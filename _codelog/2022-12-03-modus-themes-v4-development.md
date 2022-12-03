---
title: "Emacs: breaking changes coming to 'modus-themes' version 4"
excerpt: "Overview of the changes coming to the next major release of the 'modus-themes' for Emacs."
---

The next release of the `modus-themes` brings many refinements but
also a few breaking changes.  I plan to release it at the end of
December or the beginning of January.  **Everything is in development,
decisions are not final, and I am interested in your feedback.**  The
code is in the `version-4` branch.  It will become part of `main` only
when I feel it is ready for widespread adoption.

## More pronounced grey backgrounds

A pain point for many users is the perception of "invisible"
background values.  These are shades of grey that many monitors cannot
reproduce accurately.  For example, some tests for LCD displays:

+ <http://www.lagom.nl/lcd-test/black.php>
+ <http://www.lagom.nl/lcd-test/white.php>

I have revised all such backgrounds and expect everything to be easier
to spot.  This includes the mode lines, the header line, tabs,
fringes, region, diff hunk headings, and related.

## Fewer colours and semantic colour mappings

The colour palettes used to have lots of ad-hoc entries.  These are
all removed in favour of reusing existing colours more efficiently.

Colours are now named meaningfully.  The pattern of `HUE-alt` becomes
`HUE-warmer`, while `HUE-alt-other` is `HUE-cooler`.

The new colour mappings let us abstract how a value is assigned to
individual faces.  For example, there now are entries for `builtin`,
`string`, `variable` so making a change to one affects all relevant
faces at once.

Faces defined by the Modus themes are drastically reduced in number.
Those were simply incorporating and propagating those special-purpose
colours.

## Deprecation of colour overrides and new themes

I used to provide user options for overriding colour values.  Those
are no longer available as they made the code more complex.  Instead,
the new design makes it possible to define new Modus themes at the
user level: I will write documentation to that end.

Two new Modus themes are in the works, serving the dual purpose of (i)
providing useful alternatives to `modus-operandi` and `modus-vivendi`,
and (ii) showing how new themes can be introduced without affecting
the main `modus-themes.el` file.

The new themes were anticipated maybe 2 years ago and you can find
hints about them in the manual: a light ochre `modus-operandi` and a
night-sky `modus-vivendi`.

## Deprecation of user options

Several user options are deprecated, while others will be simplified.
The intent is to reduce the number of possible colour combinations.
Those combinations require ad-hoc entries in the colour palette and,
generally, make things harder to maintain and explain.

There also is the idea that tweaking certain face attributes is best
done at the user level, due to the ultimate flexibility it offers.
For example, why offer an option for "yellow comments" when it is
easier to configure `font-lock-comment-face`?  Again, the manual will
show how to do it and recommend some colours (e.g. to try the
`red-faint` from the new colour palettes).

Instead of user options with stylistic permutations of dubious value,
relevant faces will be revised to have more reasonable defaults.  For
example, the background used to highlight the matching parenthesis of
`show-paren-mode` is easier to discern.

## Review of supported packages

Support for several packages will be discontinued.  Covering thousands
of faces is not sustainable (and more keep coming).  Instead, we as a
community must learn to either inherit from basic faces
(e.g. font-lock) OR define reasonable/legible defaults that work
across all reasonable themes.  When some `defface` form fails this
test, we should be patching it for the benefit of all users.

If you use a package that I no longer support (e.g. `helm` or
`dired+`), I encourage you to ask its maintainer to do the right
thing: play nicely with the vast majority of themes by inheriting from
basic faces.

## Ongoing development

Again, nothing is final.  We still have a month to go and I will
extend it further if necessary.  If you have any comments, please
speak your mind.

+ Package name (GNU ELPA): `modus-themes` (also built into Emacs >= 28)
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/modus-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/modus-themes>
    + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes
