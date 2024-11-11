# hiro-lab-cu-boulder

A typst theme for the HIRO lab at the University of Colorado Boulder.

Based on the [touying-unistra-pristine](https://github.com/spidersouris/touying-unistra-pristine) theme.

> [!WARNING]
> This theme is **NOT** affiliated with the University of Colorado. The logos are the property of the University of Colorado.

**hiro-lab-cu-boulder** is a [Touying](https://github.com/touying-typ/touying) theme for creating presentation slides in [Typst](https://github.com/typst/typst), based on a timeplate from [the University of Strasbourg, France](https://langagevisuel.unistra.fr).

# Example

See [example/example.pdf](example/example.pdf) for an example PDF output, and [example/example.typ](example/example.typ) for the corresponding Typst file.

# Installation

These steps assume that you already have [Typst](https://typst.app/) installed and/or running.

## Import from Typst Universe

```typst
#import "@preview/touying:0.5.3": *
#import "@preview/hiro-lab-cu-boulder:0.1.0": *

#show: hiro-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Title],
    subtitle: [_Subtitle_],
    author: [Author],
    date: datetime.today().display("[month repr:long] [day], [year repr:full]"),
  ),
)

#title-slide[]

= Example Section Title

== Example Slide

A slide with *important information*.

#lorem(50)
```
