#import "template.typ": *

#let name = "Facundo Octavio Mello"
#let email = [
  #icon("email.svg") facundomello34\@gmail.com
]
#let phone = [
  #icon("phone.svg")
  (+54) 9 11 2408 4431
]
#let github = [
  #icon("github.svg")
  #link("https://github.com/facundomello34-byte")[ facundomello34-byte ]
]
// Si tenés LinkedIn, descomentá la línea de abajo y completá tu perfil:
// #let linkedin = [
//   #icon("linkedin.svg")
//   #link("https://linkedin.com/in/TU-USUARIO")[ Facundo Mello ]
// ]

#let author = (
  name: name, email: email, phone: phone, github: github,
)

#let selftitle = [ Perfil Profesional ]
#let self = [
  Estudiante de Desarrollo de Software en UADE orientado a dar los primeros
  pasos en el sector IT. Conocimientos en programación y bases de datos, con
  foco en desarrollo de aplicaciones, *QA Testing* y automatización.
  Experiencia operativa resolviendo incidencias técnicas de primera línea y
  optimizando procesos con herramientas digitales. Rápida adaptación y clara
  orientación a la resolución de problemas.
]

#let techtitle = [ Tecnologías y Habilidades ]
#let tech = [
  *Desarrollo*: Python, JavaScript, HTML, CSS, FastAPI, Next.js\
  *Bases de datos y DevOps*: SQL, PostgreSQL, Git/GitHub, Docker, Playwright\
  *Soporte IT*: soporte técnico, Windows, redes Wi-Fi, hardware,
  resolución de incidencias, manejo de sistemas operativos\
  *Competencias*: QA Testing, lógica de programación, optimización de
  procesos, inglés técnico _(intermedio/avanzado)_
]

#let experiencetitle = [ Experiencia ]
#let experience = [
  #datedsubsection(align(left)[
    *COTO Digital (COTO CICSA)* \
    Operador
  ], align(right)[ Oct 2025 - _presente_ ])

  - Manejo de *PDA y sistemas digitales* para la operación logística y el
    despacho de pedidos.
  - Resolución de incidencias técnicas de hardware y equipos del sector para
    asegurar la continuidad operativa.

  #datedsubsection(align(left)[
    *Bon Air Cafetería* \
    Encargado Administrativo
  ], align(right)[ Nov 2024 - Sep 2025 ])

  - Administración con el sistema *FUDO POS*: resolución autónoma de
    incidencias y automatización del registro de ventas.

  #datedsubsection(align(left)[
    *Havanna* \
    Soporte Operativo _(orientado a IT)_
  ], align(right)[ Feb 2024 - Jul 2024 ])

  - Soporte de sistemas internos con *MAXIREST*: manejo, control y validación
    de la operación diaria del sistema y de los procesos administrativos.
]

#let projectstitle = [ Proyectos ]
#let projects = [
  #datedsubsection(align(left)[
    *Plataforma SaaS de Automatización para Comercios* \
    Proyecto propio
  ], align(right)[ _presente_ ])

  - SaaS de automatización de procesos para comercios. *Stack*: Python,
    FastAPI, PostgreSQL, Docker, JavaScript, Playwright, Next.js.
  - Prototipo funcional: automatización de procesos administrativos e
    integración de servicios con FastAPI.

  #datedsubsection(align(left)[
    *Sistema de Stock Automatizado* \
    Proyecto UADE
  ], align(right)[ 2025 ])

  - Backend en *Python* de gestión de stock para cafetería: lógica de
    negocio, productos/clientes/ventas, reportes y automatización de
    inventario.
]

#let edutitle = [ Educación ]
#let edu = [
  #datedsubsection(align(left)[
    *Tecnicatura Universitaria en Desarrollo de Software* \
    UADE
  ], align(right)[
    2025 - _presente_ \
    Promedio: 8.67
  ])

  #datedsubsection(align(left)[
    *Fundamentos de Ciberseguridad* \
    Curso certificado _(48.5 h)_
  ], align(right)[ Ago 2026 ])

]
