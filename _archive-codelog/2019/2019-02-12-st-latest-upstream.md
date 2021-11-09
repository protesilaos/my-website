---
title: 'Updating my ST to 0.8.2'
subtitle: 'No more upstream patches in my fork'
excerpt: 'Documenting the reasoning and steps I followed to prepare my soft fork of ST: the Simple Terminal by the Suckless community.'
---

The Suckless community recently announced the release of
[st-0.8.2](https://st.suckless.org/).  Seeing as I maintain [a soft
fork](https://gitlab.com/protesilaos/st), it was time to refactor my
repo.  I took this opportunity to also review my build, which led me to
the realisation that I need no added features whatsoever.  The generic
terminal emulator is good enough.

## What my fork is about

In terms of functionality, I build `st` in the user's home directory.
This is how I have designed my custom desktop session (distributed via
[my dotfiles](https://gitlab.com/protesilaos/dotfiles)): there is
`$HOME/bin` which is added to `$PATH`.

As for aesthetics:

* I have modified the font definition to leverage my `fonts.conf`
  settings in order to use my custom typefaces (see my dotfiles).
* All options related to colours are sourced from another file via an
  `#include` directive.  This allows me to (i) add my [Tempus
  themes](https://protesilaos.com/tempus-themes/) and (ii) control ST's appearance through
  scripts that are part of my custom desktop session (where I perform
  live theme switches across the entire environment).

Here are a couple of video demonstrations:

* Basics of [my BSPWM session](https://protesilaos.com/codelog/2018-12-27-bspwm-demo-video/).
* Using [ST and TMUX with BSPWM](https://protesilaos.com/codelog/2019-01-13-tmux-demo-bspwm/).

## How I prepared my fork

Downloaded the latest release tarball and extracted it in place:

	tar xf st-0.8.2.tar.gz

I made two copies of the decompressed directory.  The one served as
a reference point, while the other was used to apply my modifications.

Once I was done altering the source code, I did:

	diff -up ~/st-0.8.2-upstream ~/st-0.8.2-prot-soft-fork/ > \
	st-protesilaos-stavrou-soft-fork-0.8.2.diff

The generated `.diff` could then be applied to the upstream code base
with the following:

	patch path/to/st-protesilaos-stavrou-soft-fork-0.8.2.diff

## Review and refactor

After applying my changes, I decided to review my use of upstream
patches, such as the one offering clipboard support, or the other that
improves the appearance of box-drawing characters.

All of them have been removed from my fork in the interest of long-term
maintainability.  It is difficult to guarantee that such features will
work with new upstream releases.  Plus their functionality is
inessential to my workflow… Learn to work with less!

To use [my] `st-0.8.2` on Debian Buster we need:

	sudo apt install libx11-dev libxft-dev libxext-dev libfreetype6-dev pkgconf

Simplifying things makes my life easier.  It is now trivial to maintain my
fork, which is an integral part of my custom desktop session.
