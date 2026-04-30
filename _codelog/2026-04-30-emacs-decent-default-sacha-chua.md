---
title: "Emacs: decent defaults I shared with Sacha Chua"
excerpt: "Some basic settings for Emacs that I consider useful for most users."
---

These are the basic settings for Emacs that I shared with Sacha Chua
during our livestreamed meeting on 2026-04-30: <https://www.youtube.com/watch?v=z7pcLdwuyxE>.

```elisp
;;; Sensible defaults that are not too intrusive and focus on common use-cases.  By Protesilaos on 2026-04-30.

;; These are not all of my favourite options.  I am not even including
;; any of my packages.  They are just some basics that I consider
;; useful, given what I have learnt from my exchange with other people
;; of all skill levels.


;; Persist all customisations in a separate file called "custom.el".
;; It is in the same directory as the "init.el".
;;
;; Without the `custom-file', Emacs writes directly to the "init.el",
;; which can be confusing.
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

(use-package package
  :ensure nil
  :config
  ;; I am not using `add-to-list' here because the default "gnu" is
  ;; confusing to people, given that "elpa" is the better known name
  ;; for it.
  (setq package-archives
        '(("gnu-elpa" . "https://elpa.gnu.org/packages/")
          ("nongnu" . "https://elpa.nongnu.org/nongnu/")
          ("melpa" . "https://melpa.org/packages/")))
  ;; Prefer GNU ELPA but accept the reality of MELPA's utility to the
  ;; wider community.
  (setq package-archive-priorities
        '(("gnu-elpa" . 3)
          ("nongnu" . 2)
          ("melpa" . 1))))

;;;; General options
(use-package emacs
  :ensure nil
  :demand t
  :init
  (defun prot/keyboard-quit-dwim ()
    "Do-What-I-Mean behaviour for a general `keyboard-quit'.

The generic `keyboard-quit' does not do the expected thing when
the minibuffer is open.  Whereas we want it to close the
minibuffer, even without explicitly focusing it.

The DWIM behaviour of this command is as follows:

- When the region is active, disable it.
- When a minibuffer is open, but not focused, close the minibuffer.
- When the Completions buffer is selected, close it.
- In every other case use the regular `keyboard-quit'."
    (interactive)
    (cond
     ((region-active-p)
      (keyboard-quit))
     ((derived-mode-p 'completion-list-mode)
      (delete-completion-window))
     ((> (minibuffer-depth) 0)
      (abort-recursive-edit))
     (t
      (keyboard-quit))))
  :bind
  ("C-g" . prot/keyboard-quit-dwim)
  :config
  ;; Set your favourite font family and height here.  The :height is
  ;; 10x the point size you most commonly find on other applications.
  (set-face-attribute 'default nil :family "Aporetic Sans Mono" :height 160)
  ;; Set your favourite font for elements that are designed to always
  ;; be monospaced.  The height SHOULD BE a floating point, which is
  ;; interpreted as relative to the `default'.
  (set-face-attribute 'variable-pitch nil :family "Aporetic Serif Mono" :height 1.0)
  ;; Same as above for proportionately spaced elements.  Make any
  ;; buffer proportionately spaced by enabling the `variable-pitch-mode'.
  ;;
  ;; [ NOTE: If you use the Modus themes or derivatives, set
  ;;   `modus-themes-mixed-fonts', load the theme for the option to
  ;;   take effect, and then enable `variable-pitch-mode':
  ;;   spacing-sensitive elements like Org tables and code blocks will
  ;;   remain monospaced. ]
  (set-face-attribute 'variable-pitch nil :family "Aporetic Sans" :height 1.0)

  ;; I have never seen a user say "no" to loading a theme they have
  ;; downloaded.  Technically, any Elisp file can run arbitrary code,
  ;; so this is not doing much on the security front.
  (setq custom-safe-themes t)
  (setq use-short-answers t)
  (setq read-answer-short t)
  (setq help-window-select t) ; also check `display-buffer-alist' below
  (setq help-window-keep-selected t) ; Emacs 29
  (setq find-library-include-other-files nil) ; Emacs 29
  (setq window-combination-resize t)
  (setq save-interprogram-paste-before-kill t)
  ;; Do not jump to the current line in `*occur*' buffers.  The reason
  ;; is that you are already on that line: you want to do `occur' to
  ;; get more than that (and, presumably, to do something with the
  ;; results such as to edit them with `occur-edit-mode').
  (setq list-matching-lines-jump-to-current-line nil)
  (setq completion-category-defaults nil))

;;;; Save minibuffer histories
(use-package savehist
  :ensure nil
  :config
  (savehist-mode 1))

;;;; Delete the selected text when inserting new text
(use-package delsel
  :ensure nil
  :config
  (delete-selection-mode 1))

;;;; Bookmarks
(use-package bookmark
  :ensure nil
  ;; Emacs 29 displays a bookmark icon on the fringe.  Many people
  ;; have asked me what that thing is.  I also think it is confusing.
  (setq bookmark-fringe-mark nil)
  ;; Write changes to the bookmark file as soon as 1 modification is
  ;; made (addition or deletion).  Otherwise Emacs will only save the
  ;; bookmarks when it closes, which may never happen properly
  ;; (e.g. power failure).
  (setq bookmark-save-flag 1))

;;;; Dired
(use-package dired
  :ensure nil
  :config
  ;; Most people I have talked to prefer a single Dired buffer.
  ;; Personally I like the many Dired buffers, but I understand why
  ;; this feels overwhelming.
  (setq dired-kill-when-opening-new-dired-buffer t)
  (setq dired-auto-revert-buffer #'dired-directory-changed-p) ; also see `dired-do-revert-buffer'
  (setq dired-clean-up-buffers-too t)
  (setq dired-clean-confirm-killing-deleted-buffers t)
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-create-destination-dirs 'ask)
  (setq dired-create-destination-dirs-on-trailing-dirsep t) ; Emacs 29
  (setq wdired-create-parent-directories t))

;;;; Isearch
(use-package isearch
  :ensure nil
  :config
  ;; ;; Enable those to make "package install" match those words with
  ;; ;; anything in between.  I think this is the single best tweak I
  ;; ;; ever made.
  ;;
  ;; (setq search-whitespace-regexp ".*?")
  ;; (setq isearch-lax-whitespace t)
  ;; (setq isearch-regexp-lax-whitespace nil)
  (setq isearch-lazy-count t)
  (setq lazy-count-prefix-format "(%s/%s) ")
  (setq lazy-count-suffix-format nil))

;;;; Diff
(use-package diff
  :ensure
  :config
  ;; You cannot expect the syntax highlighting of themes to look
  ;; equally readabable against what typically are red and green
  ;; backgrounds.  This should be opt-in by default, not opt-out.
  (setq diff-font-lock-syntax nil))

;;;; Ediff
(use-package ediff
  :ensure nil
  :config
  ;; Ediff is virtually unusable without those.  Especially on tiling
  ;; window managers.  But even on a regular desktop environment it is
  ;; confusing and cumbersome to have the control panel in another
  ;; frame.
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

;;;; SHR
(use-package shr
  :ensure nil
  :config
  ;; t is bad for accessibility and generally awkward for HTML email
  ;; (especially with dark themes).
  (setq shr-use-colors nil)
  ;; This option should not exist, given `variable-pitch-mode'.
  ;; Furthermore, its default value runs counter to almost everything
  ;; else in Emacs which just uses the `default' face.
  (setq shr-use-fonts nil))

;;;; Control the display of common ancillary windows

;; Always focus common ancillary windows.  Place them in a window
;; already occupied by their respective major mode or below the
;; current window.
(add-to-list 'display-buffer-alist
             '((or . ((derived-mode . occur-mode)
                      (derived-mode . grep-mode)
                      (derived-mode . Buffer-menu-mode)
                      (derived-mode . log-view-mode)
                      (derived-mode . help-mode)))
               (display-buffer-reuse-mode-window display-buffer-below-selected)
               (body-function . select-window)))

(add-to-list 'display-buffer-alist
             '("\\`\\*\\(Org \\(Select\\|Note\\)\\|Agenda Commands\\)\\*\\'" ; the `org-capture' key selection, `org-add-log-note', and agenda dispatcher
               (display-buffer-in-side-window)
               (dedicated . t)
               (side . bottom)
               (slot . 0)
               (window-parameters . ((mode-line-format . none)))))

