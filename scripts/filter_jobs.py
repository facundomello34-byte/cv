#!/usr/bin/env python3
"""
filter_jobs.py — filtra y prioriza ofertas del digest según el perfil de Facundo.

Problema que resuelve: el digest trae ~56 ofertas/día y la mayoría son senior.
Este script descarta el ruido, puntúa el fit con el perfil (scripts/perfil_filtro.json),
marca 🆕 las ofertas nunca vistas y genera reports/priorizadas-YYYY-MM-DD.md
solo con lo que vale la pena postular.

Uso:
    python3 scripts/filter_jobs.py                     # procesa reports/jobs-latest.md
    python3 scripts/filter_jobs.py reports/jobs-2026-09-29.md
    python3 scripts/filter_jobs.py --all               # re-procesa todos los digests
    python3 scripts/filter_jobs.py --mark-applied URL  # marca oferta como postulada
    python3 scripts/filter_jobs.py --stats             # estadísticas del tracking

Archivos:
    reports/vistas.json      — DB de ofertas vistas/postuladas (URL -> info)
    reports/priorizadas-*.md — salida priorizada
"""
import json
import re
import sys
import unicodedata
from datetime import date, datetime, timedelta
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
REPORTS = REPO / "reports"
PERFIL_FILE = Path(__file__).resolve().parent / "perfil_filtro.json"


def norm(s: str) -> str:
    """minúsculas sin acentos, para comparación robusta."""
    s = unicodedata.normalize("NFKD", s)
    return "".join(c for c in s if not unicodedata.combining(c)).lower()


def load_perfil():
    with open(PERFIL_FILE, encoding="utf-8") as f:
        return json.load(f)


def load_vistas():
    p = REPORTS / "vistas.json"
    if p.exists():
        with open(p, encoding="utf-8") as f:
            return json.load(f)
    return {"vistas": {}, "postuladas": {}}


def save_vistas(v):
    with open(REPORTS / "vistas.json", "w", encoding="utf-8") as f:
        json.dump(v, f, indent=2, ensure_ascii=False)


ENTRY_RE = re.compile(
    r"^- \*\*(?P<title>.+?)\*\*(?:\s+—\s+(?P<comp>[^·]+?))?\s*·\s*(?P<loc>[^·]*?)"
    r"(?:\s*·\s*_?(?P<date>\d{4}-\d{2}-\d{2})_?)?\s*\n\s*(?P<url>https?://\S+)",
    re.M,
)


def parse_digest(path: Path):
    """Extrae (title, company, loc, date, url) de un digest markdown."""
    text = path.read_text(encoding="utf-8")
    out = []
    for m in ENTRY_RE.finditer(text):
        out.append({
            "title": m.group("title").strip(),
            "comp": (m.group("comp") or "").strip(),
            "loc": (m.group("loc") or "").strip().strip("_").strip(),
            "date": m.group("date") or "",
            "url": m.group("url").strip(),
        })
    return out


def es_senior(title: str, perfil: dict) -> bool:
    t = norm(title)
    for rx in perfil["excluir_regex"]:
        if re.search(rx, t):
            return True
    for kw in perfil["excluir_si_contiene"]:
        if norm(kw).strip() in t:
            return True
    # "X N3"/"Nivel 3" en soporte suele pedir experiencia; no excluir pero tampoco sumar
    return False


def score_job(job: dict, perfil: dict) -> int:
    t = norm(job["title"])
    c = norm(job["comp"])
    score = 0
    p = perfil["puntaje"]

    for kw in p.get("5", []):
        if norm(kw) in t:
            score += 5
            break  # junior/trainee cuenta una vez
    for kw in p.get("4", []):
        if norm(kw) in t:
            score += 4
            break
    for kw in p.get("4_qa", []):
        if norm(kw) in t:
            score += 4
            break
    for kw in p.get("3", []):
        if norm(kw) in t:
            score += 3
            break
    for kw in p.get("2", []):
        if norm(kw) in t:
            score += 2
            break

    for emp, pts in p.get("empresas_preferidas", {}).items():
        if norm(emp) in c:
            score += pts
            break

    # Frescura: publicada hoy o ayer suma
    if job["date"]:
        try:
            d = date.fromisoformat(job["date"])
            hoy = date.today()
            if d >= hoy - timedelta(days=1):
                score += 2
            elif d >= hoy - timedelta(days=3):
                score += 1
        except ValueError:
            pass

    # Puestos de desarrollo genérico sin "junior" explícito: bajo fit para primer empleo
    if score == 0 and any(
        w in t for w in ("engineer", "developer", "desarrollador", "consultor")
    ):
        score = 1  # apenas visible, al fondo

    return score


def titulo_similar(t1: str, t2: str) -> bool:
    """True si dos títulos son la misma oferta con leves variaciones."""
    def tokens(t):
        return set(norm(t).replace("–", " ").replace("-", " ").split())
    a, b = tokens(t1), tokens(t2)
    if not a or not b:
        return False
    inter = len(a & b)
    return inter / max(len(a), len(b)) >= 0.6


def dedupe(jobs: list) -> list:
    """Quita ofertas duplicadas de la misma empresa con título similar."""
    out = []
    for j in jobs:
        dup = False
        for k in out:
            if norm(k["comp"]) == norm(j["comp"]) and titulo_similar(k["title"], j["title"]):
                dup = True
                break
        if not dup:
            out.append(j)
    return out


