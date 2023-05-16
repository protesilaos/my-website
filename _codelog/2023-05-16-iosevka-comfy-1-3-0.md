---
title: "Iosevka Comfy version 1.3.0"
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

* Include table in the `README.md` file that succinctly describes the
  Iosevka Comfy variants.  This is it:

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

* Review all glyph codes to preserve the font's style in light of the
  numerous breaking stages in the main Iosevka repository.  An example
  of such a change is when `cv20 = 2` has a different style than what
  it used to or when the `cvXX` refers to another character than what
  it once did.

* Ensure the lower case italic form of `f` has a crossbar at the
  x-height. This is how its roman counterpart is: it aligns with `i`
  and `t`.

* Make the capital `B` in all the "motion" variants (slab serif families)
  consist of two symmetric chambers.  This is consistent with the sans
  serif variants of Iosevka Comfy.

* Revise the `f` in the "motion" variants to be the same as their sans
  serif counterparts.  The reason is that the previous glyph was
  closed at the top and was thus harder to read at small point sizes.

* Change the italic forms of lower case `v`, `w`, `x`, and `z` from
  curly to straight across all the variants.  This is to ensure a
  consistent rhythm in all contexts between upper and lower case
  characters as well as upright and slanted forms.

* Let capital `W` have a middle joint below the height of its two
  sides in order to be consistent with capital `M` and the lower case
  `w`.

* Adjust the bar character `|` (also known as "pipe") to have no slope
  in italic forms.  The intent is to disambiguate it from the forward
  slash.  Also, the pipe can now be used in plain text tables even if
  those are italicised (e.g. a comment in programming code).

* Declare the Iosevka Comfy Wide Motion Duo as a slab serif font.
  This affects characters that are not explicitly defined in our list
  of overrides.

* Clarify some comments in the build plan of Iosevka Comfy to better
  describe the intended looks of the referenced characters.
