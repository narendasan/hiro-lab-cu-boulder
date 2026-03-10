#import "@preview/touying:0.5.3": *
#import "../src/lib.typ": *

#show: hiro-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [My Research Presentation],
    subtitle: [_A Study in Human-Robot Interaction_],
    author: [Your Name],
    date: datetime.today().display("[month repr:long] [day], [year repr:full]"),
  ),
)

// Choose one of the title slides:
// #title-slide()        // Gradient background (green → pink)
#title-slide-dark()      // Black background with gradient text

= Introduction

== Research Motivation

Why is this research important?

- #embodied[Embodied Intelligence]: Robots need to learn through physical interaction
- #social[Social Intelligence]: Effective collaboration requires understanding human behavior
- Current systems lack the ability to *generalize* to complex environments

#pause

=== Key Questions

1. How can robots learn from sensorimotor experience?
2. What makes human-robot collaboration effective?

== Background

#definition[
  *Body Schema*: The brain's internal representation of the body's position and movement in space.
]

#note[
  This concept is central to understanding how humans interact with their environment.
]

= Methods

== Experimental Setup

#slide[
  *Hardware*

  - Robot manipulator (7-DOF)
  - Force/torque sensors
  - RGB-D cameras
][
  *Software*

  - ROS 2 framework
  - PyTorch for learning
  - Custom planning stack
]

== Algorithm Overview

#brainstorming[
  Key insight: Contact should be treated as *information*, not failure.
]

Our approach:
1. Collect sensorimotor data during exploration
2. Learn contact-aware representations
3. Plan trajectories that leverage contact

= Results

== Performance Comparison

#example[
  Our method achieves 94% success rate on manipulation tasks, compared to 67% for baseline approaches.
]

#warning[
  Results may vary depending on robot morphology and task complexity.
]

== Qualitative Analysis

#hero(
  image("../assets/cat1.jpg", width: 100%, height: 100%),
  txt: (
    text: [Robots learning through #embodied[physical interaction]],
    enhanced: false,
  ),
  direction: "rtl",
)

= Discussion

== Implications

#slide[
  #embodied[Embodied Intelligence]

  - Sensorimotor grounding is essential
  - Contact provides rich information
  - Body morphology matters
][
  #social[Social Intelligence]

  - Shared task models enable coordination
  - Predictability builds trust
  - Adaptation is key
]

== Future Work

#task[
  Extend the framework to multi-robot collaboration scenarios.
]

#question[
  How do we scale these approaches to more complex, real-world environments?
]

= Conclusion

== Summary

- We presented a novel approach to #embodied[embodied learning]
- Our method leverages contact as structured information
- Results demonstrate improved generalization

#quote(attribution: [HIRO Lab Philosophy])[
  To build truly capable robots, we must look at people not just as users, but as models of intelligence.
]

#focus-slide(
  theme: "neon",
  [
    *Thank You!* \
    Questions?
  ],
)
