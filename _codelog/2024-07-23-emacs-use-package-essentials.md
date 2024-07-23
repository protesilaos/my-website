---
title: "Emacs: use-package essentials"
excerpt: "Video demonstration of the 'use-package' configuration macro and its key features."
layout: vlog
mediaid: "RaqtzemHFDU"
---

In this ~35-minute video I demonstrate the main features of the
'use-package' configuration macro that is built into Emacs 29. It is
the de facto standard for setting up packages and is designed to make
Emacs faster to start up and more robust overall.

```elisp
;;; Install a package, if needed

(use-package denote
  :ensure t)

(use-package dired
  :ensure nil)

;;; Evaluate code after a package is loaded

(use-package ef-themes
  :ensure t
  :config
  (ef-themes-select 'ef-cyprus)) ; the theme for this video

;;; Evaluate code before a package is loaded

(use-package corfu
  :init
  (setq tab-always-indent 'complete)
  :config
  ...)

;;; Conditional loading

(use-package spacious-padding
  :ensure t
  :if (display-graphic-p)
  :config
  ...)

;; This is for the sxhkd program, which is used with minimalist tiling
;; window managers.
(use-package sxhkdrc-mode
  :ensure t
  :if (eq system-type 'gnu/linux)
  ...)

(when (eq system-type 'gnu/linux)
  (use-package sxhkdrc-mode
    :ensure t
    ...))

;;; Defer loading by defining keys

(use-package denote
  :ensure t
  :bind
  ("C-c n n" . denote)
  :config
  (setq denote-known-keywords '("emacs" "philosophy" "politics")))

(use-package denote
  :ensure t
  :bind
  ( :map global-map ; same as above
    ("C-c n n" . denote))
  :config
  (setq denote-known-keywords '("emacs" "philosophy" "politics")))

(use-package denote
  :ensure t
  :bind
  ;; For more key bindings, you need a list of such pairs
  (("C-c n n" . denote)
   ("C-c n r" . denote-rename-file))
  :config
  (setq denote-known-keywords '("emacs" "philosophy" "politics")))

;;; Defer loading with a hook

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode)
  :config
  ;; Evaluated only after I am in Dired.
  ...)

;;; Defer loading until some command is called (usually not needed)

(use-package bookmark
  :ensure nil
  :commands (bookmark-set bookmark-jump bookmark-bmenu-list))

;;; Defer loading until a file is opened (for major modes)

(use-package sxhkdrc-mode
  :ensure t
  ;; We generally do not need :mode because major modes set this up
  ;; already.
  :mode "sxhkdrc_.*")

;;; Defer loading indefinitely or for N seconds of idleness

(use-package server
  :ensure nil
  :defer 1
  :config
  (setq server-client-instructions nil)
  (unless (server-running-p)
    (server-start)))

(use-package markdown-mode
  :ensure t
  :defer t
  :config
  (setq markdown-fontify-code-blocks-natively t))

;;; Force loading when deferring is not desired

(use-package modus-themes
  :ensure t
  :demand t
  :bind
  (("<f5>" . modus-themes-toggle)
   ("C-<f5>" . modus-themes-select))
  :config
  (modus-themes-load-theme 'modus-vivendi-tinted))

;;; Define many keys in many key maps

(use-package denote
  :ensure t
  :bind
  ( :map global-map

    ("C-c n n" . denote)
    ("C-c n r" . denote-rename-file)

    :map text-mode-map

    ("C-c n i" . denote-link) ; "insert" mnemonic
    ("C-c n I" . denote-add-links)

    :map dired-mode-map

    ("C-c C-d C-i" . denote-link-dired-marked-notes)
    ("C-c C-d C-r" . denote-dired-rename-marked-files)))

;;; Add the same function to many hooks

(use-package abbrev
  :ensure nil
  :hook ((text-mode prog-mode git-commit-mode) . abbrev-mode))

;; This is the same as above, which has the advantage of being easier
;; to make sense of and modify, but is repetitive.
(use-package abbrev
  :ensure nil
  :hook ((text-mode . abbrev-mode)
         (prog-mode . abbrev-mode)
         (git-commit-mode . abbrev-mode)))

;;; Specify a custom `load-path'

(use-package notmuch
  :ensure nil ; do not install, because I get it from my Linux distro packages
  :load-path "/usr/share/emacs/site-lisp/"
  :defer t
  :commands (notmuch notmuch-mua-new-mail))

;;; Load a package after another

(use-package notmuch
  :load-path "/usr/share/emacs/site-lisp/"
  :defer t
  :commands (notmuch notmuch-mua-new-mail))

(use-package notmuch-indicator
  :ensure t
  :after notmuch
  :config
  (notmuch-indicator-mode 1))

;;; Do not force dependencies with `:after'

(use-package register
  :ensure nil
  :defer t ; its commands are autoloaded, so this will be loaded then
  :config
  ;; Use `with-eval-after-load', name the symbol of the feature, and
  ;; then write arbitrary code below.
  (with-eval-after-load 'savehist
    (add-to-list 'savehist-additional-variables 'register-alist)))

;;; Avoid never loading the package with `:bind'

(use-package vertico
  :ensure t
  ;; This is WRONG, because it defers the loading of the package until
  ;; `vertico-directory-delete-char' is invoked.  But this command is
  ;; only accessible through the `vertico-map' which, in turn, is only
  ;; available inside the Vertico-powered minibuffer, i.e. after
  ;; `vertico-mode' is enabled.
  :bind
  ( :map vertico-map
    ("DEL" . vertico-directory-delete-char))
  :config
  (vertico-mode 1))

(use-package vertico
  :ensure t
  ;; This is fine now.
  :hook
  (after-init . vertico-mode)
  :bind
  ( :map vertico-map
    ("DEL" . vertico-directory-delete-char)))
```
