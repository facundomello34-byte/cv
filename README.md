# Mi CV — Facundo Octavio Mello

CV generado con [Typst](https://typst.app/) a partir de la plantilla
[typst-cv](https://github.com/Mc-Zen/typst-cv) (adaptación propia).

Cada cambio se compila automáticamente con **GitHub Actions** y se publica en
**GitHub Pages**.

## Estructura

| Archivo              | Para qué sirve                                |
| -------------------- | --------------------------------------------- |
| `data_es.typ`        | Datos del CV en español (editá acá)           |
| `data_en.typ`        | Datos del CV en inglés (editá acá)            |
| `template.typ`       | Plantilla de diseño (no hace falta tocarla)  |
| `cv_es.typ`          | Genera `cv_es.pdf`                            |
| `cv_en.typ`          | Genera `cv_en.pdf`                            |
| `*.svg`              | Iconos (email, teléfono, GitHub, LinkedIn…)  |

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
