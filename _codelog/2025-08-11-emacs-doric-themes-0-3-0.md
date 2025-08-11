---
title: "Emacs: doric-themes version 0.3.0"
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

## The new `oak` and `pine` themes

These explore the woody+earthly style:

- `doric-oak` has dark text against an ochre background, with accents
  of green.

- `doric-pine` uses light text against a dark green background, with
  accents of brown.

## Background colours for diffs

All diff-related interfaces, including Magit, diff-mode, and Ediff,
now use colour-coded background values where appropriate. This is done
to improve usability, as it otherwise can be hard to discern the
boundaries of individual diff hunks.

## Alternating foreground values for message/email quotes

In `message-mode`, Gnus, and related interfaces all quoted/cited
message level now conforming with an odd VS even colouring scheme. The
style is still subtle, but now the individual levels of depths are
easier to spot.
