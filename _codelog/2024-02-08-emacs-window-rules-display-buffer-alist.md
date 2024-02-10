---
title: "Emacs: control where buffers are displayed (the 'display-buffer-alist')"
excerpt: "Video demonstration on how to control the placement of Emacs buffers in windows."
layout: vlog
mediaid: "1-UIzYPn38s"
---

In this ~30 minute video I show how to tell Emacs where to place
specific buffers. The idea is to have a set of rules that specify how
you want Emacs to make use of the available space in the frame and
which windows to use. Below I show some basic code samples. For more
advanced uses, refer to my relevant section in Emacs configuration:
<https://protesilaos.com/emacs/dotemacs#h:50f8b1e4-b14e-453f-a37e-1c0e495ab80f>.

## Sample code with basic rules

```elisp
(setq display-buffer-alist
      '(

        ;; The added space is for didactic purposes

        ;; Each entry in this list has this anatomy:

        ;; ( BUFFER-MATCHING-RULE
        ;;   LIST-OF-DISPLAY-BUFFER-FUNCTIONS
        ;;   OPTIONAL-PARAMETERS)

        ;; Match a buffer whose name is "*Occur*".  We have to escape
        ;; the asterisks to match them literally and not as a special
        ;; regular expression character.
        ("\\*Occur\\*"
         ;; If a buffer with the matching major-mode exists in some
         ;; window, then use that one.  Otherwise, display the buffer
         ;; below the current window.
         (display-buffer-reuse-mode-window display-buffer-below-selected)
         ;; Then we have the parameters...
         (dedicated . t)
         (window-height . fit-window-to-buffer))

        ))

;; If you want `switch-to-buffer' and related to respect those rules
;; (I personally do not want this, because if I am switching to a
;; specific buffer in the current window, I probably have a good
;; reason for it):
(setq switch-to-buffer-obey-display-actions t)

;; If you are in a window that is dedicated to its buffer and try to
;; `switch-to-buffer' there, tell Emacs to pop a new window instead of
;; using the current one:
(setq switch-to-buffer-in-dedicated-window 'pop)

;; Other relevant variables which control when Emacs splits the frame
;; vertically or horizontally, with some sample values (do `M-x
;; describe-variable' and search for those variables to learn more
;; about them):
(setq split-height-threshold 80)
(setq split-width-threshold 125)

;; Evaluate these to get to the relevant entries in the manual (NOTE
;; that this is advanced stuff):
(info "(elisp) Displaying Buffers")
(info "(elisp) Buffer Display Action Functions")
(info "(elisp) Buffer Display Action Alists")
(info "(elisp) Window Parameters")
```

## More links to my Emacs configuration

My personal Emacs configuration.  It is comprehensive, both in terms of
the [custom] code it contains as well as the documentation on what each
piece of functionality does.

+ Website: <https://protesilaos.com/emacs/dotemacs>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/dotfiles>
  + GitLab: <https://gitlab.com/protesilaos/dotfiles>
+ Video demo: <https://protesilaos.com/codelog/2023-12-18-emacs-org-advanced-literate-conf/>
+ Backronym: Do Observe, Transpose, Examine, or Mirror All
  Configurations, Stranger (dotemacs); Dotfiles Operate Transparently
  For the Included Linux and Emacs Setups (dotfiles).
