---
title: "Emacs: stylistic refinements to the “tinted” Modus themes"
excerpt: "Status update on the development process of the 'modus-themes' package."
---

As part of the current development target of the `modus-themes` package, I am introducing small changes to the `modus-operandi-tinted` and `modus-vivendi-tinted` themes. These concern fine details, some of which most users will probably not even notice. Though the cumulative effect of these changes is obvious once we compare the themes to their main counterparts, namely, `modus-operandi` and `modus-vivendi`. I am doing this to improve the consistency of the "tinted" themes. I think existing users will appreciate the attention to detail.

Below are some screen shots with the out-of-the-box design of the themes (remember that they are highly customisable). I also include pictures with `spacious-padding-mode` enabled (from my `spacious-padding` package). Notice that in this case the mode lines are just an overline, which is done by customising the user option `spacious-padding-subtle-mode-line`.

I plan to install those changes to emacs.git and make them available via GNU ELPA as part of `modus-themes` version `4.7.0`, which I hope to publish some time this month or in May.

## Modus Operandi VS Modus Operandi Tinted

<a href="{{'/assets/images/attachments/2025-04-06-modus-operandi-sample.png' | absolute_url }}"><img alt="Sample of modus-operandi theme" src="{{'/assets/images/attachments/2025-04-06-modus-operandi-sample.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2025-04-06-modus-operandi-tinted-sample.png' | absolute_url }}"><img alt="Sample of modus-operandi-tinted theme" src="{{'/assets/images/attachments/2025-04-06-modus-operandi-tinted-sample.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2025-04-06-modus-operandi-spacious-padding-sample.png' | absolute_url }}"><img alt="Sample of modus-operandi theme" src="{{'/assets/images/attachments/2025-04-06-modus-operandi-spacious-padding-sample.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2025-04-06-modus-operandi-tinted-spacious-padding-sample.png' | absolute_url }}"><img alt="Sample of modus-operandi-tinted theme" src="{{'/assets/images/attachments/2025-04-06-modus-operandi-tinted-spacious-padding-sample.png' | absolute_url }}"/></a>

## Modus Vivendi VS Modus Vivendi Tinted

<a href="{{'/assets/images/attachments/2025-04-06-modus-vivendi-sample.png' | absolute_url }}"><img alt="Sample of modus-vivendi theme" src="{{'/assets/images/attachments/2025-04-06-modus-vivendi-sample.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2025-04-06-modus-vivendi-tinted-sample.png' | absolute_url }}"><img alt="Sample of modus-vivendi-tinted theme" src="{{'/assets/images/attachments/2025-04-06-modus-vivendi-tinted-sample.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2025-04-06-modus-vivendi-spacious-padding-sample.png' | absolute_url }}"><img alt="Sample of modus-vivendi theme" src="{{'/assets/images/attachments/2025-04-06-modus-vivendi-spacious-padding-sample.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2025-04-06-modus-vivendi-tinted-spacious-padding-sample.png' | absolute_url }}"><img alt="Sample of modus-vivendi-tinted theme" src="{{'/assets/images/attachments/2025-04-06-modus-vivendi-tinted-spacious-padding-sample.png' | absolute_url }}"/></a>

## About the Modus themes

Highly accessible themes, conforming with the highest standard for
colour contrast between background and foreground values (WCAG AAA).
They also are optimised for users with red-green or blue-yellow colour
deficiency.

The themes are very customisable and provide support for a wide range
of packages.  Their manual is detailed so that new users can get
started, while it also provides custom code for all sorts of more
advanced customisations.

Since August 2020, the original Modus themes (`modus-operandi`,
`modus-vivendi`) are built into Emacs version 28 or higher. Emacs 28
ships with `modus-themes` version `1.6.0`. Emacs 29 includes version
`3.0.0`. Emacs 30 provides version `4.4.0`. Version 4 is a major
refactoring of how the themes are implemented and customized. Such
major versions are not backward-compatible due to the limited
resources at my disposal to support multiple versions of Emacs and of
the themes across the years.

+ Package name (GNU ELPA): `modus-themes`
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/modus-themes>
  + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes.

