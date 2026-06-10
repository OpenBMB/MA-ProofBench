import re
from typing import Any, Dict, List, Optional


def extract_lean_code_from_inference(text: str, no_think: bool = False) -> Optional[str]:
    if not text:
        return None
    if no_think:
        return text.strip()
    text = re.sub(r"<think>.*?</think>", "", text, flags=re.S | re.I).strip()
    close_idx = text.find("</think>")
    if close_idx == -1:
        close_idx = text.find("</Think>")
    if close_idx != -1:
        text = text[close_idx + len("</think>"):].strip()
    fenced = list(re.finditer(r"```([^\n`]*)\n(.*?)```", text, flags=re.S))
    if fenced:
        return fenced[-1].group(2).strip()

    open_fences = list(re.finditer(r"```([^\n`]*)\s*", text, flags=re.I))
    if not open_fences:
        return None
    last_open = open_fences[-1]
    start = last_open.end()
    if start < len(text) and text[start] == "\n":
        start += 1
    end = text.find("```", start)
    if end == -1:
        return text[start:].strip()
    return text[start:end].strip()


def _parse_header_and_body(code: str) -> tuple[list[str], str]:
    lines = code.split("\n")
    header_end = 0
    for i, line in enumerate(lines):
        stripped = line.strip()
        if (stripped.startswith("import ") or stripped.startswith("open ")
                or stripped.startswith("set_option ")):
            header_end = i + 1
        elif stripped == "" or stripped.startswith("--"):
            continue
        else:
            break
    return lines[:header_end], "\n".join(lines[header_end:]).lstrip("\n")


def _merge_headers(header_a: str, header_b_lines: list[str]) -> str:
    all_lines: list[str] = []
    if header_a and header_a.strip():
        all_lines.extend(header_a.strip().split("\n"))
    all_lines.extend(header_b_lines)

    imports: set[str] = set()
    open_names: set[str] = set()
    open_scoped_names: set[str] = set()
    set_options: set[str] = set()

    for line in all_lines:
        stripped = line.strip()
        if not stripped:
            continue
        if stripped.startswith("import "):
            imports.add(stripped)
        elif stripped.startswith("open scoped "):
            for name in stripped[len("open scoped "):].split():
                open_scoped_names.add(name)
        elif stripped.startswith("open "):
            for name in stripped[len("open "):].split():
                open_names.add(name)
        elif stripped.startswith("set_option "):
            set_options.add(stripped)

    import_lines = sorted(imports)
    open_lines: list[str] = []
    if open_names:
        open_lines.append("open " + " ".join(sorted(open_names)))
    if open_scoped_names:
        open_lines.append("open scoped " + " ".join(sorted(open_scoped_names)))
    set_option_lines = sorted(set_options)

    parts: list[str] = []
    if import_lines:
        parts.append("\n".join(import_lines))
    if open_lines:
        parts.append("\n".join(open_lines))
    if set_option_lines:
        parts.append("\n".join(set_option_lines))
    return "\n\n".join(parts)


def normalize_lean_code(code: str, header: str) -> str:
    if not isinstance(code, str) or not code.strip():
        return code or ""

    code_header_lines, body = _parse_header_and_body(code.strip())

    if not isinstance(header, str) or not header.strip():
        raise ValueError("header must be a non-empty string")
    merged = _merge_headers(header, code_header_lines)

    if body:
        body_lines = body.split("\n")
        body_lines = [l for l in body_lines if not l.strip().startswith("import ")]
        body = "\n".join(body_lines).strip()

    if body:
        return f"{merged}\n\n{body}"
    return merged


_SORRY_WARNING_RE = re.compile(r"declaration uses [`']sorry[`']")

_LEAN_BLOCK_END_LOOKAHEAD = (
    r"(?:^noncomputable\b|^def\b|^lemma\b|^theorem\b|^instance\b|^example\b"
    r"|^variable\b|^open\b|^namespace\b|^section\b|^end\b|^class\b|^structure\b)"
)
_FORBIDDEN_KW_RE = re.compile(r"\b(axiom|opaque|unsafe|unsound)\b")


def _remove_lean_comments(code: str) -> str:
    code = re.sub(r"/-((?:!)?.*?)-/", "", code, flags=re.DOTALL)
    code = re.sub(r"--.*?$", "", code, flags=re.MULTILINE)
    return code


def _sanitize_lean_code(code: str) -> str:
    if not code:
        return ""
    code = _remove_lean_comments(code)
    code = code.replace("\r\n", "\n").replace("\r", "\n")
    code = "\n".join(line.rstrip() for line in code.split("\n"))
    lines: list[str] = []
    blank_streak = 0
    for line in code.split("\n"):
        blank_streak = blank_streak + 1 if line.strip() == "" else 0
        if blank_streak <= 1:
            lines.append(line)
    return "\n".join(lines).strip()


def _canonicalize_block(text: str) -> str:
    if not text:
        return ""
    s = text.replace("\r\n", "\n").replace("\r", "\n")
    s = "\n".join(line.rstrip() for line in s.split("\n"))
    s = re.sub(r"\s*:=\s*", " := ", s)
    s = re.sub(r"[ \t]{2,}", " ", s)
    lines: list[str] = []
    blank = 0
    for line in s.split("\n"):
        blank = blank + 1 if line.strip() == "" else 0
        if blank <= 1:
            lines.append(line)
    return "\n".join(lines).strip()


