---
title: "Emacs: spacious-padding version 0.5.0"
excerpt: "Information about the latest version of my 'spacious-padding' package for GNU Emacs."
---

This package provides a global minor mode to increase the
spacing/padding of Emacs windows and frames.  The idea is to make
editing and reading feel more comfortable.  Enable the mode with `M-x
spacious-padding-mode`.  Adjust the exact spacing values by modifying
the user option `spacious-padding-widths`.

Inspiration for this package comes from [Nicolas Rougier's impressive
designs](https://github.com/rougier) and [Daniel Mendler's
`org-modern` package](https://github.com/minad/org-modern).

+ Package name (GNU ELPA): `spacious-padding`
+ Official manual: <https://protesilaos.com/emacs/spacious-padding>
+ Change log: <https://protesilaos.com/emacs/spacious-padding>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/spacious-padding>
  + GitLab: <https://gitlab.com/protesilaos/spacious-padding>
+ Sample images:
  - <https://protesilaos.com/codelog/2023-06-03-emacs-spacious-padding/>
  - <https://protesilaos.com/codelog/2023-11-15-spacious-padding-extra-ui-dev/>
+ Backronyms: Space Perception Adjusted Consistently Impacts Overall
  Usability State ... padding; Spacious ... Precise Adjustments to
  Desktop Divider Internals Neatly Generated.

Release notes below.

* * *

This is a bug fix release.


## Starting a frame from the daemon/server works as well

Before, if Emacs would start as a new server process via a client, it
would not set the faces and the frame parameters correctly.

I have made sure this no longer happens, so the padding/spacing should
look as expected at startup no matter what.

Thanks to tusharhero and Julian Flake for reporting this and testing
the updated code. It was done in issue 13:
<https://github.com/protesilaos/spacious-padding/issues/13>.


## The padding of relevant elements can be set to 0

This concerns anything that has a box with padding around it. From the
user option `spacious-padding-widths`, we have the following
attributes:

-   `:tab-width`
-   `:tab-bar-width`
-   `:tab-line-width`
-   `:header-line-width`
-   `:mode-line-width`

Thanks to Ruby Iris Juric for the contribution. It was done in pull
request 7: <https://github.com/protesilaos/spacious-padding/pull/7>.

The change is less than the 15-line limit, so Ruby does not need to
assign copyright to the Free Software foundation.


## The right-divider-width has a fallback value at all times

This means that even if the `:right-divider-width` is not included in
the value of `spacious-padding-widths`, there will still be a padding
in place. We were already doing this for other scenaria, but not for
this specific case. Thanks to Stefano Rodighiero for bringing this
matter to my attention in issue 11:
<https://github.com/protesilaos/spacious-padding/issues/11>.


## Reasonable defaults even if `spacious-padding-widths` is set to nil

All the attributes of the `spacious-padding-widths` should be optional
and the value could even be nil. We take care internally to use a
reasonable fallback value. We do this on the assumption that the user
who enables `spacious-padding-mode` does actually want "spacious
padding" and not something that does nothing.
