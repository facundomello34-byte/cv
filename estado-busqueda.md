# 🗂️ Estado de búsqueda laboral — Facundo Mello

> **Documento vivo** — actualizado cada sesión. Última actualización: **24/09/2026**.
> Cuando vuelvas a trabajar con un asistente, empezá leyendo este archivo + `README.md`.

---

## 1) Snapshop del perfil

- **Estudios:** Tecnicatura Universitaria en Desarrollo de Software (UADE), 2025–presente, promedio **8.67** · Curso certificado Fundamentos de Ciberseguridad (48.5 h, Ago 2026)
- **Stack:** Python, JavaScript, HTML/CSS, FastAPI, Next.js · SQL, PostgreSQL · Linux (diario), bash, Git/GitHub, Docker, Playwright
- **Foco:** primer empleo formal en IT — QA/Testing, soporte IT, automatización, DevOps/trainee
- **Experiencia:** COTO Digital (Operador, Oct 2025–presente) · Bon Air Cafetería (Encargado Admin, Nov 2024–Sep 2025) · Havanna (Soporte Operativo IT, Feb–Jul 2024)
- **Ubicación:** Buenos Aires · **Disponibilidad:** inmediata (avisando a empleador actual) · **Modalidad:** indistinta

---

## 2) Archivos del repo (índice rápido)

| Archivo | Para qué |
|---|---|
| `cv_es.typ` / `cv_en.typ` + `data_*.typ` | Fuente del CV (ES/EN) → compilan `cv_*.pdf` (auto en GitHub Actions/Pages) |
| `carta_ey.typ` | Carta específica para EY (Junior de IT, Ref. 1462251) |
| `carta_generica.typ` / `.pdf` | **Carta genérica ES** — placeholders + 3 variantes (QA/DevOps/Soporte) al final del `.typ` |
| `carta_generica_en.typ` / `.pdf` | Carta genérica EN (ofertas remotas) |
| `perfil-bumeran.md` | **Todo el contenido listo para pegar en Bumeran** (resumen, salario, formación, skills, experiencia) |
| `fuentes-empleo.md` | **Todas las fuentes**: ofertas activas (sección 0 = postulá HOY), portales, trainee programs, correos/canales confirmados (sección 5), plan de acción |
| `consultoras.md` | **🏢 Guía de consultoras IT** (verificada 23/09): canales de postulación, programas trainee con fechas, vacantes vivas en Accenture/Wetcom/Stefanini/NTT DATA/Softtek/Baufest/Flux, emails reales, top 10 acciones |
| `reports/jobs-latest.md` | Digest diario automático de ofertas (LinkedIn + Exa) — lo actualiza el bot |
| `reports/jobs-YYYY-MM-DD.md` | Digest de cada día |
| `scripts/jobs.sh` | Script del digest (LinkedIn guest API + Exa si hay key) |
| `.github/workflows/jobs-daily.yml` | Corre `jobs.sh` todos los días 08:15 BA (GitHub Actions) |

---

## 3) Pipeline automático (no requiere hacer nada)

- **08:15 (BA) todos los días** GitHub Actions genera `reports/jobs-latest.md` con ofertas junior de LinkedIn y boards argentinos → **revisalo cada mañana** y postulá a lo nuevo.
- Para refrescar manualmente: `bash scripts/jobs.sh --days 2` (opcional `--commit "msg"`).

---

## 4) ✅ Checklist pendiente (de la sesión del 23/09)

### 🚨 HOY (verificadas frescas 22–23/09 en `consultoras.md`)
- [ ] **Accenture — Technology Support Engineer** (pub. 23/09, hace horas) → https://ar.linkedin.com/jobs/view/technology-support-engineer-at-accenture-argentina-4469613765 · **carta lista: `carta_accenture.typ`**
- [ ] **Wetcom — Jóvenes Talentos IT ed. 17** (empieza oct 2026; part-time 6 meses ideal para estudiar; pide estudiante de sistemas + inglés = TU PERFIL) → Bumeran: https://www.bumeran.com.ar/empleos/jovenes-talentos-it-2026-wetcom-s.a.-1118356445.html · **carta lista: `carta_wetcom.typ`**
- [ ] **Accenture — Site Reliability/DevOps Engineer** (22/09) → https://ar.linkedin.com/jobs/view/site-reliability-devops-engineer-at-accenture-argentina-4469073076 (carta variante DevOps)
- [ ] **Stefanini — Application Support** (PM, híbrido, SQL básico, inglés) → https://www.sercanto.com.ar/detail/a/application-support_buenos-aires_16961531 + **registrarse en su ATS**: https://stefanini-argentina.pandape.computrabajo.com
- [ ] **NTT DATA — Trainee Fullstack** (capacitación RPG) → https://careers.emeal.nttdata.com/s/offer/a1J2p00000A3snUEAR/desarrolladores-fullstack-trainee-o-junior-para-capacitarse-en-rpg-as400?language=es
- [ ] **Softtek — Analista Funcional Associate** → https://www.hubmub.com/jobs/1006573/analista-funcional + usuario en https://www.softtek.com/careers
- [ ] **Flux IT — QA Analyst Jr.** (100% remoto) → https://fluxit.breezy.hr/p/7d6df5000801-qa-analyst-jr (carta variante QA)
- [ ] **Baufest — Junior .NET** (para quedar en base) → https://baufest.avature.net/jobs/JobDetail/Remoto-Argentina-Junior-Net-Developer/5918

### Postular ya (ofertas frescas 20–24/09, links en `fuentes-empleo.md` sección 0)
- [ ] **Ciklum — Support Engineer** (23/09; chequear nivel, Ciklum toma juniors)
- [ ] **ITSM Consulting — Operador/a Mesa de Ayuda IT** (Bumeran, 20/09; pide 2/3 años help desk — experiencia Havanna/Bon Air sirve)
- [ ] **Despegar — Pasaporte Trainee 2.0** (abierto en Lever; 20 h/sem híbrido con asignación — verificar requisito 50% carrera)
- [ ] **Rocket Stars — Help Desk N3 Infraestructura** (24/09; chequear si pide exp.)
- [ ] **SONDA — Asistente Administrativo 1B** (23/09; pie en la puerta en integradora)
- [ ] **artax — Analista de Homologación y Soporte a Clientes** (LinkedIn, 24/09, perfil soporte IT) → https://ar.linkedin.com/jobs/view/analista-de-homologaci%C3%B3n-y-soporte-a-clientes-at-artax-4469681052
- [ ] **Besysoft** — Analista de Soporte y Operaciones TI Junior (LinkedIn, 21/09) ← prioridad, perfil exacto
- [ ] **LUMINA** — Técnico de microinformática (LinkedIn, 21/09)
- [ ] **Assurant** — Associate Technical Support Analyst (repub. 21/09)
- [ ] **Arize AI** — DevOps Support Engineer Argentina (LinkedIn, 21/09)
- [ ] **Webflow** — IT Support Specialist (Emploive, 15/09)
- [ ] **OLITEL** — DevOps Junior (Emploive, 17/09)
- [ ] **Fund. Educación p/el Progreso** — Cloud Platform Engineer AWS/DevOps (Bumeran, 16/09)
- [ ] **Teamcubation** — Junior Developer Banca (Emploive, 15/09)

### Si no postulaste aún (vigentes 17–19/09)
- [ ] LinkedIn: **RYACO** Soporte Aplicaciones Junior · **Prosegur** Soporte Técnico JR · **Avature** Technical Support Specialist · **Securion** Técnico NOC · **Cognizant** IT L2 · **Accenture** Analista Automatización
- [ ] Bumeran sep 2026: **QA Manual Remoto (aliantec)** · **Soporte ERP Home Office** · **Soporte IT** · **SISTEMAS (Lazos)** · **Analista Sistemas JR (Russell Bedford)** · **Desarrollador Full Stack** (links en sección "Solo Bumeran")
- [ ] Vigentes 12–16/09: **Mandü/Visma DevOps Jr** · **Flux IT QA Jr (remoto)** · **DevOps/Sysadmin Linux remoto** · **Jr. Cloud Engineer Avature**

