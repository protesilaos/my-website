---
title: "Emacs: mark and register basics"
excerpt: "Video demonstration of Emacs tools to edit regions, store data persistently and access it again, as well as jump to files/locations."
layout: vlog
mediaid: "TJrAkCyH6Dk"
---

Video overview on how to use the mark and registers in Emacs to select
or edit text efficiently, as well as to quickly jump to points of
interest across files/buffers.  I also mention bookmarks, which are
functionally the same as registers.

Some basic configurations:

```elisp
;; Make Emacs repeat the C-u C-SPC command (`set-mark-command') by
;; following it up with another C-SPC.  It is faster to type
;; C-u C-SPC, C-SPC, C-SPC, than C-u C-SPC, C-u C-SPC, C-u C-SPC...
(setq set-mark-command-repeat-pop t)

;; By default, the built-in `savehist-mode' only keeps a record of
;; minibuffer histories.  This is helpful as it surfaces the most
;; recently selected items to the top, allowing you to access them again
;; very quickly.  With the variable `savehist-additional-variables' we
;; can make `savehist-mode' keep a record of any variable we want, so
;; that it persists between Emacs sessions.  I do this to store the
;; `kill-ring' and the `register-alist'.
(setq savehist-additional-variables '(register-alist kill-ring))

(savehist-mode 1)

;; I want Emacs to write the list of bookmarks to the `bookmark-file'
;; as soon as I set a new bookmark.  The default behaviour of Emacs is
;; to write to the disk as a final step before closing Emacs.  Though
;; this can lead to data loss, such as in the case of a power failure.
;; Storing the data outright mitigates this problem.
(defun prot/bookmark-save-no-prompt (&rest _)
  "Run `bookmark-save' without prompts.

The intent of this function is to be added as an :after advice to
`bookmark-set-internal'.  Concretely, this means that when
`bookmark-set-internal' is called, this function is called right
afterwards.  We set this up because there is no hook after
setting a bookmark and we want to automatically save bookmarks at
that point."
  (funcall 'bookmark-save))

(advice-add 'bookmark-set-internal :after 'prot/bookmark-save-no-prompt)

;; After publishing the above, I learnt about this variable, which has
;; the same effect as `prot/bookmark-save-no-prompt':
(setq bookmark-save-flag 1)

;; If you are using the wonderful `consult' package, set up the
;; register preview facility with its more informative presentation:
(setq register-preview-delay 0.8
      register-preview-function #'consult-register-format)
```

**UPDATE 2023-06-30 22:33 +0300:** Add two more snippets to the code block.
