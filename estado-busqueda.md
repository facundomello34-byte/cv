# 🗂️ Estado de búsqueda laboral — Facundo Mello

> **Documento vivo** — actualizado cada sesión. Última actualización: **30/09/2026**.
> Cuando vuelvas a trabajar con un asistente, empezá leyendo este archivo + `README.md`.

---

## 1) Snapshop del perfil

- **Estudios:** Tecnicatura Universitaria en Desarrollo de Software (UADE), 2025–presente, promedio **8.67** · Graduación estimada: **fines de 2028** · Curso certificado Fundamentos de Ciberseguridad (48.5 h, Ago 2026)
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
| `reports/jobs-latest.md` | Digest diario crudo (LinkedIn + Exa) — ~50 ofertas, mayoría ruido |
| `reports/priorizadas-YYYY-MM-DD.md` | ⭐ **LO PRIMERO QUE ABRÍS CADA MAÑANA** — ofertas filtradas y priorizadas por tu perfil |
| `reports/vistas.json` | DB de ofertas ya vistas + postuladas (evita postular 2 veces, marca 🆕 las nuevas) |
| `scripts/jobs.sh` | Script del digest (LinkedIn guest API + Exa si hay key) |
| `scripts/filter_jobs.py` | ⭐ Motor de filtrado: descarta senior/spam, puntúa fit con tu perfil |
| `scripts/perfil_filtro.json` | **Tu perfil como datos** — editá acá para afinar el filtro sin tocar código |
| `.github/workflows/jobs-daily.yml` | Corre `jobs.sh` + filtro todos los días 08:15 BA (GitHub Actions) |

---

## 3) Pipeline automático (no requiere hacer nada)

- **08:15 (BA) todos los días** GitHub Actions: busca ofertas → **filtra y prioriza** → `reports/priorizadas-YYYY-MM-DD.md`.
- El filtro **descarta senior/spam/ofertas de otros países** y puntúa el fit:
  junior/trainee **+5** · soporte/QA **+4** · linux/python/dev **+3** · devops/cloud **+2** · publicada ≤2 días **+2** · empresa preferida **+2/3**.
- Marca **🆕 NUEVA** solo las ofertas que no viste antes (DB `vistas.json`) — ya no se te escapa nada.
- Refrescar manualmente: `bash scripts/jobs.sh --days 2`
- Marcar postulación: `python3 scripts/filter_jobs.py --mark-applied "URL"`
- Ver estadísticas: `python3 scripts/filter_jobs.py --stats`
- Ajustar filtro (palabras, empresas, umbrales): editar `scripts/perfil_filtro.json`

---

## 4) ✅ Checklist — ACCIÓN DE HOY (30/09, detectadas por el filtro)

