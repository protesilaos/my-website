---
title: 'Emacs: modus-themes version 4.6.0'
excerpt: 'Information about the latest version of my highly accessible themes for GNU Emacs.'
---

I just published the latest stable release of [the Modus
themes](https://protesilaos.com/emacs/modus-themes).  The change log
entry is reproduced further below.  For any questions, feel welcome to
[contact me](https://protesilaos.com/contact/).

I will soon install the changes in emacs.git so please wait a little
longer for the updates to trickle down to you.

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


## 4.6.0 on 2024-10-27

This is a small release that makes minor refinements to an already
stable base.


### Command to rotate between selected Modus themes

The command `modus-themes-rotate` switches from one theme to the next
in the list defined in the user option `modus-themes-to-rotate`. The
default value of the user option covers all the Modus themes, though
users may prefer to set it to a small subset thereof.

Rotation works in such a way that (i) if the theme-to-be-loaded is
already the current one, the next in line is loaded instead, and (ii)
the next candidate is always to the right of the currently loaded
theme.

The rotation is done from left to right. When at the end of the list,
"right" points to the beginning.

The command `modus-themes-rotate` complements the existing commands
`modus-themes-toggle` (which reads the user option `modus-themes-to-toggle`
to switch between two themes) and `modus-themes-select` to select one
among all the Modus themes using minibuffer completion.


### More accurate faces for Org agenda dates

We now adopt a more semantically consistent approach to the use of
font weights and colour intensity when styling all the permutations of
scheduled date and deadline faces. Pressing tasks stand out more,
while those that do not require immediate attention are rendered in a
more subtle style.

Thanks to Adam Porter (aka GitHub alphapapa) for suggesting this
revision and discussing the technicalities with me. This was done in
issue 102: <https://github.com/protesilaos/modus-themes/issues/102>.


### A slightly revised `red-cooler` palette entry

The value of this named colour now has a lower contribution from the
blue channel of light, meaning that it looks less pink and more rosy
red. The change is small, though it contributes to a more harmonious
distribution of colour in certain major modes that have preprocessor
constructs (e.g. for the C language).

`red-cooler` is also used in some contexts in Org and Org agenda
buffers.


### Completion popups are monospaced if `modus-themes-mixed-fonts` is non-nil

The user option `modus-themes-mixed-fonts` ensures that
spacing-sensitive constructs are always rendered in a monospaced font
(technically, they inherit the `fixed-pitch` face). This is especially
useful when enabling `variable-pitch-mode` in, say, an Org buffer that
has tables and code blocks.

The popup produced by the `corfu` and `company` packages will also be
rendered in a monospaced font if the necessary conditions are met,
ensuring proper alignment of all the elements.


### Directory icon colours are in line with each theme's palette

The directory icon presented by the `all-the-icons` and `nerd-icons`
packages is now rendered in the style of a semantic palette mapping
from the active theme, instead of using a hardcoded faint cyan colour.
This is to ensure that styles are consistent and that users with
deuteranopia or tritanopia get the desired colours while using the
relevant Modus themes.

For those who define palette overrides to refashion the themes, the
mapping is called `accent-0`: it is used in places where one or more
colours are needed for variation, such as what `orderless` does in the
minibuffer or `magit` in its status buffer.


### Refined support for `embark` and `forge` packages

We now cover more of their faces, have updated the relevant symbols of
those faces, and have made stylistic tweaks in the interest of
theme-wide consistency (i.e. the kind of quality you only appreciate
over time).


### Support for the built-in `hexl-mode`

It was using some background colour values that were somewhat hard to
read. Those are replaced with appropriate foreground colours.


### Documentation on how to support some packages

These are:

-   `combobulate`. Thanks to Damien Cassou in issue 108: <https://github.com/protesilaos/modus-themes/issues/108>.
-   `engrave-faces`.
-   `howm`. Thanks to Jabir Ali Ouassou for the discussion in issue 117: <https://github.com/protesilaos/modus-themes/issues/117>.
-   `meow`. Thanks to ZharMeny in issue 116: <https://github.com/protesilaos/modus-themes/issues/116>.

Those are not covered by the themes for a variety of reasons, but that
may change in the future.


### Updated a colour value about the `solaire` package

This is another package whose support we only document. The manual was
referring to a colour that has long been removed from the themes.

Thanks to Edgar Vincent for bringing this matter to my attention. This
was done on the GitLab mirror, issue 316:
<https://gitlab.com/protesilaos/modus-themes/-/issues/316>.


### Removed some needless `:set` values from `defcustom` forms

We did this after reviewing the state of the code following a
discussion with shipmints and Adam Porter about the behaviour of the
`setopt` macro when setting user options from the Modus themes. There
should be no visible change for users, though the edit is still useful
for the maintainability of the code. This was done in issue 118:
<https://github.com/protesilaos/modus-themes/issues/118>.


### Switched to `if-let*` and its variants everywhere

Emacs 31 deprecates the forms of these macros that lack the asterisk.
We can comply right away since the functionality is the same.
