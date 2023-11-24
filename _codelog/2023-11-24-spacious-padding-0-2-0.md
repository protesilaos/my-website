---
title: "Emacs: spacious-padding version 0.2.0"
excerpt: "Information about the latest version of my 'spacious-padding' package for GNU Emacs."
---

This package provides a global minor mode to increase the
spacing/padding of Emacs windows and frames.  The idea is to make
editing and reading feel more comfortable.  Enable the mode with `M-x
spacious-padding-mode`.  Adjust the exact spacing values by modifying
the user option `spacious-padding-widths`.

+ Package name (GNU ELPA): `spacious-padding`
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/spacious-padding>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/spacious-padding>
    + GitLab: <https://gitlab.com/protesilaos/spacious-padding>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Backronyms: Space Perception Adjusted Consistently Impacts Overall
  Usability State ... padding; Spacious ... Precise Adjustments to
  Desktop Divider Internals Neatly Generated.

Release notes below.

* * *

[ I provide screenshots in a recent publication:
  <https://protesilaos.com/codelog/2023-11-15-spacious-padding-extra-ui-dev/> ]

The package is stable and works well. This set of changes expands the
concept of "spacious padding" to more user interface elements, namely:

- active and inactive mode lines;
- header line;
- the `tab-bar-mode`.

The user option which sets all the width values is
`spacious-padding-widths`. It now reads keywords that correspond to
the aforementioned elements. Concretely, here are the defaults:

```elisp
(setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :tab-width 4
         :right-divider-width 30
         :scroll-bar-width 8))
```

After changing the widths, reload the `spacious-padding-mode` for
changes to take effect.

I have taken care to make 'spacious-padding-mode' work even when the
`spacious-padding-widths` does not include all keywords. This means
that the previously supported value will continue to work (the
previous value did not have the keywords `header-line-width`,
`mode-line-width`, and `tab-width`).
