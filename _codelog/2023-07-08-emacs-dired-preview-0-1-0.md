---
title: "Emacs: dired-preview version 0.1.0"
excerpt: "Information about my 'dired-preview' package for GNU Emacs."
---

This is a simple and robust package to automatically preview in a side
window the file at point in Dired buffers.  Preview windows are closed
when they are no longer relevant, while preview buffers are killed if
they have not been used for other purposes beside previewing.  The
package provides several customisation options to control its
behaviour.

+ Package name (GNU ELPA): `dired-preview`
+ Official manual: <https://protesilaos.com/emacs/dired-preview>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/dired-preview>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/dired-preview>
    + GitLab: <https://gitlab.com/protesilaos/dired-preview>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Backronym: Directories Invariably Render Everything Decently; PDFs
  Require Extra Viewing Instructions for Emacs to Work.

Below are the release notes.

* * *

The `dired-preview` package was in a public testing phase from
2023-06-25 until today.  In the meantime, lots of changes have been
made in the interest of usability and robustness.


## Global and buffer-local modes

The `dired-preview-mode` is a local minor mode, while
`dired-preview-global-mode` is its global counterpart.  Both only take
effect in Dired buffers.

The idea for a global and a local mode is to empower the user to
toggle the functionality on demand, such as when they are in a meeting
and want to disable/enable previews in a given context.

During the development phase, I had made an error regarding the scope
of what should be a local minor mode.  Thanks to Christian Tietze for
pointing it out: <https://lists.sr.ht/~protesilaos/general-issues/%3Cm1zg4noej2.fsf%40christiantietze.de%3E>.


## Preview delay runs on an idle timer

Originally, previews would run on a timer that would block Emacs.
Whereas we now arrange to only trigger a preview when Emacs is idle
for a customisable amount of seconds.  Refer to the user option
`dired-preview-delay`.


## Trigger a preview in the post-command phase

In the original design, previews were triggered by bespoke
`dired-preview` commands that were remapped to `n` and `p` in Dired
buffers.  This had several downsides, namely, (i) the other motions
would not pick up the trigger, (ii) we would have to remap all
possible motions, and (iii) the code was needlessly complex.

Currently, we install a local hook in the post-command phase, which
will trigger a preview if the previous command was a Dired motion.  In
future versions, we may expand the list of commands that we check for.

Thanks to Peter Prevos for reporting this in issue 1 on the GitHub
mirror: <https://github.com/protesilaos/dired-preview/issues/1>.

Thanks to Christian Tietze and Ed Hamilton for discussing this topic
with me on the mailing list:
<https://lists.sr.ht/~protesilaos/general-issues/%3Cm1zg4noej2.fsf%40christiantietze.de%3E>.
Commit ae93720 by Christian Tietze is based on this discussion,
although the implementation details have since been redone.

During the development phase, I had made the mistake of checking the
`last-command`, whereas I should be testing against the
`this-command`.  Thanks to Karthik Chikmagalur for pointing out my
error:
<https://lists.sr.ht/~protesilaos/general-issues/%3C87sfab8ixn.fsf%40gmail.com%3E>.


## The placement of the preview window is customisable

We arrange to display previews in a side window.  Due to the inherent
complexity of the `display-buffer` function and its accoutrements, a
user option is necessarily reserved for experienced users.  To this
end, we provide the `dired-preview-display-action-alist-function`.
Refer to the `dired-preview-display-action-alist-dwim` function for
the implementation details.

Thanks to Karthik Chikmagalur for making an initial suggestion about
such a feature:
<https://lists.sr.ht/~protesilaos/general-issues/%3C87jzvp484n.fsf%40gmail.com%3E>

Thanks to Bruno Boal for discussing the user option and concomitant
function with me and for checking the relevant definitions.  This was
done via a private channel and the information is shared with
permission.


## Window placement and deletion is more robust

The idea of "preview" windows is that they are not ordinary windows
that the user can interact with.  As such, they are to be deleted when
some non-preview mode of action is taken.

Testing for such cases was extensive and required lots of changes to
the code base.  Thanks to Bruno Boal for performing the tests with me,
for brainstorming possible solutions, and for inspecting the
implementation details.  This was done via a private channel and the
information is shared with permission.


## We no longer try to preview irregular files

Before, `dired-preview` would attempt to produce a preview of named
pipes and sockets.  This was not intended and has since been
addressed.  Use 'file-regular-p' instead of 'file-exists-p'

Thanks to Karthik Chikmagalur for bringing this matter to my attention
and for recommending the use of `file-regular-p` instead of
`file-exists-p`:
<https://lists.sr.ht/~protesilaos/general-issues/%3C87pm5cnpaf.fsf%40gmail.com%3E>.


## Preview buffers are killed up to a cumulative size threshold

In the original design, we were killing preview buffers all at once.
This was wasteful because all the work we were doing in the background
to, for example, fetch a large file was discarded even though the user
could theoretically request another preview of it.

The current approach is to keep around the newer buffers in order to
speed up potential requests for another preview.  Older buffers are
discarded starting from the oldest.  The clearance of older buffers is
done until we reach a cumulative size of what is specified as the
value of the variable `dired-preview--buffers-threshold`.

Note that the symbol includes double dashes, meaning that it is
intended for "private" (internal) purposes.  I am mentioning it here,
because this seems like a good candidate for a future user option,
subject to further refinements.

Thanks to Bruno Boal for suggesting this idea and checking its
implementation with me.  This was done via a private channel and the
information is shared with permission.
