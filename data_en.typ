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
  Software Development student at UADE, focused on taking my first professional
  steps in the IT sector. Knowledge of programming languages and databases,
  with a strong interest in application development, *QA Testing*, automation
  and systems support. Real experience in operational environments: handling
  digital systems, solving first-line hardware/software incidents and
  optimizing daily processes. Analytical mindset, quick adaptation and a
  clear orientation towards solving technical problems.
]

#let techtitle = [ Technologies and Skills ]
#let tech = [
  *Development and Web*: Python, JavaScript, HTML, CSS, FastAPI, Next.js\
  *Databases and DevOps*: SQL, PostgreSQL, Git/GitHub, Docker, Playwright\
  *IT and Systems Support*: technical support, Windows, software
  installation, networks and Wi-Fi connectivity, basic hardware, incident
  resolution, operating systems management\
  *Competencies*: programming logic, QA Testing, file/spreadsheet
  management, process optimization, continuous improvement\
  *Languages*: Technical English _(intermediate/advanced for reading
  documentation and manuals)_
]

#let experiencetitle = [ Experience ]
#let experience = [
  #datedsubsection(align(left)[
    *COTO Digital (COTO CICSA)* \
    Operator
  ], align(right)[ October 2025 - _present_ ])

  - Handled *PDAs and internal digital systems* for order operation,
    logistics, preparation and dispatch.
  - Solved basic technical issues (printers and equipment) to ensure
    operational continuity.
  - Continuously optimized tasks and processes through the efficient use of
    digital tools.
  - Controlled and issued tickets/vouchers and tracked orders, ensuring
    correct management and delivery.

  #datedsubsection(align(left)[
    *Bon Air Cafetería* \
    Administrative Manager
  ], align(right)[ November 2024 - September 2025 ])

  - Full operational administration using the *FUDO POS* management system.
  - Resolved system incidents autonomously to avoid operational downtime.
  - Optimized digital processes and implemented solutions to automate sales
    records.
  - Managed daily stock control and cash closure supported by computer
    platforms.

  #datedsubsection(align(left)[
    *Havanna* \
    Operational Support _(IT-oriented)_
  ], align(right)[ February 2024 - July 2024 ])

  - Managed, controlled and supported internal operating systems using
    *MAXIREST* software.
  - Validated information and supported daily operations to ensure the
    correct functioning of the system and administrative processes.
]

#let projectstitle = [ Projects ]
#let projects = [
  #datedsubsection(align(left)[
    *SaaS Automation Platform for Retail Businesses* \
    Personal project
  ], align(right)[ _present_ ])

  - Development of a *Software as a Service (SaaS)* platform focused on
    automating processes for retail businesses.
  - *Stack*: Python, FastAPI, PostgreSQL, Docker, JavaScript, Playwright,
    Next.js.
  - Functional prototype: automation of administrative processes, information
    management with PostgreSQL and service integration with FastAPI.
    Pending: testing strategy and production deployment.

  #datedsubsection(align(left)[
    *Automated Stock Management System* \
    UADE project
  ], align(right)[ 2025 ])

  - Backend application for stock management in a cafeteria, focused on
    operational efficiency.
  - Implemented business logic and data structures to manage products,
    customers and sales.
  - Generated reports and automated inventory processes.
  - *Stack*: Python.
]

#let edutitle = [ Education ]
#let edu = [
  #datedsubsection(align(left)[
    *University Technician Degree in Software Development* \
    Universidad Argentina de la Empresa _(UADE)_
  ], align(right)[
    2025 - _present_ \
    Current GPA: 8.67
  ])

  #datedsubsection(align(left)[
    *Cybersecurity Fundamentals* \
    Certified course _(48.5 hours)_
  ], align(right)[ August 2026 ])

]
