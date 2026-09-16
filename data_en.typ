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
// If you have LinkedIn, uncomment the line below and fill in your profile:
// #let linkedin = [
//   #icon("linkedin.svg")
//   #link("https://linkedin.com/in/YOUR-USER")[ Facundo Mello ]
// ]

#let author = (
  name: name, email: email, phone: phone, github: github,
)

#let selftitle = [ Professional Profile ]
#let self = [
  Software Development student at UADE, focused on taking the first steps in
  the IT sector. Knowledge of programming and databases, with a focus on
  application development, *QA Testing* and automation. Operational experience
  solving first-line technical incidents and optimizing processes with digital
  tools. Quick adaptation and a clear orientation towards problem solving.
]

#let techtitle = [ Technologies and Skills ]
#let tech = [
  *Development*: Python, JavaScript, HTML, CSS, FastAPI, Next.js\
  *Databases and DevOps*: SQL, PostgreSQL, Git/GitHub, Docker, Playwright\
  *IT Support*: technical support, Windows, Wi-Fi networks, hardware,
  incident resolution, operating systems management\
  *Competencies*: QA Testing, programming logic, process optimization,
  technical English _(intermediate/advanced)_
]

#let experiencetitle = [ Experience ]
#let experience = [
  #datedsubsection(align(left)[
    *COTO Digital (COTO CICSA)* \
    Operator
  ], align(right)[ Oct 2025 - _present_ ])

  - Handled *PDAs and digital systems* for logistics operations and order
    dispatch.
  - Solved technical hardware and equipment incidents to ensure operational
    continuity.

  #datedsubsection(align(left)[
    *Bon Air Cafetería* \
    Administrative Manager
  ], align(right)[ Nov 2024 - Sep 2025 ])

  - Administration with the *FUDO POS* system: autonomous incident resolution
    and automation of sales records.

  #datedsubsection(align(left)[
    *Havanna* \
    Operational Support _(IT-oriented)_
  ], align(right)[ Feb 2024 - Jul 2024 ])

  - Support of internal systems with *MAXIREST*: handling, control and
    validation of the daily operation of the system and administrative
    processes.
]

#let projectstitle = [ Projects ]
#let projects = [
  #datedsubsection(align(left)[
    *SaaS Automation Platform for Retail Businesses* \
    Personal project
  ], align(right)[ _present_ ])

  - SaaS for process automation in retail. *Stack*: Python, FastAPI,
    PostgreSQL, Docker, JavaScript, Playwright, Next.js.
  - Functional prototype: automation of administrative processes and service
    integration with FastAPI.

  #datedsubsection(align(left)[
    *Automated Stock Management System* \
    UADE project
  ], align(right)[ 2025 ])

  - *Python* backend for stock management in a cafeteria: business logic,
    products/customers/sales, reports and inventory automation.
]

#let edutitle = [ Education ]
#let edu = [
  #datedsubsection(align(left)[
    *University Technician Degree in Software Development* \
    UADE
  ], align(right)[
    2025 - _present_ \
    GPA: 8.67
  ])

  #datedsubsection(align(left)[
    *Cybersecurity Fundamentals* \
    Certified course _(48.5 h)_
  ], align(right)[ Aug 2026 ])

]
