---
title: "Emacs: my new 'spacious-padding' package"
excerpt: "The 'spacious-package' for Emacs increases the padding/spacing of frames and windows on demand."
---

I just published a new project called `spacious-padding`.  This is yet
another package of mine for GNU Emacs.  It increases the padding or
spacing of frames and windows on demand.

The idea with this package is to provide the means to easily toggle
between terse and spacious views, depending on the user's needs.

Below are a couple of pictures to show what I mean.

## Default spacing 😒

<a href="{{'/assets/images/attachments/2023-06-03-emacs-spacious-padding-mode-disabled.png' | absolute_url}}"><img alt="GNU Emacs with default spacing" src="{{'/assets/images/attachments/2023-06-03-emacs-spacious-padding-mode-disabled.png' | absolute_url }}"/></a>

## M-x spacious-padding-mode 🤩

<a href="{{'/assets/images/attachments/2023-06-03-emacs-spacious-padding-mode-enabled.png' | absolute_url}}"><img alt="GNU Emacs with spacious-padding-mode enabled" src="{{'/assets/images/attachments/2023-06-03-emacs-spacious-padding-mode-enabled.png' | absolute_url }}"/></a>

## Coming soon

There will be no widely available GNU ELPA package for the first days
of `spacious-padding`.  Only those who track the GNU ELPA-devel
archive or pull directly from source can get it right now.  I want to
test this for a while longer before tagging version `0.1.0`.  Expect
the formal release some time next week.

Inspiration for this package comes from [Nicolas Rougier's impressive
designs](https://github.com/rougier) and [Daniel Mendler's
`org-modern` package](https://github.com/minad/org-modern).

+ Package name (GNU ELPA): `spacious-padding`
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/spacious-padding>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/spacious-padding>
    + GitLab: <https://gitlab.com/protesilaos/spacious-padding>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Backronyms: Space Perception Adjusted Consistently Impacts Overall
  Usability State ... padding; Spacious ... Precise Adjustments to
  Desktop Divider Internals Neatly Generated.
