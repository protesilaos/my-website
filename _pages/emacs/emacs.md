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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/modus-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/modus-themes>
    + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/modus-themes>

## Minibuffer and Completions in Tandem (mct.el)

Enhancements for the default minibuffer completion UI of Emacs.  In
essence, MCT is (i) a very thin layer of interactivity on top of the
out-of-the-box completion experience, and (ii) glue code that combines
built-in functionalities to make the default completion framework work
like that of more featureful third-party options.

Requires Emacs version 27 or higher.

+ Package name (GNU ELPA): `mct`
+ Official manual: <https://protesilaos.com/emacs/mct>
+ Change log: <https://protesilaos.com/emacs/mct-changelog>
+ Git repo: <https://gitlab.com/protesilaos/mct>

## Logos

This package provides a simple approach to setting up a "focus mode".
It uses the `page-delimiter` or the outline together with some commands
to move between pages whether narrowing is in effect or not.  It also
provides some optional aesthetic tweaks which come into effect when the
buffer-local `logos-focus-mode` is enabled.  The manual shows how to
extend the code to achieve the desired result.

+ Package name (GNU ELPA): `logos`
+ Official manual: <https://protesilaos.com/emacs/logos>
+ Change log: <https://protesilaos.com/emacs/logos-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/logos>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/logos>
    + GitLab: <https://gitlab.com/protesilaos/logos>
+ Mailing list: <https://lists.sr.ht/~protesilaos/logos>

## Pulsar

This is a small package that temporarily highlights the current line
after a given function is invoked.  The affected functions are defined
in the user option `pulsar-pulse-functions`.  What Pulsar does is set up
an advice so that those functions run a hook after they are called.  The
pulse effect is added there (`pulsar-after-function-hook`).

+ Package name (GNU ELPA): `pulsar`
+ Official manual: <https://protesilaos.com/emacs/pulsar>
+ Change log: <https://protesilaos.com/emacs/pulsar-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/pulsar>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/pulsar>
    + GitLab: <https://gitlab.com/protesilaos/pulsar>
+ Mailing list: <https://lists.sr.ht/~protesilaos/pulsar>

## Lin

Lin is a stylistic enhancement for Emacs' built-in `hl-line-mode`.  It
remaps the `hl-line` face (or equivalent) buffer-locally to a style that
is optimal for major modes where line selection is the primary mode of
interaction.

The idea is that `hl-line-mode` cannot work equally well for contexts
with competing priorities: (i) line selection, or (ii) simple line
highlight.  In the former case, the current line needs to be made
prominent because it carries a specific meaning of some significance in
the given context: the user has to select a line.  Whereas in the latter
case, the primary mode of interaction does not revolve around the line
highlight itself: it may be because the focus is on editing text or
reading through the buffer's contents, so the current line highlight is
more of a reminder of the point's location on the vertical axis.

+ Package name (GNU ELPA): `lin`
+ Official manual: <https://protesilaos.com/emacs/lin>
+ Change log: <https://protesilaos.com/emacs/lin-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/lin>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/lin>
    + GitLab: <https://gitlab.com/protesilaos/lin>
+ Mailing list: <https://lists.sr.ht/~protesilaos/lin>

## TMR Must Recur (tmr.el)

A simple timer package for Emacs.

+ Official manual: <https://protesilaos.com/emacs/tmr>
+ Git repo: <https://gitlab.com/protesilaos/tmr>

* * *

For more on my Emacs-related contributions, check my [coding
blog](https://protesilaos.com/codelog) which includes lots of videos and
written publications on the topic.
