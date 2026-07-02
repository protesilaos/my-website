---
title: "Emacs:  write with input method (e.g. French) and Jinx for spelling"
excerpt: "A short video demonstration of the tools I use to write in French using Emacs."
layout: vlog
mediaid: "UjCbNOqUgTs"
---

In this video demonstration I show the tools I use to write in French
using Emacs. One is the built-in framework for input methods, which
allows us to compose characters to express the full range of the
language we are typing in (e.g. French or Greek). The other is a
spell-checking package called `jinx`, which is developed by Daniel
Mendler.

Below is the code I showed in the video:

```elisp
(use-package emacs
  :demand t
  :bind
  ( :map global-map
    ;; The `toggle-input-method' sets the latest selected input
    ;; method, or the one defined in `default-input-method'.  Once an
    ;; input method is set, `toggle-input-method' will switch back to
    ;; the standard Emacs input.
    ("<f2>" . toggle-input-method))
  :config
  ;; Call the command `describe-input-method' to get a description of
  ;; what the given input method supports in terms of key sequences as
  ;; well as the key layout it has.
  (setq default-input-method "french-postfix"))



;; You need to have libenchant available on your system. For example,
;; Debian provides the package `libenchant-2-dev'.
(use-package jinx
  :ensure t
  :demand t
  :bind
  ( :map global-map
    ("M-$" . jinx-correct) ; or bind `jinx-correct-all'
    ("C-M-$" . jinx-languages))
  :config
  ;; Here you can specify a string with space-separated dictionaries.
  ;; I install the aspell dictionaries, such as the Debian package
  ;; `aspell-fr' for French and `aspell-el' for Greek (Éllinika).
  ;; With `aspell' installed on the system, do `aspell dicts' on the
  ;; command-line to get a list of available dictionaries.
  (setq jinx-languages "en fr el es")

  ;; I want to have Jinx in programming modes but I do not want it to
  ;; check anything that is a comment or string, because then it
  ;; underlines too many things which are not useful. We can do the
  ;; same for other modes, though I think this is fine.
  (setq jinx-exclude-faces
        '((prog-mode font-lock-comment-face font-lock-string-face)))

  (global-jinx-mode 1))
```
