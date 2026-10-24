# 🗂️ Estado de búsqueda laboral — Facundo Mello

> **Documento vivo** — actualizado cada sesión. Última actualización: **24/10/2026**.
> Cuando vuelvas a trabajar con un asistente, empezá leyendo este archivo + `README.md`.
>
> ⚠️ **Pasaron 24 días desde la última sesión (30/09).** El bot siguió corriendo los
> 23 días sin fallar, pero no se postuló a nada: sigue habiendo **1 sola postulación
> enviada** (Besysoft, 22/09). El cuello de botella no es encontrar ofertas, es
> ejecutar. Sección 4 es el reinicio.

---

## 1) Snapshot del perfil

- **Estudios:** Tecnicatura Universitaria en Desarrollo de Software (UADE), 2025–presente, promedio **8.67** · Graduación estimada: **fines de 2028** · Curso certificado Fundamentos de Ciberseguridad (48.5 h, Ago 2026)
- **Stack:** Python, JavaScript, HTML/CSS, FastAPI, Next.js · SQL, PostgreSQL · Linux (diario), bash, Git/GitHub, Docker, Playwright
- **Foco:** primer empleo formal en IT — QA/Testing, soporte IT, automatización, DevOps/trainee
- **Experiencia:** COTO Digital (Operador, Oct 2025–presente) · Bon Air Cafetería (Encargado Admin, Nov 2024–Sep 2025) · Havanna (Soporte Operativo IT, Feb–Jul 2024)
- **Ubicación:** Buenos Aires · **Disponibilidad:** inmediata (avisando a empleador actual) · **Modalidad:** indistinta

---

## 2) Pipeline automático (corriendo, pero el embudo se corta después)

- **08:15 (BA) todos los días** GitHub Actions: busca ofertas → **filtra y prioriza** → `reports/priorizadas-YYYY-MM-DD.md`.
- **Estado real al 24/10:** 46 corridas, la última del 23/10, **23 commits diarios sin interrupción** (se sincronizaron recién hoy: el repo local estaba 23 commits atrás).
- **Números del embudo:** 523 ofertas vistas · 1 postulada · 0 respuestas registradas.
- **Ojo con `--days 2`:** devuelve casi 0 ofertas nuevas porque LinkedIn repite el mismo pool. El valor está en la frescura de las que ya están: las 🆕 de hoy son de 23–24/10.
- El filtro descarta senior/spam/ofertas de otros países y puntúa el fit:
  junior/trainee **+5** · soporte/QA **+4** · linux/python/dev **+3** · devops/cloud **+2** · publicada ≤2 días **+2** · empresa preferida **+2/3**.
- ⚠️ **El scoring es por palabra clave, no por seniority.** "DevOps Engineer" en Accenture o "Backend Engineer II" en Rappi puntúan alto por el término *devops/cloud* y *frescura*, pero por título no son para primer empleo. Revisá el aviso antes de gastar la carta.
- Marca **🆕 NUEVA** solo las ofertas nunca vistas (DB `reports/vistas.json`, 523 registradas) — no vas a postular dos veces.

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
| `.pi/voice.md` | Perfil de voz: cómo suenan las cartas y qué no inventar (leer antes de escribir) |
| `.pi/skills/humanizar-textos/` | Skill: limpia y puntúa cartas / CV / perfil antes de enviarlos |
| `emails/` | Seguimientos y mensajes a reclutadores, listos para copiar |

---

## 4) ✅ ACCIÓN DE HOY (24/10 — reinicio después de 24 días)

### 🚨 Postular hoy (en este orden, fit real)

- [ ] **QA Analyst Jr - 13 a 22 hs — MRM** [10 pts · pub. 22/10 · **200+ postulantes**] → https://ar.linkedin.com/jobs/view/qa-analyst-jr-13-a-22-hs-at-mrm-4465309976 · carta variante **QA**
  - El único "Jr" explícito del top y el de mayor fit. 200+ postulantes ⇒ la ventana se cierra: es la primera de hoy. Horario 13–22 h: confirmá que te sirve con COTO antes de mandar.
