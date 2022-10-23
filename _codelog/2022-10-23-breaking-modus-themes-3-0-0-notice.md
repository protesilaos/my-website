---
title: "Emacs: minor breaking changes coming to modus-themes 3.0.0"
excerpt: "The default value of some user options changes in the forthcoming release of version 3.0.0 of the modus-themes for GNU Emacs."
---

The next release of the `modus-themes` includes a new default value
for three user options.  From the Git commit log:

```
bc8604e 2022-10-23 04:11:05 +0300 BREAKING Make modus-themes-fringes visible
3c272ec 2022-10-23 03:58:36 +0300 BREAKING Make modus-themes-hl-line intense
681e031 2022-10-23 03:50:22 +0300 BREAKING Make modus-themes-completions intense
```

Each change is small, though still noticeable.  The intent is to
provide a more usable out-of-the-box experience, prioritising users
who are not aware that these themes are highly customisable.

The changes to `modus-themes-completions` and `modus-themes-hl-line`
increase the intensity of the grey background colour of the
highlighted line.  Some users have had trouble discerning the previous
default value.  This is at least in part due to limitations in the
underlying hardware, which misrepresents shades of light/dark grey or
black.

[ Try to calibrate your monitor's settings by relying on resources
  such as <http://www.lagom.nl/lcd-test/black.php> and
  <http://www.lagom.nl/lcd-test/white.php>.  Or find some software
  that affects colour output (e.g. `xrandr` can influence the gamma
  value of the red, green, blue channels of light).  ]

The change to `modus-themes-fringes` deviates from the previous style
as it now makes the fringes visible.  The "fringes" are a narrow area
to the side of each buffer that can contain indicators such as those
for truncated or wrapped lines.  I am rendering them conspicuous
because they make it easier to spot the vertical border that divides
windows in a frame.  They also complement nicely the default style of
the themes for the `display-line-numbers-mode`, which many users
enable (often globally).

All things considered, these tweaks do not refashion the character of
the themes.  Existing users may not like them though, in which case
they are advised to add this to their init file BEFORE loading either
`modus-operandi` or `modus-vivendi`:

```elisp
(setq modus-themes-completions nil
      modus-themes-hl-line nil
      modus-themes-fringes nil)
```

[ Any change to a user option after the theme has been loaded requires
a theme reload. ]

I expect to release version `3.0.0` of the Modus themes before the end
of this month.  The plan is to have it coincide with the cut of the
`emacs-29` branch, which is expected to happen in November (the themes
are built into Emacs).

* * *

+ Package name (GNU ELPA): `modus-themes` (also built into Emacs >= 28)
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/modus-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/modus-themes>
    + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes
