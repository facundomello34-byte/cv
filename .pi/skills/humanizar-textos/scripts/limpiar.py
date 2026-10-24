#!/usr/bin/env python3
"""limpiar.py: puente entre el humanizador y los textos de este repo.

Los scripts originales (humanize.py, detect.py) esperan texto plano. Acá los
textos viven en .typ (Typst) o en PDF compilado, así que este puente resuelve
tres cosas que los originales no pueden saber por su cuenta:

  1. EXTRACCIÓN   saca el texto legible de un .typ (saca comentarios //, líneas
                  de comando #, énfasis *...* y los saltos de línea \\) o de un
                  .pdf (con pdftotext). Así el puntaje se calcula sobre lo que
                  el lector ve, no sobre el código de la plantilla.
  2. CARACTERES PROPIOS   las cabeceras de las cartas usan "·" como separador
                  (email · teléfono · github). El humanizador lo cambiaría por
                  un guion porque en un post de LinkedIn es señal de IA. Acá se
                  protege antes de las pasadas y se restituye después.
  3. ESCRITURA SEGURA   --aplicar reescribe solo las líneas de prosa del .typ,
                  compila el resultado con typst y, si no compila, no escribe
                  nada. Nunca toca comentarios, comandos ni bloques [ ... ].

Uso
  python3 limpiar.py --check carta_generica.typ
      Puntúa el texto tal como está hoy (panel de cinco chequeos).

  python3 limpiar.py --check carta_generica.typ --despues
      Puntúa el original y el limpio, y muestra la diferencia.

  python3 limpiar.py carta_wetcom.typ
      Imprime el texto limpio (no modifica nada).

  python3 limpiar.py carta_wetcom.typ --aplicar
      Reescribe las líneas de prosa del .typ y valida compilando. Revisá el
      resultado con: git diff carta_wetcom.typ

  python3 limpiar.py cv_es.pdf --check
      Puntúa el PDF ya compilado (lo que recibe el reclutador).

Opciones
  --lang es|en|auto    idioma (por defecto auto)
  --keep "·•"          caracteres que no se deben tocar (por defecto "·")
  --json               salida JSON del panel
"""

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import detect  # noqa: E402
import humanize as H  # noqa: E402

# Carácter de uso privado de Unicode (categoría Co): no lo borra la pasada de
# invisibles ni lo tocan las de tipografía y léxico.
SENTINEL = "\ue000"
KEEP_POR_DEFECTO = "·"

CMD_TYPST = re.compile(r"#[A-Za-z][\w-]*\s*\([^)]*\)")


def proteger(texto, keep):
    """Reemplaza los caracteres propios por centinelas y devuelve el mapa."""
    mapa = {}
    for i, ch in enumerate(dict.fromkeys(keep)):
        token = "%s%d%s" % (SENTINEL, i, SENTINEL)
        mapa[token] = ch
        texto = texto.replace(ch, token)
    return texto, mapa


def restaurar(texto, mapa):
    for token, ch in mapa.items():
        texto = texto.replace(token, ch)
    return texto


def extraer_typst(texto):
    """Texto legible de un .typ: sin comentarios, comandos, énfasis ni saltos."""
    lineas = []
    for linea in texto.splitlines():
        s = linea.strip()
        if not s or s.startswith("//"):
            continue
        if s.startswith("#"):
            continue
        s = CMD_TYPST.sub("", s)
        s = re.sub(r"\\\s*$", "", s)          # salto de línea de Typst
        s = s.replace("\\@", "@").replace("\\_", "_")
        s = re.sub(r"\*([^*]+)\*", r"\1", s)  # negrita
        s = re.sub(r"_([^_]+)_", r"\1", s)    # cursiva
        s = re.sub(r"[ \t]{2,}", " ", s).strip()
        if s:
            lineas.append(s)
    return "\n".join(lineas) + "\n"


def extraer_pdf(ruta):
    if not shutil.which("pdftotext"):
        sys.exit("falta pdftotext (paquete poppler-utils) para leer PDFs")
    r = subprocess.run(
        ["pdftotext", "-layout", "-enc", "UTF-8", ruta, "-"],
        capture_output=True, text=True,
    )
    if r.returncode != 0:
        sys.exit("pdftotext falló: " + r.stderr.strip())
    return r.stdout


def leer_texto(ruta):
    ext = os.path.splitext(ruta)[1].lower()
    if ext == ".pdf":
        return extraer_pdf(ruta)
    with open(ruta, encoding="utf-8") as f:
        crudo = f.read()
    return extraer_typst(crudo) if ext == ".typ" else crudo


def limpiar(texto, lang, keep):
    lex = H.load_lexicon()
    prot, mapa = proteger(texto, keep)
    limpio, reporte = H.humanize(prot, lex, lang=lang)
    return restaurar(limpio, mapa), reporte


def panel(texto, lang, etiqueta=None, as_json=False):
    lex = H.load_lexicon()
    resultados, general, veredicto = detect.run(texto, lex, lang)
    if as_json:
        print(json.dumps({
            "label": etiqueta,
            "language": lang or detect.language(texto),
            "checks": resultados,
            "overall": general,
            "verdict": veredicto,
        }, ensure_ascii=False))
    else:
        detect.render(resultados, general, veredicto,
                      label=etiqueta, out=sys.stdout,
                      lang=lang or detect.language(texto))


