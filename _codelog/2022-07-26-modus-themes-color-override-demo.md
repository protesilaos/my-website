---
title: "Emacs: the Modus themes “Summertime” re-spin"
subtitle: "Complete demo of overriding the colours of the Modus themes"
excerpt: "A fully fledged demo of overriding the colours of the Modus themes using the customisation options they provide."
---

[ Note that I am working with the current development version:
  `2.5.0-dev`.  The version of the `modus-themes` built into Emacs 28 is
  `1.6.0`, while Emacs 29 is on `2.4.0`. ]

One of the powerful features of the `modus-themes` that I have not
covered before is the ability to override any colour in their palette.
The manual provides several examples, though none of them offers a fully
fledged, bespoke derivative.

The idea is to let the user introduce changes that may deviate from the
high accessibility standards of the original design.  Perhaps to alter a
hue or, if the user is feeling adventurous, to restyle the themes while
still benefiting from their customisation options, broad coverage of
packages, and meticulous design.

Here I will elaborate on the latter scenario of thoroughly refashioning
the themes.  I am turning these:

<a href="{{'/assets/images/attachments/2022-07-26-modus-themes-summertime-demo-regular-operandi.png' | absolute_url }}"><img alt="modus-themes-summertime-demo-regular-operandi sample" src="{{ '/assets/images/attachments/2022-07-26-modus-themes-summertime-demo-regular-operandi.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2022-07-26-modus-themes-summertime-demo-regular-vivendi.png' | absolute_url }}"><img alt="modus-themes-summertime-demo-regular-vivendi sample" src="{{ '/assets/images/attachments/2022-07-26-modus-themes-summertime-demo-regular-vivendi.png' | absolute_url }}"/></a>

Into these:

<a href="{{'/assets/images/attachments/2022-07-26-modus-themes-summertime-demo-override-operandi.png' | absolute_url }}"><img alt="modus-themes-summertime-demo-override-operandi sample" src="{{ '/assets/images/attachments/2022-07-26-modus-themes-summertime-demo-override-operandi.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2022-07-26-modus-themes-summertime-demo-override-vivendi.png' | absolute_url }}"><img alt="modus-themes-summertime-demo-override-vivendi sample" src="{{ '/assets/images/attachments/2022-07-26-modus-themes-summertime-demo-override-vivendi.png' | absolute_url }}"/></a>

[ Remember that the themes have **lots of customisation options** which
  govern the looks of individual components.  The screenshots do not
  cover everything. ]

## The basics of overriding the palette

The user options are `modus-themes-operandi-color-overrides` and
`modus-themes-vivendi-color-overrides` (`modus-operandi` is the light
theme and `modus-vivendi` is the dark one).  To make best use of them,
the user needs to inspect the source code and learn from the constants
`modus-themes-operandi-colors` and `modus-themes-vivendi-colors`.
Essentially, the user mirrors the palette while changing the
corresponding colour value.  Then reloads the theme for changes to take
effect.  Concretely:

```elisp
;; Override the given associations
(setq modus-themes-operandi-color-overrides
      '((bg-main . "#fff0f2") ; default is #ffffff
        (bg-dim . "#fbe6ef")  ; default is #f8f8f8
        (bg-alt . "#f5dae6")  ; default is #f0f0f0
        ;; more colours here
        ))

;; Load `modus-operandi' while disabling all others
(modus-themes-load-operandi)
```

As with all customisation options, changes are made manifest after
loading the theme.  So if one tweaks the overrides, they need to reload
the theme.

## Setting overrides on demand via a minor mode

In my workflow, I prefer to define a minor mode that applies the
overrides.  This gives me the flexibility to switch between the original
and the custom looks via `M-x` or a key binding.  Building on the
previous example:

```elisp
(define-minor-mode my-modus-themes-overrides
  "Toggle overrides demo."
  :init-value nil
  :global t
  (if my-modus-themes-overrides
      ;; Override the given associations when the minor mode is enabled
      (setq modus-themes-operandi-color-overrides
            '((bg-main . "#fff0f2") ; default is #ffffff
              (bg-dim . "#fbe6ef")  ; default is #f8f8f8
              (bg-alt . "#f5dae6")  ; default is #f0f0f0
              ;; more colours here
              ))
    ;; Remove the overrides if the minor mode is disabled
    (setq modus-themes-operandi-color-overrides nil)))
