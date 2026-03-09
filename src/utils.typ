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

// Creates a custom quote element with HIRO dark theme styling
#let _custom-quote(it) = {
  v(1em)
  box(
    fill: hiro.gray,
    outset: 1em,
    width: 100%,
    radius: 8pt,
    stroke: (
      left: 3pt + gradient.linear(hiro.embodied, hiro.social, angle: 180deg),
    ),
    [
      #set text(fill: hiro.at("text-main"))
      // smartquote() doesn't work properly here,
      // probably because we're in a block
      #settings.QUOTES.at("left") #it.body #settings.QUOTES.at("right")
      #if it.attribution != none [
        #set text(size: 0.8em, fill: hiro.at("text-muted"))
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
