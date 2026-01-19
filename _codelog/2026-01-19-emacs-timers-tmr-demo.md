---
title: "Emacs: easily set timers with TMR"
excerpt: "Video demo of my 'tmr' package for Emacs. It helps you set timers interactively and provides relevant utilities."
layout: vlog
mediaid: "vLuyt0hq4io"
---

In this ~15-minute video I demonstrate a package of mine called `tmr`
(pronounced as an acronym or as "timer"). It uses a simple notation to
set the duration of a timer at the minibuffer prompt. Once the timer
elapses, Emacs shows a notification. The desktop environment will also
include one, as well as an audio alert (those are configurable).
Timers can optionally have a description. They may also be listed in a
tabulated/grid view, which makes it easier to work with them (to edit
their description, reschedule them, etc.). Running timers may also be
displayed on the mode line.

## Sample configuration

```elisp
(use-package tmr
  :ensure t
  :config
  (define-key global-map (kbd "C-c t") #'tmr-prefix-map)
  (setq tmr-sound-file "/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"
        tmr-notification-urgency 'normal
        tmr-description-list 'tmr-description-history))
```

## TMR sources

+ Package name (GNU ELPA): `tmr`
+ Official manual: <https://protesilaos.com/emacs/tmr>
+ Change log: <https://protesilaos.com/emacs/tmr-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/tmr>
  + GitLab: <https://gitlab.com/protesilaos/tmr>
+ Backronym: TMR May Ring; Timer Must Run.
