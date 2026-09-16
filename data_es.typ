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
  Estudiante de Desarrollo de Software en UADE con perfil orientado a dar los
  primeros pasos profesionales en el sector IT. Conocimientos en lenguajes de
  programación y bases de datos, con fuerte interés en desarrollo de
  aplicaciones, *QA Testing*, automatización y soporte de sistemas. Experiencia
  real en entornos operativos: manejo de sistemas digitales, resolución de
  incidencias de hardware/software de primera línea y optimización de procesos
  diarios. Capacidad analítica, rápida adaptación y clara orientación a la
  resolución de problemas técnicos.
]

#let techtitle = [ Tecnologías y Habilidades ]
#let tech = [
  *Desarrollo y Web*: Python, JavaScript, HTML, CSS, FastAPI, Next.js\
  *Bases de datos y DevOps*: SQL, PostgreSQL, Git/GitHub, Docker, Playwright\
  *Soporte IT y Sistemas*: soporte técnico, Windows, instalación de software,
  redes y conectividad Wi-Fi, hardware básico, resolución de incidencias,
  manejo de sistemas operativos\
  *Competencias*: lógica de programación, QA Testing, manejo de
  archivos/matrices, optimización de procesos, mejora continua\
  *Idiomas*: Inglés técnico _(intermedio/avanzado para lectura de documentación
  y manuales)_
]

#let experiencetitle = [ Experiencia ]
#let experience = [
  #datedsubsection(align(left)[
    *COTO Digital (COTO CICSA)* \
    Operador
  ], align(right)[ Octubre 2025 - _presente_ ])

  - Manejo de *PDA y sistemas digitales internos* para la operación,
    logística, preparación y despacho de pedidos.
  - Resolución de inconvenientes técnicos básicos (impresoras y equipos del
    sector) para asegurar la continuidad operativa.
  - Optimización continua de tareas y procesos mediante el uso eficiente de
    las herramientas digitales.
  - Control, emisión de tickets/vouchers y seguimiento de pedidos, garantizando
    la correcta gestión y entrega.

  #datedsubsection(align(left)[
    *Bon Air Cafetería* \
    Encargado Administrativo
  ], align(right)[ Noviembre 2024 - Septiembre 2025 ])

  - Administración operativa integral utilizando el sistema de gestión
    *FUDO POS*.
  - Resolución de incidencias del sistema de manera autónoma para evitar
    frenos en la operación.
  - Optimización de procesos digitales e implementación de soluciones para
    automatizar el registro de ventas.
  - Control de stock y cierres de caja diarios apoyados en plataformas
    informáticas.

  #datedsubsection(align(left)[
    *Havanna* \
    Soporte Operativo _(orientado a IT)_
  ], align(right)[ Febrero 2024 - Julio 2024 ])

  - Manejo, control y soporte de sistemas operativos internos mediante el
    software *MAXIREST*.
  - Validación de información y soporte en la operación diaria para
    garantizar el correcto funcionamiento del sistema y de los procesos
    administrativos.
]

#let projectstitle = [ Proyectos ]
#let projects = [
  #datedsubsection(align(left)[
    *Plataforma SaaS de Automatización para Comercios* \
    Proyecto propio
  ], align(right)[ _presente_ ])

  - Desarrollo de una plataforma *Software as a Service (SaaS)* para la
    automatización de procesos en comercios.
  - *Stack*: Python, FastAPI, PostgreSQL, Docker, JavaScript, Playwright,
    Next.js.
  - Prototipo funcional: automatización de procesos administrativos, gestión
    de información con PostgreSQL e integración de servicios con FastAPI.
    Pendiente: estrategia de testing y despliegue en producción.

  #datedsubsection(align(left)[
    *Sistema de Stock Automatizado* \
    Proyecto UADE
  ], align(right)[ 2025 ])

  - Aplicación backend de gestión de stock para una cafetería, enfocada en la
    eficiencia operativa.
  - Implementación de lógica de negocio y estructuras de datos para
    administrar productos, clientes y ventas.
  - Generación de reportes y automatización de procesos de inventario.
  - *Stack*: Python.
]

#let edutitle = [ Educación ]
#let edu = [
  #datedsubsection(align(left)[
    *Tecnicatura Universitaria en Desarrollo de Software* \
    Universidad Argentina de la Empresa _(UADE)_
  ], align(right)[
    2025 - _presente_ \
    Promedio actual: 8.67
  ])

  #datedsubsection(align(left)[
    *Fundamentos de Ciberseguridad* \
    Curso certificado _(48.5 horas)_
  ], align(right)[ Agosto 2026 ])

]