### Configurar perfiles y canales
- [ ] **Bumeran**: cargar todo de `perfil-bumeran.md` + subir `cv_es.pdf` + CV visible + 3 búsquedas guardadas con alertas (`QA`, `soporte técnico`, `junior`, filtro últimos 7 días)
- [ ] **LinkedIn**: headline *"Estudiante de Desarrollo de Software UADE · Python, Linux, Docker, Playwright · Buscando primer empleo IT"* + #OpenToWork + descomentar la línea `linkedin` en `data_es.typ`/`data_en.typ`
- [ ] **UADE Portal de Empleo**: subir CV (https://www.uade.edu.ar/acerca-de-uade/oportunidades-para-alumnos/) — la oficina presenta postulantes a empresas (incl. Indra por convenios)
- [ ] **UTN FRBA**: escribir a `busquedas@electron.frba.utn.edu.ar` dejando CV (página: https://frba.utn.edu.ar/electronica/busqueda-laboral/)
- [ ] **Accenture**: portal Early Careers · **Despegar** Pasaporte Trainee · **ML IT Academy** (chequear requisito 50% de carrera)
- [ ] **Endava**: anotar en el calendario que **The Americas Internship (QA Automation, Python) abre en FEBRERO 2027** → https://www.endava.com/careers/early-careers/internship-programmes-the-americas

### Reglas de oro (no borrar)
1. Postular en **24–48 h** de publicada la oferta.
2. **Nunca inventar** experiencia/herramientas que no estén en el CV (Jira, Terraform, CNC, etc.).
3. **Coherencia total** entre CV, cartas, Bumeran, LinkedIn y entrevistas (datos, fechas, promedio, disponibilidad).

---

## 5) 📋 Tabla de postulaciones (tracking)

| Fecha | Empresa | Puesto | Portal/Link | Estado | Notas |
|---|---|---|---|---|---|
| 22/09 | Besysoft S.A. | Analista de Soporte y Operaciones TI Junior | LinkedIn | ✔️ Enviada | — |
| 23/09 | Accenture | Technology Support Engineer | LinkedIn | ⏳ Pendiente | Carta lista `carta_accenture.typ` |
| 23/09 | Wetcom | Jóvenes Talentos IT ed. 17 | Bumeran | ⏳ Pendiente | Carta lista `carta_wetcom.typ` |
| 23/09 | Stefanini | Application Support (PM) | Sercanto + ATS | ⏳ Pendiente | Registrarse en ATS pandape |
| 23/09 | NTT DATA | Trainee Fullstack RPG | ATS EMEAL | ⏳ Pendiente | — |
| 23/09 | Flux IT | QA Analyst Jr. | breezy | ⏳ Pendiente | Carta variante QA |
| 24/09 | Ciklum | Support Engineer | LinkedIn | ⏳ Pendiente | Agregada en sesión 24/09 |
| 24/09 | ITSM Consulting | Operador/a Mesa de Ayuda IT | Bumeran | ⏳ Pendiente | Agregada en sesión 24/09 |
| 24/09 | Despegar | Pasaporte Trainee 2.0 | Lever | ⏳ Pendiente | Chequear requisito 50% carrera |

---

## 6) 💬 Banco de respuestas para formularios

**Disponibilidad** (`¿Cuál es tu disponibilidad?`):
> "Disponibilidad inmediata. Además de estudiar la Tecnicatura en Desarrollo de Software, actualmente trabajo en COTO Digital, por lo que puedo coordinar la fecha de ingreso avisando con la anticipación que corresponda a mi empleador. Me adapto a los horarios que necesite la empresa."
> (Corta: "Disponibilidad inmediata. Puedo coordinar el ingreso con mi empleador actual y adaptarme al horario.")

**CNC/materiales u otra experiencia que NO tengo** → responder con honestidad:
> "No tengo experiencia con [X]. Mi experiencia es en soporte IT y sistemas (Windows/Linux, resolución de incidencias, sistemas POS) y desarrollo de software (Python, Linux, Docker, Playwright). Estoy buscando mi primer empleo en el sector IT."

**Pretensión salarial:** $900.000–$1.200.000 ARS brutos/mes (negociable) — referencia: mediana dev junior Sysarmy 2026 ≈ $1.538.500; primera experiencia/soporte está por debajo. Si el puesto es dev junior: pedir ~$1.300.000–$1.500.000.

**Palabras clave búsqueda Bumeran:** `soporte técnico` · `QA` · `tester` · `junior` · `trainee` · `help desk`/`mesa de ayuda` · `soporte de aplicaciones` · `DevOps` (filtrar junior) · `desarrollador` + filtros (Últimos 7 días, Categoría Sistemas, CABA/GBA).

---

## 7) 📌 Próximos pasos recomendados (próxima sesión)

1. Revisar `reports/jobs-latest.md` (digest de hoy 24/09 — trajo ~50 ofertas; mayoría senior, filtrar junior/soporte).
2. Postular a las 8 pendientes del checklist de HOY (sección 4) — las cartas de Accenture y Wetcom ya están compiladas en PDF.
3. Revisar `consultoras.md` para los canales de todas las consultoras y las fechas de programas trainee (Endava feb-2027).
4. Actualizar la tabla de postulaciones de la sección 5.
5. Pedir al asistente: adaptar carta a oferta puntual, armar perfil LinkedIn, actualizar CV, etc.
