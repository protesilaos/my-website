---
title: "Iosevka Comfy version 0.2.0"
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

* Updated the screenshots that compare Iosevka Comfy to regular Iosevka.
  They show how the former is more vertically compact than the latter,
  while also exhibiting the stylistic differences between the two.  Make
  sure to view the images in full screen mode, otherwise the characters
  may be distorted.

* Iosevka Comfy comes in "narrow" and "wide" variants.  As the latter
  have different requirements, we optimise for them instead of enforcing
  a misguided one-size-fits-all.  Concretely, the README explains thus:

> Deviations from the regular style
>
> The variants of Iosevka Comfy are subdivided into "narrow" and "wide".
> The former consists of `iosevka-comfy` and `iosevka-comfy-fixed`.  The
> latter includes `iosevka-comfy-wide`, `iosevka-comfy-wide-fixed`, and
> the quasi-proportional `iosevka-comfy-duo`.
>
> Due to the relaxed spacing requirements and concomitant legibility
> considerations, the wide variants have stylistic deviations from their
> counterparts.  In detail:
>
> * The `m` character has three legs of equal length, insetad of a shorter
>   middle leg.  The short middle leg in the narrow variants is necessary
>   for legibility, especially at small point sizes (otherwise the
>   character's legs visually blend into what appears to be a solid
>   block).
>
> * The `0` has a forward slash that cuts diagonally through the middle of
>   the circle, connecting the bottom left part to the top right of the
>   oval shape.  Whereas the narrow variants have a dashed forward slash
>   which does not connect the two sides as it is positioned inside the
>   oval shape.

Done using upstream version `v15.5.2`, commit `a0f82f14`.
