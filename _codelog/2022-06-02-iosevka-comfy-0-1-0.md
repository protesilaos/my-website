---
title: "Iosevka Comfy version 0.1.0"
excerpt: "Release notes for the latest tagged release of my bespoke derivative of the Iosevka font project."
---

"Iosevka Comfy" is the name of my collection of custom typefaces,
derived [from Iosevka](https://github.com/be5invis/iosevka).  It
addresses the pain points (however small) I have had with all other
libre fonts, including Hack, Source Code Pro, Fira Mono/Code, and
upstream Iosevka's numerous stylistic variants.

My project's README, describes all the technicalities about the goal of
Iosevka Comfy, its particularities, the multiple build files it
provides, and the differences between them.  The very short description
is:

> [...] with a rounded style and open shapes, adjusted metrics, and
> overrides for almost all individual glyphs in both roman (upright) and
> italic (slanted) variants.

* Git repo on SourceHut: <https://git.sr.ht/~protesilaos/iosevka-comfy>
  - Mirrors:
    * GitHub: <https://github.com/protesilaos/iosevka-comfy>
    * GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
* Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>

While not specific to Emacs, Iosevka Comfy is an integral part of _my
Emacs experience_: these are the only fonts I use as they complement my
efforts to have highly legible interfaces that are consistent and devoid
of exaggerations (per my `modus-themes`).

Below are the release notes.

* * *

* Upstream now supports inheriting glyph variants, so we do just that.
  Makes the build plans easier to manage.

* After lots of tests, the `@` sign uses a tall three-fold style which
  (i) does not give off a faux bold weight, meaning that it does not
  have more typographic colour than it ought to, (ii) does not look like
  concentric circles at small point sizes the way four-folded variants
  do, (iii) is not too short to the point where it might be mistaken for
  a regular `a` or simply be hard to discern, the way the Fira-style
  version is, and (iv) has a recognisable shape at all point sizes and
  widths.

* All "wide" builds use an `m` character with three legs of equal
  length.  Whereas the "narrow" builds have an `m` with a shorter middle
  leg.  The relevant part from the README:

> Note that the `iosevka-comfy-duo`, `iosevka-comfy-wide`, and
> `iosevka-comfy-wide-fixed` use a different style for the `m`
> character.  Instead of the one with a shorter middle leg, they let all
> legs have the same length.  The short middle leg in `m` that we need
> in the narrow monospaced variants is necessary for legibility,
> especially at small point sizes.  Otherwise it is a gimmick, so we
> remove it in the "wider" builds.

* To keep track of things, this commit marks the release of Iosevka
  Comfy version `0.1.0` (even though the project has been viable for
  close to two years now).

Done using upstream version `v15.4.2`, commit `76a87155`.