```

In this scenario, we would enable the minor mode and then load the theme
for changes to propagate.

Notice that I am only overriding `modus-operandi` in these examples.  It
is, of course, possible to extend this to `modus-vivendi` as well.  More
on that below.

## The "Summertime" re-spin

A hand-crafted derivative is no mean task.  One needs to check how all
colours work together in the relevant contexts or interfaces.  What I
have here is a pair of colour palettes that I have been using for the
last 10 days.  They give a playful, pleasant, and confident vibe.

```elisp
(setq modus-themes-operandi-color-overrides
      '((bg-main . "#fff0f2")
        (bg-dim . "#fbe6ef")
        (bg-alt . "#f5dae6")
        (bg-hl-line . "#fad8e3")
        (bg-active . "#efcadf")
        (bg-inactive . "#f3ddef")
        (bg-active-accent . "#ffbbef")
        (bg-region . "#dfc5d1")
        (bg-region-accent . "#efbfef")
        (bg-region-accent-subtle . "#ffd6ef")
        (bg-header . "#edd3e0")
        (bg-tab-active . "#ffeff2")
        (bg-tab-inactive . "#f8d3ef")
        (bg-tab-inactive-accent . "#ffd9f5")
        (bg-tab-inactive-alt . "#e5c0d5")
        (bg-tab-inactive-alt-accent . "#f3cce0")
        (fg-main . "#543f78")
        (fg-dim . "#5f476f")
        (fg-alt . "#7f6f99")
        (fg-unfocused . "#8f6f9f")
        (fg-active . "#563068")
        (fg-inactive . "#8a5698")
        (fg-docstring . "#5f5fa7")
        (fg-comment-yellow . "#a9534f")
        (fg-escape-char-construct . "#8b207f")
        (fg-escape-char-backslash . "#a06d00")
        (bg-special-cold . "#d3e0f4")
        (bg-special-faint-cold . "#e0efff")
        (bg-special-mild . "#c4ede0")
        (bg-special-faint-mild . "#e0f0ea")
        (bg-special-warm . "#efd0c4")
        (bg-special-faint-warm . "#ffe4da")
        (bg-special-calm . "#f0d3ea")
        (bg-special-faint-calm . "#fadff9")
        (fg-special-cold . "#405fb8")
        (fg-special-mild . "#407f74")
        (fg-special-warm . "#9d6f4f")
        (fg-special-calm . "#af509f")
        (bg-completion . "#ffc5e5")
        (bg-completion-subtle . "#f7cfef")
        (red . "#ed2f44")
        (red-alt . "#e0403d")
        (red-alt-other . "#e04059")
        (red-faint . "#ed4f44")
        (red-alt-faint . "#e0603d")
        (red-alt-other-faint . "#e06059")
        (green . "#217a3c")
        (green-alt . "#417a1c")
        (green-alt-other . "#006f3c")
        (green-faint . "#318a4c")
        (green-alt-faint . "#518a2c")
        (green-alt-other-faint . "#20885c")
        (yellow . "#b06202")
        (yellow-alt . "#a95642")
        (yellow-alt-other . "#a06f42")
        (yellow-faint . "#b07232")
        (yellow-alt-faint . "#a96642")
        (yellow-alt-other-faint . "#a08042")
        (blue . "#275ccf")
        (blue-alt . "#475cc0")
        (blue-alt-other . "#3340ef")
        (blue-faint . "#476ce0")
        (blue-alt-faint . "#575ccf")
        (blue-alt-other-faint . "#3f60d7")
        (magenta . "#bf317f")
        (magenta-alt . "#d033c0")
        (magenta-alt-other . "#844fe4")
        (magenta-faint . "#bf517f")
        (magenta-alt-faint . "#d053c0")
        (magenta-alt-other-faint . "#846fe4")
        (cyan . "#007a9f")
        (cyan-alt . "#3f709f")
        (cyan-alt-other . "#107f7f")
        (cyan-faint . "#108aaf")
        (cyan-alt-faint . "#3f80af")
        (cyan-alt-other-faint . "#3088af")
        (red-active . "#cd2f44")
        (green-active . "#116a6c")
        (yellow-active . "#993602")
        (blue-active . "#475ccf")
        (magenta-active . "#7f2ccf")
        (cyan-active . "#007a8f")
        (red-nuanced-bg . "#ffdbd0")
        (red-nuanced-fg . "#ed6f74")
        (green-nuanced-bg . "#dcf0dd")
        (green-nuanced-fg . "#3f9a4c")
        (yellow-nuanced-bg . "#fff3aa")
        (yellow-nuanced-fg . "#b47232")
        (blue-nuanced-bg . "#e3e3ff")
        (blue-nuanced-fg . "#201f6f")
        (magenta-nuanced-bg . "#fdd0ff")
        (magenta-nuanced-fg . "#c0527f")
        (cyan-nuanced-bg . "#dbefff")
        (cyan-nuanced-fg . "#0f3f60")
        (bg-diff-heading . "#b7cfe0")
        (fg-diff-heading . "#041645")
        (bg-diff-added . "#d6f0d6")
        (fg-diff-added . "#004520")
        (bg-diff-changed . "#fcefcf")
        (fg-diff-changed . "#524200")
        (bg-diff-removed . "#ffe0ef")
        (fg-diff-removed . "#891626")
        (bg-diff-refine-added . "#84cfa4")
        (fg-diff-refine-added . "#002a00")
        (bg-diff-refine-changed . "#cccf8f")
        (fg-diff-refine-changed . "#302010")
        (bg-diff-refine-removed . "#da92b0")
        (fg-diff-refine-removed . "#500010")
        (bg-diff-focus-added . "#a6e5c6")
        (fg-diff-focus-added . "#002c00")
        (bg-diff-focus-changed . "#ecdfbf")
        (fg-diff-focus-changed . "#392900")
        (bg-diff-focus-removed . "#efbbcf")
        (fg-diff-focus-removed . "#5a0010"))
      modus-themes-vivendi-color-overrides
      '((bg-main . "#25152a")
        (bg-dim . "#2a1930")
        (bg-alt . "#382443")
        (bg-hl-line . "#332650")
        (bg-active . "#463358")
        (bg-inactive . "#2d1f3a")
        (bg-active-accent . "#50308f")
        (bg-region . "#5d4a67")
        (bg-region-accent . "#60509f")
        (bg-region-accent-subtle . "#3f285f")
        (bg-header . "#3a2543")
        (bg-tab-active . "#26162f")
        (bg-tab-inactive . "#362647")
        (bg-tab-inactive-accent . "#36265a")
        (bg-tab-inactive-alt . "#3e2f5a")
        (bg-tab-inactive-alt-accent . "#3e2f6f")
        (fg-main . "#debfe0")
        (fg-dim . "#d0b0da")
        (fg-alt . "#ae85af")
        (fg-unfocused . "#8e7f9f")
        (fg-active . "#cfbfef")
        (fg-inactive . "#b0a0c0")
        (fg-docstring . "#c8d9f7")
        (fg-comment-yellow . "#cf9a70")
        (fg-escape-char-construct . "#ff75aa")
        (fg-escape-char-backslash . "#dbab40")
        (bg-special-cold . "#2a3f58")
        (bg-special-faint-cold . "#1e283f")
        (bg-special-mild . "#0f3f31")
        (bg-special-faint-mild . "#0f281f")
        (bg-special-warm . "#44331f")
        (bg-special-faint-warm . "#372213")
        (bg-special-calm . "#4a314f")
        (bg-special-faint-calm . "#3a223f")
        (fg-special-cold . "#c0b0ff")
        (fg-special-mild . "#bfe0cf")
        (fg-special-warm . "#edc0a6")
        (fg-special-calm . "#ff9fdf")
        (bg-completion . "#502d70")
        (bg-completion-subtle . "#451d65")
        (red . "#ff5f6f")
        (red-alt . "#ff8f6d")
        (red-alt-other . "#ff6f9d")
        (red-faint . "#ffa0a0")
        (red-alt-faint . "#f5aa80")
        (red-alt-other-faint . "#ff9fbf")
        (green . "#51ca5c")
        (green-alt . "#71ca3c")
        (green-alt-other . "#51ca9c")
        (green-faint . "#78bf78")
        (green-alt-faint . "#99b56f")
        (green-alt-other-faint . "#88bf99")
        (yellow . "#f0b262")
        (yellow-alt . "#f0e242")
        (yellow-alt-other . "#d0a272")
        (yellow-faint . "#d2b580")
        (yellow-alt-faint . "#cabf77")
        (yellow-alt-other-faint . "#d0ba95")
        (blue . "#778cff")
        (blue-alt . "#8f90ff")
        (blue-alt-other . "#8380ff")
        (blue-faint . "#82b0ec")
        (blue-alt-faint . "#a0acef")
        (blue-alt-other-faint . "#80b2f0")
        (magenta . "#ff70cf")
        (magenta-alt . "#ff77f0")
        (magenta-alt-other . "#ca7fff")
        (magenta-faint . "#e0b2d6")
        (magenta-alt-faint . "#ef9fe4")
        (magenta-alt-other-faint . "#cfa6ff")
        (cyan . "#30cacf")
        (cyan-alt . "#60caff")
        (cyan-alt-other . "#40b79f")
        (cyan-faint . "#90c4ed")
        (cyan-alt-faint . "#a0bfdf")
        (cyan-alt-other-faint . "#a4d0bb")
        (red-active . "#ff6059")
        (green-active . "#64dc64")
        (yellow-active . "#ffac80")
        (blue-active . "#4fafff")
        (magenta-active . "#cf88ff")
        (cyan-active . "#50d3d0")
        (red-nuanced-bg . "#440a1f")
        (red-nuanced-fg . "#ffcccc")
        (green-nuanced-bg . "#002904")
        (green-nuanced-fg . "#b8e2b8")
        (yellow-nuanced-bg . "#422000")
        (yellow-nuanced-fg . "#dfdfb0")
        (blue-nuanced-bg . "#1f1f5f")
        (blue-nuanced-fg . "#bfd9ff")
        (magenta-nuanced-bg . "#431641")
        (magenta-nuanced-fg . "#e5cfef")
        (cyan-nuanced-bg . "#042f49")
        (cyan-nuanced-fg . "#a8e5e5")
        (bg-diff-heading . "#304466")
        (fg-diff-heading . "#dae7ff")
        (bg-diff-added . "#0a383a")
        (fg-diff-added . "#94ba94")
        (bg-diff-changed . "#2a2000")
        (fg-diff-changed . "#b0ba9f")
        (bg-diff-removed . "#50163f")
        (fg-diff-removed . "#c6adaa")
        (bg-diff-refine-added . "#006a46")
        (fg-diff-refine-added . "#e0f6e0")
        (bg-diff-refine-changed . "#585800")
        (fg-diff-refine-changed . "#ffffcc")
        (bg-diff-refine-removed . "#952838")
        (fg-diff-refine-removed . "#ffd9eb")
        (bg-diff-focus-added . "#1d4c3f")
        (fg-diff-focus-added . "#b4dfb4")
        (bg-diff-focus-changed . "#424200")
        (fg-diff-focus-changed . "#d0daaf")
        (bg-diff-focus-removed . "#6f0f39")
        (fg-diff-focus-removed . "#eebdba")))
