---
title: "Emacs: combine dired-preview with ready-player"
excerpt: "We can run an arbitrary command in the previewed buffer, such as to play back a media file."
---

**UPDATE 2024-07-29 12:15 +0300:** Made some minor tweaks to the code
samples.

* * *

As part of the current development target of my `dired-preview`
package, the `dired-preview-with-window` macro can be used to run
arbitrary code with the preview window as the selected one. We can use
this to run a command in the previewed buffer. One such case is to
play the media file on display, with the help of the `ready-player`
package.

The `ready-player` by Alvaro Ramirez is a neat way to access
multimedia files inside of Emacs. When you visit a media file in a
buffer, Emacs will show a thumbnail, relevant metadata, and buttons to
play the file, pause it, et cetera. This is much better than what
Emacs does by default when it cannot read the file, where it presents
a bunch of gibberish characters.

My `dired-preview` package will show the current Dired file at point
in a preview window. When that file is among those supported by
`ready-player`, the preview will be done in the aforementioned nice
presentation. Demo:

<a href="{{'/assets/images/attachments/2024-07-29-emacs-dired-preview-ready-player.png' | absolute_url }}"><img alt="Dired preview of a media file using ready-player" src="{{'/assets/images/attachments/2024-07-29-emacs-dired-preview-ready-player.png' | absolute_url }}"/></a>

Using the in-development `dired-preview-with-window` macro, we can
start playing the current file using `ready-player`:

```elisp
(defun prot/ready-player-dired-preview-play-toggle ()
    "Call `ready-player-toggle-play-stop' on the currently previewed media file."
    (interactive)
    (dired-preview-with-window
     (if-let ((file buffer-file-name)
              (media (concat "\\." (regexp-opt ready-player-supported-media t) "\\'"))
              (_ (string-match-p media file)))
         (call-interactively #'ready-player-toggle-play-stop)
       (user-error "Cannot do something useful with `ready-player' here"))))
```

Then we bind `prot/ready-player-dired-preview-play-toggle` to a key in
the `dired-preview-mode-map`. For example:

```elisp
(define-key dired-preview-mode-map (kbd "C-c C-p") #'prot/ready-player-dired-preview-play-toggle)
```

Personally, I prefer to just open the file externally at all times.
With `ready-player`, we can achieve this using the following command:

```elisp
(defun prot/ready-player-dired-preview-open-externally ()
  "Call `ready-player-open-externally' on the currently previewed media file."
    (interactive)
    (dired-preview-with-window
     (if-let ((file buffer-file-name)
              (media (concat "\\." (regexp-opt ready-player-supported-media t) "\\'"))
              (_ (string-match-p media file)))
         (call-interactively #'ready-player-open-externally)
       (user-error "Cannot do something useful with `ready-player' here"))))
```

[ Emacs 30 has the `dired-do-open` if you need something more general
  for opening the file externally. ]

Again, bind it to the `dired-preview-mode-map` for it to work.

## The `dired-preview-with-window` is in development

Remember that I am still working on the `dired-preview-with-window`. I
plan to add some more commands that utilise it and, generally, make
the preview window more useful. The relevant details will be available
in the release notes for the new version, as well as the manual.

## About dired-preview

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
+ Backronym: Directories Invariably Render Everything Decently; PDFs
  Require Extra Viewing Instructions for Emacs to Work.

