---
title: "Re: What is your font setup for Emacs?"
excerpt: "Overview of my font-related configurations for Emacs, with an emphasis on how I do presentations."
---

I keep getting the titular question fairly often---two just yesterday!
I am thus publish the present entry to be able to link to it instead of
rewriting the whole thing every time (or storing it in a text register,
but you get the idea).

The short version is:

+ Fonts are part of my _Iosevka Comfy_ project.
+ My relevant Emacs packages are `fontaine`, `cursory`, `logos`, `modus-themes`.
+ Other neat packages I use include `olivetti`, `org-modern`.
+ Plus tweaks to Org, directory-local variables, `variable-pitch-mode`.

## My font is Iosevka Comfy

+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/iosevka-comfy>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/iosevka-comfy>
    + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>

This is a highly customised build of Iosevka that I have designed
meticulously to work optimally for my requirements.  Excerpts from its
README:

> Iosevka Comfy is more vertically compact than the standard upstream
> configuration.  Glyphs are rounder and have tailed ends or serifs only
> when those are required to both impose a predictable rhythm and keep
> characters distinct from each other.
>
> [...]
>
> Roman and italic variants are made to look more consistent while
> retaining their stylistic features.  Unlike the default Iosevka style,
> the upright glyphs do not have a mixture of straight/blocky and curved
> or serified characters (special exceptions notwithstanding).  While the
> italics do not have calligraphic tendencies that greatly contrast with
> their counterparts.  The differences within each character set and
> between the variants themselves are nuanced.  The intent is to make
> everything feel part of the same aesthetic.  Distinctions are drawn on
> the premise of contributing to the demands of the design without ever
> calling attention to themselves (as opposed to sporadic calligraphic
> glyphs amid an otherwise austere presentation).
>
> [... lots of technicalities elided]
>
> Iosevka Comfy comes in five variants, all of which share the same
> stylistic overrides, as documented above.
>
> * `iosevka-comfy` is monospaced and supports ligatures.  Apart from
>   ligatures, it allows certain glyphs, such as arrows, to occupy more
>   than one block.
>
> * `iosevka-comfy-fixed` is strictly monospaced and does not support
>   ligatures.  All glyphs are exactly the same width.  Use this if you
>   prefer it or if your application (e.g. terminal emulator) does not
>   recognise `iosevka-comfy` as a monospaced font.
>
> * `iosevka-comfy-duo` is quasi-proportional and supports ligatures.  The
>   naturally wide glyphs, such as `m`, are allowed to occupy two blocks
>   instead of one.
>
> * `iosevka-comfy-wide` is the same as `iosevka-comfy` except it is
>   noticeably wider.  It also looks taller than `iosevka-comfy` even
>   though both variants fit the same number of lines on a screen.
>
> * `iosevka-comfy-wide-fixed` same as `iosevka-comfy-wide` though it is
>   strictly monospaced and does not support ligatures.

## I manage font configurations with my 'fontaine' package

+ Package name (GNU ELPA): `fontaine`
+ Official manual: <https://protesilaos.com/emacs/fontaine>
+ Change log: <https://protesilaos.com/emacs/fontaine-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/fontaine>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/fontaine>
    + GitLab: <https://gitlab.com/protesilaos/fontaine>
+ Mailing list: <https://lists.sr.ht/~protesilaos/fontaine>

I have already written about `fontaine` on this blog.  It lets the user
declare font presets and switch between them on demand: helpful when you
want to switch between different contexts.  The official manual
elaborates on the particulars.  Excerpt from my dotemacs with just the
presets:

```elisp
(setq fontaine-presets
      '((tiny
         :default-family "Iosevka Comfy Wide Fixed"
         :default-height 70)
        (small
         :default-family "Iosevka Comfy Fixed"
         :default-height 90)
        (regular
         :default-height 100)
        (medium
         :default-height 110)
        (large
         :default-weight semilight
         :default-height 140
         :bold-weight extrabold)
        (presentation
         :default-weight semilight
         :default-height 170
         :bold-weight extrabold)
        (t
         ;; I keep all properties for didactic purposes, but most can be
         ;; omitted.  See the fontaine manual for the technicalities:
         ;; <https://protesilaos.com/emacs/fontaine>.
         :default-family "Iosevka Comfy"
         :default-weight regular
         :default-height 100
         :fixed-pitch-family nil ; falls back to :default-family
         :fixed-pitch-weight nil ; falls back to :default-weight
         :fixed-pitch-height 1.0
         :variable-pitch-family "Iosevka Comfy Duo"
         :variable-pitch-weight nil
         :variable-pitch-height 1.0
         :bold-family nil ; use whatever the underlying face has
         :bold-weight bold
         :italic-family nil
         :italic-slant italic
         :line-spacing nil)))
```

## Cursors are handled by my 'cursory' package

