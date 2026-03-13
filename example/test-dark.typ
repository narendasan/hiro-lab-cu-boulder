#import "@preview/touying:0.5.3": *
#import "../src/lib.typ": *

// Test: print the value
#let test-dark = true
#let bg = if test-dark { hiro.backdrop } else { white }

#show: hiro-theme.with(
  aspect-ratio: "16-9",
  dark-mode: true,
  config-info(
    title: [Dark Mode Test],
    subtitle: [Testing],
    author: [Test],
  ),
)

#title-slide-dark()

= Test

== Test Slide

This should have a black background.

The bg color is: #repr(bg)
