// HIRO Lab Presentation Theme Settings
// ====================================

// Dark mode (switches slide backgrounds and text colors)
#let DARK-MODE = false

// State for runtime dark mode propagation (set by hiro-theme)
#let dark-mode-state = state("hiro-dark-mode", false)

// Header/Footer visibility
#let SHOW-HEADER = false
#let SHOW-FOOTER = true

// Footer separators
#let FOOTER-UPPER-SEP = " | "
#let FOOTER-LOWER-SEP = " | "

// Footer content options
#let FOOTER-SHOW-SUBTITLE = false

// Admonition numbering
#let ADMONITION-NUMBERING = false

// Typography
// ----------
// Font stack matching HIRO web branding (modern geometric sans-serif)
// Primary: System fonts similar to Geom/Outfit used on hiro-group.ronc.one
#let FONT = (
  "Inter",           // Modern geometric sans-serif
  "SF Pro Display",  // Apple system font
  "Segoe UI",        // Windows system font
  "Roboto",          // Android/Google font
  "Helvetica Neue",  // Classic fallback
  "Helvetica",       // Universal fallback
  "Arial",           // Final fallback
)

// Quote characters (French-style guillemets for academic look)
#let QUOTES = (
  left: "«",
  right: "»",
)

// Debug mode (shows cell borders for layout debugging)
#let DEBUG = false

// Text sizes
#let HEADER-SIZE = 1em
#let TEXT-SIZE = .75em

// Slide layout
#let SLIDE-MARGIN = (x: 2em, y: 2em)
