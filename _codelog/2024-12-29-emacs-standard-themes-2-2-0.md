---
title: "Emacs: 'standard-themes' version 2.2.0"
excerpt: "Release notes for the latest version of my 'standard-themes' for GNU Emacs."
---

The `standard-themes` are a collection of light and dark themes for
GNU Emacs. The `standard-light` and `standard-dark` emulate the
out-of-the-box looks of Emacs (which technically do NOT constitute a
theme) while bringing to them thematic consistency, customizability,
and extensibility. Other themes are stylistic variations of those.

In practice, the Standard themes take the default style of the
font-lock and Org faces, complement it with a wider and harmonious
colour palette, address many inconsistencies, and apply established
semantic patterns across all interfaces by supporting a large number
of packages.

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

This version contains a few refinements to an already stable base.


## Enjoy the new "tinted" themes

I now provide the `standard-light-tinted` and `standard-dark-tinted`
themes in addition to `standard-light` and `standard-dark`. The
announcement I made about these new themes also includes screenshots
of them: <https://protesilaos.com/codelog/2024-12-17-emacs-standard-themes-tinted/>.

The `standard-light-tinted` theme has an earthly feel to it, with
hints of magenta. It otherwise follows the stylistic patterns of its
`standard-light` counterpart.

The `standard-dark-tinted` theme has a dark blue background in
combination with appropriate shades of magenta. It, too, is
stylistically consistent with its `standard-dark` counterpart.


## Command to rotate themes

The `standard-themes-rotate` goes through the Standard themes defined
in the user option `standard-themes-to-rotate`. It does so in order
from left to right, starting from the currently loaded theme. By
default, the value of `standard-themes-to-rotate` is:

```elisp
'(standard-light standard-light-tinted standard-dark standard-dark-tinted)
```

Users who plan to only use two themes can rely instead on the command
`standard-themes-toggle` and its `standard-themes-to-toggle` variable.


## Explicit support for the `lin` and `pulsar` packages

These packages highlight the current line. By extending support to
their faces, we guarantee that they always look right with the given
Standard theme.


## The palette preview use a tabular view

The commands `standard-themes-list-colors` and
`standard-themes-list-colors-current` are redesigned to show colours
in a tabular layout.

The practical advantage for users is that they can now sort the
entries by column: move the cursor to the desired column and type `S`
(or `M-x tabulated-list-sort`). Do it again to reverse the sorting.

This can be achieved with the mouse as well: move the pointer to the
relevant column heading and use left click (well, `<mouse-1>` to be
precise) to select and then reverse the sorting.

Remember that the Standard themes provides a comprehensive mechanism
of named colours and semantic mappings, which can be overridden. Thus,
it is possible for one to define a spin-off of these themes by only
changing a few colour values. Refer to the manual for the details, or
contact me.
