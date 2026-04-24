---
title: 'Introduction to Ibuffer (Emacs)'
excerpt: 'Video demo of "Ibuffer". Use it to manage Emacs buffers efficiently.'
layout: vlog
mediaid: '6KN_oSLFf-k'
---

`ibuffer` is a library that is built into Emacs.  It allows us to
operate on the buffer list in a number of ways.  We can sort, mark,
filter using several predicates such as buffer name, major mode,
filesystem path.

Furthermore, `ibuffer` provides convenient access to other built-in
commands, such as `query-replace` and `occur`.  You can use these to
operate on a subset of marked buffers.

Check [my dotemacs](https://protesilaos.com/emacs/dotemacs) for configurations
on this and other tools.

* * *

**UPDATE 2026-04-24 08:16 +0300:** I no longer use `ibuffer` because I
have my `beframe` package to group buffers by frame. Below is a
configuration of `ibuffer` based on what I used to have:

```elisp
(use-package ibuffer
  :ensure nil
  :bind
  ( :map global-map
    ("C-x C-b" . ibuffer)
    :map ibuffer-mode-map
    ("* f" . ibuffer-mark-by-file-name-regexp)
    ("* g" . ibuffer-mark-by-content-regexp) ; "g" is for "grep"
    ("* n" . ibuffer-mark-by-name-regexp)
    ("s n" . ibuffer-do-sort-by-alphabetic)  ; "sort name" mnemonic
    ("/ g" . ibuffer-filter-by-content))
  :hook
  ((ibuffer-mode . hl-line-mode)
   (ibuffer-mode . (lambda () (ibuffer-switch-to-saved-filter-groups "Main"))))
  :config
  (require 'ibuf-ext)
  (setq ibuffer-saved-filter-groups
        '(("Main"
           ("Directories" (mode . dired-mode))
           ("Org" (mode . org-mode))
           ("Programming" (or
                           (mode . c-mode)
                           (mode . conf-mode)
                           (mode . css-mode)
                           (mode . emacs-lisp-mode)
                           (mode . html-mode)
                           (mode . mhtml-mode)
                           (mode . python-mode)
                           (mode . ruby-mode)
                           (mode . scss-mode)
                           (mode . shell-script-mode)
                           (mode . yaml-mode)))
           ("Markdown" (mode . markdown-mode))
           ("Magit" (or
                     (mode . magit-blame-mode)
                     (mode . magit-cherry-mode)
                     (mode . magit-diff-mode)
                     (mode . magit-log-mode)
                     (mode . magit-process-mode)
                     (mode . magit-status-mode)))
           ("Apps" (or
                    (mode . bongo-playlist-mode)
                    (mode . elfeed-search-mode)
                    (mode . elfeed-show-mode)))
           ("Gnus" (or
                    (mode . message-mode)
                    (mode . mail-mode)
                    (mode . gnus-article-mode)
                    (mode . gnus-group-mode)
                    (mode . gnus-server-mode)
                    (mode . gnus-summary-mode)))
           ("Emacs" (or
                     (name . "\\`\\*Help\\*\\'")
                     (name . "\\`\\*Custom.*")
                     (name . "\\`\\*Org Agenda\\*\\'")
                     (name . "\\`\\*info\\*\\'")
                     (name . "\\`\\*scratch.*\\*\\'")
                     (name . "\\`\\*Backtrace\\*\\'")
                     (name . "\\`\\*Messages\\*\\'")
                     (name . "\\`\\*Warnings\\*\\'"))))))
  (setq ibuffer-expert t)
  (setq ibuffer-display-summary nil)
  (setq ibuffer-use-other-window nil)
  (setq ibuffer-show-empty-filter-groups nil)
  (setq ibuffer-movement-cycle nil)
  (setq ibuffer-default-sorting-mode 'filename/process)
  (setq ibuffer-use-header-line t)
  (setq ibuffer-default-shrink-to-minimum-size nil)
  (setq ibuffer-formats
        '((mark modified read-only locked " "
                (name 40 40 :left :elide)
                " "
                (size 9 -1 :right)
                " "
                (mode 16 16 :left :elide)
                " " filename-and-process)
          (mark " "
                (name 16 -1)
                " " filename)))
  (setq ibuffer-old-time 48))
```
