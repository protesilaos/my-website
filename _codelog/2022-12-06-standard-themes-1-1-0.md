---
title: "Emacs: 'standard-themes' version 1.1.0"
excerpt: "Release notes for the latest version of my 'standard-themes' for GNU Emacs."
---

The `standard-themes` are a pair of light and dark themes for GNU
Emacs.  They emulate the out-of-the-box looks of Emacs (which
technically do NOT constitute a theme) while bringing to them thematic
consistency, customizability, and extensibility.  In practice, the
Standard themes take the default style of the font-lock and Org faces,
complement it with a wider colour palette, address some
inconsistencies, and apply established semantic patterns across all
interfaces.

+ Package name (GNU ELPA): `standard-themes`
+ Official manual: <https://protesilaos.com/emacs/standard-themes>
+ Change log: <https://protesilaos.com/emacs/standard-themes-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/standard-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/standard-themes>
    + GitLab: <https://gitlab.com/protesilaos/standard-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/standard-themes>
+ Backronym: Standard Themes Are Not Derivatives but the
  Affectionately Reimagined Default ... themes.

Below are the release notes.

* * *

## The `standard-themes-headings` now covers the Org agenda

The user option `standard-themes-headings` lets the user control the
height, weight, and use of proportionately spaced fonts
(`variable-pitch`) on a per-heading basis.  Different combinations are
possible, as explained in the option's doc string on the corresponding
entry in the manual.

I have now made it possible to specify the `agenda-date` and
`agenda-structure` keys.  Both pertain to the Org agenda.  The former
applies to date headings, while the latter styles the headings of each
"block" of content.  In a generic agenda buffer, that block heading is
the first line which reads `Week-agenda (W49):` or something like
that, though we find such headings in more places as well.

Here is a sample with various stylistic variants per heading:

```elisp
(setq standard-themes-headings ; read the manual's entry or the doc string
      '((0 . (variable-pitch light 1.9))
        (1 . (variable-pitch light 1.8))
        (2 . (semilight 1.7))
        (3 . (semilight 1.6))
        (4 . (1.5)) ; absence of weight means "regular"
        (5 . (1.4))
        (6 . (bold 1.3))
        (7 . (bold 1.2))
        (agenda-date . (semilight 1.5))
        (agenda-structure . (variable-pitch light 1.9))
        (t . (variable-pitch 1.1))))
```

Note that Org re-uses heading levels past 8.  This means that level 9
will look the same as level 1.  This is not the theme's doing.  Check
the user options `org-level-faces`, `org-n-level-faces` for ways to
change this.


## `M-x theme-choose-variant` works as expected

Users of Emacs 29 have access to the command `theme-choose-variant`:
it toggles between two themes of the same family.  If the family
has more members, it uses minibuffer completion instead.

I registered the appropriate theme properties to make this work as
intended.  However, it is still possible to use the command
`standard-themes-toggle`.


## Stylistic refinements

-   Simplified the Magit blame faces to avoid exaggerations.
-   Revised the colours of day headings in the `M-x calendar` buffer.
    Weekends stand out, as is the case with physical calendars and many
    established apps.
-   Made the `edmacro-label` face stand out in its context.  Otherwise
    it was difficult to spot.  This is for Emacs 29 and applies to
    headings in the keyboard macro editing buffer (e.g. with `C-x C-k
      C-e` (`kmacro-edit-macro-repeat`)).
-   Added support for the `powerline` package.

