---
title: "Emacs: beframe version 1.5.0"
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

## Version 1.5.0 on 2026-02-04

This version fixes two bugs and makes other minor tweaks.

The first bug pertains to the performance of the command
`beframe-switch-buffer` or the command `switch-to-buffer` when
`beframe-mode` is enabled: they were really slow when the list of
buffers was long. Now they are always fast. Thanks to Alexandre
Rousseau for reporting the problem in issue 17:
<https://github.com/protesilaos/beframe/issues/17>.

The second bug is more subtle. It is about persisting the completion
metadata `category` value in all prompts that read a buffer, when
`beframe-mode` is enabled. This change means that users who configure
the user option `completion-category-overrides` will not get the
expected results in buffer prompts affected by Beframe.

Thanks to Stefan Monnier for commenting on the initial implementation,
specifically telling me that `let` binding the metadata can affect
nested minibuffers, which we do not want. This was done on the
emacs-devel mailing list: <https://lists.gnu.org/archive/html/emacs-devel/2025-12/msg00264.html>.

