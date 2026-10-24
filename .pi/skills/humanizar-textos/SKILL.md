---
name: humanizar-textos
description: >-
  Quita la huella de IA de los textos de este repo (cartas .typ y su PDF,
  bullets del CV, perfil-bumeran.md, respuestas de formularios) y los puntúa
  con un panel de cinco chequeos, respetando los separadores "·" de las
  cabeceras y la estructura de Typst. Úsala cuando haya que escribir, revisar
  o pulir una carta de presentación, el perfil profesional del CV, el resumen
  de Bumeran o un mensaje a un reclutador; o cuando el usuario diga "¿esto
  suena a IA?", "humanizá esto", "revisá la carta", "sácale las rayas largas",
  "esto lo va a marcar un detector".
---

# humanizar-textos

Dos scripts que corren en tu máquina, sin dependencias ni llamadas a ningún
servicio, más un puente para los archivos de este repo.

Todo lo que sale de acá lo lee una persona que contrata. Un texto con rayas
largas, "en el mundo actual" y oraciones todas del mismo largo se descarta
antes de llegar a la línea de "experiencia".

## Antes de escribir: el perfil de voz

Leé `.pi/voice.md`. Está armado con las cartas y el CV reales de Facundo: qué
registro usa, qué datos repite, qué frases son suyas y cuáles no. Si el texto
no suena a esa persona, no importa cuánto puntúe.

## Comandos

```bash
S=.pi/skills/humanizar-textos/scripts

python3 $S/limpiar.py --check carta_generica.typ          # puntúa el texto actual
python3 $S/limpiar.py --check carta_ey.typ --despues      # antes y después
python3 $S/limpiar.py carta_wetcom.typ                    # imprime el texto limpio, no toca nada
python3 $S/limpiar.py carta_wetcom.typ --aplicar          # reescribe la prosa del .typ (valida compilando)
python3 $S/limpiar.py cv_es.pdf --check                   # puntúa el PDF que recibe el reclutador
python3 $S/limpiar.py perfil-bumeran.md --check           # también sirve con .md
```

`--lang en` para las cartas en inglés (`auto` ya lo detecta solo).

## Qué arregla solo y qué no

**Arregla:** caracteres invisibles, rayas largas, comillas curvas, puntos
suspensivos tipográficos, y 168 términos de relleno en español / 113 en inglés
definidos en `slop.json`.

**Marca pero no reescribe:** tríadas, "no es solo X, es Y", preguntas
retóricas sueltas, muros de hashtags, y oraciones del mismo largo. Reescribir
eso necesita criterio, así que es tu trabajo. El panel te dice dónde mirar.

**No aplica a todo:** el chequeo VOZ supone prosa en primera persona. En un CV
o en un resumen de Bumeran, que van impersonales, va a dar bajo y está bien.

## Cómo leer el panel

| chequeo | qué hacer si sale bajo |
| --- | --- |
| **RITMO** | Mezclá oraciones cortas con largas: una de 5 palabras al lado de una de 25. Nunca lo arregles agregando relleno. Si el resto de los chequeos está en 100, primero dudá de la extracción. |
| **CONCRECIÓN** | Meter números reales: promedio 8.67, 48.5 h del curso, edición 17, años. Nunca un número inventado. |
| **RELLENO** | Correr `--aplicar`, o reescribir la frase con palabras propias. |
| **HUELLA** | `--aplicar` lo resuelve entero. |
| **VOZ** | Primera persona y verbos en pasado propio: "automaticé", "resolvía", "armé". |

El veredicto pesa el promedio al 60% y el peor chequeo al 40%: alcanza con una
señal para que un detector se dispare. **APROBADO** es 70+ con ningún chequeo
debajo de 55.

## Reglas duras de este repo

1. **No inventar nada.** Ni métricas, ni clientes, ni herramientas que no usó,
   ni experiencia que no tiene. Si falta un dato, va `{{dato}}` y se pregunta.
