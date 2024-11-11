#import "@preview/touying:0.5.3": *
#import "@local/hiro-lab-cu-boulder:0.1.0": *

#show: hiro-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Title],
    subtitle: [_Subtitle_],
    author: [Author],
    date: datetime.today().display("[month repr:long] [day], [year repr:full]"),
    logo: image("unistra.svg"),
  ),
)

#title-slide()

= Example Section Title

== Example Slide

A slide with *important information*.


#focus-slide(
  theme: "neon",
  [
    This is a focus slide \ with theme "neon"
  ],
)
