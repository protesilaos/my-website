---
title: "Iosevka Comfy version 1.2.0"
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
+ Backronym: Iosevka ... Could Only Modify a Font, Yes

Below are the release notes.

* * *

* Make necessary adjustments to handle backward-incompatible changes
  in upstream Iosevka.  The intent is to preserve the aesthetic of
  Iosevka Comfy.

* Introduce the "wide motion" superset of font families.  This is
  another triplet that consists of (i) a regular monospaced style with
  support for ligatures and some wide glyphs like arrows, (ii) a fixed
  spaced monospaced variant that does not support ligatures or any
  wide glyphs, and (ii) a quasi-proportional ("duospaced") variant
  that preserves some of the rigidity of its monospaced counterparts
  but allows certain glyphs to occupy their natural width.  The
  project's README describes all the variants on offer.

* * *

| Family                          | Shapes | Spacing | Style      | Ligatures |
|---------------------------------+--------+---------+------------+-----------|
| Iosevka Comfy                   | Sans   | Compact | Monospaced | Yes       |
| Iosevka Comfy Fixed             | Sans   | Compact | Monospaced | No        |
| Iosevka Comfy Duo               | Sans   | Compact | Duospaced  | Yes       |
|---------------------------------+--------+---------+------------+-----------|
| Iosevka Comfy Motion            | Slab   | Compact | Monospaced | Yes       |
| Iosevka Comfy Motion Fixed      | Slab   | Compact | Monospaced | No        |
| Iosevka Comfy Motion Duo        | Slab   | Compact | Duospaced  | Yes       |
|---------------------------------+--------+---------+------------+-----------|
| Iosevka Comfy Wide              | Sans   | Wide    | Monospaced | Yes       |
| Iosevka Comfy Wide Fixed        | Sans   | Wide    | Monospaced | No        |
| Iosevka Comfy Wide Duo          | Sans   | Wide    | Duospaced  | Yes       |
|---------------------------------+--------+---------+------------+-----------|
| Iosevka Comfy Wide Motion       | Slab   | Wide    | Monospaced | Yes       |
| Iosevka Comfy Wide Motion Fixed | Slab   | Wide    | Monospaced | No        |
| Iosevka Comfy Wide Motion Duo   | Slab   | Wide    | Duospaced  | Yes       |

Quote from the README about the available styles:

> Iosevka Comfy comes in four sets of three: two sans-serif and two
> serif supersets.  The triplets in each set follow the naming scheme
> `NAME{,-fixed,-duo}`.  The base name is monospaced and supports
> ligatures.  The "fixed" one is strictly monospaced so as to work with
> all terminal emulators: it does not support ligatures or any wider
> glyphs.  And the "duo" is quasi-proportionately spaced, while
> supporting ligatures.
>
> Here "quasi-proportional" means that certain glyphs are allowed to
> occupy their natural width, instead of being strictly monospaced,
> while other remain monospaced.  This combination results in a style
> that feels like fixed spacing but reads like variable spacing.
>
> 1. The **compact, sans-serif** set:
>
>    - `iosevka-comfy` is monospaced and supports ligatures.  Apart from
>      ligatures, it allows certain special glyphs, such as arrows, to
>      occupy more than one block.
>
>    - `iosevka-comfy-fixed` is like `iosevka-comfy` albeit strictly
>      monospaced and thus does not support ligatures.  All glyphs are
>      exactly the same width.  Use this if you prefer it or if your
>      application (e.g. terminal emulator) does not recognise
>      `iosevka-comfy` as a monospaced font.
>
>    - `iosevka-comfy-duo` is quasi-proportional and supports ligatures.  The
>      naturally narrow glyphs, such as `i`, are allowed to occupy their
>      natural width instead of one space.
>
> 2. The **compact, serif** set:
>
>    - `iosevka-comfy-motion` is monospaced and supports ligatures.  It is
>      like `iosevka-comfy` but with lots of small tweaks that add serifs
>      and tailed ends to relevant glyphs.  Put simply, it is the serified
>      counterpart of `iosevka-comfy`.
>
>    - `iosevka-comfy-motion-fixed` is the serif equivalent of the
>      aforementioned `iosevka-comfy-fixed`.
>
>    - `iosevka-comfy-motion-duo` is the serif equivalent of
>      `iosevka-comfy-duo`.
>
> 3. The **wide, sans-serif** set:
>
>    - `iosevka-comfy-wide` is the same as `iosevka-comfy` except it is
>      noticeably wider.  It also looks taller than `iosevka-comfy` even
>      though both variants fit the same number of lines on a screen.
>
>    - `iosevka-comfy-wide-fixed` is the "wide" counterpart of the
>      `iosevka-comfy-fixed` family.
>
>    - `iosevka-comfy-wide-duo` is the "wide" counterpart of the
>      `iosevka-comfy-duo` family.
>
> 4. The **wide, serif** set:
>
>    - `iosevka-comfy-wide-motion` is the same as `iosevka-comfy-motion`
>      except it is noticeably wider.  It also looks taller than
>      `iosevka-comfy-motion` even though both variants fit the same
>      number of lines on a screen.
>
>    - `iosevka-comfy-wide-motion-fixed` is the "wide" counterpart of the
>      `iosevka-comfy-motion-fixed` family.
>
>    - `iosevka-comfy-wide-motion-duo` is the "wide" counterpart of the
>      `iosevka-comfy-motion-duo` family.
