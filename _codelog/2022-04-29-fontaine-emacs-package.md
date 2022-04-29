---
title: "Emacs: my 'fontaine' package is available on GNU ELPA"
subtitle: "Set font configurations using presets"
excerpt: "Announcement about the availability of my new package for Emacs to manage font presets."
---

My `fontaine` package lets the user specify font configuration presets
and set them on demand.  The idea is to quickly switch between different
contexts, such as "small and compact fonts for editing" versus "large
and spacious fonts for a video demonstration".

Fontaine operates on the typographic attributes of relevant Emacs faces.
These faces are `default`, `fixed-pitch`, `variable-pitch`, `bold`, and
`italic`.  The typographic attributes are the font family, the height,
and the weight.

Presets are stored in the user option `fontaine-presets`.  Each set
looks as follows, where the car is an arbitrary symbol used to identify
the property list:

```elisp
(regular
 :default-family "Hack"
 :default-weight normal
 :default-height 100
 :fixed-pitch-family "Fira Code"
 :fixed-pitch-weight nil ; falls back to :default-weight
 :fixed-pitch-height 1.0
 :variable-pitch-family "Noto Sans"
 :variable-pitch-weight normal
 :variable-pitch-height 1.0
 :bold-family nil ; use whatever the underlying face has
 :bold-weight bold
 :italic-family "Source Code Pro"
 :italic-slant italic
 :line-spacing 1)
```

In the Annex further below, I provide a copy of my presets as seen in my
dotemacs.

The command `fontaine-set-preset` is used to select a set among the
available options.  This can also be done in user init files to set up
the desired configurations at startup.  For example:

```elisp
(fontaine-set-preset 'regular)
```

Fontaine can save the latest preset in the `fontaine-latest-state-file`
and retrieve it in order to restore it.  The details are documented in
the manual.  The gist is this:

```elisp
(fontaine-restore-latest-preset)

;; Set `fontaine-recovered-preset' or fall back to desired style from
;; `fontaine-presets'.
(if-let ((state fontaine-recovered-preset))
    (fontaine-set-preset state)
  (fontaine-set-preset 'regular))

;; The other side of `fontaine-restore-latest-preset'.
(add-hook 'kill-emacs-hook #'fontaine-store-latest-preset)
```

There also exists a command to help users preview a set of styles for
the relevant faces: `fontaine-set-face-font`.  The idea is to use this
to test how, for example, `Source Code Pro` with height `100` looks and
then codify it as a preset.

Please consult the manual and doc strings of all relevant variables and
functions.

## Sources

+ Package name (GNU ELPA): `fontaine`
+ Official manual: <https://protesilaos.com/emacs/fontaine>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/fontaine>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/fontaine>
    + GitLab: <https://gitlab.com/protesilaos/fontaine>
+ Mailing list: <https://lists.sr.ht/~protesilaos/fontaine>

All my Emacs packages: <https://protesilaos.com/emacs>.

## Annex

My fontaine presets as of 2022-04-29 09:42 +0300.  Check [my
dotemacs](https://protesilaos.com/emacs/dotemacs) for an up-to-date
version:

```elisp
(setq fontaine-presets
      '((small
         :default-family "Hack"
         :default-weight normal
         :default-height 75
         :fixed-pitch-family nil ; falls back to :default-family
         :fixed-pitch-weight nil ; falls back to :default-weight
         :fixed-pitch-height 1.0
         :variable-pitch-family "Noto Sans"
         :variable-pitch-weight normal
         :variable-pitch-height 1.0
         :bold-family nil ; use whatever the underlying face has
         :bold-weight bold
         :italic-family nil
         :italic-slant italic
         :line-spacing nil)
        (regular
         :default-family "Iosevka Comfy"
         :default-weight normal
         :default-height 100
         :fixed-pitch-family nil ; falls back to :default-family
         :fixed-pitch-weight nil ; falls back to :default-weight
         :fixed-pitch-height 1.0
         :variable-pitch-family "FiraGO"
         :variable-pitch-weight normal
         :variable-pitch-height 1.05
         :bold-family nil ; use whatever the underlying face has
         :bold-weight bold
         :italic-family nil
         :italic-slant italic
         :line-spacing nil)
        (medium
         :default-family "Source Code Pro"
         :default-weight normal
         :default-height 110
         :fixed-pitch-family nil ; falls back to :default-family
         :fixed-pitch-weight nil ; falls back to :default-weight
         :fixed-pitch-height 1.0
         :variable-pitch-family "Source Sans Pro"
         :variable-pitch-weight normal
         :variable-pitch-height 1.05
         :bold-family nil ; use whatever the underlying face has
         :bold-weight semibold
         :italic-family nil
         :italic-slant italic
         :line-spacing nil)
        (large
         :default-family "Iosevka Comfy"
         :default-weight semilight
         :default-height 160
         :fixed-pitch-family nil ; falls back to :default-family
         :fixed-pitch-weight nil ; falls back to :default-weight
         :fixed-pitch-height 1.0
         :variable-pitch-family "FiraGO"
         :variable-pitch-weight normal
         :variable-pitch-height 1.05
         :bold-family nil ; use whatever the underlying face has
         :bold-weight bold
         :italic-family nil
         :italic-slant italic
         :line-spacing nil)
        (presentation
         :default-family "Iosevka Comfy"
         :default-weight semilight
         :default-height 170
         :fixed-pitch-family nil ; falls back to :default-family
         :fixed-pitch-weight nil ; falls back to :default-weight
         :fixed-pitch-height 1.0
         :variable-pitch-family "FiraGO"
         :variable-pitch-weight normal
         :variable-pitch-height 1.05
         :bold-family nil ; use whatever the underlying face has
         :bold-weight bold
         :italic-family nil
         :italic-slant italic
         :line-spacing nil)))
```
