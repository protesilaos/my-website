---
title: "Emacs: abbreviations with abbrev-mode (quick text expansion)"
excerpt: "Video demonstration on how to use quick text-expansion in Emacs with the built-in 'abbrev-mode'."
layout: vlog
mediaid: "ruPpRlh2re4"
---

In this ~27 minute video, I explain how to use the built-in
`abbrev-mode` to define "abbreviations" for quick-yet-powerful text
expansion. I cover the most simple scenario and then go into more
technical implementations: (i) to use a function instead of a
predetermined text, and (ii) to expand what counts as an abbreviation
so as to use characters that are not word constituents.

Here is a variant of what I had in my scratch buffer:

```elisp
;;; Simple abbreviations

;; Abbrevs are grouped into "tables". The most specific table
;; overrides the more general one in case of a conflict.
(define-abbrev global-abbrev-table "metest" "a global abbrev for demo purposes")
(define-abbrev text-mode-abbrev-table "metest" "text-mode abbrev expansion here")
(define-abbrev org-mode-abbrev-table "metest" "org-mode abbrev")

;; `abbrev-mode' is buffer-local
(abbrev-mode 1) ; so this is WRONG

;; The following is the correct way to enable the buffer-local minor
;; mode where you want it. Remember the inheritence of major modes.
;;
;; Parent modes: `prog-mode' (programming), `text-mode' (prose).
(add-hook 'text-mode-hook 'abbrev-mode)

;;; Abbreviations that expand into some text by calling a function.

(defun my-current-time ()
  (insert (format-time-string "%T")))

(define-abbrev global-abbrev-table "metime" "" 'my-current-time)

;; This code is fine, but it does not work for abbrevs because the
;; function is called with no arguments.
;;
;; (defun my-greet-person (name)
;;   (interactive (list (read-string "Greet person: ")))
;;   (insert (format "Hello %s" name)))

;; So we use something like this instead of the above...
(defun my-greet-person ()
  (interactive)
  (insert (format "Hello %s" (read-string "Greet person: "))))

(define-abbrev global-abbrev-table "mehi" "" 'my-greet-person)

;;; Abbreviations with a modified match for word boundaries

(define-abbrev global-abbrev-table ":uni" "🦄")

;; We need to modify the properties of the abbreviation table to
;; accept characters that are not word consituents.
;;
;; We learn about `abbrev-table-put' and relevant properties from the
;; Elisp manual. Evaluate: (info "(elisp) Abbrev Table Properties")
(abbrev-table-put global-abbrev-table :regexp "\\(?:^\\|[\t\s]+\\)\\(?1:[:_].*\\|.*\\)")
  ```
