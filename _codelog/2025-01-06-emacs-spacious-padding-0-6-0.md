---
title: "Emacs: spacious-padding version 0.6.0"
excerpt: "Information about the latest version of my 'spacious-padding' package for GNU Emacs."
---

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

Release notes below.

* * *

This is a small release that makes some minor refinements. The package
is otherwise stable and works as expected.


## We use the `spacious-padding` theme instead of `user`

This is an internal detail with how we implement the &ldquo;spacious&rdquo;
changes to the faces we cover. Before, we would override anything that
the user would explicitly configure with `custom-set-faces`, either
via their Elisp code or through the Custom User Interface and the
snippet it automatically generates.

By storing our changes in the bespoke `spacious-padding` theme instead
of the special `user` theme, we do not override the user&rsquo;s preference.
This is the right design in principle, though users may no longer get
the same styles as before because faces they had configured before
will now override what `spacious-padding-mode` does.

When in doubt, search your configuration for `custom-set-faces`,
comment out the whole block, try to re-enable `spacious-padding-mode`,
and see if the results are okay.

Thanks to Martin Marshal for making the initial change in pull request
26: <https://github.com/protesilaos/spacious-padding/pull/26>. The
change is within the `15-line limit of permitted changes without the
need for copyright assignment to the Free Software Foundation. I then
followed it up with the creation of the ~spacious-padding` theme.


## The `tab-line-tab-current` face is supported

This means that `tab-line-mode` will look consistent when
`spacious-padding-mode` is enabled, instead of some tabs looks
smaller/different.


## `spacious-padding-mode` works with `window-divider-mode`

Thanks to Pierre Baille and Tobias Tschinkowitz for bringing up the
problem in issue 17: <https://github.com/protesilaos/spacious-padding/issues/17>.
