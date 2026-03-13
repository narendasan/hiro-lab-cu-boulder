#import "colors.typ": *
#import "settings.typ" as settings

// Color functions for admonitions based on dark mode
#let get-admonition-bg(dark-mode) = if dark-mode { hiro.at("card-bg") } else { rgb("#f5f5f5") }
#let get-admonition-text(dark-mode) = if dark-mode { hiro.at("text-main") } else { black }
#let get-admonition-border(dark-mode) = if dark-mode { hiro.gray } else { rgb("#e0e0e0") }

// Default colors (based on settings)
#let admonition-bg = get-admonition-bg(settings.DARK-MODE)
#let admonition-text = get-admonition-text(settings.DARK-MODE)
#let admonition-border = get-admonition-border(settings.DARK-MODE)

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
  secondary-color: auto,
  tertiary-color: hiro.embodied,
  dotted: false,
  figured: false,
  counter: none,
  show-numbering: settings.ADMONITION-NUMBERING,
  numbering-format: (..n) => numbering("1.1", ..n),
  figure-supplement: none,
  figure-kind: none,
  text-color: auto,
  emoji: none,
  dark-mode: settings.DARK-MODE,
) = {
  // Resolve auto colors based on dark mode
  let bg-color = if secondary-color == auto { get-admonition-bg(dark-mode) } else { secondary-color }
  let txt-color = if text-color == auto { get-admonition-text(dark-mode) } else { text-color }
  let border-color = get-admonition-border(dark-mode)

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

    block(
      width: 100%,
      height: auto,
      inset: 0.5em,
      outset: 0.2em,
      fill: bg-color,
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
        top: 1pt + border-color,
        right: 1pt + border-color,
        bottom: 1pt + border-color,
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
          text(size: 1.1em, fill: txt-color, body),
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
#let task(body, plural: false) = context admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("task").at(if plural { "pl" } else { "sg" }),
  primary-color: blue.E,
  tertiary-color: blue.E,
  figure-kind: "task",
  counter: counter("admonition-task"),
  emoji: "✍️",
  dark-mode: settings.dark-mode-state.get(),
)

/// Definition admonition - for key terms and concepts
/// Uses HIRO embodied green accent
#let definition(body, plural: false) = context {
  let dm = settings.dark-mode-state.get()
  admonition(
    body,
    title: (ADMONITION-TRANSLATIONS).at("definition").at(if plural { "pl" } else { "sg" }),
    primary-color: if dm { hiro.embodied } else { hiro.embodied.darken(25%) },
    tertiary-color: if dm { hiro.embodied } else { hiro.embodied.darken(25%) },
    figure-kind: "definition",
    counter: counter("admonition-definition"),
    emoji: "🧠",
    dark-mode: dm,
  )
}

/// Brainstorming admonition - for ideas and creative thinking
/// Uses orange accent color
#let brainstorming(body, plural: false) = context admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("brainstorming").at(if plural { "pl" } else { "sg" }),
  primary-color: orange.E,
  tertiary-color: orange.E,
  figure-kind: "brainstorming",
  counter: counter("admonition-brainstorming"),
  emoji: "💡",
  dark-mode: settings.dark-mode-state.get(),
)

/// Question admonition - for questions and inquiries
/// Uses violet accent color
#let question(body, plural: false) = context admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("question").at(if plural { "pl" } else { "sg" }),
  primary-color: violet.E,
  tertiary-color: violet.E,
  figure-kind: "question",
  counter: counter("admonition-question"),
  emoji: "❓",
  dark-mode: settings.dark-mode-state.get(),
)

/// Example admonition - for examples and demonstrations
/// Uses cyan accent color
#let example(body, plural: false) = context admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("example").at(if plural { "pl" } else { "sg" }),
  primary-color: cyan.E,
  tertiary-color: cyan.E,
  figure-kind: "example",
  counter: counter("admonition-example"),
  emoji: "🔍",
  dark-mode: settings.dark-mode-state.get(),
)

/// Note admonition - for important information
/// Uses HIRO accent teal color
#let note(body, plural: false) = context admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("note").at(if plural { "pl" } else { "sg" }),
  primary-color: hiro.accent,
  tertiary-color: hiro.accent,
  figure-kind: "note",
  counter: counter("admonition-note"),
  emoji: "📝",
  dark-mode: settings.dark-mode-state.get(),
)

/// Warning admonition - for cautions and alerts
/// Uses HIRO social pink color
#let warning(body, plural: false) = context admonition(
  body,
  title: (ADMONITION-TRANSLATIONS).at("warning").at(if plural { "pl" } else { "sg" }),
  primary-color: hiro.social,
  tertiary-color: hiro.social,
  figure-kind: "warning",
  counter: counter("admonition-warning"),
  emoji: "⚠️",
  dark-mode: settings.dark-mode-state.get(),
)
