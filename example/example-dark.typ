#import "@preview/touying:0.5.3": *
#import "../src/lib.typ": *

#show: hiro-theme.with(
  aspect-ratio: "16-9",
  dark-mode: true,
  config-info(
    title: [HIRO Lab Presentation Template],
    subtitle: [_Human Interaction and Robotics Group_],
    author: [Your Name],
    date: datetime.today().display("[month repr:long] [day], [year repr:full]"),
    logo: image("../assets/hiro-square.svg"),
  ),
)

#title-slide()

== Alternative: Dark Title Slide

#title-slide-dark()

= Introduction

== Welcome to HIRO Lab

The *Human Interaction and RObotics* (HIRO) Group works at the intersection of:

- *Artificial Intelligence*
- *Robotics*
- *Human-AI Teaming*

Our goal is building robot systems that enable close, natural, and extended cooperation with humans.

#pause

=== Color Palette

The HIRO brand uses two signature colors:

- #text(fill: hiro.embodied)[*Embodied Intelligence Green*] (#text(fill: hiro.embodied)[`#32FFB8`])
- #text(fill: hiro.social)[*Social Intelligence Pink*] (#text(fill: hiro.social)[`#F32B92`])

== Text Emphasis

Use *bold text* for emphasis (uses social pink by default).

You can also use the brand color functions:
- #embodied[Embodied Intelligence] - green bold text
- #social[Social Intelligence] - pink bold text
- #accent-bold[Accent text] - teal bold text

== Highlighting Examples

This is #hl-embodied[highlighted with embodied green].

This is #hl-social[highlighted with social pink].

This is #hl-accent[highlighted with HIRO accent teal].

Traditional colors also work: #highlight(fill: blue.A)[blue], #highlight(fill: yellow.A)[yellow], #highlight(fill: green.A)[green], #highlight(fill: red.A)[red].

= Research Areas

== Embodied Intelligence

#hero(
  image("../assets/cu-boulder.svg"),
  title: "Embodied Intelligence & Sensorimotor Learning",
  subtitle: "Learning through physical interaction",
  hide-footer: false,
)

== Social Intelligence

#hero(
  image("../assets/cat1.jpg", width: 100%, height: 100%),
  txt: (
    text: [#social[Social Intelligence] and Human-Robot Collaboration],
    enhanced: false,
  ),
  direction: "rtl",
  footnote: true,
)

= Visual Elements

== Gallery

#gallery(
  image("../assets/cat1.jpg", width: auto, height: 50%),
  image("../assets/cat2.jpg", width: auto, height: 50%),
  image("../assets/cat1.jpg", width: auto, height: 50%),
  image("../assets/cat2.jpg", width: auto, height: 50%),
  title: "Research Gallery",
  captions: (
    "Experiment 1",
    "Experiment 2",
    "Analysis 1",
    "Analysis 2",
  ),
  columns: 4,
)

= Focus Slides

== HIRO Brand Themes

#focus-slide(
  theme: "neon",
  [
    *Neon Theme* \ HIRO Signature Gradient \ (Embodied → Social)
  ],
)

#focus-slide(
  theme: "embodied",
  [
    *Embodied Theme* \ Black to Green
  ],
)

#focus-slide(
  theme: "social",
  [
    *Social Theme* \ Black to Pink
  ],
)

#focus-slide(
  theme: "hiro",
  [
    *HIRO Theme* \ Dark with Green Accent
  ],
)

#focus-slide(
  theme: "smoke",
  [
    *Smoke Theme* \ Neutral Dark
  ],
)

#focus-slide(
  theme: "midnight",
  [
    *Midnight Theme* \ Pure Dark Mode
  ],
)

= Admonitions

== Admonition Examples

#slide[
  #definition[
    *Peripersonal Space*: The space immediately surrounding our bodies, where we can reach and interact with objects.
  ]

  #brainstorming[
    How can we leverage body schema representations for robot learning?
  ]
]

== More Admonitions

#slide[
  #task[
    Implement the new sensorimotor learning algorithm.
  ]

  #question[
    What role does social intelligence play in human-robot collaboration?
  ]
]

== Additional Admonition Types

#slide[
  #note[
    HIRO Group meetings are held biweekly on Wednesdays at 11:30 AM in ECES 116.
  ]

  #warning[
    Always follow proper safety protocols when working with robot hardware.
  ]

  #example[
    The CAT-RRT algorithm enables motion planning with intentional contact.
  ]
]

= Conclusion

== Quotes

#quote(attribution: [Alessandro Roncone, HIRO Lab])[
  We believe that to build truly capable and general-purpose robots, we must look at people not just as users, but as models of intelligence.
]

== Two-Column Layout

#slide[
  #embodied[Embodied Intelligence]

  - Sensorimotor learning
  - Contact-aware planning
  - Body schema representations
  - Physical interaction
][
  #social[Social Intelligence]

  - Human-robot collaboration
  - Shared task models
  - Implicit coordination
  - Behavioral cues
]

#focus-slide(
  theme: "hiro_gradient",
  [
    *Thank You!* \
    Questions?
  ],
)