```

## The basics of the configuration

In terms of properly sequencing the individual snippets of code in the
user's configuration, we would have this order:

```elisp
(require 'modus-themes)

;; User options here:
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t
      ;; All other user options here
      )

;; Overrides here:
(setq modus-themes-operandi-color-overrides
      '((bg-main . "#fff0f2")
        (bg-dim . "#fbe6ef")
        (bg-alt . "#f5dae6")
        ;; more colours for `modus-operandi'...
        )
      modus-themes-vivendi-color-overrides
      '((bg-main . "#25152a")
        (bg-dim . "#2a1930")
        (bg-alt . "#382443")
        ;; more colours for `modus-vivendi'...
        ))

;; Load the theme files before enabling a theme (else you might get an
;; error depending on your setup).
(modus-themes-load-themes)

;; Load the theme of your preference:
(modus-themes-load-operandi) ; OR (modus-themes-load-vivendi)

;; Optionally set the `modus-themes-toggle' to a key binding:
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)
```

Notice that in the above block the overrides are set unconditionally.
If we want the aforementioned minor mode, we just do this instead:

```elisp
(require 'modus-themes)

;; User options here:
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t
      ;; All other user options here
      )

;; Overrides here:
(define-minor-mode my-modus-themes-overrides
  "Toggle overrides."
  :init-value nil
  :global t
  (setq modus-themes-operandi-color-overrides
        '((bg-main . "#fff0f2")
          (bg-dim . "#fbe6ef")
          (bg-alt . "#f5dae6")
          ;; more colours for `modus-operandi'...
          )
        modus-themes-vivendi-color-overrides
        '((bg-main . "#25152a")
          (bg-dim . "#2a1930")
          (bg-alt . "#382443")
          ;; more colours for `modus-vivendi'...
          ))
  (setq modus-themes-operandi-color-overrides nil
        modus-themes-vivendi-color-overrides nil))

;; Load the theme files before enabling a theme (else you might get an
;; error depending on your setup).
(modus-themes-load-themes)

;; Load the theme of your preference:
(modus-themes-load-operandi) ; OR (modus-themes-load-vivendi)

;; Optionally set the `modus-themes-toggle' to a key binding:
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)
```

Now the minor mode is declared but it does not run at startup.  We would
need to manually enable it with `M-x` (or by assigning it to a key
binding).

Though we can enable the minor mode right before loading the theme.  In
the above snippet, replace:

```elisp
(modus-themes-load-operandi)
```

With:

```elisp
(my-modus-themes-overrides 1)
(modus-themes-load-operandi)
```

## The complete annotated setup from my dotemacs

The upside of the overrides is that we retain the rest of the Modus
themes' functionality, including all their user options and concomitant
advance configuration mechanisms (as explained in the manual's numerous
do-it-yourself sections).  In my setup, I do not enable the minor mode
at startup.  I do it via `M-x`.  Though you can tweak things as I
explained above.  And if something remains unclear, you are welcome to
[contact me](https://protesilaos.com/contact).

What follows is a slightly tweaked variant of [my own
setup](https://git.sr.ht/~protesilaos/dotfiles/tree/master/item/emacs/.emacs.d/prot-emacs-modules/prot-emacs-theme.el).
Note that I periodically change the user options for testing purposes,
so what is recorded herein is not necessarily my number one preference.
Also be aware that the minor mode with the overrides is called
`modus-themes-summertime`:

```elisp
;;; The Modus themes

