---
title: "Emacs: find a file in the 'denote-directory'"
excerpt: "Code samples that let you quickly find a file in the 'denote-directory'."
---

Because Denote files are standard files, we do not provide the
equivalent of a `find-file` command to directly open a file in the
`denote-directory`. Though users may still want to have that
functionality, which is easy to implement with what core Denote
already provides:

```elisp
(defun my-denote-find-file ()
  "Open a file in the variable `denote-directory'."
  (declare (interactive-only t))
  (interactive)
  (when-let* ((file (denote-file-prompt)))
    (find-file file)))
```

This can be extended to include commands that only match specific file
types or regular expressions in general. For example, here is how we
prompt only for files that include `.pdf` in their name and also
modify the minibuffer prompt to indicate what we are doing:

```elisp
(defun my-denote-find-file-pdf ()
  "Prompt for FILE in the variable `denote-directory' and open it."
  (declare (interactive-only t))
  (interactive)
  (when-let* ((file (denote-file-prompt "\\.pdf" "Prompt for PDF file")))
    (find-file file)))
```

To take it a step further, we can define a keymap which we may then
bind to a prefix key. This way we can access all the "Denote find
file" commands we have defined for ourselves:

```elisp
;; Define the keymap.  Notice the symbol of :prefix, which is used in
;; the `define-key' below.
(defvar-keymap my-denote-find-file-map
  :doc "Commands to find a file in the variable `denote-directory'."
  :prefix 'my-denote-find
  "f" #'my-denote-find-file
  "p" #'my-denote-find-file-pdf)

;; Pick a suitable prefix key.  Here we use C-c f.  So
;; `my-denote-find-file' is this: C-c f f.
(define-key global-map (kbd "C-c f") 'my-denote-find)
```

Putting it all together:

```elisp
;; Use this as a template to define as many commands as you need, like
;; with `my-denote-find-file-pdf'.
(defun my-denote-find-file ()
  "Open a file in the variable `denote-directory'."
  (declare (interactive-only t))
  (interactive)
  (when-let* ((file (denote-file-prompt)))
    (find-file file)))

(defun my-denote-find-file-pdf ()
  "Prompt for FILE in the variable `denote-directory' and open it."
  (declare (interactive-only t))
  (interactive)
  (when-let* ((file (denote-file-prompt "\\.pdf" "Find PDF file")))
    (find-file file)))

;; Define the keymap.  Notice the symbol of :prefix, which is used in
;; the `define-key' below.
(defvar-keymap my-denote-find-file-map
  :doc "Commands to find a file in the variable `denote-directory'."
  :prefix 'my-denote-find
  "f" #'my-denote-find-file
  "p" #'my-denote-find-file-pdf)

;; Pick a suitable prefix key.  Here we use C-c f.  So
;; `my-denote-find-file' is this: C-c f f.
(define-key global-map (kbd "C-c f") 'my-denote-find)
```

Enjoy!
