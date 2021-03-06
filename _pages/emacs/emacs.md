---
title: 'My packages and/or custom code for GNU Emacs'
excerpt: 'List of all my packages and/or custom code for GNU Emacs'
permalink: /emacs/
---

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

+ Package name (GNU ELPA): `modus-themes` (also built into Emacs >= 28)
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/modus-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/modus-themes>
    + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/modus-themes>

## Denote

Denote is a simple note-taking tool.  It is based on the idea that notes
should follow a predictable and descriptive file-naming scheme.  The
file name must offer a clear indication of what the note is about,
without reference to any other metadata.  Denote basically streamlines
the creation of such files while providing facilities to link between
them.

[Watch the video demo that was produced before version 0.1.0 of the
package](https://protesilaos.com/codelog/2022-06-18-denote-demo/).

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/denote>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/denote>
    + GitLab: <https://gitlab.com/protesilaos/denote>
+ Mailing list: <https://lists.sr.ht/~protesilaos/denote>

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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/fontaine>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/fontaine>
    + GitLab: <https://gitlab.com/protesilaos/fontaine>
+ Mailing list: <https://lists.sr.ht/~protesilaos/fontaine>

## TMR May Ring (tmr)

TMR is an Emacs package that provides facilities for setting timers
using a convenient notation.  Lots of commands are available to operate
on timers, while there also exists a tabulated view to display all
timers in a nice grid.

+ Package name (GNU ELPA): `tmr`
+ Official manual: <https://protesilaos.com/emacs/tmr>
+ Change log: <https://protesilaos.com/emacs/tmr-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/tmr>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/tmr>
    + GitLab: <https://gitlab.com/protesilaos/tmr>
+ Mailing list: <https://lists.sr.ht/~protesilaos/tmr>

## Cursory

Cursory provides a thin wrapper around built-in variables that affect
the style of the Emacs cursor.  The intent is to allow the user to
define preset configurations such as "block with slow blinking" or "bar
with fast blinking" and set them on demand.

+ Package name (GNU ELPA): `cursory`
+ Official manual: <https://protesilaos.com/emacs/cursory>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/cursory>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/cursory>
    + GitLab: <https://gitlab.com/protesilaos/cursory>
+ Mailing list: <https://lists.sr.ht/~protesilaos/cursory>

## The official Emacs TUTORIAL in Greek

I am the author and maintainer of the `TUTORIAL.el_GR` file that is part
of Emacs 29 (current development target) since 2022-05-08.  You can find
it in the Emacs source code inside the `etc/tutorials/` directory.  If
you report a bug about it with `M-x report-emacs-bug`, consider adding
me in carbon copy (Cc).  The `etc/tutorials/TUTORIAL.translators` file
mentions the email address you should use.

## Dotemacs

My personal Emacs configuration.  It is comprehensive, both in terms of
the [custom] code it contains as well as the documentation on what each
piece of functionality does.

+ Website: <https://protesilaos.com/emacs/dotemacs>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/dotfiles>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/dotfiles>
    + GitLab: <https://gitlab.com/protesilaos/dotfiles>
+ Mailing list: <https://lists.sr.ht/~protesilaos/dotfiles>

## Iosevka Comfy

This is not an "Emacs package" per se though I use it full time in my
Emacs setup (it complements my work on the `modus-themes` and
`fontaine`).

_Iosevka Comfy_ is a build of the Iosevka typeface with a rounded style
and open shapes, adjusted metrics, and overrides for almost all
individual glyphs in both roman (upright) and italic (slanted) variants.
It is more vertically compact than the standard upstream configuration.
Glyphs are rounder and have tailed ends or serifs only when those are
required to both impose a predictable rhythm and keep characters
distinct from each other.

The README file in the git repository covers all the technicalities.

+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/iosevka-comfy>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/iosevka-comfy>
    + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>

## Minibuffer and Completions in Tandem (mct.el)

**UPDATE 2022-04-14:** Development of this package has been discontinued:
<https://protesilaos.com/codelog/2022-04-14-emacs-discontinue-mct/>.

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

* * *

For more on my Emacs-related contributions, check my [coding
blog](https://protesilaos.com/codelog) which includes lots of videos and
written publications on the topic.
