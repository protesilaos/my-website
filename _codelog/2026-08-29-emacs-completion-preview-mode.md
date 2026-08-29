---
title: "Emacs: completion-preview-mode and the Completions buffer (Emacs 31)"
excerpt: "The built-in completion-preview-mode combines nicely with the Completions buffer. This is excellent in Emacs 31."
layout: vlog
mediaid: "8V4ZyEL_i-s"
---

The built-in `completion-preview-mode` lets us expand what we type in
a minimalist, distraction-free way. It can also be combined with the
default Completions buffer to show all the available options. The
Completions buffer has several nice features, starting with Emacs 31,
which make this an excellent combination that does not require any
third party packages (though packages can still augment the overall
experience). I also mention the Emacs 31 'newcomers-presets' theme,
which configures some of these options as well: it is a great way to
start your Emacs configuration.

## Sample configuration

```elisp
(use-package completion-preview
  :ensure nil
  :demand t
  :bind
  ( :map completion-preview-active-mode-map
    ("M-i" . completion-preview-insert-word)
    ("M-n" . completion-preview-next-candidate)
    ("M-p" . completion-preview-prev-candidate)
    ("M-<return>" . completion-preview-insert)
    ;; With TAB we effectively defer to the *Completions* buffer to
    ;; show more completion candidates at once.
    ("<tab>" . completion-preview-complete))
  :config
  (setq completion-preview-minimum-symbol-length 2)
  (global-completion-preview-mode 1))

;; I have a more detailed configuration (and explanation) that works
;; with Emacs 31 built-in completion capabilities:
;; https://protesilaos.com/codelog/2026-07-29-emacs-default-minibuffer-completion-overview/.
(use-package minibuffer
  :ensure nil
  :demand t
  :bind
  ( :map completion-in-region-mode-map
    ("M-i" . minibuffer-choose-completion)
    ("M-n" . minibuffer-next-completion)
    ("M-p" . minibuffer-previous-completion))
  :config
  (setq completions-format 'one-column)
  (setq completions-max-height 12)
  (setq completion-auto-help t)
  (setq completion-auto-select nil)
  (setq minibuffer-visible-completions t)
  (setq completion-eager-update t))
```

Finally, the `newcomers-presets` theme is an excellent way to start
your configuration. It is available as part of Emacs 31. Put this at
the top of your `init.el`:

```elisp
(load-theme 'newcomers-presets)
```