### 🚨 Postular HOY (fit más alto, nuevas 28-30/09)
- [ ] **QA SAP GUI/SAP LOGON JR — Tata Consultancy Services (TCS)** [11 pts · 🆕 29/09] → https://ar.linkedin.com/jobs/view/qa-sap-gui-sap-logon-jr-at-tata-consultancy-services-4473257015 · carta variante **QA**
- [ ] **Soporte de Calidad — Cervecería y Maltería Quilmes** [10 pts · 🆕 29/09 · QA en empresa grande] → https://ar.linkedin.com/jobs/view/soporte-de-calidad-at-cervecer%C3%ADa-y-malter%C3%ADa-quilmes-4464398615 · carta variante **QA**
- [ ] **Junior L1 Genesys Support Engineer — Miratech** [10 pts · 28/09] → https://ar.linkedin.com/jobs/view/junior-l1-genesys-support-engineer-at-miratech-4470858313 · carta variante **soporte**
- [ ] **QA Funcional SAP — Stefanini LATAM** [9 pts · 🆕 29/09 · remoto] → https://ar.linkedin.com/jobs/view/qa-funcional-sap-at-stefanini-latam-4471943363 · carta variante **QA**
- [ ] **Application Support Engineer — Accenture** [9 pts · 30/09] → https://ar.linkedin.com/jobs/view/application-support-engineer-at-accenture-argentina-4469412609
- [ ] **Analista de Soporte de Aplicaciones (Python, SQL, Linux) — Doctec** [9 pts · 26/09 · **PERFIL EXACTO**] → https://ar.linkedin.com/jobs/view/analista-de-soporte-de-aplicaciones-con-conocimientos-en-python-sql-y-linux-at-doctec-digitalizaci%C3%B3n-de-documentos-4470507448
- [ ] **Auxiliar TI — Bumeran** [🆕 publicada hace horas 30/09] → https://www.bumeran.com.ar/empleos/auxiliar-ti-importante-empresa-exportadora-2190288.html
- [ ] **Soporte de Comunicaciones — Stefanini LATAM** [8 pts · 🆕 28/09] → https://ar.linkedin.com/jobs/view/soporte-de-comunicaciones-at-stefanini-latam-4471553075
- [ ] **Soporte de Aplicaciones ERP (Home Office) — Bumeran** [🆕 ayer 29/09 · remoto] → https://www.bumeran.com.ar/empleos/soporte-de-aplicaciones-erp-home-office-mauricio-paluch-2190276.html
- [ ] **Soporte para TI Nivel 1 — INVAP** [7 pts · 🆕 28/09] → https://ar.linkedin.com/jobs/view/soporte-para-ti-nivel-1-at-invap-4472713489
- [ ] **Core Network Junior con inglés — Experis Argentina** [7 pts · 29/09] → https://ar.linkedin.com/jobs/view/core-network-junior-con-ingl%C3%A9s-at-experis-argentina-4473266867
- [ ] **QA Junior-Temporal — Acciona IT** [QA junior, pide ~2 años pero regla 60-70%: aplicar igual] → https://www.bumeran.com.ar/empleos/qa-junior-temporal-acciona-it-1118425932.html
- [ ] **Trainee informático JR — Yel (CABA)** [🆕 en Próximo Trabajo] → https://proximotrabajo.com/empleos/trainee-informatico-jr-caba-cd3c3af3-c582-4f9d-893f-f787cfb18095
- [ ] **Jr Service Desk Agent (Portuguese & Spanish) — Cognizant** [solo si manejás portugués] → https://ar.linkedin.com/jobs/view/jr-service-desk-agent-portuguese-spanish-at-cognizant-4442274343

### ⏳ Seguimiento (postulaciones anteriores — esperar y anotar respuesta)
- [ ] Besysoft (22/09) → si no hay respuesta en 7-10 días, buscar mail de RRHH de Besysoft y hacer follow-up
- [ ] Wetcom — Jóvenes Talentos IT ed. 17 → arranca octubre 2026 — **verificar que la postulación entró**
- [ ] EY — Junior de IT (Banco de Talentos) → postular + WhatsApp (011) 2469-4914
- [ ] Accenture — Technology Support Engineer (23/09) → postular si no se hizo
- [ ] Flux IT — QA Analyst Jr → postular con carta Playwright

### Configurar perfiles y canales (si falta)
- [ ] **Bumeran**: CV cargado + alertas activas (`QA`, `soporte técnico`, `junior`, últimos 7 días)
- [ ] **LinkedIn**: headline *"Estudiante Desarrollo de Software UADE · Python, Linux, Docker, Playwright · Buscando primer empleo IT"* + #OpenToWork
- [ ] **UADE Portal de Empleo**: subir CV

### Reglas de oro (no borrar)
1. Postular en **24–48 h** de publicada la oferta (el filtro marca 🆕 para esto).
2. **Nunca inventar** experiencia/herramientas que no estén en el CV (Jira, Terraform, CNC, etc.).
3. **Coherencia total** entre CV, cartas, Bumeran, LinkedIn y entrevistas.
4. Follow-up a los 7-10 días sin respuesta.
5. Volumen: mínimo **10 postulaciones/semana** — cada postulación es un ticket de lotería.

---

## 5) 📋 Tabla de postulaciones (tracking)