- [ ] **Technical Consultant Trainee — Thales** [6 pts · pub. 22/10 · trainee explícito] → https://ar.linkedin.com/jobs/view/technical-consultant-trainee-at-thales-4482786219 · carta variante **QA** o genérica
- [ ] **Network Support Engineer N1 — Experis Argentina** [6 pts · 🆕 pub. 23/10 · N1] → https://ar.linkedin.com/jobs/view/network-support-engineer-n1-at-experis-argentina-4483116850 · carta variante **soporte**

### ⭐ Si te quedan 30 minutos (frescás 22–24/10, todas de soporte/QA)

- [ ] **QA Tester SAP – UAT — MaxIT** [6 pts · 🆕 24/10] → https://ar.linkedin.com/jobs/view/qa-tester-sap-%E2%80%93-uat-y-casos-de-prueba-oil-gas-relaci%C3%B3n-de-dependencia-at-maxit-consulting-max-corporate-group-4482615580 · variante **QA**
- [ ] **Analista QA Automatización Fintech — Claro Argentina** [6 pts · 24/10] → https://ar.linkedin.com/jobs/view/analista-qa-atomatizaci%C3%B3n-fintech-at-claro-argentina-4465113038 · variante **QA** (Playwright juega a favor)
- [ ] **Analista de Mesa de Ayuda — Grupo Hasar** [6 pts · 🆕 23/10] → https://ar.linkedin.com/jobs/view/analista-de-mesa-de-ayuda-at-grupo-hasar-4481946569 · variante **soporte**
- [ ] **Analista de Mesa de Ayuda Nivel 1 — Conectando Personas** [5 pts · 22/10] → https://ar.linkedin.com/jobs/view/analista-de-mesa-de-ayuda-nivel-1-4480084078 · variante **soporte**
- [ ] **Soporte Técnico IT y Audiovisual CABA — Novatium** [6 pts · 🆕 23/10] → https://ar.linkedin.com/jobs/view/soporte-t%C3%A9cnico-%E2%80%93-it-y-audiovisual-caba-at-novatium-consulting-outsourcing-4483149124 · variante **soporte**

### ⚠️ Puntúan alto pero NO son para primer empleo (verificar el aviso antes)

El filtro les da 7 pts por *devops/cloud + frescura*, pero por título piden experiencia:

- **DevOps Engineer — Accenture** [7] · **Backend Software Engineer, DevOps — Avature** [7] · **Software Engineer Backend II — Rappi** [5] · **SRE Engineer II — Medallia** [4] · **Cloud DevOps & Technical Operations — Monks** · **Devops Engineer (AWS) — Particle41** · **Administrador Cloud — Claro** · **GCP Specialist — Productive Playhouse**

Regla: si el aviso no dice *junior / trainee / sin experiencia / N1*, y en los requisitos aparece "3+ años", no gastes la carta. Con 60–70% de los requisitos, sí.

### 🗂️ Archivo: las 19 pendientes del 30/09

Quedaron sin postular hace 24 días. Las de LinkedIn (28–30/09) están casi seguro cerradas; las de Bumeran y portales de consultoras pueden seguir abiertas, pero **verificá antes de escribir la carta** — no las trates como pendientes.

Miratech · Stefanini (QA SAP y Soporte Comunicaciones) · Accenture Application Support · Doctec · INVAP · Experis Core Network · Acciona IT · Yel · Cognizant (PT/ES) · Auxiliar TI y Soporte ERP (Bumeran) · Quilmes · TCS QA SAP · Wetcom · EY · Flux IT · Stefanini Application Support

### ⏳ Seguimiento vencido (esto sí es urgente)

- [ ] **Besysoft** — follow-up pautado para el ~02/10, **22 días tarde**. **Borrador listo:** `emails/2026-10-24-seguimiento-besysoft.md` (DM de LinkedIn de 385 caracteres y email completo). Besysoft no publica email de RRHH: el canal real es LinkedIn → Personas → Talento.
- [ ] **Wetcom — Jóvenes Talentos IT ed. 17** — *arranca en octubre 2026, o sea ahora*. Verificá que la postulación entró: https://www.bumeran.com.ar/empleos/jovenes-talentos-it-2026-wetcom-s.a.-1118356445.html
- [ ] **EY — Junior de IT (Banco de Talentos)** — sigue abierto, no vence: https://careers.ey.com/ey/job/Buenos-Aires-EY-Junior-de-IT-CABA-1437/998182801/
- [ ] **Flux IT — QA Analyst Jr.** (100% remoto) → https://fluxit.breezy.hr/p/7d6df5000801-qa-analyst-jr