(add-to-list 'display-buffer-alist
             '((derived-mode . calendar-mode)
               (display-buffer-reuse-mode-window display-buffer-below-selected)
               (mode . (calendar-mode bookmark-edit-annotation-mode ert-results-mode))
               (inhibit-switch-frame . t)
               (dedicated . t)
               (window-height . fit-window-to-buffer)))

(add-to-list 'display-buffer-alist
             '((derived-mode . reb-mode) ; M-x re-builder
               (display-buffer-reuse-mode-window display-buffer-below-selected)
               (inhibit-switch-frame . t)
               (window-height . 4) ; note this is literal lines, not relative
               (dedicated . t)
               (preserve-size . (t . t))))

;;;; ESSENTIAL packages to install

(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

;;;; VERY USEFUL but not essential packages
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)))

(use-package consult
  :ensure t
  ;; All commands have their utility, but those are commonly needed.
  :commands (consult-buffer consult-line consult-outline consult-find consult-grep))

(use-package embark
  :ensure t
  :bind
  ;; Embark is helpful in every context, though there are other ways
  ;; to do what it does.  Where it stands out is in its ability to
  ;; deal with all the minibuffer results.  The equivalent of those
  ;; two commands should be a core Emacs functionality.
  ( :map minibuffer-local-map
    ("C-c C-c" . embark-collect)
    ("C-c C-e" . embark-export))
  :config
  ;; Needed for correct exporting while using Embark with Consult commands.
  (use-package embark-consult
    :ensure t
    :after consult))

;; Useful when combined with `delete-by-moving-to-trash'.
(use-package trashed
  :ensure t)
```
