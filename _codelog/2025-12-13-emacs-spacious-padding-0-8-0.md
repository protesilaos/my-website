---
title: "Emacs: spacious-padding version 0.8.0"
excerpt: "Information about the latest version of my 'spacious-padding' package for GNU Emacs."
---

This package provides a global minor mode to increase the
spacing/padding of Emacs windows and frames.  The idea is to make
editing and reading feel more comfortable.  Enable the mode with `M-x
spacious-padding-mode`.  Adjust the exact spacing values by modifying
the user option `spacious-padding-widths`.

+ Package name (GNU ELPA): `spacious-padding`
+ Official manual: <https://protesilaos.com/emacs/spacious-padding>
+ Change log: <https://protesilaos.com/emacs/spacious-padding>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/spacious-padding>
  + GitLab: <https://gitlab.com/protesilaos/spacious-padding>
+ Sample images:
  - <https://protesilaos.com/codelog/2023-06-03-emacs-spacious-padding/>
  - <https://protesilaos.com/codelog/2023-11-15-spacious-padding-extra-ui-dev/>
+ Backronyms: Space Perception Adjusted Consistently Impacts Overall
  Usability State ... padding; Spacious ... Precise Adjustments to
  Desktop Divider Internals Neatly Generated.

* * *

This release introduces some nice refinements and fixes a couple of
subtle bugs.


### Subtle mode and header line

The new user option `spacious-padding-subtle-frame-lines` supersedes
the `~spacious-padding-subtle-mode-line`. It does the same thing,
namely, of making the mode lines use only a thin line instead of a
background. Though it extends this feature to header lines as well.

The documentation string of `spacious-padding-subtle-frame-lines`
describes the technicalities and includes examples. In short, we can
associate a keyword with either a face that has a foreground color or
a color value directly. For the convenience of the user, the package
also defines the faces `spacious-padding-line-active` and
`spacious-padding-line-inactive`. Here is a sample configuration:

```elisp
;; Read the doc string of `spacious-padding-subtle-mode-line' as it
;; is very flexible.  Here we make the mode lines be a single
;; overline, while header lines have an underline.
(setq spacious-padding-subtle-frame-lines
      '( :mode-line-active spacious-padding-line-active
         :mode-line-inactive spacious-padding-line-inactive
         :header-line-active spacious-padding-line-active
         :header-line-inactive spacious-padding-line-inactive))
```

In the future, we might decide that other elements can benefit from
this style.


### The header line underline is spaced further away from the text

As noted above, when `spacious-padding-subtle-frame-lines` is
configured to cover header lines, those will be drawn with an
underline. This will not intersect with the text of the header line.

Normally, underlines cut through letters that descend below the
baseline, such as the letters `g` and `y`. We choose to avoid that
because it makes for a cleaner interface (though I personally think it
is not a good style for paragraph text, because of the rivers of
negative space it introduces).

This specific design is available for Emacs version 29 or higher.
Users of Emacs 28 must set `x-underline-at-descent-line` to a
non-`nil` value. Though note that this has a global effect: we cannot
limit it to a single face.

Thanks to Steven Allen for covering this in pull request 37:
<https://github.com/protesilaos/spacious-padding/pull/37>. Steven has
assigned copyright to the Free Software Foundation.


### The `spacious-padding-widths` can affect Custom buttons

This is about the buttons we find in buffers of the Custom system. For
example, we get such a buffer after we do `M-x customize`.

The relevant keyword is `:custom-button-width`. It is set to a number
of spaces for padding. Here is the default value and, as always, the
documentation cover the details:

```elisp
(setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :custom-button-width 3 ; the new one
         :tab-width 4
         :right-divider-width 30
         :scroll-bar-width 8
         :fringe-width 8))
```

### Fixes for the Emacs daemon

There were reports about incorrect face specifications that could
happen when Emacs was started as a daemon process. I made the relevant
changes. Also thanks to kaibagley for covering a line I had missed.
This was done in pull request 43: <https://github.com/protesilaos/spacious-padding/pull/43>.

Related threads:

-   Issue 35, as reported by Chinmay Dalal: <https://github.com/protesilaos/spacious-padding/issues/35>.
-   Issue 41, as reported by zealotrush: <https://github.com/protesilaos/spacious-padding/issues/41>.
