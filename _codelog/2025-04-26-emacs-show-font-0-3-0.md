---
title: "Emacs: show-font version 0.3.0"
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


## Version 0.3.0 on 2025-04-26

This version adds some refinements to an already stable package.


### The command `show-font-list` is an alias for `show-font-tabulated`

The `show-font-list` command was using a custom buffer that listed
font families and their corresponding short preview. It did not have
any other feature.

I made changes under the hood to rely on the built-in
`tabulated-list-mode` which is a standard and gives us the option to
sort by column. The `show-font-list` is thus an alias for the new
command `show-font-tabulated`. Right now the sorting facility only
applies to reversing the name-based order. In the future we may have
more columns, such as if we describe a font as &ldquo;Latin&rdquo;, &ldquo;Greek&rdquo;, etc.


### The tabulated list marks fonts that cannot be previewed

In the past, the font listing would include families that could not
display the `show-font-pangram` or, indeed, any Latin character. Those
would be rendered as empty boxes.

I have now introduced a simple heuristic to test that the given family
supports Latin characters. If it does not, then (i) it is highlighted
with a different colour, (ii) it shows &ldquo;No preview&rdquo; instead of the
pangram, and (iii) it displays the information in the Emacs default
font family. Some families do not play nice with this approach though,
as they pass the test but still do not display any Latin characters.
This happens with icon fonts.

The long-term goal is to support different scripts and show the
appropriate text for each of them.


### The `show-font-sentences-sample` adds more to the `show-font-select-preview`

The new user option `show-font-sentences-sample` is a list of strings
that can be used to exhibit common patterns and letter combinations.
The default value is carefully designed to show if a font family is
stylistically consistent, such as with how it draws `i`, `l`, `t`, or
`h`, `n`, `m`, and so on. Plus, it teaches you some obscure words like
&ldquo;scholarch&rdquo;, &ldquo;antipode&rdquo;, and &ldquo;heteroclite&rdquo;: use them with your Greek
friends&#x2014;and if they do not know those words, then they must buy you
a café frappé!


### Miscellaneous

-   The face `show-font-title-small` is an obsolete alias for the more
    appropriately named `show-font-title-in-listing`.
-   The prompt used by the command `show-font-select-preview` now
    correctly uses its own history and default value.
-   The default value of the user option `show-font-character-sample`
    includes some more patterns to better test the adequacy of a font
    family. This sample is displayed in the buffer produced by the
    command `show-font-select-preview`.
