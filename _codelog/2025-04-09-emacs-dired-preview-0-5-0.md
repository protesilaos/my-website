---
title: "Emacs: dired-preview version 0.5.0"
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


## Version 0.5.0 on 2025-04-09

This version contains a few bug fixes and minor refinements that
should improve the behaviour of the package.


### Revised how preview windows are deleted

In the past, `dired-preview-mode` could delete windows that held
another buffer, thus undoing the window layout that was present before
a preview buffer was displayed. Now `dired-preview-mode` makes sure to
only delete windows that have not had another buffer shown in them,
i.e. windows that were created just for preview purposes.


### Directories no longer get misunderstood as &ldquo;large files&rdquo;

We tweaked how we test the type of the buffer-to-be-preview such that
directories are not mistaken for &ldquo;large files&rdquo;. This was an issue for
Mac computers that Sean Devlin brought to my attention in issue 27:
<https://github.com/protesilaos/dired-preview/issues/27>.


### The `dired-preview-delay` has a 0.1 second minimum to avoid instability

A value of 0 could lead to a noticeably degraded experience while
navigating the Dired buffer. Thanks to Yiyu Zhou for reporting the
matter in issue 2 on the GitLab mirror:
<https://gitlab.com/protesilaos/dired-preview/-/issues/2>.


### Files without an extension can also be ignored

The user option `dired-preview-ignored-extensions-regexp` will now
also match files without an extension, such as the `.DS_Store` on Mac
computers.

Thanks to Sean Devlin for the contribution in pull request 26:
<https://github.com/protesilaos/dired-preview/pull/26>. The change is
within the ~15-line limit, meaning that Sean does not need to assign
copyright to the Free Software Foundation.


### The preview buffer is the &ldquo;other window&rdquo; for scrolling purposes

The commands which scroll the other window, such as
`scroll-other-window` now operate on the preview buffer when that is
displayed. Thanks to Karthik Chikmagalur for proposing this in issue
24: <https://github.com/protesilaos/dired-preview/issues/24>.

This is in addition to the commands we already provided for scrolling
the preview window, namely, `dired-preview-page-up` and `dired-preview-page-down`.
Do `M-x describe-keymap` and then search for `dired-preview-mode-map`:
it is in effect when `dired-preview-mode` is enabled.
