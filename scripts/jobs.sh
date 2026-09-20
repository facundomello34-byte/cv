#!/usr/bin/env bash
#
# jobs.sh — digest diario de búsqueda laboral (sin API keys obligatorias)
#
# Fuentes:
#   1. LinkedIn guest search API (gratis, sin login) — filtrado a últimos N días
#   2. Exa (si EXA_API_KEY está disponible) — boards argentinos mal indexados
#      (Bumeran, Computrabajo, ZonaJobs, UTN, etc.)
#
# Uso:
#   ./jobs.sh [--days N]                     días a mirar (default 7)
#   ./jobs.sh --commit "mensaje"             además hace commit+push del reporte
#   NTFY_TOPIC=mi-topic ./jobs.sh            + push a ntfy.sh (app de celular)
#
# Escribe: reports/jobs-latest.md  y  reports/jobs-YYYY-MM-DD.md
set -euo pipefail
case "$-" in *x*) printf 'Refusing to run with shell tracing enabled\n' >&2; exit 1 ;; esac

DAYS=7
COMMIT_MSG=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --days) DAYS="$2"; shift 2 ;;
    --commit) COMMIT_MSG="$2"; shift 2 ;;
    -h|--help) sed -n '1,12p' "$0"; exit 0 ;;
    *) printf 'Unknown option: %s\n' "$1" >&2; exit 2 ;;
  esac
done

command -v curl >/dev/null || { echo "curl required" >&2; exit 1; }
command -v jq >/dev/null || { echo "jq required" >&2; exit 1; }
command -v python3 >/dev/null || { echo "python3 required" >&2; exit 1; }

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPORTS="$REPO_DIR/reports"
mkdir -p "$REPORTS"
TODAY="$(date +%F)"
OUT="$REPORTS/jobs-$TODAY.md"
TMP="$(mktemp -d)"
trap 'rm -rf -- "$TMP"' EXIT HUP INT TERM

UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36"

{
  printf '# 🔍 Búsqueda laboral — %s\n\n' "$TODAY"
  printf '_DevOps Jr / Cloud / SRE / Soporte IT · Argentina · últimos %s días_\n\n' "$DAYS"
} > "$OUT"

# ── 1) LinkedIn guest API ─────────────────────────────────────────────────────
printf '## LinkedIn (últimos %s días)\n\n' "$DAYS" >> "$OUT"
LI_QUERIES=(
  "devops jr|Argentina"
  "devops trainee|Argentina"
  "cloud engineer junior|Buenos Aires"
  "site reliability|Argentina"
  "cloud support|Argentina"
  "soporte tecnico linux|Argentina"
  "administrador de sistemas junior|Buenos Aires"
  "help desk|Buenos Aires"
)
for q in "${LI_QUERIES[@]}"; do
  kw="${q%%|*}"; loc="${q##*|}"
  enc_kw="$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$kw")"
  enc_loc="$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$loc")"
  url="https://www.linkedin.com/jobs-guest/jobs/api/seeMoreJobPostings/search?keywords=${enc_kw}&location=${enc_loc}&f_TPR=r604800&sortBy=R"
  curl -s --max-time 20 -A "$UA" "$url" -o "$TMP/li.html" || true
  python3 - "$TMP/li.html" "$OUT" "$TODAY" "$DAYS" <<'PYEOF' || true
import sys, re, html as h
from datetime import date, timedelta
fname, out, today, days = sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4])
cutoff = (date.fromisoformat(today) - timedelta(days=days)).isoformat()
raw = open(fname, encoding="utf-8", errors="replace").read()
posts = re.findall(r"<li>(.*?)</li>", raw, re.S)
rows = []
for p in posts:
    t = re.search(r'base-search-card__title[^>]*>(.*?)</h3>', p, re.S)
    c = re.search(r'base-search-card__subtitle[^>]*>(.*?)</h4>', p, re.S)
    l = re.search(r'base-search-card__location[^>]*>(.*?)</span>', p, re.S)
    d = re.search(r'datetime="([^"]+)"', p)
    u = re.search(r'href="([^"]*jobs/view/[^"]+)"', p)
    urn = re.search(r'data-entity-urn="urn:li:jobPosting:(\d+)"', p)
    if not (t and u):
        continue
    title = re.sub(r"\s+", " ", h.unescape(re.sub(r"<[^>]+>", "", t.group(1)))).strip()
    comp  = re.sub(r"\s+", " ", h.unescape(re.sub(r"<[^>]+>", "", c.group(1)))).strip() if c else ""
    loc   = re.sub(r"\s+", " ", h.unescape(re.sub(r"<[^>]+>", "", l.group(1)))).strip() if l else ""
    date  = d.group(1)[:10] if d else ""
    url   = h.unescape(u.group(1)).replace("&amp;", "&").split("?")[0]
    key   = urn.group(1) if urn else url
    if date and date < cutoff:
        continue
    rows.append((date, title, comp, loc, url, key))
