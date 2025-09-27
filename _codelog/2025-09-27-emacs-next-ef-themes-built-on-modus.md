---
title: "Emacs: the next 'ef-themes' will build on top of the 'modus-themes'"
excerpt: "Announcement about the changes coming to the next major version of the Ef themes."
---

Since version `4.0.0` of my `modus-themes`, users can override the
palette of one or all the themes. They can change the applicable
colours and how those are mapped to semantic elements. For example,
"heading level 1" will apply to Org, Markdown, Info, and anything else
that defines a relevant face. In principle, Modus can derive any
theme. The advantage is that we get battle tested support for a wide
range of packages, theme-wide consistency and attention to detail, and
all the familiar flexibility of customisation, while only defining new
colour values and/or their mappings. Plus, the Modus themes are built
into Emacs.

When I first designed the `ef-themes`, Modus did not have the
aforementioned capabilities. As such, Ef had to be implemented from
scratch. Over time, the two projects have converged in terms of
overall approach. There still are some notable differences, namely, Ef
is less customisable and extensive than Modus. This is about to change.

I am working on a thoroughgoing redesign of the Ef themes to make them
essentially load either `modus-operandi` (main light theme) or
`modus-vivendi` (main dark theme) with the relevant palette overrides.
All the Ef themes will look the same as they do now, but under the
hood things will become much simpler. What is currently a standalone
"theme" object will be reduced to a palette definition, essentially an
alist.

In a future publication, I will document all the breaking changes. In
short, all customisation shall be done via the Modus user options. Ef
will only implement its palettes. As for my `doric-themes` and
`standard-themes` those will remain unchanged for the time being.
Standard might go the way of Ef, but Doric will probably continue to
be its own thing. At any rate, these issues will be examined when
their time is right.

Stay tuned for more. In the meantime, enjoy version `1.11.0` of the Ef
themes that I released earlier this week!

## About the Ef themes

The `ef-themes` are a collection of light and dark themes for GNU
Emacs that provide colourful ("pretty") yet legible options for users
who want something with a bit more flair than the `modus-themes` (also
designed by me).

+ Package name (GNU ELPA): `ef-themes`
+ Official manual: <https://protesilaos.com/emacs/ef-themes>
+ Change log: <https://protesilaos.com/emacs/ef-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/ef-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/ef-themes>
  + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Backronym: Eclectic Fashion in Themes Hides Exaggerated Markings,
  Embellishments, and Sparkles.

## About the Modus themes

Highly accessible themes, conforming with the highest standard for
colour contrast between background and foreground values (WCAG AAA).
They also are optimised for users with red-green or blue-yellow colour
deficiency.

The themes are very customisable and provide support for a wide range
of packages.  Their manual is detailed so that new users can get
started, while it also provides custom code for all sorts of more
advanced customisations.

Since August 2020, the original Modus themes (`modus-operandi`,
`modus-vivendi`) are built into Emacs version 28 or higher. Emacs 28
ships with `modus-themes` version `1.6.0`. Emacs 29 includes version
`3.0.0`. Emacs 30 provides version `4.4.0`. Version 4 is a major
refactoring of how the themes are implemented and customised. Such
major versions are not backward-compatible due to the limited
resources at my disposal to support multiple versions of Emacs and of
the themes across the years.

+ Package name (GNU ELPA): `modus-themes`
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/modus-themes>
  + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes.
