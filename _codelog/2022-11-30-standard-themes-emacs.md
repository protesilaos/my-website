---
title: "Introduction to the 'standard-themes' for Emacs"
excerpt: "A pair of themes that are like the default looks of Emacs, but more consistent and with several customisation options."
---

The `standard-themes` are a pair of light and dark themes for GNU
Emacs.  They emulate the out-of-the-box looks of Emacs (which
technically do NOT constitute a theme) while bringing to them thematic
consistency, customizability, and extensibility.  In practice, the
Standard themes take the default style of the font-lock and Org faces,
complement it with a wider colour palette, address some
inconsistencies, and apply established semantic patterns across all
interfaces.

## Sample

The first picture is the default set of faces.  The second is
`standard-light` with some user options enabled.  The third is
`standard-dark`.

<a href="{{'/assets/images/standard/emacs-no-theme.png' | absolute_url}}"><img alt="Sample of Emacs without a theme" src="{{'/assets/images/standard/emacs-no-theme.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/standard/standard-light.png' | absolute_url }}"><img alt="standard-light theme sample" src="{{'/assets/images/standard/standard-light.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/standard/standard-dark.png' | absolute_url }}"><img alt="standard-dark theme sample" src="{{'/assets/images/standard/standard-dark.png' | absolute_url }}"/></a>

## Why a new theme?

Emacs does not have a default _theme_.  It has a collection of basic
faces.  As such, different package authors add their own styles to
address their specific requirements, at times resulting in an
inconsistent experience.

A theme lets us bring together thousands of faces and treat them
systematically.  For example, to make headings in Org and Markdown
look the same, or to ensure predictable colouration between the
various buffers/components that form part of a user's email workflow
(make notmuch.el and message.el feel like they belong together).

We can thus retain the character of the original style, while giving
users something familiar and usable.

## Sources

I made the changes to elpa.git though it may take some time for the
package to become available.

+ Package name (GNU ELPA): `standard-themes`
+ Official manual: <https://protesilaos.com/emacs/standard-themes>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/standard-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/standard-themes>
    + GitLab: <https://gitlab.com/protesilaos/standard-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/standard-themes>
+ Backronym: Standard Themes Are Not Derivatives but the
  Affectionately Reimagined Default ... themes.
