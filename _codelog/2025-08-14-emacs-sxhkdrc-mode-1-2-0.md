---
title: 'Emacs: sxhkdrc-mode version 1.2.0'
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

## 1.2.0 on 2025-08-14

The package is stable and gets the job done. This version introduces a
small new feature to restart the daemon from inside Emacs. Thanks to
Jonathan Neidel for making the suggestion in issue 1:
<https://github.com/protesilaos/sxhkdrc-mode/issues/1>.


### Reload the SXHKD daemon on demand

The command `sxhkdrc-mode-restart` sends a signal to the `sxhkd`
process which causes it to restart, thus reloading its configuration
file. Use this after modifying the `sxhkdrc` to make the new changes
available.


### Automatically reload the daemon on file save

The function `sxhkdrc-mode-auto-restart` can be assigned to the
`sxhkdrc-mode-hook` to automatically reload the daemon after the
`sxhkdrc` file is saved (well, technically, after the file which is
using the `sxhkdrc-mode` is saved).


### Sample configuration with `use-package`

The project's `README.md` includes this sample configuration:

```elisp
(use-package sxhkdrc-mode
  :ensure t
  :mode "sxhkdrc.*" ; if you want more than just "sxhkdrc"
  :commands (sxhkdrc-mode-restart)
  :hook (sxhkdrc-mode . sxhkdrc-mode-auto-restart))
```
