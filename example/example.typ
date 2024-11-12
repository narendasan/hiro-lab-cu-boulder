#import "@preview/touying:0.5.3": *
#import "@local/hiro-lab-cu-boulder:0.1.0": *

#show: hiro-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Title],
    subtitle: [_Subtitle_],
    author: [Author],
    date: datetime.today().display("[month repr:long] [day], [year repr:full]"),
    logo: image("../assets/cu-boulder.svg"),
  ),
)

#title-slide()

= Example Section Title

== Example Slide

A slide with *important information*.

#pause

=== Highlight
This is #highlight(fill: blue.C)[highlighted in blue]. This is #highlight(fill: yellow.C)[highlighted in yellow]. This is #highlight(fill: green.C)[highlighted in green]. This is #highlight(fill: red.C)[highlighted in red].

#hero(
  image("../assets/cu-boulder.svg"),
  title: "Hero",
  subtitle: "Subtitle",
  hide-footer: false,
)

#hero(
  image("../assets/cat1.jpg", width: 100%, height: 100%),
  txt: (
    text: "This is an " + highlight(fill: yellow.C)[RTL#footnote[RTL = right to left. Oh, and here's a footnote!] hero with text and no title] + ".\n",
    enhanced: false,
  ),
  direction: "rtl",
  footnote: true,
)

#gallery(
  image("../assets/cat1.jpg", width: auto, height: 50%),
  image("../assets/cat2.jpg", width: auto, height: 50%),
  image("../assets/cat1.jpg", width: auto, height: 50%),
  image("../assets/cat2.jpg", width: auto, height: 50%),
  title: "Gallery",
  captions: (
    "Cat 1",
    "Cat 2",
    "Cat 1 again",
    "Cat 2 again",
  ),
  columns: 4,
)

#focus-slide(
  theme: "smoke",
  [
    This is a focus slide \ with theme "smoke"
  ],
)

== Admonitions

#slide[
  This is a normal slide with *admonitions*:

  #brainstorming[
    This is a brainstorming.
  ]

  #definition[
    This is a definition.
  ]
]

#focus-slide(
  theme: "neon",
  [
    This is a focus slide \ with theme "neon"
  ],
)

#focus-slide(
  theme: "yellow",
  [
    This is a focus slide \ with theme "yellow"
  ],
)

#focus-slide(
  c1: black,
  c2: white,
  [
    This is a focus slide \ with custom colors
    \ Next: Section 2
  ],
  text-color: yellow.D,
)

= Section 2

== Hey! New Section!

#lorem(30)

=== Heading 3

#lorem(10)

==== Heading 4

#lorem(80)

#quote(attribution: [from the Henry Cary literal translation of 1897])[
  ... I seem, then, in just this little thing to be wiser than this man at
  any rate, that what I do not know I do not think I know either.
]

#slide[
  First column. #lorem(15)
][
  Second column. #lorem(15)
]