2. **Nunca reescribir un `.typ` a mano con los scripts sueltos.** `humanize.py`
   convierte `·` en `-` (rompe las cabeceras) y `—` en `,` incluso dentro de
   comentarios `//`. Para eso está `--aplicar`, que solo toca líneas de prosa y
   revierte si el archivo no compila.
3. **`--aplicar` no reemplaza la revisión.** Siempre: `git diff` y después
   `typst compile` del archivo tocado. Y revisá qué revirtió: la raya larga
   pasa a coma, lo que está bien en una oración y **mal en un título**.
   `EY – Junior de IT` convertido en `EY, Junior de IT` es peor que la raya.
   Nombres de puesto, empresas, fechas y bloques de cabecera: se revierten.
4. **La carta no se publica sola.** Se muestra el texto final y espera el ok.

## Estado actual medido (24/10/2026)

**Cartas** — prosa en primera persona, el caso para el que el panel fue hecho:

| archivo | puntaje | veredicto |
| --- | --- | --- |
| `carta_ey.typ` | 92.0 | APROBADO |
| `carta_generica.typ` | 90.6 | APROBADO |
| `carta_generica_en.typ` | 87.5 | APROBADO |
| `carta_wetcom.typ` | 86.8 | APROBADO |
| `carta_accenture.typ` | 85.6 | APROBADO |

**CV y perfil** — no los midas con este panel como si fueran cartas:

| archivo | puntaje | por qué queda en REVISAR |
| --- | --- | --- |
| `perfil-bumeran.md` | 64.8 | VOZ 44.3: el resumen se escribe en tercera persona a propósito |
| `data_es.typ` | 58.8 | VOZ 30.0: un CV no dice "yo" |
| `data_en.typ` | 57.7 | ídem, en inglés |
| `cv_es.pdf` / `cv_en.pdf` | 56.6 / 58.0 | ídem, y además son listas de viñetas |

El chequeo **VOZ** cuenta marcas de primera y segunda persona porque en un post
de LinkedIn eso es señal humana. En un CV o en un resumen de Bumeran el registro
correcto es impersonal, así que el puntaje bajo ahí **no es un defecto**. En los
cinco CV/perfiles el resto de los chequeos está en 100 (RELLENO, CONCRECIÓN,
HUELLA) o cerca de 100 (RITMO 51–60).

Lo único accionable en el perfil: 9 rayas largas, casi todas en títulos y
etiquetas (`# Contenido para perfil de Bumeran — Facundo Mello`). No son señal
de IA en un encabezado, pero si se quiere limpiar, se reemplazan a mano.

### Ojo con la medición

`limpiar.py` une las líneas de un mismo párrafo antes de medir (en `.typ` y en
`.md`) y protege decimales y abreviaturas (`8.67`, `$1.200.000`, `Ref.:`). Sin
eso, el separador de oraciones del upstream corta en cada punto y en cada salto
de línea de 80 columnas, inventa decenas de oraciones cortas falsas y hunde el
RITMO. Medido mal, `carta_generica.typ` daba 62.8 REVISAR con "RITMO 34.0";
medido bien da **90.6 APROBADO con RITMO 100.0** (variación 0.73 en 22
oraciones). Si algún día ves un RITMO bajo con CONCRECIÓN en 100, sospechá
de la extracción antes de reescribir la carta.

## Archivos

```
scripts/limpiar.py     el puente: extrae texto de .typ/.pdf, protege "·", aplica con validación
scripts/humanize.py    las tres pasadas de limpieza (original, sin cambios)
scripts/detect.py      el panel de cinco chequeos (original, sin cambios)
scripts/slop.json      el léxico de relleno (editable)
ORIGEN.md              licencia MIT y de dónde salieron los scripts
```

Los dos scripts originales son idénticos al upstream (verificado por sha256), y
su suite de 45 tests pasa con `python3 -m unittest` desde el repo original: no
hace falta re-testear acá lo que no se modificó.
