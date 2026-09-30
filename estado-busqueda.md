# 🗂️ Estado de búsqueda laboral — Facundo Mello

> **Documento vivo** — actualizado cada sesión. Última actualización: **30/09/2026**.
> Cuando vuelvas a trabajar con un asistente, empezá leyendo este archivo + `README.md`.

---

## 1) Snapshot del perfil

- **Estudios:** Tecnicatura Universitaria en Desarrollo de Software (UADE), 2025–presente, promedio **8.67** · Graduación estimada: **fines de 2028** · Curso certificado Fundamentos de Ciberseguridad (48.5 h, Ago 2026)
- **Stack:** Python, JavaScript, HTML/CSS, FastAPI, Next.js · SQL, PostgreSQL · Linux (diario), bash, Git/GitHub, Docker, Playwright
- **Foco:** primer empleo formal en IT — QA/Testing, soporte IT, automatización, DevOps/trainee
- **Experiencia:** COTO Digital (Operador, Oct 2025–presente) · Bon Air Cafetería (Encargado Admin, Nov 2024–Sep 2025) · Havanna (Soporte Operativo IT, Feb–Jul 2024)
- **Ubicación:** Buenos Aires · **Disponibilidad:** inmediata (avisando a empleador actual) · **Modalidad:** indistinta

---

## 2) Pipeline automático (nuevo, activo desde 30/09)

- **08:15 (BA) todos los días** GitHub Actions: busca ofertas → **filtra y prioriza** → `reports/priorizadas-YYYY-MM-DD.md`.
- El filtro descarta senior/spam/ofertas de otros países y puntúa el fit:
  junior/trainee **+5** · soporte/QA **+4** · linux/python/dev **+3** · devops/cloud **+2** · publicada ≤2 días **+2** · empresa preferida **+2/3**.
- Marca **🆕 NUEVA** solo las ofertas nunca vistas (DB `reports/vistas.json`, 173 registradas) — ya no se te escapa nada ni postulás dos veces.

```bash
bash scripts/jobs.sh --days 2                          # refrescar digest ahora
python3 scripts/filter_jobs.py --mark-applied "URL"    # marcar postulación
python3 scripts/filter_jobs.py --stats                 # ver tracking
```

- Ajustar filtro (palabras, empresas, umbrales): editar `scripts/perfil_filtro.json`.

---

## 3) Índice de archivos

| Archivo | Para qué |
|---|---|
| `reports/priorizadas-YYYY-MM-DD.md` | ⭐ **LO PRIMERO QUE ABRÍS CADA MAÑANA** — ofertas filtradas y priorizadas |
| `reports/jobs-latest.md` | Digest crudo (LinkedIn + Exa), ~50 ofertas — mayoría ruido |
| `reports/vistas.json` | DB de ofertas vistas + postuladas |
| `scripts/jobs.sh` | Digest diario (LinkedIn guest API + Exa) |
| `scripts/filter_jobs.py` | Motor de filtrado y scoring |
| `scripts/perfil_filtro.json` | Perfil como datos — editar para afinar el filtro |
| `cv_es.typ` / `cv_en.typ` + `data_*.typ` | Fuente del CV (ES/EN) → PDFs (auto en GitHub Actions) |
| `carta_generica.typ` | Carta genérica + 3 variantes (QA/DevOps/Soporte) al final |
| `carta_generica_en.typ` | Carta genérica EN (ofertas remotas) |
| `carta_accenture.typ` / `carta_wetcom.typ` / `carta_ey.typ` | Cartas específicas ya compiladas |
| `perfil-bumeran.md` | Contenido listo para pegar en Bumeran |
| `fuentes-empleo.md` / `consultoras.md` | Portales, consultoras, trainee programs, canales |
| `.github/workflows/jobs-daily.yml` | Corre todo el pipeline diario 08:15 BA |

---

## 4) ✅ ACCIÓN DE HOY (30/09 — detectadas por el filtro + búsqueda web)

### 🚨 Postular HOY (en este orden, fit más alto primero)

