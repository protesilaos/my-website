---
title: 'About recentf and virtual buffers in Emacs'
excerpt: 'The built-in "recentf" offers quick access to the most recent files. It also interfaces with Ido mode via the [virtual] buffer list.'
layout: vlog
mediaid: 'Nq5r_E_Cx08'
---

In this screen cast I demonstrate the main uses of `recentf`.  This is a
package that is built into Emacs.  It stores a list of the most
recently-visited files, allowing us to access them directly even if they
are no longer stored in a buffer.

`recentf` can interface with `ido-mode` to either improve the selection
of items from the list or to treat them as "virtual buffers".  The
latter means that recent files are available through the standard
buffer-switching command (by default bound to `C-x b`).  They are
treated as if they were actual buffers.  Super convenient!

And this is a link to my configuration file, with all the settings I
showed in the video as well as everything else from previous screen
casts: [protesilaos.com/emacs/dotemacs](https://protesilaos.com/emacs/dotemacs).
