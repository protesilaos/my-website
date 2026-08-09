---
title: "Emacs: conditionally expand abbrev-mode definitions"
excerpt: "Video where I demonstrate how to define conditions for 'abbrev-mode' definitions, with practical examples."
layout: vlog
mediaid: "QzhU6fklc4o"
---

In this ~15-minute video I show how to add conditions to `abbrev-mode`
abbreviations that you define. The idea is to have those abbrevs
expand only in certain cases. I use three examples, which I think
cover the common needs.

## Code samples

```elisp
(defun my-french-p ()
  "Return non-nil if `current-input-method' is French."
  (and current-input-method
       (string-match-p "french" current-input-method)))

(define-abbrev global-abbrev-table "welcome" "je t'en prie" nil :enable-function #'my-french-p)


(defvar my-notes-directory (expand-file-name "~/.emacs.d/abbrev-test/")
  "Directory where my notes are.")

(defun my-notes-directory-p ()
  "Return non-nil if we are in `my-notes-directory' or its subdirectories."
  (let ((current-directory (expand-file-name default-directory)))
    (string-prefix-p my-notes-directory current-directory)))

(define-abbrev global-abbrev-table "prot" "p’rǒt" nil :enable-function #'my-notes-directory-p)


(defun my-notes-keycast-mode-p ()
  "Return non-nil if `keycast-mode-line-mode' is enabled."
  (bound-and-true-p keycast-mode-line-mode))

(define-abbrev global-abbrev-table "prot" "Protesilaos, also known as Prot" nil :enable-function #'my-notes-keycast-mode-p)
```