| Fecha | Empresa | Puesto | Portal/Link | Estado | Notas |
|---|---|---|---|---|---|
| 22/09 | Besysoft S.A. | Analista de Soporte y Operaciones TI Junior | LinkedIn | ✔️ Enviada | Follow-up si no responde ~02/10 |
| 30/09 | Tata Consultancy Services | QA SAP GUI/SAP LOGON JR | LinkedIn | ⏳ Pendiente | [11 pts] Postular HOY, carta QA |
| 30/09 | Cervecería y Maltería Quilmes | Soporte de Calidad | LinkedIn | ⏳ Pendiente | [10 pts] QA en empresa grande |
| 30/09 | Miratech | Junior L1 Genesys Support Engineer | LinkedIn | ⏳ Pendiente | [10 pts] Junior explícito |
| 30/09 | Stefanini LATAM | QA Funcional SAP | LinkedIn | ⏳ Pendiente | [9 pts] Remoto |
| 30/09 | Accenture | Application Support Engineer | LinkedIn | ⏳ Pendiente | [9 pts] Fresca 30/09 |
| 30/09 | Doctec | Analista Soporte Aplicaciones (Py/SQL/Linux) | LinkedIn | ⏳ Pendiente | [9 pts] PERFIL EXACTO |
| 30/09 | Empresa exportadora | Auxiliar TI | Bumeran | ⏳ Pendiente | Publicada hace horas |
| 30/09 | Stefanini LATAM | Soporte de Comunicaciones | LinkedIn | ⏳ Pendiente | [8 pts] |
| 30/09 | Mauricio Paluch | Soporte Aplicaciones ERP (Home Office) | Bumeran | ⏳ Pendiente | Remoto, publicada ayer |
| 30/09 | INVAP | Soporte para TI Nivel 1 | LinkedIn | ⏳ Pendiente | [7 pts] |
| 30/09 | Experis Argentina | Core Network Junior con inglés | LinkedIn | ⏳ Pendiente | [7 pts] |
| 30/09 | Acciona IT | QA Junior-Temporal | Bumeran | ⏳ Pendiente | Pide 2 años — aplicar igual |
| 30/09 | Yel | Trainee informático JR (CABA) | PróximoTrabajo | ⏳ Pendiente | — |
| 30/09 | Cognizant | Jr Service Desk Agent (PT/ES) | LinkedIn | ⏳ Dudosa | Solo si maneja portugués |

> Al postular, marcar en la DB: `python3 scripts/filter_jobs.py --mark-applied "URL"` — así el filtro muestra "ya postulada" y no la repite.

---

## 6) 💬 Banco de respuestas para formularios

**Disponibilidad** (`¿Cuál es tu disponibilidad?`):
> "Disponibilidad inmediata. Además de estudiar la Tecnicatura en Desarrollo de Software, actualmente trabajo en COTO Digital, por lo que puedo coordinar la fecha de ingreso avisando con la anticipación que corresponda a mi empleador. Me adapto a los horarios que necesite la empresa."
> (Corta: "Disponibilidad inmediata. Puedo coordinar el ingreso con mi empleador actual y adaptarme al horario.")

**Fecha de graduación estimada** (`¿Cuándo te recibís?` / `Expected graduation date`):
> "Graduación estimada: finales de 2028. Actualmente curso la Tecnicatura Universitaria en Desarrollo de Software en UADE (promedio 8.67)."
> (Corta: "Estimada fines de 2028 — UADE, Tecnicatura en Desarrollo de Software.")

**CNC/materiales u otra experiencia que NO tengo** → responder con honestidad:
> "No tengo experiencia con [X]. Mi experiencia es en soporte IT y sistemas (Windows/Linux, resolución de incidencias, sistemas POS) y desarrollo de software (Python, Linux, Docker, Playwright). Estoy buscando mi primer empleo en el sector IT."

**Pretensión salarial:** $900.000–$1.200.000 ARS brutos/mes (negociable) — referencia: mediana dev junior Sysarmy 2026 ≈ $1.538.500; primera experiencia/soporte está por debajo. Si el puesto es dev junior: pedir ~$1.300.000–$1.500.000.

**Palabras clave búsqueda Bumeran:** `soporte técnico` · `QA` · `tester` · `junior` · `trainee` · `help desk`/`mesa de ayuda` · `soporte de aplicaciones` · `DevOps` (filtrar junior) · `desarrollador` + filtros (Últimos 7 días, Categoría Sistemas, CABA/GBA).

---

## 7) 📌 Próximos pasos recomendados (próxima sesión)

1. **Abrir `reports/priorizadas-<fecha>.md`** — es el nuevo digest filtrado: solo ofertas que valen la pena, las nuevas marcadas 🆕.
2. Postular a las ~15 pendientes de la sección 4 (las de 30/09) — priorizar las [10-11 pts] y las 🆕.
3. Al postular cada una: `python3 scripts/filter_jobs.py --mark-applied "URL"`.
4. Si una oferta pide algo que no está en el CV (ej. SAP, Jira): no mentir, pero aplicar igual si cumplís 60-70%.
5. Adaptar cartas: pedí al asistente "adaptá carta para [oferta]" usando `carta_generica.typ` como base.
6. En GitHub Actions, el digest ya usa el filtro nuevo desde mañana (08:15).
