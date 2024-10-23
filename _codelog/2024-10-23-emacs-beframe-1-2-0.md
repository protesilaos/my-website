---
title: "Emacs: beframe version 1.2.0"
excerpt: 'Information about the latest version of my beframe package for GNU Emacs.'
---

`beframe` enables a frame-oriented Emacs workflow where each frame has
access only to the list of buffers visited therein.  In the interest of
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


## Version 1.2.0 on 2024-10-23

Beframe is in a stable state. This version includes three new commands
as well as quality-of-life improvements.


### Assume or unassume buffers using a regular expression

There two more commands to assume/unassume buffers from/to the current
frame:

-   `beframe-assume-buffers-matching-regexp`
-   `beframe-unassume-buffers-matching-regexp`

They both work by matching a regular expression against the global
list of buffer names. When called with a prefix argument, the regular
expression is matched against the buffer name or the name of the
buffer's major mode.

This is a convenient way to, for example, collect all email or IRC
buffers in a single frame and work with them as you will.


### Delete buffers matching a regular expression

Following the same principle as above, we have the command
`beframe-kill-buffers-matching-regexp`. The regular expression is
matched against the buffer name or the name of the major mode when
called with a prefix argument.

Since this is a destructive operation, the command prompts for
confirmation to operate on the buffers it has found. Users who do not
like this check can set the new user option `beframe-kill-buffers-no-confirm`
to a non-nil value.

Note that Emacs may still prompt for further confirmation if the given
buffer is unsaved, has a running process, and the like. Also note that
this operation applies to all frames because buffers are shared by the
Emacs session even though Beframe only exposes those that pertain to a
particular frame (when `beframe-mode` is enabled).


### Commands that assume/unassume buffers report on their status

All relevant commands will now log a message about what they did. If,
for example, `beframe-assume-buffers-matching-regexp` assumes two new
buffers into the current frame, the message will be something like:

    Assumed into current frame 2 buffers: (name-of-buffer-one name-of-buffer-two)

Similarly:

    Unassumed from current frame 2 buffers: (name-of-buffer-one name-of-buffer-two)

If the command does not change the frame's buffer list, it will report
as much:

    Did not modify the frame's buffer list


### Several internal refinements

-   The way we derive the "global buffers" (buffers that are available
    in all frames, per the user option `beframe-global-buffers`) is more
    efficient. Thanks to Bruno Boal for the contribution in pull request
    7: <https://github.com/protesilaos/beframe/pull/7>. Bruno has
    assigned copyright to the Free Software Foundation.

-   We now have a single function to get a list of buffers, given
    certain parameters. Part of this work is by Bruno Boal, from the
    aforementioned pull request. The rest is from me, which includes the
    addition of the functionality about matching buffers with a regular
    expression (as seen in the new commands described herein).

-   Inferring the name of a project among those known to `project.el` no
    longer fails when the path is abbreviated (like `~/path/to/repo`).
    Thanks to Fritz Grabo for the contribution and for Bruno Boal for
    double-checking it. This was done in pull request 6:
    <https://github.com/protesilaos/beframe/pull/6>. The change is
    small, meaning that Fritz does not need to assign copyright to the
    Free Software Foundation.

-   The subroutines to assume/unassume buffers are consolidated into one
    function. It not only provides a single point of entry, but also
    takes care to carry out its operation only when it will yield a
    change to the current frame's buffer list.