def empresa_descartada(job: dict, perfil: dict) -> bool:
    c = norm(job["comp"])
    t = norm(job["title"])
    # Exa no siempre trae empresa: chequear también el título
    if any(norm(e) in c or norm(e) in t for e in perfil["empresas_descartadas"]):
        return True
    # Ofertas fuera de Argentina/LATAM (India, Brasil en portugués, etc.)
    fuera = ["noida", "india", "vaga ", "vagas", "contrata", "workei",
             "remoto — ", "(us-based)", "filipinas", "pakistan",
             "thailand", "esgueira"]
    if any(f in t for f in fuera):
        return True
    # Dominios de países que no aplican
    urls_fuera = ["bumeran.com.pe", "bumeran.com.uy", "bumeran.com.mx",
                  "bumeran.cl", "emprego24.pt", "workei.com.br",
                  "pragatishilclasses.org", "jobgrow"]
    return any(u in job["url"] for u in urls_fuera)


def main():
    args = sys.argv[1:]
    perfil = load_perfil()
    vistas = load_vistas()

    # ── Modo tracking ──
    if args and args[0] == "--mark-applied":
        url = args[1] if len(args) > 1 else ""
        if url not in vistas["vistas"]:
            print(f"⚠️  URL no conocida, la agrego igual: {url}")
        vistas["postuladas"][url] = {
            "fecha": date.today().isoformat(),
            "estado": "postulada",
        }
        if url in vistas["vistas"]:
            vistas["postuladas"][url]["titulo"] = vistas["vistas"][url].get("title", "")
        save_vistas(vistas)
        print(f"✅ Marcada como POSTULADA: {url}")
        return

    if args and args[0] == "--stats":
        print(f"👀 Vistas:    {len(vistas['vistas'])}")
        print(f"📨 Postuladas: {len(vistas['postuladas'])}")
        for url, info in vistas["postuladas"].items():
            print(f"  [{info['fecha']}] {info.get('titulo', url)[:60]}")
        return

    # ── Modo filtrado ──
    files = []
    if args and args[0] == "--all":
        files = sorted(REPORTS.glob("jobs-*.md"))
    elif args and not args[0].startswith("--"):
        files = [Path(args[0])]
    else:
        latest = REPORTS / "jobs-latest.md"
        if not latest.exists():
            print("No hay digest. Corré primero scripts/jobs.sh")
            sys.exit(1)
        files = [latest]

    today = date.today().isoformat()
    umbral_post = perfil["umbral_postular"]
    umbral_rev = perfil["umbral_revisar"]

    aplicar, revisar, descartadas = [], [], 0
    pool = []
    for f in files:
        for job in parse_digest(f):
            key = job["url"].split("?")[0]
            if empresa_descartada(job, perfil) or es_senior(job["title"], perfil):
                descartadas += 1
                continue
            s = score_job(job, perfil)
            job["score"] = s
            job["nueva"] = key not in vistas["vistas"] and key not in vistas["postuladas"]
            job["postulada"] = key in vistas["postuladas"]
            pool.append(job)
            # registrar en vistas
            vistas["vistas"][key] = {
                "title": job["title"], "comp": job["comp"],
                "date": job["date"], "score": s,
                "primera_vista": vistas["vistas"].get(key, {}).get(
                    "primera_vista", today),
            }
    pool = dedupe(pool)
    for job in pool:
        if job["score"] >= umbral_post:
            aplicar.append(job)
        elif job["score"] >= umbral_rev:
            revisar.append(job)

    aplicar.sort(key=lambda j: (-j["score"], j["date"]), reverse=False)
    aplicar.sort(key=lambda j: (-j["score"], j["date"]))
    revisar.sort(key=lambda j: (-j["score"], j["date"]))

    out = [REPORTS / f"priorizadas-{today}.md"]
    lines = [
        f"# 🎯 Ofertas PRIORIZADAS para tu perfil — {today}\n",
        f"_Filtradas de {len(files)} digest(s): {descartadas} descartadas (senior/spam), "
        f"**{len(aplicar)} para POSTULAR**, {len(revisar)} para revisar_\n",
        f"_Scoring: junior/trainee +5 · soporte/QA +4 · linux/dev/python +3 · "
        f"devops/cloud +2 · frescura ≤2 días +2 · empresa preferida +2/3. "
        f"Umbral postular: ≥{umbral_post}_\n",
    ]
    if aplicar:
        lines.append("\n## 🚨 POSTULAR YA (mayor fit)\n")
        for j in aplicar:
            nuevo = " 🆕 **NUEVA**" if j["nueva"] else ""
            post = " ✅ _ya postulada_" if j["postulada"] else ""
            d = f" · _{j['date']}_" if j["date"] else ""
            lines.append(
                f"- **[{j['score']} pts]{' 🔥' if j['score'] >= 10 else ''} {j['title']}**"
                f" — {j['comp']}{d}{nuevo}{post}\n  {j['url']}\n"
            )
    if revisar:
        lines.append("\n## ⭐ Revisar (fit medio — postular si cumplís 60-70%)\n")
        for j in revisar:
            nuevo = " 🆕" if j["nueva"] else ""
            d = f" · _{j['date']}_" if j["date"] else ""
            lines.append(
                f"- **[{j['score']} pts] {j['title']}** — {j['comp']}{d}{nuevo}\n  {j['url']}\n"
            )
    lines.append(
        "\n---\n"
        f"_Descartadas por senior/spam: {descartadas}. "
        "Ajustá el filtro editando `scripts/perfil_filtro.json`._\n"
    )
    for o in out:
        o.write_text("".join(lines), encoding="utf-8")
    save_vistas(vistas)

    print(f"✅ {o}")
    print(f"🚨 Postular: {len(aplicar)} · ⭐ Revisar: {len(revisar)} · 🗑 Descartadas: {descartadas}")
    if aplicar:
        print("\nTOP POSTULAR HOY:")
        for j in aplicar[:8]:
            n = " 🆕" if j["nueva"] else ""
            print(f"  [{j['score']}] {j['title']} — {j['comp']}{n}")


if __name__ == "__main__":
    main()