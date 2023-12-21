---
title: "Emacs: spacious-padding version 0.3.0"
excerpt: "Information about the latest version of my 'spacious-padding' package for GNU Emacs."
---

This package provides a global minor mode to increase the
spacing/padding of Emacs windows and frames.  The idea is to make
editing and reading feel more comfortable.

+ Package name (GNU ELPA): `spacious-padding`
+ Official manual: <https://protesilaos.com/emacs/spacious-padding>
+ Change log: <https://protesilaos.com/emacs/spacious-padding>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/spacious-padding>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/spacious-padding>
    + GitLab: <https://gitlab.com/protesilaos/spacious-padding>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Sample images:
  - <https://protesilaos.com/codelog/2023-06-03-emacs-spacious-padding/>
  - <https://protesilaos.com/codelog/2023-11-15-spacious-padding-extra-ui-dev/>
+ Backronyms: Space Perception Adjusted Consistently Impacts Overall
  Usability State ... padding; Spacious ... Precise Adjustments to
  Desktop Divider Internals Neatly Generated.

Release notes below.

* * *

## Version 0.3.0 on 2023-12-21


### Enjoy the optional subtle mode lines

The new user option `~spacious-padding-subtle-mode-line` makes mode
lines more subtle. It does so by removing the background and adding an
overline in its stead.

By default, `spacious-padding-mode` does not refashion the mode lines
other than adding to them some extra padding (per `spacious-padding-widths`).
The user option `spacious-padding-subtle-mode-line` does change the
mode lines so that instead of a background they only have an overline,
while preserving whatever padding is in effect.

The value bound to `spacious-padding-subtle-mode-line` is either a
boolean type or a plist. If it is non-nil, use the foreground of the
underlying mode line face to derive the color of the overline.

If the non-nil value is a plist read the following keys to determine
the exact style of the overlines.

-   `:mode-line-active` refers to the active/current mode line.

-   `:mode-line-inactive` refers to the inactive/non-current mode lines.

Each key accepts either a face or a string representing a color as its
associated value:

-   The face is an unquoted symbol, such as `success` or `shadow`, whose
    `:foreground` attribute is queried to extract the desired color value.

-   The color is a name among those listed in the output of the command
    `list-colors-display` or a hexadecimal RGB value, such as `#123456`.

If the key is missing or its value is not one of the above, fall back
to reading the foreground of the underlying mode line face to
determine the color of the overline.

Examples of valid configurations:

```elisp
;; Use the foreground of the underlying mode line face to determine
;; the color of the overline (e.g. the inactive mode line has gray
;; text, so render the overline in the same gray).
(setq spacious-padding-subtle-mode-line t)

;; Use the foreground of the `error' face (typically a red hue) for
;; the active mode line's overline.  For the inactive mode line, fall
;; back to the foreground color of the underlying face (as in the case
;; of the t shown above).
(setq spacious-padding-subtle-mode-line
      '(:mode-line-active error))

;; As above, but now use the foreground of the `shadow' face for the
;; inactive mode line.
(setq spacious-padding-subtle-mode-line
      '(:mode-line-active error :mode-line-inactive shadow))

;; Use color values directly.
(setq spacious-padding-subtle-mode-line
      '(:mode-line-active "#0000ff" :mode-line-inactive "gray50"))
```

### Expanded documentation

The `spacious-padding` package now comes with an Info manual. When
looking at the source code, this is done in the `README.org` file,
which the GNU ELPA machinery automatically converts to Info. A change
log is also provided.

Their respective web links are these:

-   <https://protesilaos.com/emacs/spacious-padding>
-   <https://protesilaos.com/emacs/spacious-padding-changelog>