### ⚙️ Configurar perfiles (una sola vez, no vence, y hoy vale más que 5 postulaciones)

- [ ] **Bumeran**: CV cargado (`perfil-bumeran.md`) + CV visible + alertas (`QA`, `soporte técnico`, `junior`, últimos 7 días)
- [ ] **LinkedIn**: headline *"Estudiante Desarrollo de Software UADE · Python, Linux, Docker, Playwright · Buscando primer empleo IT"* + #OpenToWork + descomentar `linkedin` en `data_es.typ`/`data_en.typ`
- [ ] **UADE Portal de Empleo**: subir CV (la oficina presenta postulantes a empresas)
- [ ] **Endava**: anotar — The Americas Internship (QA Automation, Python) abre **febrero 2027** → https://www.endava.com/careers/early-careers/internship-programmes-the-americas
- [ ] **Despegar — Pasaporte Trainee 2.0**: pide 50% de carrera aprobada — no se cumple aún; retomar en 2027 → https://jobs.lever.co/despegar/57d7de89-ac21-44f9-bbde-0f5bb81a6082

---

## 5) 📋 Tabla de postulaciones (tracking)

### Reinicio 24/10

| Fecha | Empresa | Puesto | Portal | Estado | Notas |
|---|---|---|---|---|---|
| 22/09 | Besysoft S.A. | Analista de Soporte y Operaciones TI Junior | LinkedIn | ✔️ Enviada | **Follow-up vencido hace 22 días** |
| 24/10 | MRM | QA Analyst Jr - 13 a 22 hs | LinkedIn | ⏳ Pendiente | [10 pts] 200+ postulantes: hoy |
| 24/10 | Thales | Technical Consultant Trainee | LinkedIn | ⏳ Pendiente | [6 pts] trainee |
| 24/10 | Experis Argentina | Network Support Engineer N1 | LinkedIn | ⏳ Pendiente | [6 pts] N1 |

### Historial 30/09 (sin postular — archivar)

Las 18 restantes de esa lista (`TCS`, `Quilmes`, `Miratech`, `Stefanini` ×3, `Accenture`, `Doctec`, `Auxiliar TI`, `SAP ERP`, `INVAP`, `Experis Core Network`, `Acciona IT`, `Yel`, `Cognizant`, `Wetcom`, `EY`, `Flux IT`) quedaron en ⏳ Pendiente y nunca se enviaron. No se borran para no perder los datos, pero **no cuentan como postulaciones activas**: la tasa real del período es **1 enviada en 32 días**, cuando la regla es 10 por semana.

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

1. **Lo primero, sin excepción:** las 3 de la sección 4 + el follow-up de Besysoft y la verificación de Wetcom. Eso solo ya rompe la racha.
2. Después, `reports/priorizadas-<fecha de hoy>.md` — nuevo digest, ofertas 🆕 marcadas.
3. Al postular: `python3 scripts/filter_jobs.py --mark-applied "URL"` y actualizar sección 5.
4. Adaptar cartas: "adaptá carta para [oferta]" usando `carta_generica.typ` como base. Las 5 cartas del repo están en APROBADO en el panel de IA (ver `.pi/skills/humanizar-textos/`).
5. Revisar `consultoras.md` para canales y fechas de trainee programs.

### Pendiente de decisión (no lo resuelvo solo)

- **Pretensión salarial:** `perfil-bumeran.md` usa la mediana junior de la **Encuesta Sysarmy 2026.1** ($1.538.500) para fijar el rango $900.000–$1.200.000. Busqué una edición 2026.2 con números publicados y no la encontré. Con ~19% de inflación semestral, ese rango puede estar corto. Decisión tuya: mantenerlo (competitivo para primera experiencia) o subirlo ~15% y arriesgar filtros automáticos por precio.
- **Volumen real:** con 523 ofertas vistas y 1 postulación, añadir fuentes no cambia nada. Antes de tocar `scripts/perfil_filtro.json`, hacé 10 postulaciones en una semana y medí respuestas.
