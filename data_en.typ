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
  application development, *QA Testing* and automation, and daily use of
  *Linux*. Operational experience solving first-line technical incidents and
  optimizing processes with digital tools. Interest in *infrastructure and
  DevOps*. Quick adaptation and a clear orientation towards problem solving.
]

#let techtitle = [ Technologies and Skills ]
#let tech = [
  *Development*: Python, JavaScript, HTML, CSS, FastAPI, Next.js\
  *Databases and DevOps*: SQL, PostgreSQL, Linux (daily use), terminal/CLI
  (bash), Git/GitHub, Docker, Playwright\
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

  - Handled *PDAs and internal digital systems* for logistics operations and
    order preparation: printing and placing the *vouchers*.
  - *Ticket issuance, order control and tracking*, ensuring proper management
    of the operation.
  - Autonomous resolution of *basic technical issues* (printers and sector
    equipment) to ensure operational continuity.
  - Constant pursuit of *task and process optimization* through the efficient
    use of available tools.

  #datedsubsection(align(left)[
    *Bon Air Cafetería* \
    Administrative Manager
  ], align(right)[ Nov 2024 - Sep 2025 ])

  - Overall operational administration of the venue using the *FUDO POS*
    management system.
  - Autonomous resolution of *system incidents* to avoid operational
    bottlenecks.
  - *Digital process optimization*: implemented solutions to automate sales
    records, *stock control* and daily *cash register closures*, supported by
    IT platforms.

  #datedsubsection(align(left)[
    *Havanna* \
    Operational Support _(IT-oriented)_
  ], align(right)[ Feb 2024 - Jul 2024 ])

  - Handling, control and support of *internal systems* using the *MAXIREST*
    software.
  - *Information validation* and computer support for the waiters.
  - In charge of the *cash register* and the smooth operation of the sector.
]

#let projectstitle = [ Projects ]
#let projects = [
  #datedsubsection(align(left)[
    *SaaS Automation Platform for Retail Businesses* \
    Personal project
  ], align(right)[ _present_ ])

  - SaaS for process automation in retail. *Stack*: Python, FastAPI,
    PostgreSQL, Docker, JavaScript, Playwright, Next.js.
  - Functional prototype *containerized with Docker*: automation of
    administrative processes, service integration with FastAPI and automated
    *E2E testing with Playwright*. Testing strategy and production deployment
    still to be defined.

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
