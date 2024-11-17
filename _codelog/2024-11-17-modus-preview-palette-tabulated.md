---
title: "Emacs: the Modus themes palette previews are tabulated"
excerpt: "I refactored the commands which preview a Modus theme palette. They are in a tabulated format now."
---

I just pushed a massive change to the Modus themes Git repository
which makes the "preview palette" commands use `tabulated-list-mode`.
This means that the output consists of actual rows and columns and,
more importantly, the user can sort by the given column (click on the
column name or do `M-x describe-mode` to learn about the relevant key
bindings).

As part of the redesign, I also included an indicator about which
entries in the palette constitute "semantic colour mappings", as
opposed to "named colours". Named colours are those which correspond
to a hexadecimal RGB value, like `(blue-warmer "#3548cf")`, while the
mappings will point to such named colours like `(fg-link blue-warmer)`.

But enough of this! Here is a picture showing two buffers. In the left
window we have the output of `M-x modus-themes-list-colors`. In the
right window it is the same command with a `C-u` prefix argument to
show only the semantic color mappings. Notice that the buffers are
named after the theme they are previewing and the scope of the
preview.

<a href="{{'/assets/images/attachments/2024-11-17-modus-themes-preview-palette.png' | absolute_url }}"><img alt="Modus themes palette preview in a tabulated list" src="{{'/assets/images/attachments/2024-11-17-modus-themes-preview-palette.png' | absolute_url }}"/></a>

The command `modus-themes-list-colors` prompts for a Modus theme to
preview. Whereas `modus-themes-list-colors-current` acts directly
using the current Modus theme.

Use these to design your own palette overrides (check the manual for
details) or simply to copy the colour values you are interested in.

## Sources

+ Package name (GNU ELPA): `modus-themes`
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/modus-themes>
  + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes.
