#import "settings.typ" as settings
#import "colors.typ": *



// ===================================
// ============ UTILITIES ============
// ===================================

/// Creates a custom rectangle cell
#let _cell(
  body,
  width: 100%,
  height: 100%,
  inset: 0mm,
  outset: 0mm,
  alignment: top + left,
  fill: none,
  debug: settings.DEBUG,
) = rect(
  width: width,
  height: height,
  inset: inset,
  outset: outset,
  fill: fill,
  radius: 2em,
  stroke: if debug {
    1mm + red
  } else {
    none
  },
  align(alignment, body),
)

/// Adds gradient to body (used for slide-focus)
/// Default uses HIRO brand gradient (embodied green → social pink)
#let _gradientize(
  self,
  body,
  colors: (hiro.embodied, hiro.social),
  lighten-pct: 20%,
  angle: 135deg,
) = {
  rect(fill: gradient.linear(..colors, angle: angle), body)
}

/// Creates a title and subtitle block
#let _title-and-sub(body, title, subtitle: none, heading-level: 1) = {
  grid(
    inset: .5em,
    _cell(
      heading(level: heading-level, title),
      height: auto,
      width: auto,
    ),
    if subtitle != none {
      _cell(
        heading(level: heading-level + 1, subtitle),
        height: auto,
        width: auto,
      )
    },
    columns: 1fr,
    gutter: 0.0em,
    body
  )
}

/// Calculates page margin based on header and footer settings
#let _get-page-margin() = {
  if settings.SHOW-HEADER and settings.SHOW-FOOTER {
    (x: 2.8em, y: 2.5em)
  } else if settings.SHOW-HEADER {
    (x: 2.8em, bottom: 0em)
  } else if settings.SHOW-FOOTER {
    (x: 2em, left: 2.8em)
  } else {
    (x: 1em, y: 1em)
  }
}

// Creates a custom quote element that respects dark mode setting
#let _custom-quote(it) = context {
  let dark = settings.dark-mode-state.get()
  let quote-bg = if dark { hiro.gray } else { rgb("#f5f5f5") }
  let quote-text = if dark { hiro.at("text-main") } else { black }
  let quote-text-muted = if dark { hiro.at("text-muted") } else { gray.A }
  v(1em)
  box(
    fill: quote-bg,
    outset: 1em,
    width: 100%,
    radius: 8pt,
    stroke: (
      left: 3pt + gradient.linear(hiro.embodied, hiro.social, angle: 180deg),
    ),
    [
      #set text(fill: quote-text)
      #settings.QUOTES.at("left") #it.body #settings.QUOTES.at("right")
      #if it.attribution != none [
        #set text(size: 0.8em, fill: quote-text-muted)
        #linebreak()
        #h(1fr)
        (#it.attribution)
      ]
    ],
  )
}

#let smaller = it => {
  text(size: 25pt, it)
}

#let smallest = it => {
  text(size: 20pt, it)
}

// HIRO brand emphasis functions
// Use these to emphasize text with brand colors

/// Emphasize text with HIRO embodied green (bold green text, slightly darkened for readability)
/// Usage: #embodied[Your text here]
#let embodied = it => {
  text(fill: hiro.embodied.darken(15%), weight: "bold", it)
}

/// Emphasize text with HIRO social pink (bold pink text)
/// Usage: #social[Your text here]
#let social = it => {
  text(fill: hiro.social, weight: "bold", it)
}

/// Alias for embodied - green bold text
#let green-bold = embodied

/// Alias for social - pink bold text
#let pink-bold = social

/// Emphasize with HIRO accent teal (bold teal text)
/// Usage: #accent[Your text here]
#let accent-bold = it => {
  text(fill: hiro.accent, weight: "bold", it)
}

// HIRO brand highlight functions
// Use these for highlighted text that adapts to dark/light mode

/// Highlight with HIRO embodied green (adapts to dark mode automatically)
/// Usage: #hl-embodied[Your text here]
#let hl-embodied(body) = context {
  let dark = settings.dark-mode-state.get()
  let fill-color = if dark { hiro.embodied.darken(20%) } else { hiro.embodied.lighten(60%) }
  highlight(fill: fill-color, body)
}

/// Highlight with HIRO social pink (adapts to dark mode automatically)
/// Usage: #hl-social[Your text here]
#let hl-social(body) = context {
  let dark = settings.dark-mode-state.get()
  let fill-color = if dark { hiro.social.darken(15%) } else { hiro.social.lighten(60%) }
  highlight(fill: fill-color, body)
}

/// Highlight with HIRO accent teal (adapts to dark mode automatically)
/// Usage: #hl-accent[Your text here]
#let hl-accent(body) = context {
  let dark = settings.dark-mode-state.get()
  let fill-color = if dark { hiro.accent.darken(10%) } else { hiro.accent.lighten(60%) }
  highlight(fill: fill-color, body)
}
