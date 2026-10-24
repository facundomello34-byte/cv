# Origen y licencia

Los archivos `scripts/humanize.py`, `scripts/detect.py` y `scripts/slop.json`
son copias **sin modificar** de:

- Repo: https://github.com/aldushmedia/linkedin-agent-skill-es
- Commit: `3e22ab688d7734f68d3a33ef31b07840ece0376c` (2026-10-23)
- Ruta original: `skills/li-human/`
- Adaptación al español: Aldush Media
- Proyecto original: MIT, Copyright (c) 2026 Jake Schincariol
- Licencia: MIT (ver https://github.com/aldushmedia/linkedin-agent-skill-es/blob/main/LICENSE)

Verificado por sha256 el 24/10/2026: los tres archivos son byte a byte iguales
al upstream, así que su suite de 45 tests (`python3 -m unittest discover -s
tests`) los cubre tal cual.

## Qué se agregó acá

`scripts/limpiar.py` es nuevo, escrito para este repo. Resuelve tres cosas que
los originales no pueden saber: extraer el texto legible de un `.typ` (sin
comentarios `//`, comandos `#` ni énfasis `*...*`) o de un PDF compilado;
preservar los separadores `·` de las cabeceras de las cartas; y reescribir un
`.typ` validando que compile antes de dar el cambio por bueno.

## Qué se dejó afuera del paquete original

El resto de las skills de ese repo (`li-post`, `li-comment`, `li-reply`,
`li-profile`, `li-plan`, `li-dm`, `li-inbox`, `li-carousel`, `li-repurpose`,
`li-audit`) son para gestionar una cuenta de LinkedIn como canal de marketing
personal. No aplican a la búsqueda de un primer empleo: acá el objetivo es
postular a ofertas, no construir audiencia.
