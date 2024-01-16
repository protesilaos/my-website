---
title: "Emacs: customize fonts (generic method and 'fontaine' package)"
excerpt: "Video demonstration on how to configure fonts in Emacs using a generic method as well as my 'fontaine' package."
layout: vlog
mediaid: "qR8JRYr4BKE"
---

In this ~27-minute video, I show how to configure fonts in Emacs. I
explain what "faces" are and how the `default`, `fixed-pitch`, and
`variable-pitch` faces work. I demonstrate the built-in
`variable-pitch-mode` and then discuss how to change preset font
configurations with the help of the `fontaine` package (one of my
packages).

## Fontaine

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
+ Mailing list: <https://lists.sr.ht/~protesilaos/fontaine>
+ Backronym: Fonts, Ornaments, and Neat Typography Are Irrelevant in
  Non-graphical Emacs.

## Dotemacs

My personal Emacs configuration.  It is comprehensive, both in terms of
the [custom] code it contains as well as the documentation on what each
piece of functionality does.

+ Website: <https://protesilaos.com/emacs/dotemacs>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/dotfiles>
  + GitLab: <https://gitlab.com/protesilaos/dotfiles>
+ Mailing list: <https://lists.sr.ht/~protesilaos/dotfiles>
+ Video demo: <https://protesilaos.com/codelog/2023-12-18-emacs-org-advanced-literate-conf/>
+ Backronym: Do Observe, Transpose, Examine, or Mirror All
  Configurations, Stranger (dotemacs); Dotfiles Operate Transparently
  For the Included Linux and Emacs Setups (dotfiles).
