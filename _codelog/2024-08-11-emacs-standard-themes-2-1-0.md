---
title: "Emacs: 'standard-themes' version 2.1.0"
excerpt: "Release notes for the latest version of my 'standard-themes' for GNU Emacs."
---

The `standard-themes` are a pair of light and dark themes for GNU
Emacs.  They emulate the out-of-the-box looks of Emacs (which
technically do NOT constitute a theme) while bringing to them thematic
consistency, customizability, and extensibility.  In practice, the
Standard themes take the default style of the font-lock and Org faces,
complement it with a wider and harmonious colour palette, address many
inconsistencies, and apply established semantic patterns across all
interfaces by supporting a large number of packages.

+ Package name (GNU ELPA): `standard-themes`
+ Official manual: <https://protesilaos.com/emacs/standard-themes>
+ Change log: <https://protesilaos.com/emacs/standard-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/standard-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/standard-themes>
  + GitLab: <https://gitlab.com/protesilaos/standard-themes>
+ Backronym: Standard Themes Are Not Derivatives but the
  Affectionately Reimagined Default ... themes.

Below are the release notes.

* * *

This package is in a stable state. The present release introduces only
tweaks and refinements.


## The built-in `erc` package is now supported

This is an IRC client for Emacs that is more feature-rich than its
`rcirc` counterpart (also built-in). The colours used in ERC buffers
are now consistest with the rest of theme.


## `ert` test results have the appropriate styles

The built-in `ert` testing framework for Emacs Lisp code displays its
results in a set of colours that are consistent with the rest of the
themes.


## The `ztree` package is fully supported

This is a directory viewer that also has the capability to compare the
contents of different directories. The colours it uses now follow the
established patterns of the themes.


## Mu4e folds look a bit different

The characters used by the `mu4e` email client to show the tree
structure of message threads are now draws in a less intense colour.
This ensures that the focus in on the message subject lines and
accompanying information.


## The `doom-modeline` no longer uses bold+italic combinations

This is because those can clip the edges of icons/symbols used
therein.

I was informed about this problem on the issue tracker of my
`ef-themes` by Filippo Argiolas: <https://github.com/protesilaos/ef-themes/issues/42>.


## The Elisp shorthands are easier to spot

This is not a commonly seen feature, though Emacs Lisp can benefit
from so-called "shorthands" were long symbol prefixes are substituted
by a shorter equivalent. At the theme level, we now render those in
italic and in a colour that is not used elsewhere in Elisp code.


## Nerd icon directories are more colourful during completion

The `nerd-icons-completion` package extends coverage of `nerd-icons`
to the minibuffer. File/directory prompts now display directories in
the colour that is also used in Dired buffers instead of black/white.
This makes the themes more consistent and the icons in the minibuffer
less intense.


## Org keywords like `#+title` may be monospaced

If the user option `standard-themes-mixed-fonts` is set to a non-nil
value, then all such keywords will use a monospaced font (inherit from
`fixed-pitch`). This is already done for other code- or metadata- like
elements.

The purpose of this user option is to render spacing-sensitive
constructs in a monospaced font but allow the user to set the
`default` face to a proportionately spaced font (this can be done on
demand with `M-x variable-pitch-mode`). Without this arrangement,
proportionately spaced fonts will produce misalignments in tables,
code blocks, et cetera.


## Miscellaneous

-   Extended the coverage of `shr` (built-in) faces to cover `shr-mark`.
-   Added support for the built-in `completions-highlight` face (Emacs
    29).
-   Removed the underline property from the Gnus implicit buttons,
    because it can be too distracting.
-   Made changes to the manual, were necessary.
