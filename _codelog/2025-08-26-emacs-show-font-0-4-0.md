---
title: "Emacs: show-font version 0.4.0"
excerpt: 'Information about the latest version of my show-font package for GNU Emacs.'
---

This package lets you preview a font inside of Emacs. It does so in
three ways:

- Prompt for a font on the system and display it in a buffer.
- List all known fonts in a buffer, with a short preview for each.
- Provide a major mode to preview a font whose file is among the
  installed ones.

Sources:

+ Package name (GNU ELPA): `show-font`
+ Official manual: <https://protesilaos.com/emacs/show-font>
+ Change log: <https://protesilaos.com/emacs/show-font-changelog>
+ Git repository: <https://github.com/protesilaos/show-font>
+ Sample pictures: <https://protesilaos.com/codelog/2024-09-10-emacs-show-font-0-1-0/>
+ Backronym: Should Highlight Only With the Family Of the Named Typeface.

Below are the release notes.

* * *

## Version 0.4.0 on 2025-08-26

This version expands the capabilities of the font preview mechanism to
handle emoji and icon fonts (i.e. those with codepoints in the Unicode
Private Use Area).

Both the `show-font-select-preview` and `show-font-tabulated` commands
now handle these types of font.

Previews for emoji or icon fonts are done using the string of
characters set to the variable `show-font-emoji-sample` or
`show-font-icon-sample`. These symbols are user options.