- [ ] **QA SAP GUI/SAP LOGON JR — Tata Consultancy Services (TCS)** [11 pts · 🆕 29/09] → https://ar.linkedin.com/jobs/view/qa-sap-gui-sap-logon-jr-at-tata-consultancy-services-4473257015 · carta variante **QA**
- [ ] **Soporte de Calidad — Cervecería y Maltería Quilmes** [10 pts · 🆕 29/09 · QA en empresa grande] → https://ar.linkedin.com/jobs/view/soporte-de-calidad-at-cervecer%C3%ADa-y-malter%C3%ADa-quilmes-4464398615 · carta variante **QA**
- [ ] **Junior L1 Genesys Support Engineer — Miratech** [10 pts · 28/09] → https://ar.linkedin.com/jobs/view/junior-l1-genesys-support-engineer-at-miratech-4470858313 · carta variante **soporte**
- [ ] **QA Funcional SAP — Stefanini LATAM** [9 pts · 🆕 29/09 · remoto] → https://ar.linkedin.com/jobs/view/qa-funcional-sap-at-stefanini-latam-4471943363 · carta variante **QA**
- [ ] **Application Support Engineer — Accenture** [9 pts · 30/09] → https://ar.linkedin.com/jobs/view/application-support-engineer-at-accenture-argentina-4469412609
- [ ] **Analista de Soporte de Aplicaciones (Python, SQL, Linux) — Doctec** [9 pts · 26/09 · **PERFIL EXACTO**] → https://ar.linkedin.com/jobs/view/analista-de-soporte-de-aplicaciones-con-conocimientos-en-python-sql-y-linux-at-doctec-digitalizaci%C3%B3n-de-documentos-4470507448
- [ ] **Auxiliar TI — Bumeran** [🆕 publicada hace horas] → https://www.bumeran.com.ar/empleos/auxiliar-ti-importante-empresa-exportadora-2190288.html
- [ ] **Soporte de Comunicaciones — Stefanini LATAM** [8 pts · 🆕 28/09] → https://ar.linkedin.com/jobs/view/soporte-de-comunicaciones-at-stefanini-latam-4471553075
- [ ] **Soporte de Aplicaciones ERP (Home Office) — Bumeran** [🆕 ayer · remoto] → https://www.bumeran.com.ar/empleos/soporte-de-aplicaciones-erp-home-office-mauricio-paluch-2190276.html
- [ ] **Soporte para TI Nivel 1 — INVAP** [7 pts · 🆕 28/09] → https://ar.linkedin.com/jobs/view/soporte-para-ti-nivel-1-at-invap-4472713489
- [ ] **Core Network Junior con inglés — Experis Argentina** [7 pts · 29/09] → https://ar.linkedin.com/jobs/view/core-network-junior-con-ingl%C3%A9s-at-experis-argentina-4473266867
- [ ] **QA Junior-Temporal — Acciona IT** [QA junior, pide ~2 años — regla 60-70%: aplicar igual] → https://www.bumeran.com.ar/empleos/qa-junior-temporal-acciona-it-1118425932.html
- [ ] **Trainee informático JR — Yel (CABA)** [🆕 Próximo Trabajo] → https://proximotrabajo.com/empleos/trainee-informatico-jr-caba-cd3c3af3-c582-4f9d-893f-f787cfb18095
- [ ] **Jr Service Desk Agent (Portuguese & Spanish) — Cognizant** [solo si manejás portugués] → https://ar.linkedin.com/jobs/view/jr-service-desk-agent-portuguese-spanish-at-cognizant-4442274343

### ⏳ Seguimiento (postulaciones anteriores)

