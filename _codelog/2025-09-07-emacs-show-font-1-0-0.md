---
title: "Emacs: show-font version 1.0.0"
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


## Version 1.0.0 on 2025-09-07

This major update introduces support for fonts that cover more than
the Latin script. It also expands the available functionality with
quality-of-life refinements.


### Support for Arabic, Chinese, Greek, Japanese, Korean, Russian

The commands `show-font-tabulated` (alias `show-font-list`) and
`show-font-select-preview` can now generate a preview for fonts that
are optimised to display the aforementioned languages. Each language
provides its own user option to control the sample text it displays.
The naming pattern `show-font-LANGUAGE-sample`.

Of those, I only know Greek and thus wrote the value of
`show-font-greek-sample`, namely: `"Πρωτεσίλαος ο φιλόσοφος του οποίου
τα έργα βρίθουν αστειισμών"`. For the others I used translation
software to get the equivalent of `"Protesilaos does not read
LANGUAGE"`. Please let me know if there are any mistakes in this
regard. I was thinking of writing something a bit more funny, but was
concerned the joke may not translate well.


### Checking for language support among known families

While I have written functions that test if a given font can display a
range of characters, this approach is computationally intensive if we
need to check for many code points across multiple fonts.

The alternative is to maintain lists of known font families that are
meant to work with the given language. Those generally support Latin
as well, but the idea is to let them shine in the language they are
meant to be used for.

For example, here is how we know that a font family is meant to
display Arabic script:

```elisp
(defconst show-font-arabic-families
  '("AlArabiya" "AlBattar" "AlHor" "AlManzomah" "AlYarmook"
    "Dimnah" "Hani" "Haramain" "Hor" "Kayrawan" "Khalid" "Mashq"
    "Nagham" "Noto Kufi Arabic" "Noto Naskh Arabic" "Noto Sans Arabic"
    "Rehan" "Sharjah" "Sindbad")
  "List of families that specialise in Arabic.
Also see `show-font-greek-families' for the rationale of grouping font
families in distinct variables.")
```

The list is not exhaustive and I am always eager to expand it. Just
let me know.

I learnt about these font families through trial and error by (i)
installing them on my Debian system and (ii) searching online for
common samples of them. Do `apt search -n fonts-` to check the
relevant packages.


### Support for music notation, mathematics, and other symbols

As with the natural languages, there are some fonts that specialise in
displaying symbols. For example, MathJax has a bunch of fonts for
showing those fancy formulas in the processed output of LaTeX
documents. Again, there is a `defconst` for each of those types of
font listing the known families. The concomitant user options are:

-   `show-font-mathematics-sample`
-   `show-font-music-sample`
-   `show-font-symbols-sample`


### Problematic fonts are hidden from the list view

The `show-font-hidden-families` lists the fonts that are not known to
cause problems. They do not render properly any of the supported
samples and I am not sure even when they claim to support a certain
set of characters (e.g. `show-font--displays-latin-p` returns
non-`nil`). If you think there is a mistake here, please contact me.


### Show a full preview from the list view

While in the buffer produced by `show-font-tabulated` (alias
`show-font-list`), type `RET` to get a complete preview of the font
family of the current line. This is the same as invoking the command
`show-font-select-preview` and then selecting the given family.

The command called by that key binding is `show-font-tabulated-select-preview`.
A hint of it is also shown in the tabulated list header.


### Quickly copy the name of the font in the list view

As above, type `w` in the tabulated view to copy the name of the font
family to the `kill-ring`. The command is `show-font-tabulated-copy-name`
and there is also a hint of it in the tabulated list header.
