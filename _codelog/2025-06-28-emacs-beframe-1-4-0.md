---
title: "Emacs: beframe version 1.4.0"
excerpt: 'Information about the latest version of my beframe package for GNU Emacs.'
---

`beframe` enables a frame-oriented Emacs workflow where each frame has
access only to the list of buffers visited therein. In the interest of
brevity, we call buffers that belong to frames "beframed".

+ Package name (GNU ELPA): `beframe`
+ Official manual: <https://protesilaos.com/emacs/beframe>
+ Change log: <https://protesilaos.com/emacs/beframe-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/beframe>
  + GitLab: <https://gitlab.com/protesilaos/beframe>
+ Video demo: <https://protesilaos.com/codelog/2023-02-28-emacs-beframe-demo/>
+ Backronym: Buffers Encapsulated in Frames Realise Advanced
  Management of Emacs.

Below are the release notes

* * *


## Version 1.4.0 on 2025-06-28

This version adds some minor improvements to a stable package.


### Per-frame Xref histories

The built-in Xref mechanism is typically used to navigate to the
definition of the symbol at point in a programming major mode. The
command `xref-find-definitions` (`M-.` by default) jumps to the
source, while `xref-go-back` (`M-,` by default) goes back in the
history of visited positions until it reaches the starting point.

When `beframe-mode` is enabled, each new frame has its own Xref
history. This means that finding a definition in one frame does not
interfere with the Xref history of another frame.


### "Beframed" buffer prompt text is now optional

When `beframe-mode` is enabled, it sets the standard
`read-buffer-function` to one that filters buffers by frame. Any
command that uses that, such as `switch-to-buffer` (`C-x b` by
default) is thus beframing its completion candidates.

Such prompts get a prefix to inform the user of their behaviour. By
default this is `[Beframed]`: it is subject to the user option `beframe-prompt-prefix`.
Users who do not wish to have any prefix can set this option to nil or
an empty string.

When there is a string, it is styled with the face `beframe-face-prompt-prefix`.
