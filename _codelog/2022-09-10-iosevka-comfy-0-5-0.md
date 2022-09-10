---
title: "Iosevka Comfy version 0.5.0"
excerpt: "Release notes for the latest tagged release of my bespoke derivative of the Iosevka font project."
---

_Iosevka Comfy_ is a build of the Iosevka typeface with a rounded style
and open shapes, adjusted metrics, and overrides for almost all
individual glyphs in both roman (upright) and italic (slanted) variants.
It is more vertically compact than the standard upstream configuration.
Glyphs are rounder and have tailed ends or serifs only when those are
required to both impose a predictable rhythm and keep characters
distinct from each other.

+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/iosevka-comfy>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/iosevka-comfy>
    + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Sample pictures: <https://protesilaos.com/emacs/iosevka-comfy-pictures>
+ Backronym: Iosevka (Could Only Modify a Font, Yes)

While not specific to Emacs, Iosevka Comfy is an integral part of _my
Emacs experience_: these are the only fonts I use as they complement my
efforts to have highly legible interfaces that are consistent and devoid
of exaggerations (per my `modus-themes` and `ef-themes`).

Below are the release notes.

* * *

Update to Iosevka Comfy 0.5.0

* Created a dedicated page for sample pictures of the fonts:
  <https://protesilaos.com/emacs/iosevka-comfy-pictures>.

* Revised the proportions of the fonts to have a marginally less compact
  vertical spacing.  The intent is to fix the display of accents over
  capital letters, such as ÀÄÃÁÖÕ.  This issue was discussed on the
  mailing list.  Thanks to inwit for bringing the matter to my
  attention:
  <https://lists.sr.ht/~protesilaos/general-issues/%3CCMG66XYLH7MO.2T0058JIS1343%40bisio%3E>.

* Made sweeping changes to Iosevka Comfy Motion and Iosevka Comfy Motion
  Duo to address their [subtle] inconsistencies and enforce a uniform
  style throughout their glyphs.  Put simply, the "motion" variants are
  the pseudo-serif counterparts of base Iosevka Comfy and Iosevka Comfy
  Duo, respectively.

* Rebuilt all font files based on Iosevka `v16.2.0`, commit `b7a59ee4`
  on 2022-09-10.

* Updated the README to reflect the aforementioned.

* * *

Reminder of the font families on offer:

* `iosevka-comfy` is monospaced and supports ligatures.  Apart from
  ligatures, it allows certain glyphs, such as arrows, to occupy more
  than one block.

* `iosevka-comfy-motion` is like `iosevka-comfy` but with lots of small
  tweaks that add serifs and tailed ends to relevant glyphs.  Put sipmly
  this is the pseudo-serif version of the otherwise sans-serif base
  style.

* `iosevka-comfy-duo` is quasi-proportional and supports ligatures.  The
  naturally wide glyphs, such as `i`, are allowed to occupy their
  natural width instead of one space.

* `iosevka-comfy-motion-duo` is like `iosevka-comfy-duo` but with the
  serified style of `iosevka-comfy-motion`.

* `iosevka-comfy-fixed` is like `iosevka-comfy` albeit strictly
  monospaced and thus does not support ligatures.  All glyphs are
  exactly the same width.  Use this if you prefer it or if your
  application (e.g. terminal emulator) does not recognise
  `iosevka-comfy` as a monospaced font.

* `iosevka-comfy-wide` is the same as `iosevka-comfy` except it is
  noticeably wider.  It also looks taller than `iosevka-comfy` even
  though both variants fit the same number of lines on a screen.

* `iosevka-comfy-wide-fixed` same as `iosevka-comfy-wide` though it is
  strictly monospaced and does not support ligatures.
