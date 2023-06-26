---
title: "Emacs: file and Dired basics"
excerpt: "Video demonstration of Emacs' powerful tools for finding files, managing directory contents, and editing everything efficiently."
layout: vlog
mediaid: "L_4pLN0gXGI"
---

Video overview of file navigation in Emacs.  There are lots of
powerful commands to find files, open directories, and perform
operations on the contents of the filesystem.  Technically, I talk
about `find-file`, `dired` and its numerous accoutrements, the
minibuffer and its histories, file permissions, keyboard macros, and
projects.

Same basic configurations based on what I mentioned in the video:

```elisp
;; Install the `vertico' package to get a vertical view of the
;; minibuffer.  Vertico is optimised for performance and is also
;; highly configurable.  Here is my minimal setup:
(setq vertico-resize nil)
(vertico-mode 1)

;; Install the `marginalia' package.  This will display useful
;; annotations next to entries in the minibuffer.  For example, when
;; using M-x it will show a brief description of the command as well
;; as the keybinding associated with it (if any).
(marginalia-mode 1)

;; When you first call `find-file' (C-x C-f by default), you do not
;; need to clear the existing file path before adding the new one.
;; Just start typing the whole path and Emacs will "shadow" the
;; current one.  For example, you are at ~/Documents/notes/file.txt
;; and you want to go to ~/.emacs.d/init.el: type the latter directly
;; and Emacs will take you there.
(file-name-shadow-mode 1)

;; This works with `file-name-shadow-mode' enabled.  When you are in
;; a sub-directory and use, say, `find-file' to go to your home '~/'
;; or root '/' directory, Vertico will clear the old path to keep
;; only your current input.
(add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy)

;; Do not outright delete files.  Move them to the system trash
;; instead.  The `trashed' package can act on them in a Dired-like
;; fashion.  I use it and can recommend it to either restore (R) or
;; permanently delete (D) the files.
(setq delete-by-moving-to-trash t)

;; When there are two Dired buffers side-by-side make Emacs
;; automatically suggest the other one as the target of copy or rename
;; operations.  Remember that you can always use M-p and M-n in the
;; minibuffer to cycle through the history, regardless of what this
;; does.  (The "dwim" stands for "Do What I Mean".)
(setq dired-dwim-target t)

;; Automatically hide the detailed listing when visiting a Dired
;; buffer.  This can always be toggled on/off by calling the
;; `dired-hide-details-mode' interactively with M-x or its keybindings
;; (the left parenthesis by default).
(add-hook 'dired-mode-hook #'dired-hide-details-mode)

;; Teach Dired to use a specific external program with either the
;; `dired-do-shell-command' or `dired-do-async-shell-command' command
;; (with the default keys, those are bound to `!' `&', respectively).
;; The first string is a pattern match against file names.  The
;; remaining strings are external programs that Dired will provide as
;; suggestions.  Of course, you can always type an arbitrary program
;; despite these defaults.
(setq dired-guess-shell-alist-user
      '(("\\.\\(png\\|jpe?g\\|tiff\\)" "feh" "xdg-open")
        ("\\.\\(mp[34]\\|m4a\\|ogg\\|flac\\|webm\\|mkv\\)" "mpv" "xdg-open")
		(".*" "xdg-open")))
```
