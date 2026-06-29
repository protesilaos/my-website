---
title: 'Emacs: fontaine version 3.1.0'
excerpt: 'Information about the latest version of my fontaine package for GNU Emacs.'
---

Fontaine allows the user to define detailed font configurations and set
them on demand.  For example, one can have a `regular-editing` preset
and another for `presentation-mode` (these are arbitrary, user-defined
symbols): the former uses small fonts which are optimised for writing,
while the latter applies typefaces that are pleasant to read at
comfortable point sizes.

+ Package name (GNU ELPA): `fontaine`
+ Official manual: <https://protesilaos.com/emacs/fontaine>
+ Change log: <https://protesilaos.com/emacs/fontaine-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/fontaine>
  + GitLab: <https://gitlab.com/protesilaos/fontaine>
+ Backronym: Fonts, Ornaments, and Neat Typography Are Irrelevant in Non-graphical Emacs.

Below are the release notes.

* * *

## Version 3.1.0 on 2026-06-29

This is a small release that includes internal refinements as well as
two user-facing changes:

1.  The user option `fontaine-presets` accepts an optional
    `:line-spacing` entry, which corresponds to the `line-spacing`
    variable. As of Emacs version 31, `line-spacing` can be bound to a
    cons cell to set the space above and below. Fontaine now handles
    this as intended.

2.  By default, changing the font size has the effect of resizing the
    frame. This is because of the original value of the variable
    `frame-inhibit-implied-resize`. Fontaine is now designed to always
    inhibit frame resizing, regardless of `frame-inhibit-implied-resize`.
