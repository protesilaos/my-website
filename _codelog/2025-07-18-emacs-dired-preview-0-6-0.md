---
title: "Emacs: dired-preview version 0.6.0"
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

## Version 0.6.0 on 2025-07-18

This is a small release that provides quality-of-life refinements.


### Optionally do not trigger a preview when entering the directory

The new user option `dired-preview-trigger-on-start` controls whether
a preview is produced automatically when (i) entering a directory
while (ii) the `dired-preview-mode` or its global counterpart is
enabled.

The default value is non-`nil`, which preserves the behaviour we have
always had of previewing outright. When set to `nil`, the preview does
not happen upon entering a directory and is triggered only after one
of the commands in `denote-preview-trigger-commands` is invoked.

I did this is in response to issue 31 by dasoju: <https://github.com/protesilaos/dired-preview/issues/31>.


### Define which commands trigger a preview

The `denote-preview-trigger-commands` is now declared as a &ldquo;user
option&rdquo; rather than a generic variable, meaning that users are
encouraged to customise it (and it technically is available via the
Custom interface and related). Everything should otherwise work the
same as before.


### The preview does not interfere with `dired-dwim-target`

Previous versions would make `dired-dwim-target` not return the
directory of the other window. Whereas we want the preview to not
influence how Dired behaves when copying or renaming files.

The bug was addressed in patch release `0.5.2`.


### Fixed a temporary bug in `dired-preview-page-up`

It was missing the macro we define to perform operations in the
preview window.

Thanks to Alex Popescu for telling me that the command was not
working. This was done in issue 28: <https://github.com/protesilaos/dired-preview/issues/28>.

The bug was addressed in patch release `0.5.1`.
