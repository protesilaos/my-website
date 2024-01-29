---
title: "Emacs: define  prefix/leader key (nested key maps)"
excerpt: "Video demonstration on how to define a prefix key in Emacs using built-in tools."
layout: vlog
mediaid: "gojOZ3k1mmk"
---

In this ~24 minute video I show how to define a prefix key in Emacs
using built-in functionality. The idea is to organise our keys in an
efficient way. Using this method, we can have nested key maps as well,
meaning that the prefix key can have access to the contents of another
map which holds more key bindings. Put simply, we can have "C-z" as a
prefix, "C-z b" as a nested key maps for buffer-related commands, and
"C-z f" for file-related commands. This is a neat way to provide quick
access to our most used commands.

## A variant of what I had in my scratch buffer

In the video I also talked about the difference between `'` and `#'`,
as well as what the combination of backtick and comma is about.

```elisp
;; Read this to learn about key binding conventions so that you know
;; which keys are safe for users:
;;
;;     (info "(elisp) Key Binding Conventions")

;; Sample of a generic command with a corresponding key binding
(defun test-command ()
  (interactive)
  (message "Hello world"))

(keymap-set global-map "C-z" #'test-command)

;; Define key maps that will then be added to the prefix map
(defvar-keymap test-prefix-buffer-map
  :doc "My prefix key map for buffers."
  "s" #'save-buffer
  "w" #'write-file
  "p" #'previous-buffer
  "n" #'next-buffer)

(defvar-keymap test-prefix-mode-map
  :doc "My prefix key map for minor modes."
  "l" #'display-line-numbers-mode
  "h" #'hl-line-mode)

;; Define a key map with commands and nested key maps
(defvar-keymap test-prefix-map
  :doc "My prefix key map."
  "b" test-prefix-buffer-map
  "m" test-prefix-mode-map
  "f" #'find-file
  "d" #'dired)

;; Define how the nested keymaps are labelled in `which-key-mode'.
(which-key-add-keymap-based-replacements test-prefix-map
  "b" `("Buffer" . ,test-prefix-buffer-map)
  "m" `("Testing" . ,test-prefix-mode-map))

;; Bind the prefix key map to a key.  Notice the absence of a quote for
;; the map's symbol.
(keymap-set global-map "C-z" test-prefix-map)
  ```
