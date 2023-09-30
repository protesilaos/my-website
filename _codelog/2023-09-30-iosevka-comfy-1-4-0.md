---
title: "Iosevka Comfy version 1.4.0"
excerpt: "Release notes for the latest tagged release of my bespoke derivative of the Iosevka font project."
---

_Iosevka Comfy_ is a customised build of the [Iosevka
typeface](https://github.com/be5invis/Iosevka), with a consistent
rounded style and overrides for almost all individual glyphs in both
roman (upright) and italic (slanted) variants.  Many font families are
available, covering a broad range of typographic weights.  The README
file in the git repository covers all the technicalities.

IMAGES HERE: <https://protesilaos.com/emacs/iosevka-comfy-pictures>.

+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/iosevka-comfy>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/iosevka-comfy>
    + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Backronym: Iosevka ... Could Only Modify a Font, Yes

Below are the release notes.

* * *

Update to Iosevka Comfy version 1.4.0

- All fonts are now available in two more weights: medium and
  semibold.  Use them to refine your interfaces.  This is in response to
  the request for a medium weight made by madjxatw in issue 8 on the
  GitHub mirror: <https://github.com/protesilaos/iosevka-comfy/issues/8>.

- Large portions of the build instructions have been rewritten to (i)
  track the numerous and non-trivial breaking changes made by upstream
  Iosevka and (ii) preserve the style of Iosevka Comfy.

- The latin long S (ſ) and the Latin sharp S, else Eszett (ß), are now
  supported by Iosevka Comfy.  Details of shape have been considered,
  such that the reader does not conflate those characters with similar
  ones (e.g. the sharp S with a Greek beta, an ampersand, or an 8).

- The slanted version of the ampersand looks the same as its upright
  counterpart.  This is a deviation from the previous version, where
  this character looked like a flipped 3 with a flat top: I had
  introduced that style by mistake and did not want to rebuild
  everything just for it (rebuilding fonts is an expensive
  operation---I spent 8 hours this time).

- Thanks to Raymond Ko for sending a patch to make Iosevka Comfy build
  on top of Iosevka version 26.3.1.  I installed it to register the
  contribution in Git, though I eventually wrote the aforementioned
  changes from scratch as the current development of Iosevka has more
  breaking changes.  It was easier to review all code points, than to
  assume some as fixed.  Raymond send the patch on the mailing list:
  <https://lists.sr.ht/~protesilaos/general-issues/patches/44816>.

As a note for future users, I am always keeping track of upstream
Iosevka, though I do not want to rebuild Iosevka Comfy too frequently.
Upstream has a policy of changing the code points practically every
few weeks, which then requires hours or days of testing on my end just
to keep Iosevka Comfy the same.  If you try to build Iosevka Comfy
from source, make sure to use the commit in iosevka.git specified in
my project's README.md, as of this writing: this is the current
working version for me.  Future versions of iosevka.git will probably
contain breaking changes.  I will eventually adapt to them.
