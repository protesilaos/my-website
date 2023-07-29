---
title: "Emacs: write a custom mode line"
excerpt: "Video demonstration on how to customize the Emacs mode line to make it more useful."
layout: vlog
mediaid: "Qf_DLPIA9Cs"
---

In this video I show how to customise the Emacs mode line (the
`mode-line-format`) to make it more useful and pretty.

Check my dotemacs/dotfiles for actual code samples.  Both my Emacs and
Linux environments are highly customised and well maintained.

+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/dotfiles>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/dotfiles>
    + GitLab: <https://gitlab.com/protesilaos/dotfiles>
+ Mailing list: <https://lists.sr.ht/~protesilaos/dotfiles>

Below is what I included in the `*scratch*` buffer during the video:

```elisp
;; The default mode line 🤨
(setq-default mode-line-format
              '("%e" mode-line-front-space
                (:propertize
                 ("" mode-line-mule-info mode-line-client mode-line-modified
                  mode-line-remote)
                 display (min-width (5.0)))
                mode-line-frame-identification mode-line-buffer-identification "   "
                mode-line-position (vc-mode vc-mode) "  " mode-line-modes
                mode-line-misc-info mode-line-end-spaces))

;; My mode line with the `prot-modeline.el' 🤩
;; Note that separate to this is my `prot-modeline-subtle-mode'.
(setq-default mode-line-format
              '("%e"
                prot-modeline-kbd-macro
                prot-modeline-narrow
                prot-modeline-input-method
                prot-modeline-buffer-status
                " "
                prot-modeline-buffer-identification
                "  "
                prot-modeline-major-mode
                prot-modeline-process
                "  "
                prot-modeline-vc-branch
                "  "
                prot-modeline-flymake
                "  "
                prot-modeline-align-right
                prot-modeline-misc-info))


;; Here I explained why `setq' sets a buffer-local value and discussed
;; why we need `setq-default' in such cases.
(setq mode-line-format nil)

(kill-local-variable 'mode-line-format)

(force-mode-line-update)




(setq-default mode-line-format
              '("%e"
                my-modeline-buffer-name
                "  "
                my-modeline-major-mode))

(defface my-modeline-background
  '((t :background "#3355bb" :foreground "white" :inherit bold))
  "Face with a red background for use on the mode line.")

(defun my-modeline--buffer-name ()
  "Return `buffer-name' with spaces around it."
  (format " %s " (buffer-name)))

(defvar-local my-modeline-buffer-name
    '(:eval
      (when (mode-line-window-selected-p)
        (propertize (my-modeline--buffer-name) 'face 'my-modeline-background)))
  "Mode line construct to display the buffer name.")

(put 'my-modeline-buffer-name 'risky-local-variable t)

(defun my-modeline--major-mode-name ()
  "Return capitalized `major-mode' as a string."
  (capitalize (symbol-name major-mode)))

(defvar-local my-modeline-major-mode
    '(:eval
      (list
       (propertize "λ" 'face 'shadow)
       " "
       (propertize (my-modeline--major-mode-name) 'face 'bold)))
  "Mode line construct to display the major mode.")

(put 'my-modeline-major-mode 'risky-local-variable t)





;; Emacs 29, check the definition right below
(mode-line-window-selected-p)

(defun mode-line-window-selected-p ()
  "Return non-nil if we're updating the mode line for the selected window.
This function is meant to be called in `:eval' mode line
constructs to allow altering the look of the mode line depending
on whether the mode line belongs to the currently selected window
or not."
  (let ((window (selected-window)))
    (or (eq window (old-selected-window))
	(and (minibuffer-window-active-p (minibuffer-window))
	     (with-selected-window (minibuffer-window)
	       (eq window (minibuffer-selected-window)))))))
```
