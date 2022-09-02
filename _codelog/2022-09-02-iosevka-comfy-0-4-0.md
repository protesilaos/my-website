---
title: "Iosevka Comfy version 0.4.0"
excerpt: "Release notes for the latest tagged release of my bespoke derivative of the Iosevka font project."
---

_Iosevka Comfy_ is a build of the Iosevka typeface with a rounded style
and open shapes, adjusted metrics, and overrides for almost all
individual glyphs in both roman (upright) and italic (slanted) variants.
It is more vertically compact than the standard upstream configuration.
Glyphs are rounder and have tailed ends or serifs only when those are
required to both impose a predictable rhythm and keep characters
distinct from each other.

The README file in the git repository covers all the technicalities
**and presents the screenshots**.

+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/iosevka-comfy>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/iosevka-comfy>
    + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>

While not specific to Emacs, Iosevka Comfy is an integral part of _my
Emacs experience_: these are the only fonts I use as they complement my
efforts to have highly legible interfaces that are consistent and devoid
of exaggerations (per my `modus-themes` and `ef-themes`).

Below are the release notes.

* * *

- Rebuilt all files using upstream Iosevka version `v16.0.2`, commit
  `2f48331f`.  This is done to incorporate the latest changes (although
  they do not affect Iosevka Comfy).

- Designed a new stylistic "motion" variant.  Select glyphs are curlier
  and/or have tailed ends and serifs, giving a more playful and fluid
  impression.  By comparison, standard Iosevka Comfy is austere.

  The new variants are (i) `iosevka-comfy-motion`, which is largely
  monospaced and supports ligatures, and (ii) `iosevka-comfy-motion-duo`
  which is quasi-proportional in its spacing.

  The variants in brief:

  - `iosevka-comfy` is monospaced and supports ligatures.  Apart from
    ligatures, it allows certain glyphs, such as arrows, to occupy more
    than one block.

  - `iosevka-comfy-motion` is like `iosevka-comfy` but with lots of small
    tweaks that add serifs and tailed ends to give a more playful
    impression.

  - `iosevka-comfy-duo` is quasi-proportional and supports ligatures.  The
    naturally wide glyphs, such as `m`, are allowed to occupy two blocks
    instead of one.

  - `iosevka-comfy-motion-duo` is like `iosevka-comfy-duo` but with the
    more playful style of `iosevka-comfy-motion`.

  - `iosevka-comfy-fixed` is like `iosevka-comfy` albeit strictly
    monospaced and thus does not support ligatures.  All glyphs are
    exactly the same width.  Use this if you prefer it or if your
    application (e.g. terminal emulator) does not recognise
    `iosevka-comfy` as a monospaced font.

  - `iosevka-comfy-wide` is the same as `iosevka-comfy` except it is
    noticeably wider.  It also looks taller than `iosevka-comfy` even
    though both variants fit the same number of lines on a screen.

  - `iosevka-comfy-wide-fixed` same as `iosevka-comfy-wide` though it is
    strictly monospaced and does not support ligatures.

- Updated all screenshots and reworked the README to better present the
  stylistic variants of Iosevka Comfy.

- The comparison between regular Iosevka and Iosevka Comfy now uses a
  larger font height and displays line numbers.  These help illustrate how
  Iosevka Comfy is more compact than its counterpart (compactness is more
  economical, but also prevents rivers of negative space from flowing
  through the lines; rivers which I find incredibly annoying).
