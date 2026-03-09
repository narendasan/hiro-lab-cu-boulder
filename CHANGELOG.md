# v1.2.0 (2025-02-05)

## HIRO Lab Rebrand Update

Major update to align with the new HIRO Lab branding from [hiro-group.ronc.one](https://hiro-group.ronc.one).

### Colors

- **New brand colors**:
  - `hiro.embodied` (`#32FFB8`): Electric green for Embodied Intelligence
  - `hiro.social` (`#F32B92`): Electric pink for Social Intelligence
  - `hiro.accent` (`#00a0a0`): Legacy HIRO teal accent
  - `hiro.backdrop` (`#000000`): Dark background
  - `hiro.bg-dark` (`#111111`): Secondary dark background
  - `hiro.card-bg` (`#1a1a1a`): Card/container background
  - `hiro.text-main` (`#eeeeee`): Primary text color
  - `hiro.text-muted` (`#aeaeae`): Muted/secondary text color
- Legacy `hiro.tealA` and `hiro.tealB` maintained for compatibility
- Updated `link-color` to use embodied green

### Themes

- **New focus slide themes**:
  - `neon`: HIRO signature gradient (embodied green → social pink)
  - `embodied`: Black to embodied green
  - `social`: Black to social pink
  - `hiro_gradient`: Full brand gradient
  - `hiro_dark`: Pure dark mode
  - `midnight`: Black to dark gray
- Updated existing `hiro` and `hiro_light` themes

### Slides

- **Title Slide**: Updated gradient to use HIRO brand colors (embodied → social)
- **Footer**: Added gradient accent line at top (embodied green → social pink)
- **Footer**: Updated text colors to use new `text-main` and `text-muted` colors

### Admonitions

- Updated to dark theme glassmorphism styling
- Dark backgrounds with subtle borders
- Gradient accent on left border
- **New admonition types**:
  - `example`: Cyan accent for demonstrations
  - `note`: HIRO teal accent for important information
  - `warning`: Social pink accent for cautions
- Updated `definition` to use embodied green accent

### Utilities

- Updated default gradient angle to 135deg
- Updated quote styling with dark theme and gradient accent border

### Settings

- Updated font stack to modern geometric sans-serif fonts (Inter, SF Pro Display, etc.)
- Added `SLIDE-MARGIN` setting

### Documentation

- Updated README with brand color documentation
- Added focus slide theme table
- Added admonition usage examples
- Added brand color usage examples

---

# v1.1.0 (2024-10-16)

## General

- Updated to Touying 0.5.3.

### Slides

- **Hero Slides**:
  - Added the following parameters: `fill`, `inset`, `footnote`.
    - `fill` (color): allows to fill the entire slide with a color. It can be used to achieve a better result if an image with a fixed background color different from the default one does not properly cover the entire slide, leaving some parts of the default background color visible.
    - `inset` (length): allows to specify the negative inset value for the image to take the most space possible on the slide.
    - `footnote` (bool): allows to specify whether there is a footnote. If true, gives some width to accommodate the footnote. Experimental feature. Default: false.
  - Removed the following parameters: `img-height`, `img-width`, `text-fill`, `text-alignment`, `enhanced-text`.
  - The `txt` parameter, used to show text next to the image, is now a dictionary accepting the following optional keys: `text`, `enhanced`, `fill`, `align`.
    - `text` (str): the text to display. Default: none.
    - `enhanced` (bool | function): whether to enhance the text. Can pass a custom function that will act as a callback to enhance the text. Default: true.
    - `fill` (color): the fill color of the text. Default: none.
    - `align` (alignment): the alignment of the text. Default: horizon + center.

### Colors

- Added all the colors from the [official color palette of the University of Strasbourg](https://langagevisuel.unistra.fr/index.php?id=396) to `colors.typ`.
  - Every color is defined as a dictionary with its different shades as keys (A: dark (_foncée_), B: vivid (_vive_), C: pale (_layette_), D: light (_claire_), E: Web colors (_Web_)).
    - The following colors and their shades are included: `grey`, `maroon`, `brown`, `orange`, `red`, `pink`, `purple`, `violet`, `nblue`, `cyan`, `ngreen`, `green`, `camo`, `yellow`.
      - Example use: `grey.A` for the dark shade of grey, `maroon.B` for the vivid shade of maroon, etc.
  - Standard colors `black`, `white`, and `link-color` remain available without dictionary use.
- Added the following colorthemes: `forest`, `berry`, `ocean`, `lavender`, `moss`, `clay`, `mint`, `lemon`, `wine`.

## Fixes

- The image on hero slides now takes double the space of the text box width on the main axis (LTR, RTL) when text is provided.
- Increased font size from 22pt to 25pt.
- Fixed template title slide missing logo.
- Fixed outdated `title-slide` function docstring.
- Fixed logo in footer not positioning correctly.
- Fixed other footer positioning issues.

# v1.0.0 (2024-09-18)

Initial release for publication as a Typst template package.

# v0.2.0 (2024-08-30)

## General

### Slides

- **Focus Slides**:
  - Added counter support.
  - Added the following parameters: `text_alignment`, `show_counter`.
  - Added the following parameters to `grandientize(): `lighten-pct`, `angle`.
- **Title Slides**:
  - Added the following parameters: `title`, `subtitle`.
- **Hero Slides**:
  - Added support for the following directions: left-to-right (default), right-to-left, up-to-down, down-to-up.
  - Added caption support.
    - - Captions can be bolded using `bold_caption: true`.
  - Added enhanced text option.
    - Enhanced text appears bigger than normal text, in bold, and close to the image for better visibility.
    - Enhanced text can have a background using the `text_fill` parameter and specifying a fill color.
  - Added option to hide footer on individual slides.
  - Added the following parameters: `bold_caption`, `caption`, `direction`, `enhanced_text`, `gap`, `heading_level`, `hide_footer`, `img_height`, `img_width`, `numbering`, `rows`, `text_alignment`, `text_fill`, `txt`.
- **Gallery Slides**:
  - Added caption support for individual images.
    - Captions can be bolded using `bold_caption: true`.
  - Added the following parameters: `captions`, `height`, `gutter`, `subtitle`, `bold_caption`, `heading_level`, `width`, `gap`.

### Admonitions

- Added "Brainstorming" admonition type.
- Added "Question" admonition type.
- Added option to enable or disable admonition numbering (default: false).
- Added localization support.

### Settings

- Added the following settings:
  - ADMONITION_NUMBERING (default: false),
  - DEBUG (default: false),
  - FOOTER_LOWER_SEP (footer lower separator) (default: " | "),
  - FOOTER_SHOW_SUBTITLE
  - FOOTER_UPPER_SEP (footer upper separator) (default: " | "),
  - LANGUAGE (used for [Typst's `text()` lang parameter](https://typst.app/docs/reference/text/text/#parameters-lang)) (default: "fr"),
  - QUOTES (used to specify left and right quotation mark characters for the "Quote" element) (default: "« ,  »).
- Added [wiki page listing settings](https://github.com/spidersouris/typst-unistra-slides/wiki/Settings).

### Other

- Updated example with newest changes.
- Added a customized version of [`quote`](https://typst.app/docs/reference/model/quote/).
- Added the following exportable methods: `smaller`, `smallest`.
  - `smaller` sets text to 25pt.
  - `smallest` sets text to 20pt.
- Added `link-color` to `colors.typ`.

## Fixes

- Fixed aligment issue with `cell()`.
- Fixed alignment issue with `focus-slide()`.
- Improved `focus-slide()` theme-related error messages.

## Miscellaneous

- Added licence.

# v0.1.0 (2024-08-05)

Initial pre-release.
