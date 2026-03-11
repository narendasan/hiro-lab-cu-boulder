#import "colors.typ": *
#import "settings.typ" as settings

// Credit: piepert
// https://github.com/piepert/grape-suite/blob/3be3e71a994bae82c9a9dedf41e918d7837ccc39/src/elements.typ

#let ADMONITION-TRANSLATIONS = (
  "task": (
    "sg": "Task",
    "pl": "Tasks",
  ),
  "definition": (
    "sg": "Definition",
    "pl": "Definitions",
  ),
  "example": (
    "sg": "Example",
    "pl": "Examples",
  ),
  "brainstorming": (
    "sg": "Brainstorming",
    "pl": "Brainstormings",
  ),
  "question": (
    "sg": "Question",
    "pl": "Questions",
  ),
  "note": (
    "sg": "Note",
    "pl": "Notes",
  ),
  "warning": (
    "sg": "Warning",
    "pl": "Warnings",
  ),
)

/// Creates an admonition block with HIRO dark theme glassmorphism styling
///
/// - `body` (content): The content of the admonition
/// - `title` (str): The title/label of the admonition
/// - `time` (str): Optional time annotation
/// - `primary-color` (color): The accent color for the left border
/// - `secondary-color` (color): The background fill color
/// - `tertiary-color` (color): The title text color
/// - `text-color` (color): The body text color
/// - `dotted` (bool): Whether to use a dotted border
/// - `figured` (bool): Whether to wrap in a figure
/// - `counter` (counter): Counter for numbering
/// - `show-numbering` (bool): Whether to show numbering
/// - `numbering-format` (function): Format function for numbering
/// - `figure-supplement` (str): Supplement text for figure
/// - `figure-kind` (str): Kind identifier for figure
/// - `emoji` (content): Emoji/icon to display before title
#let admonition(
  body,
  title: none,
  time: none,
  primary-color: hiro.embodied,
  secondary-color: rgb("#f5f5f5"),
  tertiary-color: hiro.embodied,
  dotted: false,
  figured: false,
  counter: none,
  show-numbering: settings.ADMONITION-NUMBERING,
  numbering-format: (..n) => numbering("1.1", ..n),
  figure-supplement: none,
  figure-kind: none,
  text-color: black,
  emoji: none,
) = {

  if figured {
    if figure-supplement == none {
      figure-supplement = title
    }

    if figure-kind == none {
      panic("once parameter 'figured' is true, parameter 'figure-kind' must be set!")
    }
  }


  let body = {
    if show-numbering or figured {
      if counter == none {
        panic("parameter 'counter' must be set!")
      }

      counter.step()
    }

    // Glassmorphism-style admonition card
    block(
      width: 100%,
      height: auto,
      inset: 0.5em,
      outset: 0.2em,
      fill: secondary-color,
      radius: 8pt,

      stroke: (
        left: (
          thickness: 4pt,
          paint: primary-color,
          dash: if dotted {
            "dotted"
          } else {
            "solid"
          },
        ),
        top: 1pt + hiro.at("text-muted").transparentize(80%),
        right: 1pt + hiro.at("text-muted").transparentize(80%),
        bottom: 1pt + hiro.at("text-muted").transparentize(80%),
      ),

      pad(
        left: 0.5em,
        right: 0.3em,
        top: 0.2em,
        bottom: 0.2em,
        text(
          size: 1.1em,
          strong(
            text(
              fill: tertiary-color,
              emoji + " " + smallcaps(title) + if show-numbering or figured {
                [ ] + context numbering(
                  numbering-format,
                  ..counter.at(here()),
                ) + h(1fr) + text(fill: hiro.at("text-muted"), time)
              },
            ),
          ),
        ) + block(
          above: 0.6em,
          text(size: 1.1em, fill: text-color, body),
        ),
      ),
    )
  }

  if figured {
    figure(kind: figure-kind, supplement: figure-supplement, body)
  } else {
    body
  }
}

/// Task admonition - for action items and todos
/// Uses blue accent color
#let task(body, plural: false) = admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("task").at(if plural {
    "pl"
  } else {
    "sg"
  }),
  primary-color: blue.E,
  secondary-color: rgb("#f5f5f5"),
  tertiary-color: blue.E,
  figure-kind: "task",
  counter: counter("admonition-task"),
  emoji: "✍️",
)

/// Definition admonition - for key terms and concepts
/// Uses HIRO embodied green accent
#let definition(body, plural: false) = admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("definition").at(if plural {
    "pl"
  } else {
    "sg"
  }),
  primary-color: hiro.embodied.darken(25%),
  secondary-color: rgb("#f5f5f5"),
  tertiary-color: hiro.embodied.darken(25%),
  figure-kind: "definition",
  counter: counter("admonition-definition"),
  emoji: "🧠",
)

/// Brainstorming admonition - for ideas and creative thinking
/// Uses orange accent color
#let brainstorming(body, plural: false) = admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("brainstorming").at(if plural {
    "pl"
  } else {
    "sg"
  }),
  primary-color: orange.E,
  secondary-color: rgb("#f5f5f5"),
  tertiary-color: orange.E,
  figure-kind: "brainstorming",
  counter: counter("admonition-brainstorming"),
  emoji: "💡",
)

/// Question admonition - for questions and inquiries
/// Uses violet accent color
#let question(body, plural: false) = admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("question").at(if plural {
    "pl"
  } else {
    "sg"
  }),
  primary-color: violet.E,
  secondary-color: rgb("#f5f5f5"),
  tertiary-color: violet.E,
  figure-kind: "question",
  counter: counter("admonition-question"),
  emoji: "❓",
)

/// Example admonition - for examples and demonstrations
/// Uses cyan accent color
#let example(body, plural: false) = admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("example").at(if plural {
    "pl"
  } else {
    "sg"
  }),
  primary-color: cyan.E,
  secondary-color: rgb("#f5f5f5"),
  tertiary-color: cyan.E,
  figure-kind: "example",
  counter: counter("admonition-example"),
  emoji: "🔍",
)

/// Note admonition - for important information
/// Uses HIRO accent teal color
#let note(body, plural: false) = admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("note").at(if plural {
    "pl"
  } else {
    "sg"
  }),
  primary-color: hiro.accent,
  secondary-color: rgb("#f5f5f5"),
  tertiary-color: hiro.accent,
  figure-kind: "note",
  counter: counter("admonition-note"),
  emoji: "📝",
)

/// Warning admonition - for cautions and alerts
/// Uses HIRO social pink color
#let warning(body, plural: false) = admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("warning").at(if plural {
    "pl"
  } else {
    "sg"
  }),
  primary-color: hiro.social,
  secondary-color: rgb("#f5f5f5"),
  tertiary-color: hiro.social,
  figure-kind: "warning",
  counter: counter("admonition-warning"),
  emoji: "⚠️",
)
