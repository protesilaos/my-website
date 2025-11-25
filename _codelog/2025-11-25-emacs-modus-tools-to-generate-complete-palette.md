---
title: "Emacs: new Modus themes tool to generate a complete palette"
excerpt: "There is a new function I wrote for my modus-themes that makes it easier for users to create derivative Modus themes palettes."
---

[ This is of interest to users who want to create a new theme on top of
  Modus (for private purposes or as a package). ]

The current development target of the Modus themes includes the
function `modus-themes-generate-palette`. I have updated the manual
with a detailed, step-by-step guide on how to use that function to
derive a custom theme. I am doing it with Solarized, since it is
well-known. Start here: <https://protesilaos.com/emacs/modus-themes#h:3a7ede17-f0d4-4322-8e69-1804ed69012b>

The reason I wrote this function is to make it easier for users to get
started with their Modus ports. The common workflow is for someone to
copy a colour scheme from their favourite terminal emulator and use it
as a starting point for their Emacs theme. Modus will do the heavy
lifting in the background.

`modus-themes-generate-palette` returns a fully fledged Modus palette:
the literal hundreds of entries are all defined, even if we only give
it a couple of colour values. The more colours we specify, the more
defined the character of the resulting palette will be---and we have
complete control, as the manual demonstrates.

A good starting point is to provide values for the main background (`bg-main`),
main foreground (`fg-main`), and the basic hues of `red`, `green`,
`yellow`, `blue`, `magenta`, and `cyan`.

Options for power users are available. Though the point is to lower
the barrier to entry for those who want to start with something
tolerable. Then they can trust that I cover everything they need to
gradually evolve their theme to be as complete as core Modus.

In the manual I used Solarized as an example, with usable code
snippets that you can copy+paste. Those yield a theme, if you try
them. Below is a complete, albeit generic, Modus+Solarized theme. It
is a decent starting point.

```elisp
;; Modus+Solarized dark
(defvar modus-solarized-dark-palette
  (modus-themes-generate-palette
   '((bg-main "#073642")
     (fg-main "#EEE8D5")
     (red "#DC322F")
     (green "#859900")
     (yellow "#B58900")
     (blue "#268BD2")
     (magenta "#D33682")
     (cyan "#2AA198"))))

(modus-themes-theme
 'modus-solarized-dark
 'modus-solarized-themes
 "Sample of a basic Solarized dark port."
 'dark
 'modus-solarized-dark-palette
 nil
 nil)
```

Do not rush to play around with this snippet. The chapter in the
manual I linked to above has much more about this topic. Take some
time to read through it. You can extend the port to also map out all
the colors you want. Thus:

```elisp
;; Modus+Solarized dark
(defvar modus-solarized-dark-palette
  (modus-themes-generate-palette
   ;; We provide the two base colors of Solarized, plus most of its
   ;; accents.  These form the BASE-COLORS we pass as an argument.
   ;; All other color values come from those.  The BASE-COLORS here
   ;; are enough to generate a new palatte that has no traces of, say,
   ;; the `modus-vivendi' color values.
   '((bg-main "#073642")
     (fg-main "#EEE8D5")
     (red "#DC322F")
     (green "#859900")
     (yellow "#B58900")
     (blue "#268BD2")
     (magenta "#D33682")
     (cyan "#2AA198"))
   ;; The COOL-OR-WARM-PREFERENCE is derived internally based on
   ;; `bg-main'.  We can pass it here if we feel strongly about it.
   nil
   ;; If we need to specify the CORE-PALETTE from where to inherit any
   ;; missing colors and/or semantic mappings, we can give it here.
   ;; Though nil is the appropriate starting point, as the code will
   ;; handle things internally.
   nil
   ;; And here are our MAPPINGS where we can specify what values apply
   ;; to which semantic color.  The `modus-themes-list-colors' shows
   ;; them all.
   ;;
   ;; Note that in our BASE-COLORS above we never wrote what, say,
   ;; `magenta-warmer' is: it is derived programmatically from the
   ;; `magenta' we have there.  Absent that, it would be taken from
   ;; the CORE-PALETTE.
   '((cursor magenta-warmer)
     (bg-hl-line bg-blue-nuanced)
     (bg-paren-match bg-magenta-subtle)
     (bg-region bg-blue-intense)
     (fg-region fg-dim)
     (bg-mode-line-active bg-blue-nuanced)
     (fg-mode-line-active blue-warmer)
     (border-mode-line-active blue-cooler))))

(modus-themes-theme
 'modus-solarized-dark
 'modus-solarized-themes
 "Sample of a basic Solarized dark port."
 'dark
 'modus-solarized-dark-palette
 nil
 nil)
```

Using this infrastructure, I am confident that we can implement any
colour scheme as a Modus theme---and, again, we can configure every
part of it.

The manual is extensive, though remember that I remain at your
disposal in case something is unclear: open an issue in the Modus
themes repository or [contact me](https://protesilaos.com/contact/)
and I will help you.

## Sources

+ Package name (GNU ELPA): `modus-themes` (also built into Emacs)
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/modus-themes>
  + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes.
