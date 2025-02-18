---
title: "Emacs: dired-preview version 0.4.0"
excerpt: 'Information about the latest version of my dired-preview package for GNU Emacs.'
---

This is a simple package to automatically preview in a window the file
at point in Dired buffers. Preview windows are closed when they are no
longer relevant, while preview buffers are killed if they have not
been used for other purposes beside previewing. The package provides
several customisation options to control its behaviour.

+ Package name (GNU ELPA): `dired-preview`
+ Official manual: <https://protesilaos.com/emacs/dired-preview>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/dired-preview>
  + GitLab: <https://gitlab.com/protesilaos/dired-preview>
+ Backronym: Directories Invariably Render Everything Decently ...
  preview; dired ... PDFs Require Extra Viewing Instructions for Emacs
  to Work.

Below are the release notes

* * *

## Version 0.4.0 on 2025-02-18

This version contains several refinements and bug fixes.


### Preview buffers have a mode line indicator

Preview buffers have a prefix to their name to make them stand out.
This is controlled by the user option `dired-preview-buffer-name-indicator`,
which is a string that defaults to `[P]`.


### Control how preview buffers are cleaned up

The way `dired-preview` works is to display a buffer and then keep a
list of preview buffers to economise on redisplaying it again. This
list of buffers is relevant for as long as we are in the Dired buffer,
otherwise all buffers therein are killed (buffers that were alive
before being previewed are not touched).

By default we delete from oldest to newest the accumulated buffers
when they exceed `10` in total. Though users can modify this behaviour
by editing the value of the new user option `dired-preview-kill-buffers-method`
(its doc string explains the technicalities).

Thanks to artelse for discussing this with me in issue 20:
<https://github.com/protesilaos/dired-preview/issues/20>.


### The `dired-preview-display-action-alist` has a new optional function

The `dired-preview-display-action-alist` is the user option which
controls where the preview window is displayed. Its value can either
be the symbol of a function or a `display-buffer-alist` entry.

By default, we have a "do-what-I-mean" function that tries to find a
good placement for the window. The new `dired-preview-display-action-alist-below`
function has a straightforward behaviour: it always shows the preview
below the current window and it always makes the preview window 0.3
times the height of the Emacs frame.


### Encypted files are no longer previewed

This is to ensure that potentially sensitive contents are not
displayed by accident, such as during a video call.


### We no longer preview the "self" directory

We should not trigger a preview when the cursor is over the implicit
`.` directory, as that causes a recursion that breaks things. Thanks
to Inkbottle007 for reporting the bug in issue 23:
<https://github.com/protesilaos/dired-preview/issues/23>.


### Miscellaneous

-   Fixed a scenario where we would try to delete the last available
    window on the current frame. This should never happen. Thanks to
    artelse for reporting a relevant bug in the discussion of issue 22:
    <https://github.com/protesilaos/dired-preview/issues/22>.

-   Fixed a case when `hexl-follow-ascii` could fail to find an overlay
    under certain conditions. This did not create any noticeable
    problems, though having an error there would interfere with any
    workflow that would rely on `toggle-debug-on-error`.

-   The preview window will automatically be closed if the user switches
    outside the given Dired buffer. We now do not consider a change to
    the minibuffer as being &ldquo;outside&rdquo; this context. This way, a quick
    `M-x` to, say, enable a minor mode does not have any effect on the
    window layout.

-   Suppressed the messaging facility of the underlying tracking of
    preview buffers. Otherwise, Dired would notify us that the directory
    has changed whenever we would preview a new one, which is
    superfluous.

-   The body of the `dired-preview-trigger` function, which determines
    whether a preview will be displayed, is encapsulated in a `condition-case`.
    This helps capture errors and thus have a more predictable behaviour.

-   The `dired-preview-display-action-alist` has a more accurate
    declaration which allows for its correct customisation inside the
    Custom UI interface. In particular, it will behave the same way as
    the `display-buffer-alist`, where relevant.
