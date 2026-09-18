---
title: "Emacs: dired-preview version 0.7.0"
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

## Version 0.7.0 on 2026-09-18

This version introduces a few refinements to an already stable code base.


### The `dired-preview-ignored-extensions-regexp` becomes `dired-preview-ignored-extensions`

This change reflects the broadened flexibility of the user option.
Before, it used to accept either a `nil` value or a regular expression
(i.e. a single string). In addition to these, it can now accept a list
of strings, each of which represents a file type extension.

The default value is basically this:

```elisp
;; Illustration of the new value
(setq dired-preview-ignored-extensions
      '("mkv" "webm" "mp4"
        "mp3" "ogg" "m4a" "flac" "wav"
        "gz" "zst" "tar" "xz" "rar" "zip" "iso"
        "epub" "pdf"
        ".DS_Store"))
```

And here is how it used to be:

```elisp
;; Illustration of the old variable and its value
(setq dired-preview-ignored-extensions-regexp
      (concat "\\."
              "\\(mkv\\|webm\\|mp4\\|mp3\\|ogg\\|m4a\\|flac\\|wav"
              "\\|gz\\|zst\\|tar\\|xz\\|rar\\|zip"
              "\\|iso\\|epub\\|pdf\\)\\'"))
```

Again, the old single regexp is supported, though I think the list is
easier to write.


### New `dired-preview-hook` and the `dired-preview-with-window` macro

The hook is run when a preview is displayed. Functions that need to
act with the preview window as current can rely on the macro
`dired-preview-with-window`. Look at the code to get an idea of how
the macro is used.

Thanks to dasoju for requesting the hook in issue 32:
<https://github.com/protesilaos/dired-preview/issues/32>.


### The `dired-preview-find-file` and `dired-preview-open-dwim` are robust

They should always find the underlying file and do the right thing
with it. Basically, they should always work if there is a preview
window.


### The `dired-preview-image-extensions-regexp` is obsolete

This was a user option since the early days of the package. I left it
there by mistake. The manual was not mentioning it but it is possible
that users have configured it.

Its new name is `dired-preview-image-extensions` and it is just a
variable (not a &ldquo;user option&rdquo;), meaning that users should configure it
only if they know what they are doing.


### The preview trigger is more robust

It should now work reliably and do what is expected of the preview. I
fixed this in response to issue 33 by dasoju:
<https://github.com/protesilaos/dired-preview/issues/33>.


### The preview state is handled properly

The preview window is closed when it ought to without affecting the
rest of the layout. Unexpected values are also handled gracefully.
With regard to the latter, thanks to abdulnafe-t for reporting a bug
which helped me notice this problem. The report is part of issue 34:
<https://github.com/protesilaos/dired-preview/issues/34>.


### The original value of `dired-dwim-target` is handled correctly

The `dired-dwim-target` is changed by the preview so that relevant
Dired operations are not affected by the preview window. When we need
to restore that variable to its original value, we now do it without
hardcoding a preference.

Thanks to qhga for bringing this matter to my attention in issue 36:
<https://github.com/protesilaos/dired-preview/issues/36>.