seen = set()
for date, title, comp, loc, url, key in sorted(rows, key=lambda r: r[0], reverse=True):
    if key in seen:
        continue
    seen.add(key)
    d = f" · _{date}_" if date else ""
    print(f"- **{title}** — {comp} · {loc}{d}  \n  {url}", file=open(out, "a", encoding="utf-8"))
print(len(seen), file=sys.stderr)
PYEOF
  sleep 2
done

# ── 2) Exa (opcional, si hay key) ─────────────────────────────────────────────
EXA_KEY="${EXA_API_KEY:-}"
if [[ -f "$HOME/.pi/agent/auth.json" ]]; then
  k=$(jq -r '.exa.key // empty' "$HOME/.pi/agent/auth.json" 2>/dev/null || true)
  [[ -n "$k" ]] && EXA_KEY="$k"
fi
if [[ -n "$EXA_KEY" ]]; then
  printf '\n## Exa — boards argentinos (Bumeran, Computrabajo, etc.)\n\n' >> "$OUT"
  START="$(date -u -d "$DAYS days ago" +%Y-%m-%d 2>/dev/null || date -u -v-${DAYS}d +%Y-%m-%d)"
  for q in "DevOps junior empleo Argentina" "Cloud Support Engineer Argentina" "técnico soporte IT Linux Buenos Aires" "DevOps trainee Argentina"; do
    jq -n --arg q "$q" --arg s "$START" \
      '{query:$q, type:"neural", numResults:5, startPublishedDate:$s, contents:{highlights:{maxCharacters:120}}}' |
    curl -s --max-time 25 -H "x-api-key: $EXA_KEY" -H "Content-Type: application/json" -d @- \
      https://api.exa.ai/search | jq -r '.results[] | "- **\(.title // "?")** · _\(.publishedDate // "" | .[:10])_  \n  \(.url // "")"' >> "$OUT" || true
    sleep 2
  done
fi

# ── 3) Dedupe global (elimina oferta repetida junto con su título) ──────────
python3 - "$OUT" <<'PYEOF' || true
import sys, re
f = sys.argv[1]
lines = open(f, encoding="utf-8").read().splitlines(keepends=True)
seen, out, pending_title = set(), [], -1
for idx, ln in enumerate(lines):
    m = re.match(r"^(\s*)(https?://\S+)\s*\n$", ln)
    if m:
        if m.group(2) in seen:
            if pending_title >= 0:  # borra el título colgado
                del out[pending_title]
                pending_title = -1
            continue
        seen.add(m.group(2))
    if ln.startswith("- **"):
        pending_title = len(out)
    out.append(ln)
open(f, "w", encoding="utf-8").write("".join(out))
PYEOF

COUNT="$(grep -c '^- \*\*' "$OUT" || true)"
SUMMARY="🗞 $COUNT ofertas (últimos $DAYS días) — $TODAY
Ver reporte: reports/jobs-$TODAY.md"
cp "$OUT" "$REPORTS/jobs-latest.md"
printf '\n---\n_Generado por scripts/jobs.sh · %s_\n' "$(date '+%F %R')" >> "$OUT"
printf '%s\n' "$SUMMARY"

if [[ -n "${NTFY_TOPIC:-}" ]]; then
  curl -s --max-time 10 -H "Title: 🔍 Ofertas $TODAY" -d "$SUMMARY" "https://ntfy.sh/$NTFY_TOPIC" >/dev/null 2>&1 || true
fi

# ── 4) commit opcional ────────────────────────────────────────────────────
if [[ -n "$COMMIT_MSG" ]]; then
  cd "$REPO_DIR"
  git config user.name "jobs bot"
  git config user.email "jobs@bot.local"
  git add reports/
  if ! git diff --cached --quiet; then
    git commit -m "$COMMIT_MSG" -q
    if ! git push -q origin HEAD; then
      git pull -q --rebase origin HEAD && git push -q origin HEAD
    fi
  fi
fi
