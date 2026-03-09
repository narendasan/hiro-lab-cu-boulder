# hiro-lab-cu-boulder

A Typst presentation theme for the **Human Interaction and RObotics (HIRO) Group** at the University of Colorado Boulder.

Based on the [touying-unistra-pristine](https://github.com/spidersouris/touying-unistra-pristine) theme.

> [!WARNING]
> This theme is **NOT** officially affiliated with the University of Colorado or the HIRO Group. The logos and branding are the property of their respective owners.

**hiro-lab-cu-boulder** is a [Touying](https://github.com/touying-typ/touying) theme for creating presentation slides in [Typst](https://github.com/typst/typst), styled to match the HIRO Lab's modern dark branding.

## Brand Colors

The theme uses the official HIRO Lab brand colors:

| Color             | Hex       | Usage                                          |
| ----------------- | --------- | ---------------------------------------------- |
| 🟢 Embodied Green | `#32FFB8` | Primary accent, Embodied Intelligence research |
| 🩷 Social Pink    | `#F32B92` | Secondary accent, Social Intelligence research |
| 🔵 Accent Teal    | `#00a0a0` | Legacy HIRO accent color                       |
| ⬛ Backdrop       | `#000000` | Dark backgrounds                               |
| ⬜ Text Main      | `#eeeeee` | Primary text color                             |

## Features

- **Dark theme** with glassmorphism-inspired styling
- **Gradient accents** using the HIRO brand gradient (green → pink)
- **Multiple focus slide themes**: `neon`, `embodied`, `social`, `hiro`, `hiro_gradient`, `midnight`, and more
- **Styled admonitions**: `definition`, `brainstorming`, `task`, `question`, `example`, `note`, `warning`
- **Hero slides** for full-width images
- **Gallery slides** for image grids
- **Quote styling** with gradient accent borders

## Example

See [example/example.pdf](example/example.pdf) for an example PDF output, and [example/example.typ](example/example.typ) for the corresponding Typst file.

## Installation

These steps assume that you already have [Typst](https://typst.app/) installed and/or running.

### Import from Typst Universe

```typst
#import "@preview/touying:0.5.3": *
#import "@preview/hiro-lab-cu-boulder:0.1.0": *

#show: hiro-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [My Presentation Title],
    subtitle: [_Research Update_],
    author: [Your Name],
    date: datetime.today().display("[month repr:long] [day], [year repr:full]"),
  ),
)

#title-slide()

= Introduction

== Welcome

A slide with *important information* about our research.

#definition[
  *Peripersonal Space*: The space immediately surrounding our bodies.
]

#focus-slide(
  theme: "neon",
  [
    Thank You! \ Questions?
  ],
)
```

### Local Installation

1. Clone or download this repository
2. Import locally using `@local/hiro-lab-cu-boulder:0.1.0`

## Focus Slide Themes

The theme provides several color themes for focus slides:

| Theme           | Description                            |
| --------------- | -------------------------------------- |
| `neon`          | HIRO signature gradient (green → pink) |
| `embodied`      | Black to embodied green                |
| `social`        | Black to social pink                   |
| `hiro`          | Dark gray with green accent            |
| `hiro_light`    | Light mode with green accent           |
| `hiro_gradient` | Full brand gradient                    |
| `hiro_dark`     | Pure dark mode                         |
| `midnight`      | Black to dark gray                     |
| `smoke`         | Gray to black                          |

### Usage

```typst
#focus-slide(
  theme: "neon",
  [
    This uses the HIRO brand gradient!
  ],
)
```

## Admonitions

Available admonition types:

```typst
#definition[Your definition here]
#brainstorming[Your ideas here]
#task[Your task here]
#question[Your question here]
#example[Your example here]
#note[Your note here]
#warning[Your warning here]
```

## Using Brand Colors

Access the brand colors directly in your content:

```typst
#text(fill: hiro.embodied)[Embodied Intelligence]
#text(fill: hiro.social)[Social Intelligence]
#highlight(fill: hiro.embodied.lighten(60%))[Highlighted text]
```

## Credits

- Based on [touying-unistra-pristine](https://github.com/spidersouris/touying-unistra-pristine)
- [Touying](https://github.com/touying-typ/touying) presentation framework
- HIRO Lab branding from [hiro-group.ronc.one](https://hiro-group.ronc.one)

## License

See [LICENSE](LICENSE) for details.
