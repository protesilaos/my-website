---
title: "Iosevka Comfy version 0.3.0"
excerpt: "Release notes for the latest tagged release of my bespoke derivative of the Iosevka font project."
---

_Iosevka Comfy_ is a build of the Iosevka typeface with a rounded style
and open shapes, adjusted metrics, and overrides for almost all
individual glyphs in both roman (upright) and italic (slanted) variants.
It is more vertically compact than the standard upstream configuration.
Glyphs are rounder and have tailed ends or serifs only when those are
required to both impose a predictable rhythm and keep characters
distinct from each other.

The README file in the git repository covers all the technicalities.

+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/iosevka-comfy>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/iosevka-comfy>
    + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>

While not specific to Emacs, Iosevka Comfy is an integral part of _my
Emacs experience_: these are the only fonts I use as they complement my
efforts to have highly legible interfaces that are consistent and devoid
of exaggerations (per my `modus-themes`).

Below are the release notes.

* * *

* Changed the 'a' glyph from a single to a double storey design.  The
  previous implementation had two problems: (1) it was not fully
  consistent with the overall rounded style of Iosevka Comfy, and (2) it
  could be mistaken for an 'o'.

  Damien Cassou wrote about the latter case in issue 2 over at the
  GitHub mirror: <https://github.com/protesilaos/iosevka-comfy/issues/2>.

  The report confirmed my suspicion that I had a misplaced sense of
  comfort in disambiguating the single storey 'a' from 'o' solely
  because of how we tend to read known words predictively instead of
  character-by-character.  I was already testing this by substituting
  random 'a' with 'o' in long texts where I was still reading everything
  as if the typos were not there.  Damien's report was the final datum
  that provided the impetus for this change.

* Revised the 'b' and 'd' glyphs to exhibit the roundedness found in
  other relevant glyphs.  Before they had a sturdier look which broke
  the established patterns of Iosevka Comfy, albeit ever so slightly.
  The inconsistency was noticeable at larger point sizes.

  The new rounded shapes look virtually the same as their predecessors
  at small point sizes.  At larger sizes though, they retain the
  desirable characteristics of the typeface.

* Removed the tail from the 'u' glyph and enforced roundedness.  This
  aligns its design with 'a' but also with other characters like 'n'.
  Again, the intent is to achieve inter-character consistency, where
  appropriate.

* Updated the documentation to reflect the aforementioned.

* Produced new screenshots to showcase the current state of the project.
