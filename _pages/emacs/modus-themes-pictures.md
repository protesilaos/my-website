---
title: 'Screen shots of the Modus themes for Emacs'
subtitle: 'Demonstrating some options for various interfaces'
excerpt: 'Demo of the Modus themes for Emacs, showcasing a wide range of options and interfaces.'
permalink: /emacs/modus-themes-pictures
redirect_from:
  - /modus-themes-pictures
---

Refer to the [official manual](https://protesilaos.com/emacs/modus-themes) for
the specifics of the Modus Operandi and Modus Vivendi themes (if you
have either the package installed or are using Emacs28, just evaluate
this: `(info "(modus-themes) Top")`).  In short, the themes are (1)
designed to conform with the highest accessibility standard for relative
colour luminance, (2) highly customisable, (3) optimised for red-green
colour deficiency and there are options specifically for deuteranopia,
and (4) comprehensive as they cover practically every package or
interface you may want to use in your Emacs session.

The following screen shots correspond to version `1.4.0-dev` and were
taken on 2021-05-05.  The typeface is [my modified version of
Iosevka](https://git.sr.ht/~protesilaos/iosevka-comfy), set at point
size 14.

**Enlarge the image**, because the smaller size can affect your
perception of what is on display.

## Default looks

This is what you get out-of-the-box.  We try to offer a generic
experience that conforms with the overarching accessibility objective of
the themes, but is otherwise fairly minimalist.

<a href="{{'/assets/images/modus/modus-themes-operandi-default.png' | absolute_url }}"><img alt="Modus Operandi default" src="{{'/assets/images/modus/modus-themes-operandi-default.png' | absolute_url }}"/></a>

<a href="{{ '/assets/images/modus/modus-themes-vivendi-default.png' | absolute_url }}"><img alt="Modus Vivendi default" src="{{'/assets/images/modus/modus-themes-vivendi-default.png' | absolute_url}}"/></a>

## Org mode styles

Org (and Markdown and others) is affected by various options that are
not specific to it.  In these screenshots we cover
`modus-themes-headings`, `modus-themes-links`,
`modus-themes-org-blocks`, `modus-themes-success-deuteranopia`.

<a href="{{'/assets/images/modus/modus-themes-operandi-org-default.png' | absolute_url }}"><img alt="Modus Operandi default org" src="{{'/assets/images/modus/modus-themes-operandi-org-default.png' | absolute_url }}"/></a>

<a href="{{ '/assets/images/modus/modus-themes-vivendi-org-default.png' | absolute_url }}"><img alt="Modus Vivendi default org" src="{{'/assets/images/modus/modus-themes-vivendi-org-default.png' | absolute_url}}"/></a>

<a href="{{'/assets/images/modus/modus-themes-operandi-org-various-styles.png' | absolute_url }}"><img alt="Modus Operandi various styles for org" src="{{'/assets/images/modus/modus-themes-operandi-org-various-styles.png' | absolute_url }}"/></a>

<a href="{{ '/assets/images/modus/modus-themes-vivendi-org-various-styles.png' | absolute_url }}"><img alt="Modus Vivendi various styles for org" src="{{'/assets/images/modus/modus-themes-vivendi-org-various-styles.png' | absolute_url}}"/></a>

## Some styles for code

Here we showcase the customisation options `modus-themes-mode-line`,
`modus-themes-hl-line`, `modus-themes-bold-constructs`,
`modus-themes-syntax`, `modus-themes-slanted-constructs`,
`modus-themes-subtle-line-numbers`.

<a href="{{'/assets/images/modus/modus-themes-operandi-code-default.png' | absolute_url }}"><img alt="Modus Operandi default code" src="{{'/assets/images/modus/modus-themes-operandi-code-default.png' | absolute_url }}"/></a>

<a href="{{ '/assets/images/modus/modus-themes-vivendi-code-default.png' | absolute_url }}"><img alt="Modus Vivendi default code" src="{{'/assets/images/modus/modus-themes-vivendi-code-default.png' | absolute_url}}"/></a>


<a href="{{'/assets/images/modus/modus-themes-operandi-code-various-styles.png' | absolute_url }}"><img alt="Modus Operandi various styles for code" src="{{'/assets/images/modus/modus-themes-operandi-code-various-styles.png' | absolute_url }}"/></a>

<a href="{{ '/assets/images/modus/modus-themes-vivendi-code-various-styles.png' | absolute_url }}"><img alt="Modus Vivendi various styles for code" src="{{'/assets/images/modus/modus-themes-vivendi-code-various-styles.png' | absolute_url}}"/></a>

## Variations for diffs

Here we demo some variants of `modus-themes-diffs`, by using Magit.
Expect the same styles for `diff-mode`, Ediff, etc.

<a href="{{'/assets/images/modus/modus-themes-operandi-diffs-default.png' | absolute_url }}"><img alt="Modus Operandi default diffs default" src="{{'/assets/images/modus/modus-themes-operandi-diffs-default.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/modus/modus-themes-vivendi-diffs-default.png' | absolute_url }}"><img alt="Modus Vivendi default diffs default" src="{{'/assets/images/modus/modus-themes-vivendi-diffs-default.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/modus/modus-themes-operandi-diffs-desaturated.png' | absolute_url }}"><img alt="Modus Operandi desaturated diffs desaturated" src="{{'/assets/images/modus/modus-themes-operandi-diffs-desaturated.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/modus/modus-themes-vivendi-diffs-desaturated.png' | absolute_url }}"><img alt="Modus Vivendi desaturated diffs desaturated" src="{{'/assets/images/modus/modus-themes-vivendi-diffs-desaturated.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/modus/modus-themes-operandi-diffs-fg-only.png' | absolute_url }}"><img alt="Modus Operandi fg-only diffs fg-only" src="{{'/assets/images/modus/modus-themes-operandi-diffs-fg-only.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/modus/modus-themes-vivendi-diffs-fg-only.png' | absolute_url }}"><img alt="Modus Vivendi fg-only diffs fg-only" src="{{'/assets/images/modus/modus-themes-vivendi-diffs-fg-only.png' | absolute_url }}"/></a>

## Completion UIs

The `modus-themes-completions` affects a lot of packages in different
ways, as explained in its doc string and in the manual.  Here we use
`vertico` with `orderless` which are aligned with the aesthetic of the
default completion UI, Icomplete, Selectrum, and the like (Ivy and Helm
are treated differently).

<a href="{{'/assets/images/modus/modus-themes-operandi-completions-default.png' | absolute_url }}"><img alt="Modus Operandi default completions" src="{{'/assets/images/modus/modus-themes-operandi-completions-default.png' | absolute_url }}"/></a>

<a href="{{ '/assets/images/modus/modus-themes-vivendi-completions-default.png' | absolute_url }}"><img alt="Modus Vivendi default completions" src="{{'/assets/images/modus/modus-themes-vivendi-completions-default.png' | absolute_url}}"/></a>

<a href="{{'/assets/images/modus/modus-themes-operandi-completions-opinionated.png' | absolute_url }}"><img alt="Modus Operandi 'opinionated' style for completions" src="{{'/assets/images/modus/modus-themes-operandi-completions-opinionated.png' | absolute_url }}"/></a>

<a href="{{ '/assets/images/modus/modus-themes-vivendi-completions-opinionated.png' | absolute_url }}"><img alt="Modus Vivendi 'opinionated' style for completions" src="{{'/assets/images/modus/modus-themes-vivendi-completions-opinionated.png' | absolute_url}}"/></a>
