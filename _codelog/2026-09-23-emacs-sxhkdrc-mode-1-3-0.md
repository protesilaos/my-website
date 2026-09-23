---
title: 'Emacs: sxhkdrc-mode version 1.3.0'
excerpt: 'Information about the latest version of my Emacs major mode for editing the Simple X Hot Key Daemon files.'
---

This is a major mode for editing `sxhkdrc` files. SXHKD is the Simple
X Hot Key Daemon which is commonly used in minimalist desktop sessions
on Xorg (I use it with bspwm, herbstluftwm, and i3wm). The `sxhkdrc`
file configures key chords, binding them to commands. For the
technicalities, read the man page `sxhkd(1)`.

+ Package name (GNU ELPA): `sxhkdrc-mode`
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/sxhkdrc-mode>
  + GitLab: <https://gitlab.com/protesilaos/sxhkdrc-mode>
+ Backronym: Such Xenotropic Hot Keys Demonstrate Robustness and
  Configurability ... mode.

* * *


## 1.3.0 on 2026-09-23

This version makes quality-of-life refinements to an already stable package.


### Fontification of key chord chains

Key chord chains are written with the semicolon (`;`) or colon (`:`)
characters. The former refers to one-shot operations while the latter
is for continuous ones that exit only with `Escape`.

The corresponding faces are `sxhkdrc-mode-chain-one-off-separator` and
`sxhkdrc-mode-chain-continuous-separator`.


### Support for all command prefixes

The previous version only covered the `;` in front of a command. The
prefixes `@` and `~` are now covered as well. They are all using teh
face `sxhkdrc-mode-command-prefix`, which supersedes the deprecated
`sxhkdrc-mode-command-async`.


### Continuation lines in commands are highlighted as well

This concerns the backslash character (`\`) at the end of a line. The
applicable face is `sxhkdrc-mode-continuation-line`.


### All modifiers are covered

The updated manpage of SXHKD, `sxhkd(1)`, mentions all the modifiers
that it supports. I have extended support for all of them in the order
they appear in the manual.
