---
title: "Iosevka Comfy version 1.0.0"
excerpt: "Release notes for the latest tagged release of my bespoke derivative of the Iosevka font project."
---

_Iosevka Comfy_ is a customised build of the [Iosevka
typeface](https://github.com/be5invis/Iosevka), with a consistent
rounded style and overrides for almost all individual glyphs in both
roman (upright) and italic (slanted) variants.

IMAGES HERE: <https://protesilaos.com/emacs/iosevka-comfy-pictures>.

+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/iosevka-comfy>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/iosevka-comfy>
    + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Backronym: Iosevka (Could Only Modify a Font, Yes)

Below are the release notes.

* * *

## Breaking change about vertical spacing

I no longer override the line height established by upstream Iosevka.
This means that all the font families provided by the Iosevka Comfy
project are the same as Iosevka in terms of vertical spacing.

This change is necessary to conform with recent developments upstream.
Those affected Iosevka Comfy in two ways:

1. Capital letters with accents would no longer be rendered in full.
   The accent would be cropped.  I tried some modest adjustments to the
   relevant variable, but the problem would still occur at certain point
   sizes.

2. The "wide" families no longer had the same vertical spacing as the
   others.  This is a regression from what we used to have.  I do not
   want the various families of this project to be radically different,
   so such a deviation is unacceptable.


## New families and reorganisation into triplets

I added two new families: `iosevka-comfy-motion-fixed` and
`iosevka-comfy-wide-duo`.  These complete the set of the three stylistic
variants provided by this project.

These triplets follow the naming scheme `NAME{,-fixed,-duo}`.  The base
name is monospaced and supports ligatures.  The "fixed" one is strictly
monospaced so as to work with all terminal emulators: it does not
support ligatures.  And the "duo" is quasi-proportionately spaced, while
supporting ligatures.

1. The **compact, sans-serif** set:

   - `iosevka-comfy` is monospaced and supports ligatures.  Apart from
     ligatures, it allows certain special glyphs, such as arrows, to
     occupy more than one block.

   - `iosevka-comfy-fixed` is like `iosevka-comfy` albeit strictly
     monospaced and thus does not support ligatures.  All glyphs are
     exactly the same width.  Use this if you prefer it or if your
     application (e.g. terminal emulator) does not recognise
     `iosevka-comfy` as a monospaced font.

   - `iosevka-comfy-duo` is quasi-proportional and supports ligatures.  The
     naturally narrow glyphs, such as `i`, are allowed to occupy their
     natural width instead of one space.

2. The **compact, serif** set:

   - `iosevka-comfy-motion` is monospaced and supports ligatures.  It is
     like `iosevka-comfy` but with lots of small tweaks that add serifs
     and tailed ends to relevant glyphs.  Put simply, it is the serified
     counterpart of `iosevka-comfy`.

   - `iosevka-comfy-motion-fixed` is the serif equivalent of the
     aforementioned `iosevka-comfy-fixed`.

   - `iosevka-comfy-motion-duo` is the serif equivalent of
     `iosevka-comfy-duo`.

3. The **wide, sans-serif** set:

   - `iosevka-comfy-wide` is the same as `iosevka-comfy` except it is
     noticeably wider.  It also looks taller than `iosevka-comfy` even
     though both variants fit the same number of lines on a screen.

   - `iosevka-comfy-wide-fixed` is the "wide" counterpart of the
     `iosevka-comfy-fixed` family.

   - `iosevka-comfy-wide-duo` is the "wide" counterpart of the
     `iosevka-comfy-duo` family.


## Inter-font consistency

I ensured that all fonts feel part of the same project.  The stylistic
differences between them are subtle and, generally, only go in one
direction (e.g. the "motion" triplet just adds some serifs while
retaining the main skeleton).


## Simplification of the README and update to the demo pictures

I rewrote the README to omit some of its more technical sections.  It
now is simpler as it focuses on describing what this project offers.

The README also includes links to all official sources of the project.

Furthermore, I updated the sample screen shots to better showcase the
three variants mentioned above:
<https://protesilaos.com/emacs/iosevka-comfy-pictures>.


## Miscellaneous

The README now suggests a shallow clone of the git repo.  Keeping a
version history of lots of `.ttf` files is not ideal.

Advanced users who plan to tweak the `private-build-plans.toml` and then
build their own fonts, may be interested in the shell one-liner I use to
build the font files:

```sh
for i in iosevka-comfy{,-motion,-wide}{,-fixed,-duo} ; do npm run build -- ttf::$i ; done
```

This is invoked from the root of the iosevka.git repo and works with my
`private-build-plans.toml`.

The backronym of Iosevka COMFY is: Iosevka (Could Only Modify a Font, Yes).
