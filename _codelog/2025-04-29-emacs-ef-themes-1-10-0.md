---
title: 'Emacs: ef-themes version 1.10.0'
excerpt: 'Information about the latest version of my colourful-yet-legible themes for GNU Emacs.'
---

The `ef-themes` are a collection of light and dark themes for GNU
Emacs that provide colourful ("pretty") yet legible options for users
who want something with a bit more flair than the `modus-themes` (also
designed by me).

+ Package name (GNU ELPA): `ef-themes`
+ Official manual: <https://protesilaos.com/emacs/ef-themes>
+ Change log: <https://protesilaos.com/emacs/ef-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/ef-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/ef-themes>
  + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Backronym: Eclectic Fashion in Themes Hides Exaggerated Markings,
  Embellishments, and Sparkles.

Below are the release notes.

* * *

## Version 1.10.0 on 2025-04-29

This version introduces minor refinements to an already stable
package.


### The palette preview uses a tabulated interface

The commands `ef-themes-preview-colors` and `ef-themes-preview-colors-current`
produce a preview of the given theme's palette. In the past, we were
using a bespoke buffer for this task, just how the built-in command
`list-colors-display` does it.

Now we rely on the built-in `tabulated-list-mode` to get a cleaner
tabulated view. Plus, users can sort by column.


### Support for more faces or face groups

-   Added support for my `tmr` package. This will be especially
    noticeable in its tabulated view (used to show timers, with the
    command `tmr-tabulated-view` (alias `tmr-list-timers`)).

-   Added explicit support for my `spacious-padding` package.
    Specifically, this is for the faces `spacious-padding-subtle-mode-line-active`
    and `spacious-padding-subtle-mode-line-inactive`. Those can be
    configured as part of the user option `spacious-padding-subtle-mode-line`.

    ```elisp
    (setq spacious-padding-subtle-mode-line
          '( :mode-line-active spacious-padding-subtle-mode-line-active
             :mode-line-inactive spacious-padding-subtle-mode-line-inactive))
    ```

-   Made the `helpful` headings use whatever the style of level 1
    headings is, as defined by the user option `ef-themes-heading`.
    Thanks to John Haman for applying the relevant code we have for the
    `modus-themes`. The change is small (and comes from my `modus-themes`,
    anyway), meaning that John does not need to assign copyright to the
    Free Software Foundation.

-   Added support for the `howm` package.

-   Extended support for the `auto-dim-other-buffers` package to include
    its `auto-dim-other-buffers-hide-face`.

-   Made sure that all new `transient` faces conform with the design
    priorities of the themes. Concretely, this means that they do not
    support any colour-coding: all keys look the same, regardless of
    whether they mean "continue", "exit", or anything else.
    Colour-coding with a full spectrum of colours cannot be accessible
    (and I do not believe colour-coding alone even works because the
    colours have nothing else to be associated with, like how a red line
    in a diff buffer also goes together with the minus sign).

    Thanks to Kevin Fleming for including the `transient-key-stack` face
    that I had originally missed. This was done in pull request 54:
    <https://github.com/protesilaos/ef-themes/pull/54>. The change is
    small, meaning that Kevin does not need to assign copyright to the
    Free Software Foundation

-   Extended support for `adoc-mode` courtesy of Leilei332. This was
    done in pull request 52: <https://github.com/protesilaos/ef-themes/pull/52>.

    The change is within the ~15-line limit, meaning that its author does
    not need to assign copyright to the Free Software Foundation.
