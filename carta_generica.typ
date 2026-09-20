// ─────────────────────────────────────────────────────────────────────────────
// CARTA DE PRESENTACIÓN GENÉRICA — Facundo Mello
// Uso: copiá este archivo, completá los campos entre [corchetes] y elegí la
// variante de párrafo según el puesto (QA / DevOps / Soporte) al final.
// Compilá con:  typst compile carta_generica.typ carta_generica.pdf
// ─────────────────────────────────────────────────────────────────────────────
#set page(margin: (x: 2.4cm, y: 2.2cm))
#set text(font: "Liberation Serif", size: 10.5pt, lang: "es")
#set par(justify: true, leading: 0.62em)

#align(center)[
  #text(size: 17pt, weight: 700)[Facundo Octavio Mello]\
  #v(2pt)
  #text(size: 9.5pt)[
    facundomello34\@gmail.com  ·  (+54) 9 11 2408 4431  ·  github.com/facundomello34-byte
  ]
]

#line(length: 100%)

#v(1.2em)

#text(size: 10pt)[
  Buenos Aires, [fecha]

  #v(0.8em)

  [Nombre de la empresa]\
  [Equipo de Talento]\
  Ref.: [Puesto] — [ID del aviso o nombre del puesto]
]

#v(1.4em)

Estimados/as del equipo de Talento:

#v(0.9em)

Les escribo para postularme al puesto de *[Puesto]* que publicaron (ref.
[ID]). Soy estudiante de la *Tecnicatura Universitaria en Desarrollo de
Software* en UADE (promedio actual: 8.67) y estoy buscando mi *primer empleo
formal en IT*. Quiero ser transparente al respecto: todavía no tengo
experiencia laboral en el sector. Lo que sí tengo, y en grande, son *ganas de
trabajar, aprender y crecer* dentro de un equipo como el de [Empresa].

Aunque mi carrera IT está arrancando, no llego vacío. Uso *Linux* a diario
como sistema principal, programo en *Python* (también JavaScript y
SQL/PostgreSQL) y tengo un proyecto propio de automatización para comercios:
un SaaS contenedorizado con *Docker*, con backend en *FastAPI*, base de datos
en *PostgreSQL* y pruebas *E2E automatizadas con Playwright*. Estoy cursando
la carrera con un promedio de 8.67 y cuento con un certificado de fundamentos
de ciberseguridad.

Además, mi experiencia laboral previa en operaciones me dio algo que no se
enseña en las aulas: *responsabilidad y continuidad operativa*. En COTO
Digital y Bon Air Cafetería mi función era que la operación nunca se
detuviera: gestionaba sistemas digitales, resolvía incidencias técnicas en
equipos e impresoras, y con el sistema FUDO POS automaticé procesos de ventas,
stock y cierre de caja. Trabajo bien en equipo, bajo presión, y con el detalle
puesto en no romper lo que ya funciona.

[PÁRRAFO DE ENCAJE — elegí y pegá acá una de las tres variantes del final]

Quedo a disposición para una entrevista cuando lo consideren oportuno. Puedo
empezar de inmediato y me adapto a la modalidad presencial, híbrida o remota.
Les agradezco de antemano por leer mi postulación.

Saludos cordiales,

#v(1.6em)

*Facundo Octavio Mello*

#text(size: 9.5pt)[
  facundomello34\@gmail.com  ·  (+54) 9 11 2408 4431  ·  github.com/facundomello34-byte
]

// ═════════════════════════════════════════════════════════════════════════════
// VARIANTES DEL PÁRRAFO DE ENCAJE — elegí según el puesto y reemplazá el
// marcador [PÁRRAFO DE ENCAJE ...] de arriba. Borrá las que no uses.
// ═════════════════════════════════════════════════════════════════════════════

// ── 1) PUESTO DE QA / TESTING ────────────────────────────────────────────────
// El puesto de QA me entusiasma porque combina dos cosas que disfruto: el
// detalle y la automatización. Ya automatizo pruebas E2E con Playwright en mi
// proyecto propio, conozco los fundamentos del testing y tengo el rigor y la
// paciencia necesarios para diseñar casos de prueba, reportar incidencias y
// asegurar que el producto salga sin errores. Mi experiencia en operaciones
// me dio un ojo entrenado para detectar lo que falla antes de que falle.

// ── 2) PUESTO DE DEVOPS / INFRAESTRUCTURA / SYSADMIN ────────────────────────
// El puesto de [DevOps / infraestructura] es el área donde quiero crecer, y ya
// estoy trabajando en esa dirección: uso Linux a diario, manejo Git/GitHub,
// contenedorizo mis proyectos con Docker (incluido el despliegue en
// contenedores de mi SaaS propio) y me interesa mucho la infraestructura como
// código y la automatización de despliegues. Además, mi experiencia resolviendo
// incidencias técnicas bajo presión me preparó para el tipo de continuidad
// operativa que este rol exige.

// ── 3) PUESTO DE SOPORTE IT / HELP DESK ─────────────────────────────────────
// Mi experiencia laboral ya fue, en buena parte, soporte técnico: en COTO
// Digital, Bon Air Cafetería y Havanna resolvía incidencias en equipos e
// impresoras, daba soporte a usuarios y compañeros y cuidaba que los sistemas
// siguieran funcionando. Manejo tanto Windows como Linux, entiendo la lógica
// de redes y conexiones, y tengo mucha práctica en explicar soluciones de
// forma clara a personas no técnicas. Además, mi formación en desarrollo me
// permite aportar algo extra: automatizar las tareas repetitivas del día a día.

// ── NOTAS ────────────────────────────────────────────────────────────────────
// - Si el aviso pide algo puntual (Jira, Terraform, X herramienta), mencionalo
//   en primera línea del párrafo de encaje SOLO si es verdad y lo usaste.
// - Para puestos que piden experiencia y no la tenés: no mientas en el CV,
//   pero sí enfatizá proyectos y cursos (esto ya está cubierto en la carta).
// - Versión en inglés: usá carta_generica_en.typ (misma estructura).
