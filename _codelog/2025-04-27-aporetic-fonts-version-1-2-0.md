---
title: "Aporetic fonts version 1.2.0"
excerpt: "Release notes for the latest version of my custom 'Aporetic' fonts."
---

Customised build of the Iosevka typeface, with a consistent rounded
style and overrides for almost all individual glyphs in both upright
(roman) and slanted (italic) variants. This is the successor to my
now-discontinued "Iosevka Comfy" fonts.

+ Git repository: <https://github.com/protesilaos/aporetic>.
+ Sample pictures: <https://protesilaos.com/emacs/aporetic-fonts-pictures>
+ Backronym: Aporetic's Predecessor Objects' Reserved Eponym Truly Included "Comfy".

Below are the release notes.

* * *

The major change for this release is that Aporetic Sans Mono and
Aporetic Serif Mono are rendered in a strictly monospaced width. This
means that characters such as the em dash (`—`) occupy the same space
as the regular dash.

Before, Aporetic Sans Mono and Aporetic Serif Mono had some characters
that were proportionately spaced. This would upset the expectations of
terminal emulators and thus break the display, sometimes with
characters overlapping when they should not.

Other changes are more subtle. They pertain to the style of individual
characters, namely:

- The Greek lower case lambda (`λ`) has a flat top instead of a straight
  one. The legs remain straight. This makes it consistent with the
  design of the Greek lower case delta (`δ`), among others.

- The Greek lower case mee (`μ`) has a rounder right corner, which is
  in line with a whole range of characters.

- The micro sign is the same design as the Greek lower case mee, even
  though these are technically two distinct code points.

- The at sign (`@`) of Aporetic Sans and Aporetic Serif (i.e. the
   proportionately spaced fonts I provide) is a bit taller than it was
   before. This makes it look more related to its monospaced
   counterpart, which is also relatively tall.

I also added support for some more Greek characters, as well as the
Latin eth (`ð`), thorn (`þ`), and thorn capital (`Þ`).

All other changes are done to retain the aesthetic of the fonts while
dealing with the breaking changes introduced by the upstream Iosevka
project.
