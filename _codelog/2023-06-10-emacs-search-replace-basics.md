---
title: "Emacs: basics of search and replace"
excerpt: "Video demonstration of Emacs' powerful tools for searching, searching and replacing, and more."
layout: vlog
mediaid: "f2mQXNnChwc"
---

Video overview of the powerful tools Emacs has to search files, create
a dynamic index of matches, search and replace, use grep and make
editable grep buffers, match strings or regular expressions, etc.

The code I showed in the video:

```elisp
;; Display a counter showing the number of the current and the other
;; matches.  Place it before the prompt, though it can be after it.
(setq isearch-lazy-count t)
(setq lazy-count-prefix-format "(%s/%s) ")
(setq lazy-count-suffix-format nil)

;; Make regular Isearch interpret the empty space as a regular
;; expression that matches any character between the words you give
;; it.
(setq search-whitespace-regexp ".*?")

;; Install the `wgrep' package.  It makes the grep buffers editable.

;; Install the `consult' package.  It provides lots of useful commands that
;; enhance the minibuffer experience of Emacs (e.g. for searching
;; lines/heading).

;; Install the `embark' package.  It allows you to perform context-sensitive
;; actions, using a prompt and then a key/action selection interface.
```