;; These are built into Emacs 28 or higher, though I use the package for
;; my development purposes (I need to make sure it always builds cleanly
;; and works properly).

;; Read their manual with Emacs' Info reader, or visit:
;; <https://protesilaos.com/emacs/modus-themes>.
(require 'modus-themes)

;; Add all your customizations prior to loading the themes
;;
;; NOTE: these are not my preferences!  I am always testing various
;; configurations.  Though I still like what I have here.
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t
      modus-themes-mixed-fonts t
      modus-themes-subtle-line-numbers t
      modus-themes-intense-mouseovers nil
      modus-themes-deuteranopia nil
      modus-themes-tabs-accented nil
      modus-themes-variable-pitch-ui t
      modus-themes-inhibit-reload t ; only applies to `customize-set-variable' and related

      modus-themes-fringes nil ; {nil,'subtle,'intense}

      ;; Options for `modus-themes-lang-checkers' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `straight-underline', `text-also', `background',
      ;; `intense' OR `faint'.
      modus-themes-lang-checkers nil

      ;; Options for `modus-themes-mode-line' are either nil, or a list
      ;; that can combine any of `3d' OR `moody', `borderless',
      ;; `accented', a natural number for extra padding (or a cons cell
      ;; of padding and NATNUM), and a floating point for the height of
      ;; the text relative to the base font size (or a cons cell of
      ;; height and FLOAT)
      modus-themes-mode-line '(accented)

      ;; Options for `modus-themes-markup' are either nil, or a list
      ;; that can combine any of `bold', `italic', `background',
      ;; `intense'.
      modus-themes-markup nil

      ;; Options for `modus-themes-syntax' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `faint', `yellow-comments', `green-strings', `alt-syntax'
      modus-themes-syntax nil

      ;; Options for `modus-themes-hl-line' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `accented', `underline', `intense'
      modus-themes-hl-line nil

      ;; Options for `modus-themes-paren-match' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `bold', `intense', `underline'
      modus-themes-paren-match '(bold)

      ;; Options for `modus-themes-links' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `neutral-underline' OR `no-underline', `faint' OR `no-color',
      ;; `bold', `italic', `background'
      modus-themes-links '(neutral-underline)

      ;; Options for `modus-themes-box-buttons' are either nil (the
      ;; default), or a list that can combine any of `flat',
      ;; `accented', `faint', `variable-pitch', `underline',
      ;; `all-buttons', the symbol of any font weight as listed in
      ;; `modus-themes-weights', and a floating point number
      ;; (e.g. 0.9) for the height of the button's text.
      modus-themes-box-buttons nil

      ;; Options for `modus-themes-prompts' are either nil (the
      ;; default), or a list of properties that may include any of those
      ;; symbols: `background', `bold', `gray', `intense', `italic'
      modus-themes-prompts nil

      ;; The `modus-themes-completions' is an alist that reads three
      ;; keys: `matches', `selection', `popup'.  Each accepts a nil
      ;; value (or empty list) or a list of properties that can include
      ;; any of the following (for WEIGHT read further below):
      ;;
      ;; `matches' - `background', `intense', `underline', `italic', WEIGHT
      ;; `selection' - `accented', `intense', `underline', `italic', `text-also', WEIGHT
      ;; `popup' - same as `selected'
      ;; `t' - applies to any key not explicitly referenced (check docs)
      ;;
      ;; WEIGHT is a symbol such as `semibold', `light', or anything
      ;; covered in `modus-themes-weights'.  Bold is used in the absence
      ;; of an explicit WEIGHT.
      modus-themes-completions
      '((matches . (semibold))
        (selection . (extrabold accented))
        (popup . (extrabold accented)))

      modus-themes-mail-citations nil ; {nil,'intense,'faint,'monochrome}

      ;; Options for `modus-themes-region' are either nil (the default),
      ;; or a list of properties that may include any of those symbols:
      ;; `no-extend', `bg-only', `accented'
      modus-themes-region '(accented no-extend)

      ;; Options for `modus-themes-diffs': nil, 'desaturated, 'bg-only
      modus-themes-diffs nil

      modus-themes-org-blocks 'gray-background ; {nil,'gray-background,'tinted-background}

      modus-themes-org-agenda ; this is an alist: read the manual or its doc string
      '((header-block . (variable-pitch light 1.6))
        (header-date . (underline-today grayscale workaholic 1.2))
        (event . (accented italic varied))
        (scheduled . rainbow)
        (habit . simplified))

      ;; The `modus-themes-headings' is an alist with lots of possible
      ;; combinations, include per-heading-level tweaks: read the
      ;; manual or its doc string
      modus-themes-headings
      '((0 . (variable-pitch light (height 2.2)))
        (1 . (rainbow variable-pitch light (height 1.6)))
        (2 . (rainbow variable-pitch light (height 1.4)))
        (3 . (rainbow variable-pitch regular (height 1.3)))
        (4 . (rainbow regular (height 1.2)))
        (5 . (rainbow (height 1.1)))
        (t . (variable-pitch extrabold))))

