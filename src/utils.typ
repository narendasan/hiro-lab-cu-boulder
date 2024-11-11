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
#let _gradientize(
  self,
  body,
  colors: (nblue.E, nblue.E),
  lighten-pct: 20%,
  angle: 45deg,
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

// Creates a custom quote element
#let _custom-quote(it) = {
  v(1em)
  box(
    fill: luma(220),
    outset: 1em,
    width: 100%,
    [
      // smartquote() doesn't work properly here,
      // probably because we're in a block
      #settings.QUOTES.at("left") #it.body #settings.QUOTES.at("right")
      #if it.attribution != none [
        #set text(size: 0.8em)
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
