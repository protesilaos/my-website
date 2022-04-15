---
title: "Introducing 'cursory' package for Emacs"
subtitle: "Manage cursor styles using presets"
excerpt: "Cursory is a simple package to manage Emacs cursor styles using presets."
---

I just published my new `cursory` package for Emacs.  For the time
being, it is only available through its [Git repo on
SourceHut](https://git.sr.ht/~protesilaos/cursory), though I plan to
eventually add it to GNU ELPA as well (as such, patches require
copyright assignment to the Free Software Foundation).

[ Read: [Moving all my Emacs projects to
SourceHut](https://protesilaos.com/codelog/2022-04-07-all-emacs-projects-sourcehut/)
(2022-04-07) ]

The package provides a thin wrapper around built-in variables that
affect the style of the Emacs cursor.  The intent is to allow the user
to define preset configurations such as "a block cursor style with a
slow blinking effect" or "a bar with faster blinking" and set them on
demand.

In my case, this is useful when I switch to focused reading or do a
presentation: I want to change the cursor from a prominent block to a
more subtle bar and apply relevant tweaks to the blinking speed.  This
is done manually by invoking the `cursory-set-preset` command, though it
is trivial to define a wrapper function and add it to a relevant hook
(the `cursory` manual will eventually document such scenaria).

Sample configuration:

```elisp
(require 'cursory)

(setq cursory-presets
      '((bar . ( :cursor-type (bar . 2)
                 :cursor-in-non-selected-windows hollow
                 :blink-cursor-blinks 10
                 :blink-cursor-interval 0.5
                 :blink-cursor-delay 0.2))

        (box  . ( :cursor-type box
                  :cursor-in-non-selected-windows hollow
                  :blink-cursor-blinks 10
                  :blink-cursor-interval 0.5
                  :blink-cursor-delay 0.2))

        (underscore . ( :cursor-type (hbar . 3)
                        :cursor-in-non-selected-windows hollow
                        :blink-cursor-blinks 50
                        :blink-cursor-interval 0.2
                        :blink-cursor-delay 0.2))))

(setq cursory-latest-state-file (locate-user-emacs-file "cursory-latest-state"))

(cursory-restore-latest-preset)

;; Set `cursory-recovered-preset' or fall back to desired style from
;; `cursory-presets'.
(if cursory-recovered-preset
    (cursory-set-preset cursory-recovered-preset)
  (cursory-set-preset 'bar))

;; The other side of `cursory-restore-latest-preset'.
(add-hook 'kill-emacs-hook #'cursory-store-latest-preset)

;; We have to use the "point" mnemonic, because C-c c is often the
;; suggested binding for `org-capture'.
(define-key global-map (kbd "C-c p") #'cursory-set-preset)
```