;; Load the theme files before enabling a theme (else you get an error).
(modus-themes-load-themes)

;; Load the theme of your preference:
(modus-themes-load-operandi) ; OR (modus-themes-load-vivendi)

;; Optionally set the `modus-themes-toggle' to a key binding:
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

;;;; Modus themes "Summertime"

;; Read the relevant blog post:
;; <https://protesilaos.com/codelog/2022-07-26-modus-themes-color-override-demo/>

;; Thanks to user "Summer Emacs" for (i) suggesting the name
;; "summertime", (ii) testing variants of this in her setup, and (iii)
;; sending me feedback on possible tweaks and refinements.  All errors
;; are my own.  (This information is shared with permission.)
(define-minor-mode modus-themes-summertime
  "Refashion the Modus themes by overriding their colors.

This is a complete technology demonstration to show how to
manually override the colors of the Modus themes.  I have taken
good care of those overrides to make them work as a fully fledged
color scheme that is compatible with all user options of the
Modus themes.

These overrides are usable by those who (i) like something more
fancy than the comparatively austere looks of the Modus themes,
and (ii) can cope with a lower contrast ratio.

The overrides are set up as a minor mode, so that the user can
activate the effect on demand.  Those who want to load the
overrides at all times can either add them directly to their
configuration or enable `modus-themes-summertime' BEFORE loading
either of the Modus themes (if the overrides are evaluated after
the theme, the theme must be reloaded).