def _iter_lean_blocks(code: str, kind: str) -> List[str]:
    if not code.strip():
        return []
    code_nl = code if code.endswith("\n") else code + "\n"
    block_begin = (
        r"(noncomputable\s+def|def|lemma|theorem|noncomputable\s+instance"
        r"|instance|example|class|structure)"
    )
    pattern = rf"^{block_begin}.*?(?=\n{_LEAN_BLOCK_END_LOOKAHEAD}|\Z)"
    results: list[str] = []
    for m in re.finditer(pattern, code_nl, re.MULTILINE | re.DOTALL):
        first_line = m.group(0).lstrip().split("\n")[0]
        if kind == "def":
            if first_line.startswith("noncomputable def ") or first_line.startswith("def "):
                results.append(m.group(0).strip())
        elif kind == "instance":
            if first_line.startswith("noncomputable instance ") or first_line.startswith("instance "):
                results.append(m.group(0).strip())
        elif first_line.startswith(kind + " "):
            results.append(m.group(0).strip())
    return results


def _extract_lean_components(code: str) -> Dict[str, Any]:
    sanitized = _sanitize_lean_code(code)
    return {
        "defs": _iter_lean_blocks(sanitized, "def"),
        "lemmas": _iter_lean_blocks(sanitized, "lemma"),
        "instances": _iter_lean_blocks(sanitized, "instance"),
        "theorems": _iter_lean_blocks(sanitized, "theorem"),
        "classes": _iter_lean_blocks(sanitized, "class"),
        "structures": _iter_lean_blocks(sanitized, "structure"),
    }


def _remove_lean_proof(code: str) -> str:
    if not code:
        return ""
    pattern = (
        r"(.*?)(?::=\s*by[\s\S]*?)"
        r"(?=^noncomputable\b|^def\b|^lemma\b|^theorem\b|^instance\b"
        r"|^example\b|^class\b|^structure\b|\Z)"
    )
    return re.sub(pattern, lambda m: m.group(1).strip(), code, flags=re.MULTILINE).strip()


def _check_block_presence(blocks: List[str], target_text: str) -> tuple[bool, str]:
    if not blocks:
        return True, ""
    if not target_text:
        return False, blocks[0] if blocks else ""
    canon_target = _canonicalize_block(target_text)
    for item in blocks:
        if not item or not item.strip():
            continue
        canon_item = _canonicalize_block(item)
        if canon_item not in canon_target:
            first_line = canon_item.split("\n", 1)[0]
            return False, first_line[:120]
    return True, ""


def check_statement_tampered(
    lean_code: str, formal_statement: str
) -> tuple[bool, Optional[Dict[str, str]]]:
    if not lean_code or not formal_statement:
        return False, None

    def _extract_sig(code: str) -> Optional[str]:
        code = _remove_lean_comments(code)
        m = re.search(r"(theorem\s+\S+.*?):=\s*by", code, re.DOTALL)
        if m:
            return re.sub(r"\s+", " ", m.group(1).strip())
        return None

    bench_sig = _extract_sig(formal_statement)
    pred_sig = _extract_sig(lean_code)
    if bench_sig is None or pred_sig is None:
        return False, None
    if bench_sig == pred_sig:
        return False, None

    ctx = 40
    for i, (a, b) in enumerate(zip(bench_sig, pred_sig)):
        if a != b:
            start = max(0, i - ctx)
            prefix = ("..." if start > 0 else "") + bench_sig[start:i]
            return True, {
                "original": f"{prefix}【{bench_sig[i:]}】",
                "tampered": f"{prefix}【{pred_sig[i:]}】",
            }
    shorter = min(len(bench_sig), len(pred_sig))
    start = max(0, shorter - ctx)
    prefix = ("..." if start > 0 else "") + bench_sig[start:shorter]
    return True, {
        "original": f"{prefix}【{bench_sig[shorter:]}】",
        "tampered": f"{prefix}【{pred_sig[shorter:]}】",
    }


def static_precheck(lean_code: str, formal_statement: str) -> tuple[bool, str]:
    if not lean_code or not lean_code.strip():
        return False, "empty code"
    if not formal_statement or not formal_statement.strip():
        return True, "ok"

    if _FORBIDDEN_KW_RE.search(_sanitize_lean_code(lean_code)):
        return False, "forbidden keywords found"

    comps = _extract_lean_components(formal_statement)

    formal_defs: List[str] = comps.get("defs", [])
    formal_lemmas = [_remove_lean_proof(l) for l in comps.get("lemmas", []) if l]
    formal_instances: List[str] = comps.get("instances", [])
    formal_structures: List[str] = comps.get("structures", [])
    formal_classes: List[str] = comps.get("classes", [])

    formal_theorems: List[str] = comps.get("theorems", [])
    formal_last_theorem_name: Optional[str] = None
    if formal_theorems:
        first_line = formal_theorems[-1].strip().split("\n")[0]
        name_match = re.match(r"^theorem\s+([A-Za-z_][\w']*)", first_line)
        if name_match:
            formal_last_theorem_name = name_match.group(1)

    canon_code = _canonicalize_block(lean_code)
    canon_code_no_comments = _canonicalize_block(_remove_lean_comments(lean_code))

    for kind, items in [
        ("def", formal_defs),
        ("lemma", formal_lemmas),
        ("instance", formal_instances),
        ("structure", formal_structures),
        ("class", formal_classes),
    ]:
        if items:
            ok, missing = _check_block_presence(items, canon_code)
            if not ok:
                return False, f"missing {kind}: {missing}"

    if formal_last_theorem_name:
        if formal_last_theorem_name not in canon_code_no_comments:
            return False, f"missing theorem name: {formal_last_theorem_name}"

    return True, "ok"
