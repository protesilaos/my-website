---
title: "Emacs: The Modus themes can now be extended with a 'user' palette"
excerpt: "I show the new feature of the Modus themes to define more colours for use as palette overrides"
---

Starting with commit `573db12` in the modus-themes.git repository,
users can now extend the palette of the active theme with their own
colour definitions. This makes it easier to reuse colour values when
defining overrides for palette entries (overrides allow the user to,
for example, change the mapping of `string` from a shade of blue to a
shade of green---changes apply across all faces due to how semantic
entries are defined in the palette).

By default, the palette of each theme includes something like this:

```elisp
;; Excerpt from `modus-operandi-palette'.
(red             "#a60000")
(red-warmer      "#972500")
(red-cooler      "#a0132f")
(red-faint       "#7f0000")
(red-intense     "#d00000")
(green           "#006800")
(green-warmer    "#316500")
(green-cooler    "#00663f")
(green-faint     "#2a5045")
(green-intense   "#008900")
```

As well as semantic mappings like:

```elisp
;; Excerpt from `modus-operandi-palette'.
(builtin magenta-warmer)
(comment fg-dim)
(constant blue-cooler)
(docstring green-faint)
(docmarkup magenta-faint)
(fnname magenta)
(keyword magenta-cooler)
(preprocessor red-cooler)
(string blue-warmer)
(type cyan-cooler)
(variable cyan)
```

Instead of overriding, say, the values of existing entries like `red`
and `magenta-cooler`, the user may now define their own `cherry` and
`plum` colours, which can then be used as part of the palette overrides.

## Add more colours per-theme

Here is how the new definitions are added to the `modus-operandi`
theme:

```elisp
;; Define two new colors in the "user" palette of `modus-operandi'.
;; Other themes will not use these.
(setq modus-operandi-palette-user
      '((cherry "#a0134f")
        (plum "#6f459a")))
```

Each theme provides a user option of the form `THEME-NAME-palette-user`,
where `THEME-NAME` is the name of the theme, like `modus-operandi-tinted`
or `modus-vivendi-tritanopia`.

[ The new colours follow the same principles as those of the core
  palette, so please read the relevant documentation. ]

Now that `cherry` and `plum` are known, they can be used as semantic
palette overrides. Thus:

```elisp
;; Use entries from `modus-operandi-palette-user' in the overrides.
(setq modus-operandi-palette-overrides
      '((cursor cherry)
        (string plum)))
```

The themes have lots of semantic mappings, including for programming
code syntax, Org heading levels, mode lines, and more. Again, read the
manual for the technicalities.

Tweaks on a per-theme basis give the user maximum flexibility. For
example, they can have the above for `modus-operandi` while they use
these for `modus-vivendi`:

```elisp
(setq modus-vivendi-palette-user
      '((apricot "#dfb350")
        (kiwi "#80d458")))

(setq modus-vivendi-palette-overrides
      '((cursor apricot)
        (string kiwi)))
```

## More colours common to all themes

Same principle as above, but instead of defining new colours for each
theme, they are available to all themes:

```elisp
(setq modus-themes-common-palette-user
      '((apricot "#dfb350")
        (cherry "#a0134f")
        (kiwi "#80d458")
        (plum "#6f459a")))
```

Then the user can either apply those to the "common" palette overrides
or implement overrides on a per-theme basis. Since I already showed
the latter, here is the former scenario:

```elisp
(setq modus-themes-common-palette-overrides
      '((cursor apricot)
        (keyword cherry)
        (string kiwi)
        (comment plum)))
```

Note, however, that using common overrides this way runs the risk of
producing inaccessible colour combinations. Indeed, those I show above
are not optimal for all themes. But you get the idea of how this
works.

## Coming in modus-themes version 4.5.0

This feature will be widely available in the next stable release of
the themes, adding to an already comprehensive framework for theming
that is decidedly "Emacs-y" with all the customisations it provides.

I do not know if `4.5.0` can still make it into Emacs 30, as the
branch was created a few days ago, but it will definitely be in
emacs.git (now the development target for Emacs 31) as well as GNU
ELPA.

## About the Modus themes

Highly accessible themes, conforming with the highest standard for
colour contrast between background and foreground values (WCAG AAA).
They also are optimised for users with red-green or blue-yellow colour
deficiency.

The themes are very customisable and provide support for a wide range
of packages.  Their manual is detailed so that new users can get
started, while it also provides custom code for all sorts of more
advanced customisations.

Since August 2020, the original Modus themes (`modus-operandi`,
`modus-vivendi`) are built into Emacs version 28 or higher.  Emacs 28
ships with `modus-themes` version `1.6.0`.  Emacs 29 includes version
`3.0.0`.  Emacs 30 provides a newer, refactored version that
thoroughly refashions how the themes are implemented and customized.
Such major versions are not backward-compatible due to the limited
resources at my disposal to support multiple versions of Emacs and of
the themes across the years.

+ Package name (GNU ELPA): `modus-themes`
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/modus-themes>
  + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes.
