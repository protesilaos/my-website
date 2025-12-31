---
title: 'Emacs: modus-themes version 5.2.0'
excerpt: 'Information about the latest version of my highly accessible themes for GNU Emacs.'
---

I just published the latest stable release of [the Modus
themes](https://protesilaos.com/emacs/modus-themes). The change log
entry is reproduced further below. For any questions, you are welcome
to [contact me](https://protesilaos.com/contact/). I will now work to
apply these same changes to emacs.git, so please wait a little longer
for the updates to trickle down to you.

+ Package name (GNU ELPA): `modus-themes` (also built into Emacs 28+)
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/modus-themes>
  + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes.

* * *


## 5.2.0 on 2025-12-31

This version fixes some bugs, adds a new feature for those who want to
derive a theme from Modus, and makes other small quality-of-life
refinements.


### The `modus-themes-with-colors` should work at all times

In the transition to version `5.0.0`, I inadvertently introduced
regressions to the behaviour of the `modus-themes-with-colors` macro.
This macro `let` binds the current theme's palette around arbitrary
Elisp expressions, which allows users to access the named colours
therein. In versions `5.0.0` and `5.1.0` the macro could not read
variables defined outside its scope. Users needed to write an `eval`
around it, which I did not like. Now the macro should not require such
workarounds: it basically is a `let` that should work as expected
everywhere.

This was fixed over a series of Git commits related to issue 170:
<https://github.com/protesilaos/modus-themes/issues/170>. Thanks to
Alexandr Semenov and realazy for reporting the problems and testing my
revisions.


### The `modus-themes-generate-palette` function to quickly get a palette

Users or package developers who want to create a theme on top of Modus
can now get a kickstart by defining their palette with the help of the
new `modus-themes-generate-palette` function. This function is meant
to return a complete palette, given a list of basic colours. Users can
thus experiment with their new theme while knowing that what they got
contains all the definitions; definitions that they may then modify
further (e.g. to define different semantic mappings than the defaults
such as, for example, to have `(fg-heading-1 red-warmer)` instead of
what originally is `(fg-heading-1 fg-main)`).

I have written extensive documentation in the manual, which includes a
complete example of a Solarized theme that is built on top of Modus.
If you have any questions, you are welcome to contact me.


### Convenience commands to select only dark or light themes

The commands `modus-themes-select-dark` and `modus-themes-select-light`
use minibuffer completion to load a theme. The completion candidates
are filtered to only dark or light themes, respectively.

This is effectively the same as calling the command `modus-themes-select`
with a prefix argument (`C-u` by default).

Remember that we also have the commands `modus-themes-load-random`,
`modus-themes-load-random-dark`, and `modus-themes-load-random-light`.
Otherwise use the command `modus-themes-rotate`.


### Improved prompt for theme selection

The minibuffer prompt used by the various Modus commands to select a
theme now has a grouping function in place: it shows the current theme
at the top and then all other themes grouped by their dark or light
background. This makes it easier to find a relevant theme, especially
if lots of them are present, such as when `modus-themes-include-derivatives-mode`
is enabled and relevant packages/themes are available (e.g. my
`ef-themes` and `standard-themes`).


### Semantic colours for `transient.el` (e.g. in Magit)

The `transient.el` concept of "semantic colours" is now supported.
This is used by default in Magit to denote the different types of
keys, such as those that exit the transient, keep it active, move to
another transient, and the like. Users who prefer the old style where
all key bindings looked the same must customise the user option
`transient-semantic-coloring`.

Note that the deuteranopia- and tritanopia- optimised themes adapt
gracefully to such "semantics", owning to relevant internal
refinements I made. Those themes cannot rely on the full colour
spectrum to communicate such nuances.


### All `hl-todo-mode` faces use a bold weight if appropriate

When the user option `modus-themes-bold-constructs` is set to a
non-`nil` value, then all keywords that `hl-todo-mode` highlights will
be rendered in a bold weight (technically, they inherit the `bold`
face). This is how we were doing it before until I undid it by
mistake. Thanks to Dominik Schrempf for reporting the bug in issue
177: <https://github.com/protesilaos/modus-themes/issues/177>.


### Theme-sensitive colours for Gnus mail groups

The Gnus mail groups no longer have hardcoded colour values. They will
look different depending on the current Modus theme.


### Faces that set a `:box` attribute handle unspecified colours

I updated all faces that use a `:box` attribute to account for the
scenario of a user writing palette overrides that unset the relevant
colour. Thanks to JD Smith for reporting a bug along those lines in
issue 9 of my `standard-themes` repository (they are derived from the
`modus-themes`, hence the changes here):
<https://github.com/protesilaos/standard-themes/issues/9>.


### The `calendar-today` and `org-date-selected` faces are disambiguated

These two faces are no longer using the same styles. This is because
they can appear in the same buffer. Thanks to Rudolf Adamkovič for
discussing this with me in the context of the same change for my
`doric-themes` (issue 20 in doric-themes.git):
<https://github.com/protesilaos/doric-themes/issues/20>.


### The Modus "current theme" respects multiple enabled themes

The Modus concept of "current theme" respects the user's choice for
multiple themes loaded at once. It will return the first Modus theme
even if it is not at the front of the list.

[ Emacs will load multiple themes by default, which leads to awkward
  colour combinations, unless you know what you are doing&#x2014;as such all
  the Modus commands that load a theme will disable all others, subject
  to the user option `modus-themes-disable-other-themes`. ]

Thanks to Pierre Téchoueyres for reporting the scenario where multiple
other themes are loaded on top of a Modus theme. This was done in
issue 182: <https://github.com/protesilaos/modus-themes/issues/182>.

Also thanks to Pierre for covering another snippet that I had missed.
This was done in pull request 184:
<https://github.com/protesilaos/modus-themes/pull/184>.

Pierre has assigned copyright to the Free Software Foundation.


### Fixed symbol of inherited AUCTeX face

There was a typo which caused an error. Thanks to Rudolf Adamkovič for
the patch and also for providing a relevant unit test. This was done
in pull request 188: <https://github.com/protesilaos/modus-themes/pull/188>.

Rudolf has assigned copyright to the Free Software Foundation.


### Miscellaneous

-   Thanks to Basil L. Contovounesios for simplifying a couple of
    expressions. This was done in pull request 190:
    <https://github.com/protesilaos/modus-themes/pull/190>. Basil has
    assigned copyright to the Free Software Foundation.

-   The faces of the built-in `completion-preview-mode` are now
    supported. Thanks to Kevin Fleming for asking me about this in issue
    178: <https://github.com/protesilaos/modus-themes/issues/178>.

-   Several faces that had a strike-through effect when they did not
    really need it are revised to use a wavy underline instead. The idea
    is to let the text be readable at all times, regardless of the
    effective font family. With the strike-through effect, some fonts
    completely obscure the underlying text.Thanks to Morgan Willcock for
    discussing with me the use of the strike-through style in issue 169:
    <https://github.com/protesilaos/modus-themes/issues/169>.

-   All `symbol-overlay` faces are unique, fixing a mistake I had done
    before.

-   The `org-dispatcher-highlight`, which is used to highlight the keys
    of the Org export interface, now uses the appropriate foreground
    colour and is always rendered in a bold weight.

-   The `org-habit` faces no longer call the function
    `readable-foreground-color`. This is because that function does not
    work if the theme is loaded via the `early-init.el`. Thanks to
    Gaston Cabotin for reporting the problem in issue 174:
    <https://github.com/protesilaos/modus-themes/issues/174>.

-   The `gnus-button`, which Gnus uses in all sorts of places to mark
    some text as clickable, is styled with a less intense underline and
    will no longer follow the style of links, including possible palette
    overrides. This way, Gnus article buffers will not have visual
    noise. Thanks to Morgan Willcock for discussing this with me in
    issue 140: <https://github.com/protesilaos/modus-themes/issues/140>.
