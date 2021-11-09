---
title: "Emacs proof-of-concept: tweaked focused writing for Org"
excerpt: "Screenshot demo of a tweaked version of my “focused editing” tools for Emacs."
---

I was asked whether it would be possible to reproduce this aesthetic:
<https://lepisma.xyz/2017/10/28/ricing-org-mode/>

I do not want to use `writeroom-mode` because it assumes far more things
than the narrower-in-scope `olivetti-mode`.  So I am sticking with the
tools I presented in my last two videos:

+ [Emacs: configuring mixed fonts in Org mode](https://protesilaos.com/codelog/2020-07-16-emacs-focused-editing/)
+ [“Focused editing” tools for Emacs](https://protesilaos.com/codelog/2020-07-17-emacs-mixed-fonts-org/)

## Screenshots

So here are my two themes, Modus Operandi and Modus Vivendi, showcasing
the result.

**Remember to visit the image's direct link** to see it full size.  The
smaller view may distort some of its details.  Also bear in mind that
_this is a proof-of-concept_ that is done on an existing document.  I
did not prepare a fake environment that would make things look good.

<img alt="Modus Operandi single window" src="{{ '/assets/images/attachments/modus-operandi-org-focus-demo-single-2020-07-18.png' | absolute_url }}"/>

<img alt="Modus Operandi side-by-side windows" src="{{ '/assets/images/attachments/modus-operandi-org-focus-demo-dual-2020-07-18.png' | absolute_url }}"/>

<img alt="Modus Vivendi single window" src="{{ '/assets/images/attachments/modus-vivendi-org-focus-demo-single-2020-07-18.png' | absolute_url }}"/>

<img alt="Modus Vivendi side-by-side windows" src="{{ '/assets/images/attachments/modus-vivendi-org-focus-demo-dual-2020-07-18.png' | absolute_url }}"/>

Note that here I also enable a few theme-specific customisation options,
such as scaled headings and distinct org blocks (there are _a lot of
options_).  For Org blocks, you may also consider the "rainbow" symbol
that you can pass to the relevant variable (check [the project's
README](https://gitlab.com/protesilaos/modus-themes)), which applies a
colour-coded background on a per-programming-language basis (useful for
those who work with multiple languages in an Org buffer).

## The new state of affairs

Overview of what is new for this proof-of-concept when
`prot/olivetti-mode` is enabled:

+ Hides the leading stars from Org headings.  This is done by enabling
  `org-superstar-mode` and by making sure that the heading marks are
  empty, thus: `(setq org-superstar-headline-bullets-list '(" "))`
+ Configures the built-in `window-divider-mode` to draw 1px wide borders
  to the bottom and right sides of the windows.

To make the text look more book-like, I use the [Alegreya font by Huerta
Typografica](https://huertatipografica.com/en/fonts/alegreya-ht-pro),
employing the methods I already explained in my video for mixing fonts.

If you want to force Olivetti to push the contents of the buffer off
centre, you could increase the values of `olivetti-body-width` and/or
`olivetti-minimum-body-width` variable.  That would, however, not
produce a good effect when you have two windows side-by-side, so please
experiment accordingly.

For me this result is _prima facie_ both usable and visually pleasing.
If you really want to control more things with padding, then do consider
`writeroom-mode` instead of `olivetti-mode`.

If you wish to use the Modus themes but tweak some of their colours,
then I have good news for you: it is possible and supported!  Check the
README for the tools that the themes provide.

## New code snippets

Below are the little extras you would need (always in addition to what I
covered in the last two videos).  I already had configurations for
those, but I tweaked them a bit for the sake of this demo:

```elisp
(use-package org-superstar              ; supersedes `org-bullets'
  :ensure
  :after org
  :config
  (setq org-superstar-remove-leading-stars t)
  (setq org-superstar-headline-bullets-list '(" ")) ;; '("🞛" "◉" "○" "▷")
  (setq org-superstar-item-bullet-alist
        '((?+ . ?•)
          (?* . ?➤)
          (?- . ?–)))
  (org-superstar-mode -1))

(use-package emacs
  :config
  (setq window-divider-default-right-width 1)
  (setq window-divider-default-bottom-width 1)
  (setq window-divider-default-places t)
  (window-divider-mode -1))
```

And this is the new `prot/olivetti-mode`:

```elisp
(use-package olivetti
  :ensure
  :diminish
  :config
  (setq olivetti-body-width 0.65)
  (setq olivetti-minimum-body-width 72)
  (setq olivetti-recall-visual-line-mode-entry-state t)

  (define-minor-mode prot/olivetti-mode
    "Toggle buffer-local `olivetti-mode' with additional parameters.

Fringes are disabled.  The modeline is hidden, except for
`prog-mode' buffers (see `prot/hidden-mode-line-mode').  The
default typeface is set to a proportionately-spaced family,
except for programming modes (see `prot/variable-pitch-mode').
The cursor becomes a blinking bar, per `prot/cursor-type-mode'."
    :init-value nil
    :global nil
    (if prot/olivetti-mode
        (progn
          (olivetti-mode 1)
          (set-window-fringes (selected-window) 0 0)
          (prot/variable-pitch-mode 1)
          (prot/cursor-type-mode 1)
          (unless (derived-mode-p 'prog-mode)
            (prot/hidden-mode-line-mode 1))
          (window-divider-mode 1)
          (when (eq major-mode 'org-mode)
            (org-superstar-mode 1)))
      (olivetti-mode -1)
      (set-window-fringes (selected-window) nil) ; Use default width
      (prot/variable-pitch-mode -1)
      (prot/cursor-type-mode -1)
      (unless (derived-mode-p 'prog-mode)
        (prot/hidden-mode-line-mode -1))
      (window-divider-mode -1)
      (when (eq major-mode "org-mode")
        (org-superstar-mode -1))))

  :bind ("C-c o" . prot/olivetti-mode))
```