- [ ] **Besysoft** (Enviada 22/09) → si no hay respuesta para el **~02/10**, buscar mail RRHH de Besysoft y hacer follow-up
- [ ] **Wetcom — Jóvenes Talentos IT ed. 17** → arranca octubre 2026 — **verificar que la postulación entró** (Bumeran: https://www.bumeran.com.ar/empleos/jovenes-talentos-it-2026-wetcom-s.a.-1118356445.html)
- [ ] **EY — Junior de IT (Banco de Talentos)** → postular + WhatsApp (011) 2469-4914 · https://careers.ey.com/ey/job/Buenos-Aires-EY-Junior-de-IT-CABA-1437/998182801/
- [ ] **Flux IT — QA Analyst Jr.** (100% remoto) → postular con carta Playwright · https://fluxit.breezy.hr/p/7d6df5000801-qa-analyst-jr
- [ ] **Stefanini — Application Support** → Sercanto + ATS pandape · https://www.sercanto.com.ar/detail/a/application-support_buenos-aires_16961531

### ⚙️ Configurar perfiles (si falta alguno)

- [ ] **Bumeran**: CV cargado (`perfil-bumeran.md`) + CV visible + alertas activas (`QA`, `soporte técnico`, `junior`, últimos 7 días)
- [ ] **LinkedIn**: headline *"Estudiante Desarrollo de Software UADE · Python, Linux, Docker, Playwright · Buscando primer empleo IT"* + #OpenToWork + descomentar línea `linkedin` en `data_es.typ`/`data_en.typ`
- [ ] **UADE Portal de Empleo**: subir CV (la oficina presenta postulantes a empresas)
- [ ] **Endava**: anotar en calendario — **The Americas Internship (QA Automation, Python) abre FEBRERO 2027** → https://www.endava.com/careers/early-careers/internship-programmes-the-americas
- [ ] **Despegar — Pasaporte Trainee 2.0**: pide **50% de carrera aprobada** — NO se cumple aún (recién 1er año); retomar en 2027 → https://jobs.lever.co/despegar/57d7de89-ac21-44f9-bbde-0f5bb81a6082

---

## 5) 📋 Tabla de postulaciones (tracking)

| Fecha | Empresa | Puesto | Portal | Estado | Notas |
|---|---|---|---|---|---|
| 22/09 | Besysoft S.A. | Analista de Soporte y Operaciones TI Junior | LinkedIn | ✔️ Enviada | Follow-up ~02/10 si no responde |
| 30/09 | Tata Consultancy Services | QA SAP GUI/SAP LOGON JR | LinkedIn | ⏳ Pendiente | [11 pts] Postular HOY |
| 30/09 | Cervecería y Maltería Quilmes | Soporte de Calidad | LinkedIn | ⏳ Pendiente | [10 pts] QA empresa grande |
| 30/09 | Miratech | Junior L1 Genesys Support Engineer | LinkedIn | ⏳ Pendiente | [10 pts] Junior explícito |
| 30/09 | Stefanini LATAM | QA Funcional SAP | LinkedIn | ⏳ Pendiente | [9 pts] Remoto |
| 30/09 | Accenture | Application Support Engineer | LinkedIn | ⏳ Pendiente | [9 pts] Fresca 30/09 |
| 30/09 | Doctec | Analista Soporte Aplicaciones (Py/SQL/Linux) | LinkedIn | ⏳ Pendiente | [9 pts] PERFIL EXACTO |
| 30/09 | Empresa exportadora | Auxiliar TI | Bumeran | ⏳ Pendiente | Publicada hace horas |
| 30/09 | Stefanini LATAM | Soporte de Comunicaciones | LinkedIn | ⏳ Pendiente | [8 pts] |
| 30/09 | Mauricio Paluch | Soporte Aplicaciones ERP (Home Office) | Bumeran | ⏳ Pendiente | Remoto, ayer |
| 30/09 | INVAP | Soporte para TI Nivel 1 | LinkedIn | ⏳ Pendiente | [7 pts] |
| 30/09 | Experis Argentina | Core Network Junior con inglés | LinkedIn | ⏳ Pendiente | [7 pts] |
| 30/09 | Acciona IT | QA Junior-Temporal | Bumeran | ⏳ Pendiente | Pide 2 años — aplicar igual |
| 30/09 | Yel | Trainee informático JR (CABA) | PróximoTrabajo | ⏳ Pendiente | — |
| 30/09 | Cognizant | Jr Service Desk Agent (PT/ES) | LinkedIn | ⏸️ Dudosa | Solo si maneja portugués |
| 30/09 | Wetcom | Jóvenes Talentos IT ed. 17 | Bumeran | ⏳ Pendiente | Verificar que entró la postulación |
| 30/09 | EY | Junior de IT (Banco de Talentos) | Portal + WhatsApp | ⏳ Pendiente | Carta lista `carta_ey.typ` |
| 30/09 | Flux IT | QA Analyst Jr. | breezy | ⏳ Pendiente | Carta variante QA + Playwright |
| 30/09 | Stefanini | Application Support | Sercanto + ATS | ⏳ Pendiente | Registrarse en ATS pandape |

> Al postular, marcar en la DB: `python3 scripts/filter_jobs.py --mark-applied "URL"` — así el filtro muestra "ya postulada" y no la repite.

---

## 6) 💬 Banco de respuestas para formularios

**Disponibilidad** (`¿Cuál es tu disponibilidad?`):
> "Disponibilidad inmediata. Además de estudiar la Tecnicatura en Desarrollo de Software, actualmente trabajo en COTO Digital, por lo que puedo coordinar la fecha de ingreso avisando con la anticipación que corresponda a mi empleador. Me adapto a los horarios que necesite la empresa."
> (Corta: "Disponibilidad inmediata. Puedo coordinar el ingreso con mi empleador actual y adaptarme al horario.")

**Fecha de graduación estimada** (`¿Cuándo te recibís?`):
> "Graduación estimada: finales de 2028. Actualmente curso la Tecnicatura Universitaria en Desarrollo de Software en UADE (promedio 8.67)."

**CNC/materiales u otra experiencia que NO tengo** → responder con honestidad:
> "No tengo experiencia con [X]. Mi experiencia es en soporte IT y sistemas (Windows/Linux, resolución de incidencias, sistemas POS) y desarrollo de software (Python, Linux, Docker, Playwright). Estoy buscando mi primer empleo en el sector IT."

**Pretensión salarial:** $900.000–$1.200.000 ARS brutos/mes (negociable) — referencia: mediana dev junior Sysarmy 2026 ≈ $1.538.500; primera experiencia/soporte está por debajo. Si el puesto es dev junior: pedir ~$1.300.000–$1.500.000.

**Palabras clave Bumeran:** `soporte técnico` · `QA` · `tester` · `junior` · `trainee` · `help desk`/`mesa de ayuda` · `soporte de aplicaciones` · `DevOps` (filtrar junior) · `desarrollador` + filtros (Últimos 7 días, Categoría Sistemas, CABA/GBA).

---

## 7) Reglas de oro (no borrar)

1. Postular en **24–48 h** de publicada la oferta (el filtro marca 🆕 para esto).
2. **Nunca inventar** experiencia/herramientas que no estén en el CV (Jira, Terraform, CNC, etc.).
3. **Coherencia total** entre CV, cartas, Bumeran, LinkedIn y entrevistas (datos, fechas, promedio, disponibilidad).
4. Follow-up a los **7–10 días** sin respuesta.
5. Volumen: mínimo **10 postulaciones/semana** — cada postulación es un ticket de lotería.
6. Aplicar aunque no cumplís 100% — con **60-70%** de requisitos, aplica igual.

---

## 8) 📌 Próximos pasos (próxima sesión)

1. **Abrir `reports/priorizadas-<fecha de hoy>.md`** — nuevo digest filtrado, ofertas nuevas marcadas 🆕.
2. Postular a las pendientes de la sección 4 — priorizar [10-11 pts] y 🆕.
3. Al postular: `python3 scripts/filter_jobs.py --mark-applied "URL"` y actualizar sección 5.
4. Adaptar cartas: pedirle al asistente "adaptá carta para [oferta]" usando `carta_generica.typ` como base.
5. Revisar `consultoras.md` para canales de consultoras y fechas de trainee programs.