---
title: "Emacs: spacious-padding version 0.7.0"
excerpt: "Information about the latest version of my 'spacious-padding' package for GNU Emacs."
---

This is a small release that makes `spacious-padding-mode` work as
intended when used in tandem with the Emacs daemon and subsequent
calls to `emacsclient -c`. I made the function responsible for
triggering the "spacious padding" effects work with individual frames
and then I responded to issue 33 by Lou Woell about integrating that
with the `server-after-make-frame-hook`: <https://github.com/protesilaos/spacious-padding/issues/33>.

Additionally, the package now defines two faces that can be used to
configure the user option `spacious-padding-subtle-mode-line` (read
its documentation string for all the possible values it accepts).

Here is how they can be set (default value is `nil`):

```elisp
(setq spacious-padding-subtle-mode-line
      '( :mode-line-active spacious-padding-subtle-mode-line-active
         :mode-line-inactive spacious-padding-subtle-mode-line-inactive))
```

Reload the `spacious-padding-mode` for changes to take effect.

When configured this way and with default styles they make the mode
line use a minimalist overline with no background colour. The active
mode line has a more noticeable border than the inactive ones. All my
themes are designed to support this aesthetic (though themes can style
those faces as they see fit).

## About Spacious Padding

This package provides a global minor mode to increase the
spacing/padding of Emacs windows and frames.  The idea is to make
editing and reading feel more comfortable.  Enable the mode with `M-x
spacious-padding-mode`.  Adjust the exact spacing values by modifying
the user option `spacious-padding-widths`.

Inspiration for this package comes from [Nicolas Rougier's impressive
designs](https://github.com/rougier) and [Daniel Mendler's
`org-modern` package](https://github.com/minad/org-modern).

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
