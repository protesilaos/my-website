---
title: "Emacs: doric-themes version 1.4.0"
excerpt: "Minimalist themes for GNU Emacs to complement my ef-themes (maximalist) and modus-themes (moderate)."
---

These are my minimalist themes. They use few colours and will appear
mostly monochromatic in many contexts. Styles involve the careful use
of typography, such as italics and bold italics.

If you want maximalist themes in terms of colour, check my `ef-themes`
package. For something in-between, which I consider the best "default
theme" for a text editor, opt for my `modus-themes`.

+ Package name (GNU ELPA): `doric-themes`
+ Sample pictures: <https://protesilaos.com/emacs/doric-themes-pictures>
+ Git repository: <https://github.com/protesilaos/doric-themes>
+ Backronym: Doric Only Really Intensifies Conservatively ... themes.

Below are the release notes.

* * *

## Update to doric-themes version 1.4.0

### The new `doric-meadow` and `doric-mountain` themes

`doric-meadow` is a light theme with yellow and green colours, while
`doric-mountain` has a similar albeit dark palette. They expand the
collection of the Doric themes to cover even more styles and
preferences.

### Diff colours are refined

I improved the inter-theme consistency of all colours that apply to
diffs, such as those shown in `diff-mode`, `ediff`, and `magit` buffers.

Before, some themes were needlessly more subtle than others while
certain colours could be hard to discern in some situations. For
example, if the `diff-hl` package was in use and the fringe was set to
a thin line.

Other packages also benefit from this review, such as my `pulsar` and
`lin`.

### Matching parentheses are distinct from the active region

The highlight of matching parentheses produced by `show-paren-mode` is
now distinct from the active region. The same is true for the current
line, per `hl-line-mode`.

### The `doric-themes-define-theme` should not fail in certain cases

I fixed an issue that was reported to me by Amin Bandali where the
`doric-themes-define-theme` was failing to instantiate a theme in the
macroexpanded code.

### The `bg-accent` and `fg-accent` palette entries are renamed

This is relevant for those who rely on `doric-themes-with-colors`. The
new names are `bg-accent-primary` and `fg-accent-primary`. The old
ones will not longer work.
