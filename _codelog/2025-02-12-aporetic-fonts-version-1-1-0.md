---
title: "Aporetic fonts version 1.1.0"
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

This release includes two stylistic corrections that pertain to
Aporetic Serif and Aporetic Serif Mono.

- The first change is to the slanted (italic) form of the letter `t`.
  Before, it was mistakenly set to have a curved, upward-facing bottom
  stroke, which would clash with the flat bottom of `i` and `l`. Now
  the slanted `t` has a flat bottom as intended. The upright (roman)
  variants are always flat in this regard.

- The second change is to the letter `m` in both upright and slanted
  forms. Before, the `m` would have a top left serif, as intended, but
  not a bottom right tail. The tail is a feature of other glyphs that
  need to have such a style, like `a`, `h`, `n`, `u`: it imposes a
  proper rhythm together with the rest of the serif details. Now the `m`
  has its missing bottom right tail, making everything consistent.

  [ The `m` has a shorter middle leg in all the "mono" families" to
    improve readability, especially at small point sizes. The
    proportionately spaced fonts use a normal middle leg, as `m` is
    naturally wider there and thus is already perfectly legible. The
    other details are the same. ]
