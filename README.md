# Mi CV — Facundo Octavio Mello

CV generado con [Typst](https://typst.app/) a partir de la plantilla
[typst-cv](https://github.com/Mc-Zen/typst-cv) (adaptación propia).

Cada cambio se compila automáticamente con **GitHub Actions** y se publica en
**GitHub Pages**.

## 🚀 Arrancá por acá (reanudar sesión)

1. Leé [`estado-busqueda.md`](estado-busqueda.md) — estado de la búsqueda,
   checklist pendiente y banco de respuestas para formularios.
2. Revisá [`reports/jobs-latest.md`](reports/jobs-latest.md) — ofertas nuevas
   del día (lo actualiza un bot todos los días a las 08:15).
3. Postulá usando [`fuentes-empleo.md`](fuentes-empleo.md) (sección 0 = ofertas
   activas para postular hoy) y [`perfil-bumeran.md`](perfil-bumeran.md) (contenido
   listo para pegar en Bumeran).

## Estructura

| Archivo              | Para qué sirve                                |
| -------------------- | --------------------------------------------- |
| `data_es.typ`        | Datos del CV en español (editá acá)           |
| `data_en.typ`        | Datos del CV en inglés (editá acá)            |
| `template.typ`       | Plantilla de diseño (no hace falta tocarla)  |
| `cv_es.typ`          | Genera `cv_es.pdf`                            |
| `cv_en.typ`          | Genera `cv_en.pdf`                            |
| `carta_ey.typ`       | Carta de presentación específica para EY      |
| `carta_generica.typ` | Carta genérica ES (placeholders + 3 variantes según el puesto) |
| `carta_generica_en.typ` | Carta genérica EN (ofertas remotas)        |
| `perfil-bumeran.md`  | Contenido listo para copiar y pegar en Bumeran |
| `consultoras.md`    | Guía de consultoras IT: canales, programas trainee, vacantes vivas, emails reales |
| `fuentes-empleo.md`  | Fuentes: ofertas activas, portales, trainee programs, correos de contacto |
| `estado-busqueda.md` | Estado vivo de la búsqueda + checklist + respuestas para formularios |
| `reports/`           | Digest diario automático de ofertas de empleo |
| `scripts/jobs.sh`    | Script del digest diario de ofertas (LinkedIn + Exa) |
| `*.svg`              | Iconos (email, teléfono, GitHub, LinkedIn…)  |

## Búsqueda laboral automática

El workflow [`.github/workflows/jobs-daily.yml`](.github/workflows/jobs-daily.yml)
corre todos los días a las **08:15 (hora de Buenos Aires)**:

```bash
bash scripts/jobs.sh --days 7 --commit "🤖 Digest laboral $(date -u +%F)"
```

Genera `reports/jobs-latest.md` con ofertas junior (DevOps, Cloud, SRE, Soporte
IT) de LinkedIn y boards argentinos (Bumeran, Computrabajo, etc.). Otras
búsquedas (QA, trainee, dev) se hacen con la skill web-search en la sesión.

## Editar el CV

Abrí `data_es.typ` (y `data_en.typ`) y cambiá lo que necesites:

- **Datos de contacto**: `email`, `phone`, `github`, `linkedin`.
  Hoy LinkedIn está comentado porque no agregaste tu perfil todavía;
  descomentá esa línea y completala con tu usuario real.
- **Secciones**: `self` (perfil), `tech` (habilidades), `experience`,
  `projects`, `edu`.
- Para agregar o quitar secciones, editá `cv_es.typ` / `cv_en.typ`.

## Compilar en tu máquina

```bash
typst compile cv_es.typ   # genera cv_es.pdf
typst compile cv_en.typ   # genera cv_en.pdf
```

O para ver el resultado en vivo:

```bash
typst watch cv_es.typ
```

## Publicar en tu GitHub

Ya tenés las claves SSH configuradas (`facundomello34-byte`), así que solo
falta crear el repo y pushear:

```bash
# 1) Creá el repo en GitHub (una vez): con la web o con gh:
gh repo create facundomello34-byte/cv --public --source . --push

# 2) (si el repo ya existe) agregalo y pusheá:
git remote add origin git@github.com:facundomello34-byte/cv.git
git push -u origin main
```

Después, una vez:

1. Entrá a **repo → Settings → Pages**.
2. En *Source* elegí **GitHub Actions** (el workflow ya está configurado).
3. Tu CV va a quedar en: `https://facundomello34-byte.github.io/cv/`

Cada `git push` a `main` recompila y actualiza la página automáticamente.

> Si querés que la URL sea más corta (`https://facundomello34-byte.github.io`),
> nombrá el repo `facundomello34-byte.github.io` en vez de `cv`.
