---
title: 'Introducing the Modus themes exporter (Emacs library)'
excerpt: 'Description of the initial publication of the "modus-themes-exporter.el".'
---

I just published the initial version of the `modus-themes-exporter.el`
as part of [my dotfiles' Emacs setup](https://gitlab.com/protesilaos/dotfiles).

The library consists of a set of functions that help produce a port of
the active Modus theme (`modus-operandi` or `modus-vivendi`) for a
variety of external applications.  Currently covered entries are XTerm,
URxvt (rxvt-unicode), Xfce terminal (xfce4-terminal), and Vim (gui and
term, as well as NeoVim).

The exporting is performed by the `modus-themes-exporter-export`
command.  Its doc string reads thus:

```
Export current Modus theme using TEMPLATE.

When called interactively, TEMPLATE is chosen from a list of candidates
using completion.  Else it must be a string that corresponds to the car
of a cons cell in `modus-themes-exporter-templates-alist'.

The output is stored in the kill ring.

When called from Lisp with optional FILE as a path to a regular file,
write there directly.  When called interactively with the universal
prefix argument (\\[universal-argument]), prompt for FILE instead:
supplying a non-existent path will create that file outright.  Once the
output has been written to the file, prompt to visit it.

With optional NO-VISIT, either as a non-nil symbol in Lisp or a
double prefix argument interactively, do not prompt to visit the
file.
```

Here is a side-by-side presentation of Emacs (left) and Xfce's terminal
with Vim running inside of it (right).  Click to enlarge.

<a href="{{ '/assets/images/attachments/2021-02-22-modus-themes-exporter-light.png' | absolute_url }}"><img alt="Modus themes exporter light" src="{{ '/assets/images/attachments/2021-02-22-modus-themes-exporter-light.png' | absolute_url }}"/></a>

<a href="{{ '/assets/images/attachments/2021-02-22-modus-themes-exporter-dark.png' | absolute_url }}"><img alt="Modus themes exporter dark" src="{{ '/assets/images/attachments/2021-02-22-modus-themes-exporter-dark.png' | absolute_url }}"/></a>

## What is this all about?

Before we start... No, I do not intend to switch back to Vim: I plan to
remain a full time Emacs user for years to come.

The `modus-themes-exporter.el` allows me to satisfy the demand for
porting my Modus themes to other applications.  I have done so several
times in private, where I would supply an Xresources file or whatnot to
the person emailing me.  I have also offered my consent to those who
asked whether they could create ports for VSCode---none of those
endeavours has yielded any results as far as I know.

Demand for ports has also been expressed publicly on the issue tracker
of the Modus themes' repo ([issue
116](https://gitlab.com/protesilaos/modus-themes/-/issues/116)) as well
as my dotfiles ([issue
31](https://gitlab.com/protesilaos/dotfiles/-/issues/31)).  Furthermore,
Simon Pugnet wrote the
[modus-exporter](https://github.com/polaris64/modus-exporter) a while
ago which, however, is targeted at older versions of the themes prior to
their major refactoring in version `1.0.0`.

I must stress that insofar as external text editors are concerned **the
output of this library does not constitute a fully fledged theme**.
Creating an original piece, especially one with the technical
requirements for uncompromising legibility that the Modus themes stand
for, requires a lot of work and painstaking attention to detail (I have
been doing so for ~1.5 years now, ever since day one of switching to
Emacs).  No automated process invented thus far can replace the
context-specific aesthetic judgement of the designer.  Still, a
templating system can help _approximate_ what has already been achieved,
while acknowledging the constraints imposed by the incompatibilities
between the various applications and Emacs (e.g. how they highlight
code, as illustrated in the screenshots above).

With those granted, the ports cover a subset of the palette used in each
of the Modus themes which means, ipso facto, that they make compromises
in the interest of maintainability.  Similarly, there is no plan
whatsoever to replicate the customisation options that the real themes
for Emacs have, as well as implement anew their advanced,
"do-it-yourself" features (consult [the Modus themes'
manual](https://protesilaos.com/emacs/modus-themes/), which, by the way, is
pushing towards 20k words).

## Experimental release

Please bear in mind that there is still a lot of work to be done before
this library reaches a certain standard of quality:

1. Refine the templating system.
2. Test automated processes for outputting ports in bulk.
3. Improve Vim's colour mapping so that it mimics that of Emacs, to the
   extent possible.
4. Write ports for the GTK Source view widget (Gedit, GNOME Builder,
   etc.).
5. Expand support for more terminal emulators, such as Kitty, Alacritty.
6. Convert colours from hexadecimal RGB notation to decimal, so that we
   can cover KDE's Konsole and, potentially, Kate, Kwrite, etc.

Patches and user feedback are most welcome!
