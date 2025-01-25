---
title: "Emacs: show-font version 0.2.0"
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

## Version 0.2.0 on 2025-01-25

This version includes quality-of-life refinements.


### Show fonts in a tabulated listing

The command `show-font-tabulated` will produce a listing of font
families and their preview that uses the built-in tabulated interface.
This interface is the same as the one used by `M-x list-packages`.
Users can sort fonts by font family name (move point to the given
column and type `S` or call `M-x tabulated-list-sort`).

When `show-font-tabulated` is called with a prefix argument (`C-u` by
default), it prompts for a string or regular expression. It then shows
only the font families matching the given input.


### Limit font listing using a regular expression

The command `show-font-list` which we already had in version 0.1.0 is
like the `show-font-tabulated`, but uses a bespoke buffer where each
font and its preview are shown one after the other. Now it also
accepts an optional prefix argument to limit the list to only the
matching fonts.


### The `show-font-display-buffer-action-alist` controls buffer placement

The preview buffers we use will now conform with the value of the new
user option `show-font-display-buffer-action-alist`. This is a more
advanced feature, due to how `display-buffer` works, so you may want
to check the video I did recently about controlling where buffers are
displayed: <https://protesilaos.com/codelog/2024-02-08-emacs-window-rules-display-buffer-alist/>.

The default value of `show-font-display-buffer-action-alist` will show
the buffer at the bottom of the frame.
