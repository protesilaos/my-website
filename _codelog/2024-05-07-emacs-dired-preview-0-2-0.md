---
title: "Emacs: dired-preview version 0.2.0"
excerpt: 'Information about the latest version of my dired-preview package for GNU Emacs.'
---

This is a simple package to automatically preview in a side window the
file at point in Dired buffers. Preview windows are closed when they
are no longer relevant, while preview buffers are killed if they have
not been used for other purposes beside previewing. The package
provides several customisation options to control its behaviour.

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

This release brings many small improvements and fixes some bugs.


## The preview shows up right away on new directories

In the past, entering a new directory would not trigger a preview: it
would wait for some motion before doing so. This could make it seem
that the mode was not enabled in the current buffer. Now, the preview
shows up immediately.

Thanks to Nofint for the initial contribution in pull request 8:
<https://github.com/protesilaos/dired-preview/pull/8>. The changes are
small and do not require copyright assignment to the Free Software
Foundation.


## Directories are previewed as well

The contents are displayed in a Dired buffer, using the current
settings for it. This means that colours are possible icons are shown
too.


## Large files are previewed in `hexl-mode`

As the documentation of this mode suggests:

> A mode for editing binary files in hex dump format.
> This is not an ordinary major mode; it alters some aspects
> of the current mode’s behavior, but not all; also, you can exit
> Hexl mode and return to the previous mode using C-c C-c.

The `C-c C-c` key binding toggles the mode, in case you want to see
the raw output.

Thanks to Karthik Chikmagalur for the contribution. This was done on
the now defunct mailing list:
<https://lists.sr.ht/~protesilaos/general-issues/%3C871qeb56bw.fsf@gmail.com%3E>.


## Previews are displayed in a full-featured mode

Before, we would delay the execution of the mode hooks to speed things
up. Though this came at the cost of (i) making the buffer less capable
and (ii) forcing us to handle the execution of those hooks at a later
stage when they would be needed, which proved to be error-prone in a
number of scenaria.


## Files without an extension are still previewed

This is a bug fix. Before, they would be considered as part of the
files to be ignored, per `dired-preview-ignored-extensions-regexp`.


## Previews are not added to what `recentf-mode` tracks

Thanks to Juergen Hoetzel for reporting this issue and for tweaking my
suggested patch for it. This was done in pull request 12:
<https://github.com/protesilaos/dired-preview/pull/12>. The change is
small, so Juergen does not need to assign copyright to the Free
Software Foundation.


## A nil value for `split-width-threshold` still works

We no longer consider this an error and adapt the preview accordingly.
Thanks to Juergen Hoetzel for the contribution. This was done in pull
request 11 and does not require copyright assignment:
<https://github.com/protesilaos/dired-preview/pull/11>.


## For developers: previews are done with `cl-defmethod`

Each file type will thus have its own method on how to display the
contents in a buffer. The idea is to make this easier to extend. The
goal is to have methods that can preview PDFs and images without
blocking Emacs. Other file types can be considered as well, though
those two are the immediate priority.
