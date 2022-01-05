---
title: "Emacs: custom faces for Org emphasis styles (org-emphasis-alist)"
excerpt: "A video demo on how to use custom faces (with defface) and how to configure the styles of Org emphasis notation (org-emphasis-alist)."
layout: vlog
mediaid: "ld1kAq_DswY"
---

In this video presentation, I demonstrate how to define Emacs "faces"
for the purposes of configuring the user option `org-emphasis-alist`.
In short: you can add more colours or alternative styles to your
`org-mode` buffers for the different styles of emphasis that the Org
notation supports.

This video can also be described as an introduction to using the
`defface` macro, as I explain all you need to know to get started.  A
face is a construct that holds display attributes, such as the colour of
the text or a background value, as well as typographic properties like a
bold weight and a slant.  Faces can evaluate conditions to determine
which set of attributes to apply.  In practical terms, this means that
we do not need different faces for light and dark themes: one definition
with the appropriate checks will suffice.

Below is the code I used for the demo:

```elisp
(setq org-emphasis-alist
      '(("*" bold)
        ("/" italic)
        ("_" underline)
        ("=" org-verbatim verbatim)
        ("~" org-code verbatim)
        ("+" (:strike-through t))))

(defface my-org-emphasis-bold
  '((default :inherit bold)
    (((class color) (min-colors 88) (background light))
     :foreground "#a60000")
    (((class color) (min-colors 88) (background dark))
     :foreground "#ff8059"))
  "My bold emphasis for Org.")

(defface my-org-emphasis-italic
  '((default :inherit italic)
    (((class color) (min-colors 88) (background light))
     :foreground "#005e00")
    (((class color) (min-colors 88) (background dark))
     :foreground "#44bc44"))
  "My italic emphasis for Org.")

(defface my-org-emphasis-underline
  '((default :inherit underline)
    (((class color) (min-colors 88) (background light))
     :foreground "#813e00")
    (((class color) (min-colors 88) (background dark))
     :foreground "#d0bc00"))
  "My underline emphasis for Org.")

(defface my-org-emphasis-strike-through
  '((((class color) (min-colors 88) (background light))
     :strike-through "#972500" :foreground "#505050")
    (((class color) (min-colors 88) (background dark))
     :strike-through "#ef8b50" :foreground "#a8a8a8"))
  "My strike-through emphasis for Org.")
```
