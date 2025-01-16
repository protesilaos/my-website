---
title: "Emacs: Org todo and agenda basics"
excerpt: "A video demonstration of using Org mode in Emacs to write and manage tasks."
layout: vlog
mediaid: "L0EJeN1fCYw"
---

In this ~45-minute video I cover the basics of managing your task list
with Org mode. The idea is to write tasks in a simple file and then
use the Org agenda views to display and filter the tasks you are
interested in. Throughout the video I also comment on relevant points
about the overall workflow. The basic configuration I show in the
video is below:

```elisp
;; These are the defaults we want to change.  We do so in the
;; following `use-package' declaration.
(setq org-M-RET-may-split-line '((default . t)))
(setq org-insert-heading-respect-content nil)
(setq org-log-done nil)
(setq org-log-into-drawer nil)


(use-package org
  :ensure nil ; do not try to install it as it is built-in
  :config
  (setq org-M-RET-may-split-line '((default . nil)))
  (setq org-insert-heading-respect-content t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-directory "/tmp/testing-org/")
  (setq org-agenda-files (list org-directory))

  ;; Learn about the ! and more by reading the relevant section of the
  ;; Org manual.  Evaluate: (info "(org) Tracking TODO state changes")
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAIT(w!)" "|" "CANCEL(c!)" "DONE(d!)"))))
```
