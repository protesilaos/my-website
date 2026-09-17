---
title: "Emacs: beframe version 1.6.0"
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

## Version 1.6.0 on 2026-09-17

I rewrote large parts of `beframe.el` to make them more clear and/or
to align them with the Elisp style I have developed over time. Those
changes do not affect existing functionality.

That granted, I have made user-facing changes that refine this
otherwise stable package.


### `beframe-rename-frame` also renames the frame's scratch buffer

`beframe-mode` makes a scratch buffer for each new frame that is
created if the user option `beframe-create-frame-scratch-buffer` is
set to `t`. Those buffers are named like:

```
*scratch for frame 'beframe'*
```

The commands `beframe-rename-frame` and `beframe-rename-current-frame`
will now update the name of that buffer to reflect the new name of the frame.

Read the docstring of `beframe-rename-frame` for the technicalities.


### Commands to kill beframed buffers

The command `beframe-kill-frame-buffers` deletes all buffers that
belong to the given frame.

The command `beframe-kill-frame-buffers-matching-regexp` deletes all
of a frame's buffers that match the given regular expression.

Both commands are subject to the user option `beframe-kill-buffers-no-confirm`.
When it is set to `nil`, the above commands ask for confirmation while
also displaying a menu with the buffers to be deleted. When the user
option is set to `t`, they kill the buffers outright.

Note though that Emacs may still prompt on a case-by-case basis, such
as if the buffer is running a process.


### Reorganised the `beframe-transient`

With the optional `(require 'beframe-transient)` the command
`beframe-transient` becomes available. I have tweaked its layout to
have one group of commands below the other. This makes it easier to
read everything, regardless of font size. Plus, I do not need to make
the code any more complex.


### `beframe-mode` integrates with the `undelete-frame` command

The `undelete-frame` command restores a frame that was deleted. In the
past, this would not restore the frame's original beframed buffer
list. Now `beframe-mode` takes care to store the buffer list of each
frame in case `undelete-frame` is invoked.

Note that deleted buffers cannot be restored. This is merely a matter
of associating live buffers with a frame (thus "beframing" them again
exactly where they were).


### `beframe-read-buffer` no longer ignores the predicate function

This concerns cases where `read-buffer` is using a predicate function.
`beframe-read-buffer` takes over `read-buffer` when `beframe-mode` is
enabled.

Thanks to Daniel Russo for the modification. This was done in pull
request 18: <https://github.com/protesilaos/beframe/pull/18>. The
change is small, meaning that Daniel does not need to assign copyright
to the Free Software Foundation.
