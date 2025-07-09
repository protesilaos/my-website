---
title: "Emacs: reorder Denote file name components"
excerpt: "Video where I explain how to use the 'denote-file-name-components-order' and retroactively make all your Denote files follow your preference."
layout: vlog
mediaid: "30uvxQMVqhg"
---

In this ~13-minute video I explain how to use the Denote user option
`denote-file-name-components-order`. Then I show how to retroactively
rename all the files that have the Denote file-naming scheme so that
they follow the desired order. In the process, I cover the command
`denote-sort-dired` (alias `denote-dired`), which helps produce a flat
listing of Denote files, even if they exist in subdirectories of the
`denote-directory`.

The code used in this video:

```elisp
;; The default:
(setq denote-file-name-components-order '(identifier signature title keywords))

;; Any order will work.  Here is the one I am using for this demonstation:
(setq denote-file-name-components-order '(identifier signature keywords title))

;; And here is another:
(setq denote-file-name-components-order '(identifier keywords title signature))

;; And yet another one for the sake of completeness:
(setq denote-file-name-components-order '(title keywords signature identifier))

(defun prot/denote-rename-all-to-reorder-components ()
  "Call `denote-dired-rename-files' without any prompts.
In other words, preserve the value of each Denote file name component.

Use this command if you wish to modify the user option
`denote-file-name-components-order' and then want your existing Denote
files to retroactively follow that order."
  (interactive)
  (let ((denote-prompts nil))
    (call-interactively 'denote-dired-rename-files)))
```
