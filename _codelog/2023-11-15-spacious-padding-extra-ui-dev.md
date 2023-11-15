---
title: "Emacs: 'spacious-padding' covers more User Interface elements"
excerpt: "The development version of my 'spacious-padding' now affects the spacing of the mode-line, header-line, and tab-bar."
---

My `spacious-padding` package adds more space around windows and
frames. Starting from today, and as part of its current development
version (`0.2.0-dev`), it also applies to the mode-line, header-line,
and tab-bar-mode. But why am I even writing when I can just post
pictures of my `modus-themes` with their default settings instead?

<a href="{{'/assets/images/attachments/2023-11-15-modus-operandi-no-spacious-padding.png' | absolute_url}}"><img alt="GNU Emacs with default spacing and modus-operandi theme" src="{{'/assets/images/attachments/2023-11-15-modus-operandi-no-spacious-padding.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2023-11-15-modus-operandi-spacious-padding.png' | absolute_url}}"><img alt="GNU Emacs with spacious-padding-mode and modus-operandi theme" src="{{'/assets/images/attachments/2023-11-15-modus-operandi-spacious-padding.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2023-11-15-modus-vivendi-no-spacious-padding.png' | absolute_url}}"><img alt="GNU Emacs with default spacing and modus-vivendi theme" src="{{'/assets/images/attachments/2023-11-15-modus-vivendi-no-spacious-padding.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2023-11-15-modus-vivendi-spacious-padding.png' | absolute_url}}"><img alt="GNU Emacs with spacious-padding-mode and modus-vivendi theme" src="{{'/assets/images/attachments/2023-11-15-modus-vivendi-spacious-padding.png' | absolute_url }}"/></a>

## Remember to tweak it

The user option `spacious-padding-widths` controls the amount of
spacing applied to each element. Here is a sample, using the defaults:

```elisp
(setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :tab-width 4
         :right-divider-width 30
         :scroll-bar-width 8))
```

And then enable the mode:

```elisp
(spacious-padding-mode 1)
```

## Coming soon

I am still testing this. It looks great so far (the `modus-themes`
used to provide an option for mode-line padding some time ago). If you
can give it a try, please do.

I expect to publish version `0.2.0` before the end of this week or, at
latest, before the end of November.

+ Package name (GNU ELPA): `spacious-padding`
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/spacious-padding>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/spacious-padding>
    + GitLab: <https://gitlab.com/protesilaos/spacious-padding>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Backronyms: Space Perception Adjusted Consistently Impacts Overall
  Usability State ... padding; Spacious ... Precise Adjustments to
  Desktop Divider Internals Neatly Generated.
