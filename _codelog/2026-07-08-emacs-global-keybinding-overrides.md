---
title: "Emacs: global keybinding overrides"
excerpt: "A short video demonstration on how to define keys that can work in every buffer."
layout: vlog
mediaid: "D99GB591Vgo"
---

In this video I demonstrate how to define key bindings that have a
global overriding effect so that major modes cannot change them. This
is important if you want to redefine keys that are not meant to be
configured by the user.

Below is the code I showed in the video:

```elisp
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

(load-theme 'modus-operandi-tinted)

(use-package keycast
  :ensure t
  :config
  (keycast-mode-line-mode 1))

(set-face-attribute 'default nil :height 180)

;; Your only safe keys are documented here:
;; (info "(elisp) Key Binding Conventions")
(define-key global-map (kbd "M-o") 'other-window)

;; (define-key MAP KEY nil)

;; There is also `defvar-keymap'...
(defvar prot-overrides-mode-map (make-sparse-keymap)
  "Keymap for the `prot-overrides-mode'.")

(define-minor-mode prot-overrides-mode
  "Activate the `prot-overrides-mode-map'."
  :global t
  :init-value nil
  :keymap prot-overrides-mode-map)

(define-key prot-overrides-mode-map (kbd "M-o") 'other-window)
(define-key prot-overrides-mode-map (kbd "C-<return>") 'find-file)

(prot-overrides-mode 1)
```