def compila(ruta):
    """Compila una copia en el mismo directorio para respetar los #import."""
    if not shutil.which("typst"):
        return None, "typst no está instalado: no se pudo validar"
    base, ext = os.path.splitext(ruta)
    prueba = base + ".limpiar-tmp" + ext
    tmpdir = tempfile.mkdtemp()
    try:
        with open(prueba, "wb") as f:
            with open(ruta, "rb") as g:
                f.write(g.read())
        r = subprocess.run(
            ["typst", "compile", prueba, os.path.join(tmpdir, "x.pdf")],
            capture_output=True, text=True,
        )
        return r.returncode == 0, r.stderr.strip()
    finally:
        if os.path.exists(prueba):
            os.remove(prueba)
        shutil.rmtree(tmpdir, ignore_errors=True)


def es_prosa(crudo, keep=KEEP_POR_DEFECTO):
    """Línea que se puede reescribir sin tocar la estructura de Typst."""
    s = crudo.strip()
    if not s:
        return False
    if s.startswith("//") or s.startswith("#"):
        return False
    if "#" in crudo or "[" in crudo or "]" in crudo:
        return False
    if s.startswith("*") and s.endswith("*") and s.count("*") == 2:
        return False  # firma en negrita
    if "@" in crudo or "://" in crudo:
        return False  # datos de contacto
    if any(ch in crudo for ch in keep):
        return False  # cabecera con separadores propios
    return True


def aplicar(ruta, lang, keep):
    if not ruta.lower().endswith(".typ"):
        sys.exit("--aplicar solo funciona con .typ; en .md/.txt usá la salida estándar")
    with open(ruta, encoding="utf-8") as f:
        original = f.read()

    antes = extraer_typst(original)
    nuevas, cambiadas, detalle = [], 0, []
    for linea in original.splitlines(keepends=True):
        crudo = linea.rstrip("\n")
        if not es_prosa(crudo, keep):
            nuevas.append(linea)
            continue
        sangria = re.match(r"[ \t]*", crudo).group(0)
        cola = "\\" if crudo.endswith("\\") else ""
        cuerpo = crudo.strip()
        if cola:
            cuerpo = cuerpo[:-1].rstrip()
        limpio, _ = limpiar(cuerpo, lang, keep)
        limpio = limpio.strip()
        # Si lo único que cambió es el espaciado, no vale la pena reescribir.
        if re.sub(r"\s+", " ", limpio) == re.sub(r"\s+", " ", cuerpo):
            nuevas.append(linea)
            continue
        if limpio and limpio != cuerpo:
            cambiadas += 1
            detalle.append((cuerpo, limpio))
            nuevas.append(sangria + limpio + cola + "\n")
        else:
            nuevas.append(linea)

    if not cambiadas:
        print("nada que cambiar: el texto ya está limpio")
        return 0

    with open(ruta, "w", encoding="utf-8") as f:
        f.write("".join(nuevas))

    ok, error = compila(ruta)
    if ok is False:
        with open(ruta, "w", encoding="utf-8") as f:
            f.write(original)
        print("no compiló, se revirtió el archivo:\n" + error, file=sys.stderr)
        return 1
    if ok is None:
        print("aviso: " + error, file=sys.stderr)

    print("%d línea(s) reescrita(s) en %s" % (cambiadas, ruta))
    for viejo, nuevo in detalle[:8]:
        print("  - %s" % viejo[:100])
        print("  + %s" % nuevo[:100])
    if len(detalle) > 8:
        print("  ... y %d más" % (len(detalle) - 8))
    print("revisá con: git diff %s" % ruta)
    despues = extraer_typst(open(ruta, encoding="utf-8").read())
    if antes != despues:
        panel(antes, lang, "ANTES")
        panel(despues, lang, "DESPUÉS")
    return 0


def main():
    ap = argparse.ArgumentParser(description="Humaniza los textos de este repo.")
    ap.add_argument("archivo", help=".typ, .md, .txt, .pdf, o - para la entrada estándar")
    ap.add_argument("--check", action="store_true", help="puntúa el texto con el panel de cinco chequeos")
    ap.add_argument("--despues", action="store_true", help="con --check: puntúa también el texto limpio")
    ap.add_argument("--aplicar", action="store_true", help="reescribe las líneas de prosa del .typ (valida compilando)")
    ap.add_argument("--lang", choices=["auto", "es", "en"], default="auto")
    ap.add_argument("--keep", default=KEEP_POR_DEFECTO, help="caracteres a preservar (por defecto: ·)")
    ap.add_argument("--json", action="store_true", help="salida JSON")
    args = ap.parse_args()
    lang = None if args.lang == "auto" else args.lang

    if args.aplicar:
        return aplicar(args.archivo, lang, args.keep)

    if args.archivo == "-":
        crudo = sys.stdin.read()
    else:
        if not os.path.exists(args.archivo):
            sys.exit("no existe: " + args.archivo)
        crudo = leer_texto(args.archivo)

    if args.check:
        panel(crudo, lang, "ACTUAL", args.json)
        if args.despues:
            limpio, _ = limpiar(crudo, lang, args.keep)
            if not args.json:
                print()
            panel(limpio, lang, "LIMPIO", args.json)
        return 0

    limpio, reporte = limpiar(crudo, lang, args.keep)
    if args.json:
        print(json.dumps({"text": limpio, "report": reporte,
                          "language": lang or detect.language(crudo)},
                         ensure_ascii=False))
    else:
        H.render_report(reporte, out=sys.stderr, lang=lang or detect.language(crudo))
        sys.stdout.write(limpio)
    return 0


if __name__ == "__main__":
    sys.exit(main())
