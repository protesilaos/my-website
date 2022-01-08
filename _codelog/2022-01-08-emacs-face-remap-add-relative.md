---
title: "Emacs: buffer-local faces (face-remap-add-relative)"
excerpt: "A video demo on how to create buffer-local Emacs faces and how to write a minor-mode to enable those on demand (or with hooks)."
layout: vlog
mediaid: "zt0sCpA1Q54"
---

In this video presentation, I demonstrate how to change Emacs faces only
in specific contexts instead of using the standard methods which modify
their global value.

Context-dependent faces give us the freedom to particularise the
presentation of certain interfaces or major-modes.  I am already
implementing those ideas in my LIN package:
<https://protesilaos.com/emacs/lin>.

The code I use starts from the basics and culminates in the creation of
a minor-mode that can be invoked with `M-x` or via hooks.  It covers all
you need to get started.  Such techniques are also discussed in the
manual of my `modus-themes` package (built into Emacs 28 or higher):
<https://protesilaos.com/emacs/modus-themes>.

Below is the code I used for the demo:

```elisp
;; This is what we will be using:

(face-remap-add-relative SOURCE DEST)

;; To find the face at point, use M-x describe-char or type C-u C-x =
;;
;; To learn about all available faces from the loaded packages on your
;; system, use M-x list-faces-display
;;
;; Create a disposable buffer and evaluate the following (you'll soon
;; learn why a disposable buffer is needed):

(face-remap-add-relative 'font-lock-comment-face 'error)

;; The problem with what I just showed is that we cannot undo the
;; remapping with the code we used.
;;
;; The `face-remap-add-relative' returns what is known as a "cookie".
;; To revert the changes we need to know the cookie.  So we must store
;; that cookie in a variable.

(defvar-local my-comment-remap-cookie nil
  "Cookie of the last `face-remap-add-relative'.")

(setq my-comment-remap-cookie (face-remap-add-relative 'font-lock-comment-face 'error))

;; Now use `face-remap-remove-relative' on the cookie.

(face-remap-remove-relative my-comment-remap-cookie)

;; Let's now write our own face instead of relying on existing ones
;; (those may change and/or they may not suit our particular
;; requirements).

(defface my-comment-remap-style
  '((default :inherit italic)
    (((class color) (min-colors 88) (background light))
     :foreground "#904200")
    (((class color) (min-colors 88) (background dark))
     :foreground "#fba849")
    (t :foreground "yellow"))
  "Yellow-tinted text with slanted font (italics).")

(setq my-comment-remap-cookie
      (face-remap-add-relative 'font-lock-comment-face 'my-comment-remap-style))

(face-remap-remove-relative my-comment-remap-cookie)

;; Time to put our functionality in a minor-mode so we can activate it
;; whenever we want with M-x.

(define-minor-mode my-comment-remap-mode
  "Remap the face of comments."
  :local t
  :init-value nil
  (if my-comment-remap-mode
      (setq my-comment-remap-cookie
            (face-remap-add-relative 'font-lock-comment-face 'my-comment-remap-style))
    (face-remap-remove-relative my-comment-remap-cookie)))

;; Or you can use a hook (this one targets the mode of the *scratch*
;; buffer):
(add-hook 'lisp-interaction-mode-hook #'my-comment-remap-mode)
```
