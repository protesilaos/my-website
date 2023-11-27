---
title: "Emacs: 'standard-themes' version 2.0.0"
excerpt: "Release notes for the latest version of my 'standard-themes' for GNU Emacs."
---

The `standard-themes` are a pair of light and dark themes for GNU
Emacs. They emulate the out-of-the-box looks of Emacs (which
technically do NOT constitute a theme) while bringing to them thematic
consistency, customizability, and extensibility. In practice, the
Standard themes take the default style of the font-lock and Org faces,
complement it with a wider and harmonious colour palette, address many
inconsistencies, and apply established semantic patterns across all
interfaces by supporting a large number of packages.

+ Package name (GNU ELPA): `standard-themes`
+ Official manual: <https://protesilaos.com/emacs/standard-themes>
+ Change log: <https://protesilaos.com/emacs/standard-themes-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/standard-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/standard-themes>
    + GitLab: <https://gitlab.com/protesilaos/standard-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/standard-themes>
+ Backronym: Standard Themes Are Not Derivatives but the
  Affectionately Reimagined Default ... themes.

Below are the release notes.

* * *

## Deprecated several user options that changed colours

The following user options are deprecated in favour of palette
overrides (more in the following section):

-   `standard-themes-mode-line-accented`
-   `standard-themes-links`
-   `standard-themes-region`
-   `standard-themes-fringes`

In the same spirit, the user option `standard-themes-prompts` no
longer affects colours.


## All colour-related tweaks are done via palette overrides

In previous versions of the themes, we provided certain hardcoded
colour variations, such as for an "accented" mode line and more
"intense" fringes. We no longer do so, in favour of a more flexible
approach that empowers the user to pick the exact colour they like.

The Standard themes provide the means to override every entry in their
palette. Each palette defines named faces (such as what is the exact
hexademical Red-Green-Blue value of `blue-warmer`) as well as semantic
colour mappings (like `bg-mode-line-active`). Users can configure
either the `standard-themes-common-palette-overrides` or the
theme-specific ones, `standard-dark-palette-overrides`,
`standard-light-palette-overrides`.

Refer to the manual for how this can be done:
<https://protesilaos.com/emacs/standard-themes#h:34fe0582-960b-45dc-af5d-23c8f3e9d724>.
And/or use the commands to preview the palette:
`standard-themes-preview-colors`,
`standard-themes-preview-colors-current`. Below is a sample:

```elisp
(setq standard-themes-common-palette-overrides
      '((cursor red-warmer)
        (bg-mode-line-active bg-blue-subtle)))
```

[ This is the same functionality found in my `modus-themes` and
  `ef-themes`. Modus has the most palette entries and widest package
  support due to its maximalist scope. ]


## The `standard-themes-prompts` accept any typographic weight

This user option applies to prompt texts of all sorts, such as the
minibuffer and command-line shells. It now accepts any supported
typographic weight as part of its value. The list of weights are
recorded in the documentation of the variable
`standard-themes-weights` as well as the manual.


## Headings have more semantic colour mappings associated with them

Apart from the foreground, each heading level from 0 to 8 now has a
background and an overline. These new palette entries are set to the
`unspecified` value, meaning that they do not have any visual effect.
Users can set them to a colour via palette overrides to have headings
with a background and/or an overline (per heading level).

Building on the previous sample code with the overrides:

```elisp
(setq standard-themes-common-palette-overrides
      '((cursor red-warmer)
        (bg-mode-line-active bg-blue-subtle)

        ;; Extra space for didactic purposes

        (fg-heading-1 rainbow-1)
        (fg-heading-2 rainbow-2)

        (bg-heading-1 bg-blue-nuanced)
        (bg-heading-2 bg-yellow-nuanced)

        (overline-heading-1 blue-faint)
        (overline-heading-2 yellow-faint)

        ))
```

Always remember to reload the theme for changes to take effect.

Contact me if you need any help.


## Space-related semantic colour mappings are available

The `whitespace-mode` and related faces now use new palette entries
that are specific to them. This means that users can easily make space
characters more intense/subtle. As part of this redesign, the
background that was enabled by default is now removed to accommodate
uses of `whitespace-mode` in spacing-sensitive programming modes: an
intensely coloured background on every space makes it hard to edit the
text.


