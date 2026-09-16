// You may need to change this settings
#let sansen = "Liberation Sans"
#let serifen = "Liberation Serif"
#let emj = "Noto Color Emoji"

// Info row: shows only the fields defined in the data file
#let info = author => align(center)[
  #let rest = ()
  #if "phone" in author { rest += (author.phone,) }
  #if "github" in author { rest += (author.github,) }
  #if "linkedin" in author { rest += (author.linkedin,) }
  #if "email" in author {
    author.email
    if rest.len() > 0 { linebreak() }
  }
  #if rest.len() > 0 { rest.join([ · ]) }
]

// You don't really need to change the content below
#let sans = (sansen, emj)
#let serif = (serifen, emj)
#let titlefont = (serifen, emj)

#let project(title: "", author: (name: ""), body) = {
  // Set the document's basic properties.
  set document(author: author.name, title: title)
  set page(margin: (x: 0.75in, y: 0.4in))
  set text(font: serif, lang: "es", size: 10.5pt)
  show math.equation: set text(weight: 400)

  // Title row.
  align(center)[
    #block(text(font: titlefont, weight: 700, 1.75em, smallcaps(title)))
  ]

  // Author information.
  pad(top: -0.3em, bottom: -0.5em, x: 2em, info(author))

  // Main body.
  set par(justify: true, leading: 0.55em)
  set list(spacing: 0.45em)

  body
}

#let icon(name, baseline: 1.5pt) = {
  box(baseline: baseline, height: 10pt, image(name))
}

#let chiline() = {
  v(-5pt)
  line(length: 100%)
  v(-6pt)
}

#let section(term) = {
  show heading.where(level: 1): it => block(width: 100%)[
    #set text(font: sans, weight: "regular")
    #smallcaps(it.body)
  ]

  [ = #term ]

  chiline()
}

#let datedsubsection(term, data) = {
  grid(columns: (1fr, auto), align(left)[ #term ], align(right)[ #data ])
}

#let group(terms) = {
  v(1.35em)

  grid(columns: (2fr, 8fr), column-gutter: 2em, row-gutter: 2em, ..terms)
}