Remember that all changes to theme-related variables require a
reload of the theme to take effect (the Modus themes have lots of
user options, apart from those overrides).

The `modus-themes-summertime' IS NOT an official extension to the
Modus themes and DOES NOT comply with its lofty accessibility
standards.  It is included in the official manual as guidance for
those who want to make use of the color overriding facility we
provide."
  :init-value nil
  :global t
  (if modus-themes-summertime
      (setq modus-themes-operandi-color-overrides
            '((bg-main . "#fff0f2")
              (bg-dim . "#fbe6ef")
              (bg-alt . "#f5dae6")
              (bg-hl-line . "#fad8e3")
              (bg-active . "#efcadf")
              (bg-inactive . "#f3ddef")
              (bg-active-accent . "#ffbbef")
              (bg-region . "#dfc5d1")
              (bg-region-accent . "#efbfef")
              (bg-region-accent-subtle . "#ffd6ef")
              (bg-header . "#edd3e0")
              (bg-tab-active . "#ffeff2")
              (bg-tab-inactive . "#f8d3ef")
              (bg-tab-inactive-accent . "#ffd9f5")
              (bg-tab-inactive-alt . "#e5c0d5")
              (bg-tab-inactive-alt-accent . "#f3cce0")
              (fg-main . "#543f78")
              (fg-dim . "#5f476f")
              (fg-alt . "#7f6f99")
              (fg-unfocused . "#8f6f9f")
              (fg-active . "#563068")
              (fg-inactive . "#8a5698")
              (fg-docstring . "#5f5fa7")
              (fg-comment-yellow . "#a9534f")
              (fg-escape-char-construct . "#8b207f")
              (fg-escape-char-backslash . "#a06d00")
              (bg-special-cold . "#d3e0f4")
              (bg-special-faint-cold . "#e0efff")
              (bg-special-mild . "#c4ede0")
              (bg-special-faint-mild . "#e0f0ea")
              (bg-special-warm . "#efd0c4")
              (bg-special-faint-warm . "#ffe4da")
              (bg-special-calm . "#f0d3ea")
              (bg-special-faint-calm . "#fadff9")
              (fg-special-cold . "#405fb8")
              (fg-special-mild . "#407f74")
              (fg-special-warm . "#9d6f4f")
              (fg-special-calm . "#af509f")
              (bg-completion . "#ffc5e5")
              (bg-completion-subtle . "#f7cfef")
              (red . "#ed2f44")
              (red-alt . "#e0403d")
              (red-alt-other . "#e04059")
              (red-faint . "#ed4f44")
              (red-alt-faint . "#e0603d")
              (red-alt-other-faint . "#e06059")
              (green . "#217a3c")
              (green-alt . "#417a1c")
              (green-alt-other . "#006f3c")
              (green-faint . "#318a4c")
              (green-alt-faint . "#518a2c")
              (green-alt-other-faint . "#20885c")
              (yellow . "#b06202")
              (yellow-alt . "#a95642")
              (yellow-alt-other . "#a06f42")
              (yellow-faint . "#b07232")
              (yellow-alt-faint . "#a96642")
              (yellow-alt-other-faint . "#a08042")
              (blue . "#275ccf")
              (blue-alt . "#475cc0")
              (blue-alt-other . "#3340ef")
              (blue-faint . "#476ce0")
              (blue-alt-faint . "#575ccf")
              (blue-alt-other-faint . "#3f60d7")
              (magenta . "#bf317f")
              (magenta-alt . "#d033c0")
              (magenta-alt-other . "#844fe4")
              (magenta-faint . "#bf517f")
              (magenta-alt-faint . "#d053c0")
              (magenta-alt-other-faint . "#846fe4")
              (cyan . "#007a9f")
              (cyan-alt . "#3f709f")
              (cyan-alt-other . "#107f7f")
              (cyan-faint . "#108aaf")
              (cyan-alt-faint . "#3f80af")
              (cyan-alt-other-faint . "#3088af")
              (red-active . "#cd2f44")
              (green-active . "#116a6c")
              (yellow-active . "#993602")
              (blue-active . "#475ccf")
              (magenta-active . "#7f2ccf")
              (cyan-active . "#007a8f")
              (red-nuanced-bg . "#ffdbd0")
              (red-nuanced-fg . "#ed6f74")
              (green-nuanced-bg . "#dcf0dd")
              (green-nuanced-fg . "#3f9a4c")
              (yellow-nuanced-bg . "#fff3aa")
              (yellow-nuanced-fg . "#b47232")
              (blue-nuanced-bg . "#e3e3ff")
              (blue-nuanced-fg . "#201f6f")
              (magenta-nuanced-bg . "#fdd0ff")
              (magenta-nuanced-fg . "#c0527f")
              (cyan-nuanced-bg . "#dbefff")
              (cyan-nuanced-fg . "#0f3f60")
              (bg-diff-heading . "#b7cfe0")
              (fg-diff-heading . "#041645")
              (bg-diff-added . "#d6f0d6")
              (fg-diff-added . "#004520")
              (bg-diff-changed . "#fcefcf")
              (fg-diff-changed . "#524200")
              (bg-diff-removed . "#ffe0ef")
              (fg-diff-removed . "#891626")
              (bg-diff-refine-added . "#84cfa4")
              (fg-diff-refine-added . "#002a00")
              (bg-diff-refine-changed . "#cccf8f")
              (fg-diff-refine-changed . "#302010")
              (bg-diff-refine-removed . "#da92b0")
              (fg-diff-refine-removed . "#500010")
              (bg-diff-focus-added . "#a6e5c6")
              (fg-diff-focus-added . "#002c00")
              (bg-diff-focus-changed . "#ecdfbf")
              (fg-diff-focus-changed . "#392900")
              (bg-diff-focus-removed . "#efbbcf")
              (fg-diff-focus-removed . "#5a0010"))
            modus-themes-vivendi-color-overrides
            '((bg-main . "#25152a")
              (bg-dim . "#2a1930")
              (bg-alt . "#382443")
              (bg-hl-line . "#332650")
              (bg-active . "#463358")
              (bg-inactive . "#2d1f3a")
              (bg-active-accent . "#50308f")
              (bg-region . "#5d4a67")
              (bg-region-accent . "#60509f")
              (bg-region-accent-subtle . "#3f285f")
              (bg-header . "#3a2543")
              (bg-tab-active . "#26162f")
              (bg-tab-inactive . "#362647")
              (bg-tab-inactive-accent . "#36265a")
              (bg-tab-inactive-alt . "#3e2f5a")
              (bg-tab-inactive-alt-accent . "#3e2f6f")
              (fg-main . "#debfe0")
              (fg-dim . "#d0b0da")
              (fg-alt . "#ae85af")
              (fg-unfocused . "#8e7f9f")
              (fg-active . "#cfbfef")
              (fg-inactive . "#b0a0c0")
              (fg-docstring . "#c8d9f7")
              (fg-comment-yellow . "#cf9a70")
              (fg-escape-char-construct . "#ff75aa")
              (fg-escape-char-backslash . "#dbab40")
              (bg-special-cold . "#2a3f58")
              (bg-special-faint-cold . "#1e283f")
              (bg-special-mild . "#0f3f31")
              (bg-special-faint-mild . "#0f281f")
              (bg-special-warm . "#44331f")
              (bg-special-faint-warm . "#372213")
              (bg-special-calm . "#4a314f")
              (bg-special-faint-calm . "#3a223f")
              (fg-special-cold . "#c0b0ff")
              (fg-special-mild . "#bfe0cf")
              (fg-special-warm . "#edc0a6")
              (fg-special-calm . "#ff9fdf")
              (bg-completion . "#502d70")
              (bg-completion-subtle . "#451d65")
              (red . "#ff5f6f")
              (red-alt . "#ff8f6d")
              (red-alt-other . "#ff6f9d")
              (red-faint . "#ffa0a0")
              (red-alt-faint . "#f5aa80")
              (red-alt-other-faint . "#ff9fbf")
              (green . "#51ca5c")
              (green-alt . "#71ca3c")
              (green-alt-other . "#51ca9c")
              (green-faint . "#78bf78")
              (green-alt-faint . "#99b56f")
              (green-alt-other-faint . "#88bf99")
              (yellow . "#f0b262")
              (yellow-alt . "#f0e242")
              (yellow-alt-other . "#d0a272")
              (yellow-faint . "#d2b580")
              (yellow-alt-faint . "#cabf77")
              (yellow-alt-other-faint . "#d0ba95")
              (blue . "#778cff")
              (blue-alt . "#8f90ff")
              (blue-alt-other . "#8380ff")
              (blue-faint . "#82b0ec")
              (blue-alt-faint . "#a0acef")
              (blue-alt-other-faint . "#80b2f0")
              (magenta . "#ff70cf")
              (magenta-alt . "#ff77f0")
              (magenta-alt-other . "#ca7fff")
              (magenta-faint . "#e0b2d6")
              (magenta-alt-faint . "#ef9fe4")
              (magenta-alt-other-faint . "#cfa6ff")
              (cyan . "#30cacf")
              (cyan-alt . "#60caff")
              (cyan-alt-other . "#40b79f")
              (cyan-faint . "#90c4ed")
              (cyan-alt-faint . "#a0bfdf")
              (cyan-alt-other-faint . "#a4d0bb")
              (red-active . "#ff6059")
              (green-active . "#64dc64")
              (yellow-active . "#ffac80")
              (blue-active . "#4fafff")
              (magenta-active . "#cf88ff")
              (cyan-active . "#50d3d0")
              (red-nuanced-bg . "#440a1f")
              (red-nuanced-fg . "#ffcccc")
              (green-nuanced-bg . "#002904")
              (green-nuanced-fg . "#b8e2b8")
              (yellow-nuanced-bg . "#422000")
              (yellow-nuanced-fg . "#dfdfb0")
              (blue-nuanced-bg . "#1f1f5f")
              (blue-nuanced-fg . "#bfd9ff")
              (magenta-nuanced-bg . "#431641")
              (magenta-nuanced-fg . "#e5cfef")
              (cyan-nuanced-bg . "#042f49")
              (cyan-nuanced-fg . "#a8e5e5")
              (bg-diff-heading . "#304466")
              (fg-diff-heading . "#dae7ff")
              (bg-diff-added . "#0a383a")
              (fg-diff-added . "#94ba94")
              (bg-diff-changed . "#2a2000")
              (fg-diff-changed . "#b0ba9f")
              (bg-diff-removed . "#50163f")
              (fg-diff-removed . "#c6adaa")
              (bg-diff-refine-added . "#006a46")
              (fg-diff-refine-added . "#e0f6e0")
              (bg-diff-refine-changed . "#585800")
              (fg-diff-refine-changed . "#ffffcc")
              (bg-diff-refine-removed . "#952838")
              (fg-diff-refine-removed . "#ffd9eb")
              (bg-diff-focus-added . "#1d4c3f")
              (fg-diff-focus-added . "#b4dfb4")
              (bg-diff-focus-changed . "#424200")
              (fg-diff-focus-changed . "#d0daaf")
              (bg-diff-focus-removed . "#6f0f39")
              (fg-diff-focus-removed . "#eebdba")))
    (setq modus-themes-operandi-color-overrides nil
          modus-themes-vivendi-color-overrides nil)))
```

