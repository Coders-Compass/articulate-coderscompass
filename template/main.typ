#import "@preview/articulate-coderscompass:0.1.0": articulate-coderscompass, callout

#show: articulate-coderscompass.with(
  title: lorem(15),
  subtitle: lorem(10),
  authors: (
    (name: "First Author", email: "first@coderscompass.org", affiliation: "Coders' Compass"),
    (name: "Second Author", email: "second@coderscompass.org", affiliation: "Coders' Compass"),
    // (name: "Third Author", email: "third@coderscompass.org", affiliation: "Coders' Compass"),
  ),
  abstract: [
    #lorem(40)
  ],
  keywords: (
    "keyword1",
    "keyword2",
    "keyword3",
  ),
  version: "1.0.0",
  reading-time: "6 minutes",
  date: datetime.today(),
  bibliography: bibliography("refs.bib", style: "institute-of-electrical-and-electronics-engineers")
)

= Introduction

#lorem(20)

#callout(
)[
  Some general information goes here.

  #lorem(20)
]

= Methodology

#lorem(10)

Some citations: #cite(<texbook>), #cite(<latex:companion>), #cite(<knuth:1984>), #cite(<lesk:1977>), #cite(<latex2e>).

== Data Collection

#lorem(30)

```python
# https://rosettacode.org/wiki/Combinations#Python
def comb(n, r):
    if m == 1: return [[x] for x in s]
    if m == len(s): return [s]
    return [s[:1] + a for a in comb(m-1, s[1:])] + comb(m, s[1:])
```

#lorem(40)

== Data Analysis

Some inline code: `cd workdir`, `git status`, `git commit -m "Initial commit"`.

#lorem(20)

= Results

== Findings

#lorem(20)

== Discussion

#callout(
  title: "Warning",
  icon: emoji.warning,
  color: orange,
)[
  This is a warning message.

  #lorem(20)
]

#lorem(40)

= Interpretation

#callout(
  title: "Danger",
  icon: emoji.prohibited,
  color: red,
)[
  Extremely dangerous information. Proceed with caution!

  #lorem(20)
]

== Comparison with Previous Work

#lorem(20)

#callout(
  color: olive,
)[
  Cool things to know:
  - This is a note.
  - This is another note.
]

== Implications for Future Research

#lorem(50)

#lorem(30)

= Conclusion

#lorem(20)