## The `display-line-numbers-mode` benefits from semantic colour mappings

A new subset of palette entries applies to line numbers. It covers
foreground and background values for the current/other line numbers.
Users can style them as they see fit by using palette overrides. For
example, this makes line numbers have a subtle grey backgrounds to not
be mistaken for the contents of the buffer:

```elisp
(setq standard-themes-common-palette-overrides
      '((cursor red-warmer)
        (bg-mode-line-active bg-blue-subtle)

        ;; Extra space for didactic purposes

        (fg-heading-1 rainbow-1)
        (fg-heading-2 rainbow-2)

        (bg-heading-1 bg-blue-nuanced)
        (bg-heading-2 bg-yellow-nuanced)

        (overline-heading-1 blue-faint)
        (overline-heading-2 yellow-faint)

        (bg-line-number-active bg-active)
        (bg-line-number-inactive bg-dim)

        ))
```


## More semantic colour mappings for dates

The palette of each theme now defines an expanded subset of entries
for dates. These include, among others, what we find in the Org agenda
and the `M-x calendar`, such as `date-weekday`, `date-scheduled`, and
more. Use palette overrides to tweak them accordingly.


## More packages are supported

Support for more packages means that the theme looks consistent across
a variety of interfaces (this is, after all, the original idea behind
the `standard-themes` otherwise an unthemed Emacs looks too
inconsistent---sorry!). For this version, we include the following in
an already long list:

-   breadcrumb
-   centaur-tabs
-   corfu-candidate-overlay
-   jit-spell
-   nerd-icons
-   nerd-icons-dired
-   nerd-icons-ibuffer
-   vundo
-   which-key


## Ediff faces do not implicitly depend on diff-mode

The Ediff faces used to inherit from the built-in `diff-mode`. This
introduced a dependency and so using something like `M-x ediff-files`
before loading `diff-mode` would result in an error. Ediff faces are
thus designed to stand on their own.


## "Flagged" and "trashed" emails are now distinct

They used to have the same colour, but this is no more. The change
covers the `mu4e` and `notmuch` packages.


## Miscellaneous

-   Revised the colour value of the `standard-dark` `bg-region` palette
    entry. The previous one was the same as the original colour used by
    the `region` face against a dark background: an intense blue. The
    new value is still blue, though it is toned down to do what it needs
    to do without exaggerations. (Remember that the point of the
    `standard-themes` is to be faithful to the defaults, but I still
    apply judgement where I think improvements can be made without
    changing the character of the themes).

-   Added support for the `appt-notification` face (which I introduced
    in Emacs 30).

-   Extended support for the various `flymake` "echo" and "end of line"
    faces (e.g. `flymake-error-echo`, `flymake-end-of-line-diagnostics-face`).

-   Removed the deprecated `consult-preview-cursor` face. This was done
    in commit `267b0c9` on the Consult Git repository. Discussed here:
    <https://github.com/minad/consult/issues/764#issuecomment-1537491625>.

-   Revised colours used in the `all-the-icons` faces. They now look
    more consistent.

-   Deleted the underline from the `org-ellipsis` face. Org files are
    already too busy and we do not need more of that.

-   Made the `eglot-diagnostic-tag-unnecessary-face` look like a
    warning. By default it inherits the 'shadow' face, which makes it
    counter-intuitive as it dims the text instead of bringing it to our
    attention. The intent of `eglot-diagnostic-tag-unnecessary-face` is
    to highlight unused symbols, so this is better presented as a
    warning.

    Thanks to Augusto Stoffel for bringing this matter to my attention.
    This was done via a private channel and the information is shared
    with permission.

-   Rewrote most of the manual to remove the deprecated user options,
    expand the documentation where necessary, and tweak the sample
    configuration.

-   Expanded the `deftheme` definition of each theme's metadata. This is
    to support new features in Emacs where themes can specify the set
    they belong to, as well as whether they are light or dark. The
    built-in command is `theme-choose-variant`. This is in response to
    Emacs bug#65468: <https://debbugs.gnu.org/cgi/bugreport.cgi?bug=65468>.
    Thanks to Mauro Aranda for bringing this matter to my attention.

-   Replaced function calls that depended on `cl-lib.el` with equivalent
    ones from `seq.el`. The latter is loaded by default and we did not
    need the CL features, anyway.
