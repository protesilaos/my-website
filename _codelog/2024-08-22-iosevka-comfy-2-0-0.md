---
title: "Iosevka Comfy version 2.0.0"
excerpt: "Release notes for the latest tagged release of my bespoke derivative of the Iosevka font project."
---

_Iosevka Comfy_ is a customised build of the Iosevka typeface, with a
consistent rounded style and overrides for almost all individual
glyphs in both roman (upright) and italic (slanted) variants.  Many
font families are available, covering a broad range of typographic
weights.  The README file in the git repository covers all the
technicalities.

IMAGES HERE: <https://protesilaos.com/emacs/iosevka-comfy-pictures>.

+ Git repositories:
  + GitHub: <https://github.com/protesilaos/iosevka-comfy>
  + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Backronym: Iosevka ... Could Only Modify a Font, Yes.

Below are the release notes.

* * *

## Update to Iosevka Comfy version 2.0.0 (on top of Iosevka 31.3.0)

### It is difficult to build Iosevka Comfy

I made a lot of adjustments to preserve the aesthetics of Iosevka
Comfy while adapting them to the latest version of upstream Iosevka.
Users will now benefit from all the refinements made upstream.

Iosevka has a rapid release cycle. Almost every version introduces
some breaking change: a code point is repurposed to reference another
character or the numeric value of a character variant is modified to
point to another variant... To rebuild Iosevka Comfy, I have to
inspect every single character to ensure its code point AND numeric
variant are correct. This is a laborious task that takes several days
of testing all the fonts. Still, it is worth the effort as I get a set
of highly functional fonts in the process.

Another complication this time was on the hardware side of things. I
could not rebuild because I was running out of RAM and my computer
would crash. This stalled the current version for several months. I
finally got a new 16GB memory stick and was able to work on this project.


### Minor stylistic refinements

All the variants I provide are the same except for two small changes:

- The capital U in all the "motion" variants now uses the style I had
  always intended. This is a rounded bottom with a serif at the top
  left corner. In the previous version of Iosevka Comfy, this character
  had a tail at the bottom right corner because upstream had changed
  the numeric value of the variant. I either did not notice that in
  the documentation at the time, or the documentation had not been
  updated accordingly. I did spot the error back then after I had
  rebuilt the fonts, but I was not going to put further stress on my
  computer just for one character. Anyway, this change makes "motion"
  variants have the desired rhythm throughout.

- All "duo" and "wide" variants have a capital `i` (`I`) with shorter
  bars/serifs than the others (e.g. Iosevka Comfy and Iosevka Comfy
  Motion). For the "duo" variants, this enforces tighter spacing around
  that character, which is appropriate in a quasi-proportional font.
  While for the "wide" variants, the same change improves the sense of
  added space between characters and is easier to read at tiny point sizes.
  This capital `I` still has serifs to not be mistaken for the bar/pipe
  character or for a cursor that is rendered in a vertical bar shape.


### Stylistic tweaks for the Greek alphabet

Greek characters have always been supported, though their style was
the same as that of upstream Iosevka. For many of those characters I
now introduce changes to make them fit better with their Latin
counterparts. The specifications are in the file 'private-build-plans.toml'.
