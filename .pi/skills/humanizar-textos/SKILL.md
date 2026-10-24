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

## Cómo leer el panel

| chequeo | qué hacer si sale bajo |
| --- | --- |
| **RITMO** | Lo más común en este repo. Mezclá oraciones cortas con largas: una de 5 palabras al lado de una de 25. Nunca lo arregles agregando relleno. |
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
   `typst compile` del archivo tocado.
4. **La carta no se publica sola.** Se muestra el texto final y espera el ok.

## Estado actual medido (24/10/2026)

| archivo | puntaje | señal más débil |
| --- | --- | --- |
| `perfil-bumeran.md` | 65.4 REVISAR | VOZ |
| `carta_generica.typ` | 62.8 REVISAR | RITMO 34.0 (37 oraciones parejas) |
| `carta_generica_en.typ` | 60.8 REVISAR | RITMO (no tiene nada que limpiar) |
| `carta_ey.typ` | 59.4 REVISAR | RITMO |
| `carta_wetcom.typ` | 57.2 REVISAR | RITMO 23.7 + 3 rayas largas |
| `cv_es.pdf` | 56.7 REVISAR | VOZ |
| `carta_accenture.typ` | 52.3 REVISAR | RITMO |

Todos tienen CONCRECIÓN y RELLENO en 100 y VOZ por encima de 90: el contenido
está bien. Y ojo con esto, porque es el dato que importa: limpiar la carta
genérica la sube solo de **62.8 a 64.2** (+1.4). El texto no está sucio; el
problema de RITMO es de redacción y no se arregla con el script. Si después de
`--aplicar` RITMO sigue abajo, hay que reescribir oraciones a mano.

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
