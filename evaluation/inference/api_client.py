import json
import threading
import time
from pathlib import Path
from typing import Any, Dict, Optional

import requests

from ..config import EXTERNAL_API_KEY, EXTERNAL_API_URL

_thread_local = threading.local()
_raw_log_lock = threading.Lock()
_raw_log_path: Optional[str] = None


def set_raw_log_path(path: str) -> None:
    global _raw_log_path
    _raw_log_path = path
    Path(path).parent.mkdir(parents=True, exist_ok=True)


def _append_raw_log(request_id: int, status_code: int, body: Any) -> None:
    if not _raw_log_path:
        return
    record = {
        "request_id": request_id,
        "http_status": status_code,
        "response_body": body,
        "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
    }
    with _raw_log_lock:
        with open(_raw_log_path, "a", encoding="utf-8") as f:
            f.write(json.dumps(record, ensure_ascii=False) + "\n")


def _get_api_session() -> requests.Session:
    if not EXTERNAL_API_URL or not EXTERNAL_API_KEY:
        raise RuntimeError("EXTERNAL_API_URL and EXTERNAL_API_KEY must be set")
    session = getattr(_thread_local, "api_session", None)
    if session is None:
        session = requests.Session()
        session.headers.update({
            "Content-Type": "application/json",
            "Accept-Charset": "utf-8",
            "Authorization": f"Bearer {EXTERNAL_API_KEY}",
        })
        session.trust_env = True
        _thread_local.api_session = session
    return session


def call_external_api(
    prompt: str,
    model_name: str,
    request_id: int,
    temperature: float,
    max_tokens: int,
    timeout: int,
) -> Dict[str, Any]:
    session = _get_api_session()
    payload: Dict[str, Any] = {
        "model": model_name,
        "messages": [{"role": "user", "content": prompt}],
        "temperature": temperature,
        "reasoning_effort": "high",
        "max_tokens": max_tokens,
        "top_p": 0.95,
        "n": 1,
        "stream": True,
        "stream_options": {"include_usage": True},
    }
    max_retries = 50
    connect_timeout = 30
    for attempt in range(max_retries):
        try:
            resp = session.post(
                EXTERNAL_API_URL,
                json=payload,
                timeout=(connect_timeout, timeout),
                stream=True,
            )
            if resp.status_code == 200:
                resp.encoding = "utf-8"
                reasoning_chunks: list[str] = []
                content_chunks: list[str] = []
                usage: Dict[str, Any] = {}
                response_model = ""
                try:
                    for raw_line in resp.iter_lines(decode_unicode=True):
                        if not raw_line or not raw_line.startswith("data:"):
                            continue
                        data_str = raw_line[len("data:"):].strip()
                        if not data_str or data_str == "[DONE]":
                            continue
                        try:
                            chunk = json.loads(data_str)
                        except json.JSONDecodeError:
                            continue
                        if not response_model:
                            response_model = chunk.get("model", "") or ""
                        choices = chunk.get("choices") or []
                        if choices:
                            delta = choices[0].get("delta") or {}
                            reasoning_part = delta.get("reasoning_content") or ""
                            content_part = delta.get("content") or ""
                            if reasoning_part:
                                reasoning_chunks.append(reasoning_part)
                            if content_part:
                                content_chunks.append(content_part)
                        usage_part = chunk.get("usage")
                        if isinstance(usage_part, dict):
                            usage = usage_part
                finally:
                    resp.close()

                reasoning_content = "".join(reasoning_chunks)
                content = "".join(content_chunks)
                _append_raw_log(
                    request_id,
                    200,
                    {
                        "model": response_model,
                        "choices": [{
                            "message": {
                                "reasoning_content": reasoning_content,
                                "content": content,
                            }
                        }],
                        "usage": usage,
                        "stream": True,
                    },
                )

                output = ""
                if reasoning_content:
                    output += "<think>\n" + reasoning_content + "\n</think>\n"
                output += content
                if output.strip():
                    return {"request_id": request_id, "status": "success", "output": output}

                if attempt < max_retries - 1:
                    wait_time = min(2 ** attempt, 90)
                    print(
                        f"Request {request_id} returned empty content "
                        f"(attempt {attempt + 1}/{max_retries}); retrying in {wait_time}s..."
                    )
                    time.sleep(wait_time)
                    continue
                return {
                    "request_id": request_id,
                    "status": "failed",
                    "error": "empty response after retries",
                    "output": "",
                }

            status_code = resp.status_code
            resp.close()
            if status_code in {429, 500, 502, 503, 504} and attempt < max_retries - 1:
                wait_time = min(2 ** attempt, 90)
                print(
                    f"Request {request_id} failed (attempt {attempt + 1}/{max_retries}): "
                    f"HTTP {status_code}; retrying in {wait_time}s..."
                )
                time.sleep(wait_time)
                continue
            return {
                "request_id": request_id,
                "status": "failed",
                "error": f"HTTP {status_code}",
                "output": "",
            }
        except Exception as exc:
            if attempt < max_retries - 1:
                wait_time = min(2 ** attempt, 90)
                print(
                    f"Request {request_id} failed (attempt {attempt + 1}/{max_retries}): "
                    f"{str(exc)[:200]}; retrying in {wait_time}s..."
                )
                time.sleep(wait_time)
                continue
            return {
                "request_id": request_id,
                "status": "failed",
                "error": str(exc),
                "output": "",
            }

    return {
        "request_id": request_id,
        "status": "failed",
        "error": "external API failed after retries",
        "output": "",
    }
