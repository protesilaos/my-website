---
title: "Emacs: 'standard-themes' version 1.2.0"
excerpt: "Release notes for the latest version of my 'standard-themes' for GNU Emacs."
---

The `standard-themes` are a pair of light and dark themes for GNU
Emacs.  They emulate the out-of-the-box looks of Emacs (which
technically do NOT constitute a theme) while bringing to them thematic
consistency, customizability, and extensibility.  In practice, the
Standard themes take the default style of the font-lock and Org faces,
complement it with a wider and hamronious colour palette, address many
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

## Support for palette overrides

It is now possible to override the palette of each Standard theme.
This is the same feature that I implemented for the `modus-themes`,
except it is a bit more limited in scope (the Modus themes are
maximalist due to their accessibility target).

Overrides allow the user to tweak the presentation of either or both
themes, such as to change the colour value of individual entries and/or
remap how named colors are applied to semantic code constructs.

For example, the user can change what the exact value of `blue-warmer`
is and then, say, make comments use a shade of green instead of red.

There are three user options to this end:

-   `standard-themes-common-palette-overrides` which covers both themes.
-   `standard-dark-palette-overrides` which concerns the dark theme.
-   `standard-light-palette-overrides` which is for the light theme.

The theme-specific overrides take precedence over the "common" ones.

The theme's palette with named colors can be previewed with the
commands `standard-themes-preview-colors` and
`standard-themes-preview-colors-current`.  When called with a
universal prefix argument (`C-u` with default key bindings) these
commands produce a preview of the semantic colour mappings (e.g. what
colour applies to level 2 headings).

Use the preview as a reference to find entries to override.  And
consult the manual for the technicalities.

Thanks to Clemens Radermacher for fixing a mistake I made in the code
that produces the palette previews.


## Added the function `standard-themes-get-color-value`

It returns the colour value of named `COLOR` for the current Standard
theme.

`COLOR` is a symbol that represents a named colour entry in the
palette.

If the value is the name of another colour entry in the palette (so a
mapping), recur until you find the underlying colour value.

With optional `OVERRIDES` as a non-nil value, account for palette
overrides.  Else use the default palette.

With optional `THEME` as a symbol among `standard-themes-items`, use
the palette of that item.  Else use the current Standard theme.

If `COLOR` is not present in the palette, return the `unspecified`
symbol, which is safe when used as a face attribute's value.

The manual provides this information and also links to relevant
entries.  The example it uses, with the `standard-light` as current:

```elisp
;; Here we show the recursion of palette mappings.  In general, it is
;; better for the user to specify named colors to avoid possible
;; confusion with their configuration, though those still work as
;; expected.
(setq standard-themes-common-palette-overrides
      '((cursor red)
        (prompt cursor)
        (variable prompt)))

;; Ignore the overrides and get the original value.
(standard-themes-get-color-value 'variable)
;; => "#a0522d"

;; Read from the overrides and deal with any recursion to find the
;; underlying value.
(standard-themes-get-color-value 'variable :overrides)
;; => "#b3303a"
```

## New user option `standard-themes-disable-other-themes`

This user option is set to `t` by default.  This means that loading a
Standard theme with the command `standard-themes-toggle` or the
functions `standard-theme-load-dark`,  `standard-theme-load-light`
will disable all `custom-enabled-themes`.

When the value of this user option is nil, themes are loaded without
disabling other entries outside their family.  This retains the
original (and in my opinion bad for most users) behaviour of Emacs
where it blithely blends multiple enabled themes.

I consider the blending a bad default because it undoes the work of
the designer and often leads to highly inaccessible and unpredictable
combinations.  Sure, experts can blend themes which is an argument in
favour of making that behaviour opt-in.


## Other changes

-   Refined the `standard-dark` theme's `bg-hl-line` background.  This
    makes it easier to read the underlying text of the currently
    highlighted line in hl-line-mode.

    Thanks to Manuel Uberti for the feedback on the mailing list:
    <https://lists.sr.ht/~protesilaos/standard-themes/%3C6e218fc0-f2dc-e03f-4e42-da0cbf9bd79b%40inventati.org%3E>.

-   Clarified some statements in the documentation about the palette
    overrides.  Thanks to Tassilo Horn for the feedback on the mailing
    list: <https://lists.sr.ht/~protesilaos/standard-themes/%3C87cz8bjrwz.fsf%40gnu.org%3E>.


## Acknowledgement

Thanks to Fritz Grabo who provided feedback via a private channel.
With it, I was able to better understand the underlying patterns of
the out-of-the-box Emacs faces and thus design the `standard-themes`
accordingly.  This information is shared with permission.

As a reminder, the Standard themes are an interpretation of the
default Emacs faces (which technically are not a "theme").  I have
expanded the effective palette with harmonious entries, made mappings
that are consistent with the patterns found in some base faces, and
extended support for lots of packages.  At first sight, the Standard
themes look like what you get with an unconfigured Emacs.  Though make
no mistake: they are far more detail-oriented.
