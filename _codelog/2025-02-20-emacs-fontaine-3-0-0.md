---
title: 'Emacs: fontaine version 3.0.0'
excerpt: 'Information about the latest version of my fontaine package for GNU Emacs.'
---

Fontaine allows the user to define detailed font configurations and set
them on demand.  For example, one can have a `regular-editing` preset
and another for `presentation-mode` (these are arbitrary, user-defined
symbols): the former uses small fonts which are optimised for writing,
while the latter applies typefaces that are pleasant to read at
comfortable point sizes.

+ Package name (GNU ELPA): `fontaine`
+ Official manual: <https://protesilaos.com/emacs/fontaine>
+ Change log: <https://protesilaos.com/emacs/fontaine-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/fontaine>
  + GitLab: <https://gitlab.com/protesilaos/fontaine>
+ Backronym: Fonts, Ornaments, and Neat Typography Are Irrelevant in Non-graphical Emacs.

Below are the release notes.

* * *


## Version 3.0.0 on 2025-02-20

This version changes the underlying implementation of Fontaine's font
configuration presets. In principle, this should not have any effect
on how users experience the package, though there are some important
details that are different.


### Fontaine is now a "theme"

Fontaine has always modified typography-related faces, such as
`default`, `fixed-pitch`, and `variable-pitch`, to apply the font
family, height, and weight specified by the user. In the past, this
was done in a way that could get overridden under certain conditions,
such as by loading a theme after setting a Fontaine preset configuration.

By making Fontaine a theme, we guarantee that its settings are not
undone. In practice, this means that users do not have to re-apply the
current preset after loading a theme. The function `fontaine-apply-current-preset`
is thus obsolete.

In Emacs, a "theme" is a bundle of configurations. Those typically
cover colours (such as with my `modus-themes`), but a theme can focus
on other settings as well. For example, the popular `use-package` is
internally done as a theme (check the value of `custom-known-themes`).

Fontaine is a theme in the same way `use-package` is, meaning that it
will (i) persist its effects, (ii) not show up in the
`custom-enabled-themes` and so not be affected by something like
`(mapc #'disable-theme custom-enabled-themes)`,
and (iii) not be an option among those presented by `load-theme`.

There are no known bugs, though please contact me if you encounter a
scenario where Fontaine does not do the right thing. Thanks, in this
regard, to Haruko and Emily Hyland for reporting a couple of bugs:

-   <https://github.com/protesilaos/fontaine/issues/14>.
-   <https://github.com/protesilaos/fontaine/issues/15>.


### Fontaine no longer has frame-specific effects

In the past, users could apply a Fontaine preset to the current frame
without affecting other frames. While this could be useful in certain
situations, it was ultimately making the code more complex for
marginal gains. As part of the transition to a theme, which is anyway
global, I am removing everything related to frame-specific functionality.


### Quality-of-life refinements

-   The `fontaine-generic-face-families` are used when necessary to
    guard against `nil` values. Those font families are symbolic
    references to whatever the operating system is configured to use
    (e.g. on Linux this is handled by fontconfig).

-   If Fontaine is instructed to load an invalid preset, it displays a
    warning and does nothing else. Before, it would produce an error,
    which could prevent Emacs from starting up normally if this were to
    happen at startup. A warning is enough to inform the user of what is
    happening.

-   Same principle as above when Emacs is not ran in a graphical
    interface. In text terminals, Fontaine cannot work because it is not
    possible to have different font families, styles, and heights, than
    those of the terminal (hence the backronym of FONTAINE "Fonts,
    Ornaments, and Neat Typography Are Irrelevant in Non-graphical
    Emacs"). Thanks to Jorge Gomez for the patch in pull request 13:
    <https://github.com/protesilaos/fontaine/pull/13>. Further tweaks by
    me.

-   The `fontaine-toggle-preset` command will produce an error if it
    cannot find the preset it is supposed to switch to. The toggle is
    between the last two loaded presets, as done by the command
    `fontaine-set-preset` (the `fontaine-mode` takes care to persist the
    relevant history).
