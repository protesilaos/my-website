---
title: "Emacs: dired-preview version 0.3.0"
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


## Version 0.3.0 on 2024-09-16

This version brings some nice new features and makes small refinements
to the code base.


### Run commands in the preview window

The `dired-preview-mode-map` is active when `dired-preview-mode` is
enabled. Here are all the keys and corresponding commands it provides
right now:

| Key binding | Command                   |
|-------------+---------------------------|
| C-c C-c     | dired-preview-hexl-toggle |
| C-c C-d     | dired-preview-page-down   |
| C-c C-f     | dired-preview-find-file   |
| C-c C-o     | dired-preview-open-dwim   |
| C-c C-u     | dired-preview-page-up     |

With the exception of `dired-preview-hexl-toggle`, these are all new
commands.

My most used command among those is `dired-preview-open-dwim`, which
has a Do-What-I-Mean behaviour: If the file name matches
`dired-preview-media-extensions-regexp`,
`dired-preview-ignored-extensions-regexp`, or
`dired-preview-image-extensions-regexp`, then it opens it externally.
Otherwise, it visits the file in an Emacs buffer. Note that here we
include the `dired-preview-image-extensions-regexp` because while
Emacs can visit those in a buffer, it does not offer as much
functionality as other apps that specialise in handling image files.

[ Emacs uses the system default for those files when opening them externally. ]


### Advanced users can rely on the `dired-preview-with-window` macro

Use this in your custom functions to run some code with the preview
window as the selected window. For example, here is a simple one from
our code base:

```elisp
(defun dired-preview-page-down ()
  "Move a page down in the preview window.
This technically runs `scroll-up-command'."
  (interactive)
  (dired-preview-with-window
    (call-interactively 'scroll-up-command)))
```

Remember to add them to the `dired-preview-mode-map`.


### Placeholder window prevents preview jumpiness

Wtih `dired-preview-ignored-extensions-regexp` we can exclude certain
files from being previewed. This is useful because, for example, Emacs
cannot display those files or do something useful with their contents,
or we just want to hide them (e.g. to omit GPG-encrypted files from
the preview).

In the past, `dired-preview-mode` would pop up a preview window for a
file that could be previewed and would then hide that window for
anything matching `dired-preview-ignored-extensions-regexp`. As a
result, windows would jump in and out of the frame layout. This could
be disorienting.

We now provide the user option `dired-preview-ignored-show-ignored-placeholders`
which shows a placeholder window when trying to preview an ignored
file. So as we move up and down the Dired buffer, the preview window
stays in place regardless if we are on an ignored file or not.

The default value of `dired-preview-ignored-show-ignored-placeholders`
is `t` because I think this is the better behaviour. Though users can
set it to `nil` to retain the old functionality.

Thanks to Álvaro Ramírez (xenodium) for the contribution. This was
done in pull request 15: <https://github.com/protesilaos/dired-preview/pull/15>.

The change is within the permissible limit of ~15 lines, meaning that
Álvaro does not need to assign copyright to the Free Software
Foundation.


### The `dired-preview-display-action-alist` replaces `dired-preview-display-action-alist-function`

The old symbol is an alias for the new one and users will be notified
accordingly while updating.

This user option is for advanced users who want to customise where and
how `display-buffer` places the preview window. Before, we were
accepting only the symbol of a function that would return an
appropriate action alist. Now we accept either a function&rsquo;s symbol or
an action alist directly.

Examples of both:

```elisp
;; Use a function that returns an action alist:
(setq dired-preview-display-action-alist #'dired-preview-display-action-alist-dwim)

;; Use an action alist directly:
(setq dired-preview-display-action-alist
      '((display-buffer-in-side-window)
        (side . bottom)
        (window-height . 0.2)
        (preserve-size . (t . t))))
```

Check our `dired-preview-display-action-alist-dwim` for inspiration if
you want to have a function that returns an action alist based on,
say, the width of the frame.


### Preview of the next file works when marking for deletion

When we mark a file for deletion, Dired moves the point to the next
line. Before, this would not trigger a preview of the updated
file-at-point. Now it should work as expected.

Technically, we check if the last command is among those stored in the
variable `dired-preview-trigger-commands`. If you think there are
more commands we need to include there, just let me know.


### The `dired-preview-ignored-extensions-regexp` can be `nil`

This was always the intention, but the relevant code was not
accounting for that scenario. It should work now as intended.
