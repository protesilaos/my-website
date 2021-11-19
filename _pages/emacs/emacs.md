---
title: 'My packages and/or custom code for GNU Emacs'
excerpt: 'List of all my packages and/or custom code for GNU Emacs'
permalink: /emacs/
---

## Dotemacs

My personal Emacs configuration.  It is comprehensive, both in terms of
the [custom] code it contains as well as the documentation on what each
piece of functionality does.

+ Website: <https://protesilaos.com/emacs/dotemacs>
+ Git repo: <https://gitlab.com/protesilaos/dotfiles>

## Modus themes

Highly accessible themes, conforming with the highest standard for
colour contrast between background and foreground values (WCAG AAA).
They also are optimised for users with red-green colour deficiency.

The themes are very customisable and provide support for a very wide
range of packages.  Their manual is detailed so that new users can get
started, while it also provides custom code for all sorts of more
advanced customisations.

Since August 2020, the Modus themes (`modus-operandi`, `modus-vivendi`)
are built into Emacs version 28 or higher.

+ Package name (GNU ELPA): `modus-themes`
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repo: <https://gitlab.com/protesilaos/modus-themes>

## Minibuffer and Completions in Tandem (mct.el)

Enhancements for the default minibuffer completion UI of Emacs.  In
essence, MCT is glue code that combines built-in functionalities to make
the default completion framework work like that of more featureful
third-party options.

Requires Emacs version 27 or higher.

+ Package name (GNU ELPA): `mct`
+ Official manual: <https://protesilaos.com/emacs/mct>
+ Change log: <https://protesilaos.com/emacs/mct-changelog>
+ Git repo: <https://gitlab.com/protesilaos/mct>

## LIN Is Noticeable

LIN locally remaps the `hl-line` face to a style that is optimal for
major modes where line selection is the primary mode of interaction.

The idea is that `hl-line` cannot work equally well for contexts with
competing priorities: (i) line selection, or (ii) simple line highlight.
In the former case, the current line needs to be made prominent because
it carries a specific meaning of some significance in the given context.
Whereas in the latter case, the primary mode of interaction does not
revolve around the line highlight itself: it may be because the focus is
on editing text or reading through the buffer's contents, so the current
line highlight is more of a gentle reminder of the point's location on
the vertical axis.

+ Official manual: <https://protesilaos.com/emacs/lin>
+ Git repo: <https://gitlab.com/protesilaos/lin>

## TMR Must Recur (tmr.el)

A simple timer package for Emacs.

+ Official manual: <https://protesilaos.com/emacs/tmr>
+ Git repo: <https://gitlab.com/protesilaos/tmr>

* * *

For more on my Emacs-related contributions, check my [coding
blog](https://protesilaos.com/codelog) which includes lots of videos and
written publications on the topic.
