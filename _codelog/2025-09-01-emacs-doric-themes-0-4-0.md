---
title: "Emacs: doric-themes version 0.4.0"
excerpt: "Minimalist themes for GNU Emacs to complement my ef-themes (maximalist) and modus-themes (moderate)."
---

These are my minimalist themes. They use few colours and will appear
mostly monochromatic in many contexts. Styles involve the careful use
of typography, such as italics and bold italics.

If you want maximalist themes in terms of colour, check my `ef-themes`
package. For something in-between, which I would consider the best
"default theme" for a text editor, opt for my `modus-themes`.

+ Package name (GNU ELPA): `doric-themes`
+ Sample pictures: <https://protesilaos.com/emacs/doric-themes-pictures>
+ Git repository: <https://github.com/protesilaos/doric-themes>
+ Backronym: Doric Only Really Intensifies Conservatively ... themes.

Below are the release notes.

* * *

## Update to doric-themes version 0.4.0

This version brings several refinements to the package, as well as two
new themes.

### Enjoy doric-beach and doric-valley

Most of the Doric themes feel monochromatic. By contrast, the
`doric-beach` (light) and `doric-valley` (dark) are dichromatic: they
combine warm hues, such as orange, with cold hues like teal. They
still are minimalistic, like the rest of the family, but appear a bit
more playful than their more austere counterparts.

[ The `doric-oak` and `doric-pine` are similar in this regard. ]

### Refashioned diffs

All diff interfaces, including Magit, diff-mode, and Ediff now rely on
a comprehensive new subset of colours. They use colour-coded
backgrounds throughout, whereas before they had just colour-coded
text. The problem with highlighting only text is that it is harder
to (i) discern the colour and thus (ii) quickly estimate the
boundaries of a change.

For Magit in particular, there are distinct styles for the
highlighted/current diff hunk, all other diff hunks, as well as the
common word-wise ("refined") diffs that all interfaces share.

### Org agenda and dates are more consistent

The changes here are subtle but should contribute to a more pleasant
experience, owning to the more careful emphasis of information.
"Scheduled" entries are easier to notice, as they are distinct from
other events. Date headings also have a more clear distinction from
the tasks they contain.

For the M-x calendar, in particular, month and date headings are
revised to be consistent with the Org agenda, while the diary and
holiday faces are redone to look harmonious in context. Thanks to Amin
Bandali for checking those and suggesting some tweaks.

### Certain header-like faces stand out more

In various contexts, such as in git-mode commit message comments or
Dired buffers, there are pieces of text that conceptually are
headings. Those are rendered in a distinct style than other generic
"bold" faces, to better perform their function.

### Flymake fringe indicators are easier to spot

Those now have a fine background colour, coded to the type of warning.

### Support for the `lin` and `pulsar` packages

Those define faces that affect the background of a line. These
packages now feel right when used in tandem with the doric-themes.