+ Package name (GNU ELPA): `cursory`
+ Official manual: <https://protesilaos.com/emacs/cursory>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/cursory>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/cursory>
    + GitLab: <https://gitlab.com/protesilaos/cursory>
+ Mailing list: <https://lists.sr.ht/~protesilaos/cursory>

Same principle as `fontaine`, but for cursor styles.  Excerpt from my
dotemacs, while I let you check the manual for the details:

```elisp
(setq cursory-presets
      '((bar
         :cursor-type (bar . 2)
         :cursor-in-non-selected-windows hollow
         :blink-cursor-blinks 10
         :blink-cursor-interval 0.5
         :blink-cursor-delay 0.2)
        (box
         :cursor-type box
         :cursor-in-non-selected-windows hollow
         :blink-cursor-blinks 10
         :blink-cursor-interval 0.5
         :blink-cursor-delay 0.2)
        (underscore
         :cursor-type (hbar . 3)
         :cursor-in-non-selected-windows hollow
         :blink-cursor-blinks 50
         :blink-cursor-interval 0.2
         :blink-cursor-delay 0.2)))
```

## I do presentations with my 'logos' package

+ Package name (GNU ELPA): `logos`
+ Official manual: <https://protesilaos.com/emacs/logos>
+ Change log: <https://protesilaos.com/emacs/logos-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/logos>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/logos>
    + GitLab: <https://gitlab.com/protesilaos/logos>
+ Mailing list: <https://lists.sr.ht/~protesilaos/logos>

Logos lets me move between "pages" and [optionally] treat each of them
as a pseudo-slide (by leveraging Emacs' narrowing capabilities).  For me
this is the best way to do presentations, as I simply switch to a
different `fontaine` preset, tweak the cursors, and then use the same
Org file I was already editing.  No unwieldy PDFs, no elaborate export
mechanism to some external app, no fancy transitions or effects.  Just
regular Emacs.

Logos optionally leverages Paul W. Rankin's excellent `olivetti` package
to centre the buffer's contents in its window.  It helps make a page
look like a slide.

What constitutes a "page" is discussed in the manual.  A snippet from my
dotemacs:

```elisp
(setq logos-outlines-are-pages t)
(setq logos-outline-regexp-alist
      `((emacs-lisp-mode . ,(format "\\(^;;;+ \\|%s\\)" logos--page-delimiter))
        (org-mode . ,(format "\\(^\\*+ +\\|^-\\{5\\}$\\|%s\\)" logos--page-delimiter))
        (markdown-mode . ,(format "\\(^\\#+ +\\|^[*-]\\{5\\}$\\|^\\* \\* \\*$\\|%s\\)" logos--page-delimiter))
        (conf-toml-mode . "^\\[")
        (t . ,(or outline-regexp logos--page-delimiter))))

(setq-default logos-hide-mode-line t)
(setq-default logos-hide-buffer-boundaries t)
(setq-default logos-hide-fringe t)
(setq-default logos-variable-pitch t) ; see my `fontaine' configurations
(setq-default logos-buffer-read-only nil)
(setq-default logos-scroll-lock nil)
(setq-default logos-olivetti t)
```

## Relevant options of my modus-themes

+ Package name (GNU ELPA): `modus-themes` (also built into Emacs >= 28)
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/modus-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/modus-themes>
    + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/modus-themes>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>

The user option `modus-themes-mixed-fonts` can be set to non-nil to let
you use `M-x variable-pitch-mode` while retaining fixed spacing for
certain elements like tables and inline code.  In practical terms, I can
use _Iosevka Comfy Duo_ (the quasi-proportional variant) together with
_Iosevka Comfy_ when I am in an Org file (e.g. for a presentation).

Alternatively, the `modus-themes-headings` can make all headings use the
`variable-pitch` face.  This is what I use for regular editing, but
presentations get the "mixed fonts" treatment via `variable-pitch-mode`
and `logos`.

## Directory-local settings for Org

In the directory where I store my presentations, I keep a
`.dir-locals.el` file with these contents:

```elisp
;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((org-mode . ((org-hide-emphasis-markers . t)
              (org-hide-macro-markers . t)
              (org-hide-leading-stars . t))))
```

It basically keeps Org clean.

Note that I do not hide those elements by default (check my dotemacs),
because I prefer to avoid "gotcha!" moments where some markup character
is not visible and messes up with my writing.  Also, I don't want to
implement a setup that smartly hides/reveals markup: I find it useful to
always see markup while editing, though not while presenting.

Org is further enhanced with Daniel Mendler's `org-modern` package: it
improves the looks of various Org elements.  For the purposes of my
presentations, it makes the asterisks of headings use different glyphs,
prettifies list characters, renders horizontal rules (`-----`) as
horizontal lines, while it shows quote/src blocks without all the
verbose markup (e.g. `quote` instead of `#+begin_quote`).