## How I actually load the theme on GNOME 42

I put this separately as it is irrelevant for many setups out there:

```elisp
;; A simple check to load the desired theme at startup based on what
;; the global preference for GNOME is.  If such preference is not
;; registered, it just loads `modus-operandi'.  Check my dotfiles for
;; the shell script called "delight", which handles system-wide theme
;; switching (as I bind the `modus-themes-toggle' to <f5>, delight is
;; bound to s-<f5> in the desktop's own custom key bindings).
(if (string-match-p
     "dark"
     (shell-command-to-string "gsettings get org.gnome.desktop.interface color-scheme"))
    (modus-themes-load-vivendi)
  (modus-themes-load-operandi))
```

## Special thanks

Thanks to user "Summer Emacs" for (i) suggesting the name "summertime",
(ii) testing variants of this in her setup, and (iii) sending me
feedback on possible tweaks and refinements.  All errors are my own.

The idea for this project came from an exchange where Summer discovered
an old theme of mine (from my pre-Emacs days) and asked if I had
anything like it for Emacs.  Well, here it is!

[ This information is shared with permission. ]

I will include "summertime" in the manual of the Modus themes.  This is
not a standalone theme and does not conform with the high accessibility
standards of the default colour palettes.  It simply shows how far we
can go by leveraging the user options at our disposal.

If you do use this, please let me know what you think.
