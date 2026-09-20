# 🗂️ Estado de búsqueda laboral — Facundo Mello

> **Documento vivo** — actualizado cada sesión. Última actualización: **19/09/2026**.
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
| `reports/jobs-latest.md` | Digest diario automático de ofertas (LinkedIn + Exa) — lo actualiza el bot |
| `reports/jobs-YYYY-MM-DD.md` | Digest de cada día |
| `scripts/jobs.sh` | Script del digest (LinkedIn guest API + Exa si hay key) |
| `.github/workflows/jobs-daily.yml` | Corre `jobs.sh` todos los días 08:15 BA (GitHub Actions) |

---

## 3) Pipeline automático (no requiere hacer nada)

- **08:15 (BA) todos los días** GitHub Actions genera `reports/jobs-latest.md` con ofertas junior de LinkedIn y boards argentinos → **revisalo cada mañana** y postulá a lo nuevo.
- Para refrescar manualmente: `bash scripts/jobs.sh --days 2` (opcional `--commit "msg"`).

---

## 4) ✅ Checklist pendiente (de la sesión del 19/09)

### Postular ya (ofertas activas 17–19/09)
- [ ] LinkedIn: **RYACO** Soporte Aplicaciones Junior · **Prosegur** Soporte Técnico JR · **Avature** Technical Support Specialist · **Assurant** Associate Support Analyst (links en `fuentes-empleo.md` sección 0)
- [ ] Bumeran sep 2026: **QA Manual Remoto (aliantec)** · **Soporte ERP Home Office** · **Soporte IT** · **SISTEMAS (Lazos)** · **Analista Sistemas JR (Russell Bedford)** · **Desarrollador Full Stack** (links en sección "Solo Bumeran")
- [ ] Vigentes 12–16/09: **Mandü/Visma DevOps Jr** · **Flux IT QA Jr (remoto)** · **DevOps/Sysadmin Linux remoto** · **Jr. Cloud Engineer Avature**

### Configurar perfiles
- [ ] **Bumeran**: cargar todo de `perfil-bumeran.md` + subir `cv_es.pdf` + CV visible + 3 búsquedas guardadas con alertas (`QA`, `soporte técnico`, `junior`, filtro últimos 7 días)
- [ ] **LinkedIn**: headline *"Estudiante de Desarrollo de Software UADE · Python, Linux, Docker, Playwright · Buscando primer empleo IT"* + #OpenToWork + descomentar la línea `linkedin` en `data_es.typ`/`data_en.typ`

### Canales directos
- [ ] **UTN FRBA**: escribir a `busquedas@electron.frba.utn.edu.ar` dejando CV (página: https://frba.utn.edu.ar/electronica/busqueda-laboral/)
- [ ] **UADE**: subir CV al Portal de Empleo de alumnos (https://www.uade.edu.ar/acerca-de-uade/oportunidades-para-alumnos/)
- [ ] **Accenture**: portal Early Careers · **Despegar** Pasaporte Trainee · **ML IT Academy** (chequear requisito 50% de carrera)

### Reglas de oro (no borrar)
1. Postular en **24–48 h** de publicada la oferta.
2. **Nunca inventar** experiencia/herramientas que no estén en el CV (Jira, Terraform, CNC, etc.).
3. **Coherencia total** entre CV, cartas, Bumeran, LinkedIn y entrevistas (datos, fechas, promedio, disponibilidad).

---

## 5) 📋 Tabla de postulaciones (tracking)

| Fecha | Empresa | Puesto | Portal/Link | Estado | Notas |
|---|---|---|---|---|---|
| 19/09 | *(ejemplo)* RYACO | Soporte Aplicaciones Junior | LinkedIn | Enviada / Pendiente | — |

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

1. Revisar `reports/jobs-latest.md` (ofertas nuevas del día).
2. Actualizar la tabla de postulaciones de la sección 5.
3. Pedir al asistente: adaptar carta a oferta puntual, armar perfil LinkedIn, actualizar CV, etc.
