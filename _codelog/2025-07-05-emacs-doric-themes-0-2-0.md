---
title: "Emacs: doric-themes version 0.2.0"
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

## Version 0.2.0 on 2025-07-05

This version introduces several refinements to the individual themes
comprising the Doric themes collection. Changes pertain to the
intensity of colours in use. While each tweak is small, their
cumulative effect contributes to a more consistent design.

Users who are interested in the contrast ratio values and relevant
colour distance can refer to the `contrasts.org` file that is part of
the project's Git repository: <https://github.com/protesilaos/doric-themes>.

I extended support for several faces or face groups including:

- `ace-window`
- `dictionary`
- `embark-keybinding`
- `man`
- `markdown-metadata-key-face`
- `package-mark-delete-line`
- `package-mark-install-line`
- `read-multiple-choice-face`
- `rcirc`
- `spacious-padding`
- `textsec-suspicious`
- `which-key-key-face`
- `woman`

Some other faces that were already covered are revised in the interest
of theme-wide consistency. Again, changes are subtle.

The colour of the directory icons in `all-the-icons` and `nerd-icons`
packages is toned down a little bit to avoid exaggerations.

Several spacing-sensitive faces, like Org tables and code blocks,
unconditionally inherit the `fixed-pitch` face. This means that, in
principle, they are rendered in a monospaced font even when the user
activates `variable-pitch-mode` or sets the `default` face to a
proportionately spaced typeface. Users who need to specify the
applicable font family can either use the following, mutatis mutandis,
or take a look at my `fontaine` package:

```elisp
(set-face-attribute 'default nil :family "Aporetic Sans Mono" :height 160)
(set-face-attribute 'variable-pitch nil :family "Aporetic Sans" :height 1.0)
(set-face-attribute 'fixed-pitch nil :family "Aporetic Sans Mono" :height 1.0)
```

Other theme packages of mine have an option for "mixed fonts" (like
`modus-themes-mixed-fonts`), but I think I will not be providing
options for the Doric themes. At least not for the time being while I
explore the design space for minimalist themes.
