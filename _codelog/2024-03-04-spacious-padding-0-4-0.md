---
title: "Emacs: spacious-padding version 0.4.0"
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

This version add some quality-of-life improvements to an already solid
package.


## The vertical border can now remain visible

The user option `spacious-padding-widths` is the single point of entry
for all types of padding supported by the package. The property
`:right-divider-width` applies to the vertical border between windows.
When it is set to 1 pixel in width, it is no longer made invisible.
Higher values do make it invisible, to produce the padding effect.

Spacing between windows can still be increased by modifying the
now-supported fringes (more below, including a code sample).

Thanks to Aronne Raimondi for suggesting the possibility of a visible
divider. This was done via a private channel and the information is
shared with permission.


## Add padding to the window fringes

The fringe area is the space to the left and right side of every
window where indicators such as for line continuation/truncation are
displayed. The user option `spacious-padding-widths` can now be
configured to either (i) apply the same width to both fringes, per the
`:fringe-width` property, or (ii) set different width values for
either side with `:right-fringe-width` and `:left-fringe-width`.

The default value is 8, which the standard width of fringes. This
means that there is no visible change for users unless they opt to
modify the relevant value.

Sample using the default:

```elisp
(setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :tab-width 4
         :right-divider-width 30
         :fringe-width 20 ; Make both fringes 20 pixels wide
         :scroll-bar-width 8))
```

Or this for individuated values:

```elisp
(setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :tab-width 4
         :right-divider-width 30
         :right-fringe-width 20 ; Make the right fringe 20 pixels wide
         :left-fringe-width 8 ; Make the left fringe 8 pixels wide
         :scroll-bar-width 8))
```

When combined with the aforementioned setting to keep the window
divider visible, we can have something like this:

```elisp
(setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :tab-width 4
         :right-divider-width 1 ; Keep a visible vertical line between windows
         :fringe-width 20 ; Make both fringes 20 pixels wide
         :scroll-bar-width 8))
```


## The built-in `tab-line-mode` is also covered

Previous versions of the package provided stylistic support for
`tab-bar-mode`. This is now extended to `tab-line-mode`. Thanks to
Lucas Gruss for providing the impetus for this inclusion in pull
request 6: <https://github.com/protesilaos/spacious-padding/pull/6>.

Building on that, all tabbed interfaces are subject to the property
`:tab-width` of the `spaicous-padding-widths`. A granular
configuration is also possible with the `:tab-bar-width` and
`:tab-line-width`.

Thanks again to Lucas Gruss for suggesting this arrangement. We
discussed this as a follow-up to Lucas&rsquo; contribution in commit
1bbc076. The discussion took place in the context of pull request 6:
<https://github.com/protesilaos/spacious-padding/pull/6>.

Using the default value of `spaicous-padding-widths` as a starting
point, we can thus have the following:

```elisp
(setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :tab-width 4 ; `tab-bar-mode' and `tab-line-mode' are uniform
         :right-divider-width 30
         :scroll-bar-width 8
         :fringe-width 8))
```

Or this:

```elisp
(setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :tab-bar-width 4 ; `tab-bar-mode' has a padding of 4 pixels
         :tab-line-width 2 ; `tab-line-mode' has a padding of 2 pixels
         :right-divider-width 30
         :scroll-bar-width 8
         :fringe-width 8))
```

## No more SourceHut

Development continues on GitHub with GitLab as a mirror.

I explained my reasons here: <https://protesilaos.com/codelog/2024-01-27-sourcehut-no-more/>.

This is a change that affects all my Emacs packages.


## Miscellaneous

-   The properties of the user option `spacious-padding-widths` accept a
    `nil` value when configured via the Custom user interface,
    `customize-set-variable`, `setopt`, or related.

-   The `vertical-border` face is explicitly supported. This ensures
    that colours are the way we need them to be.

-   The manual reflects all of the above.
