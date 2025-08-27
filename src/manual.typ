#import "@preview/tidy:0.4.3"

#let docs = tidy.parse-module(
  read("lib.typ"),
  name: "Articulate by Coders' Compass",
)
#tidy.show-module(
  docs,
  style: tidy.styles.default,
)
