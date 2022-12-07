---
title: "Emacs: change colour values and mappings in Modus themes version 4"
excerpt: "Overview of the power of customisation that 'modus-themes' version 4 brings."
---

The forthcoming "version 4" rewrite of the `modus-themes` simplifies
the code while also making it more powerful and easier to extend.  The
code is currently in the `version-4` branch and will be merged into
`main` in the coming weeks (WORK-IN-PROGRESS).

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

In this article, I demonstrate the power of the new design compared to
what we had before.

## How do I get back my "yellow comments"?

Before, we had the user option `modus-themes-syntax`.  It took a list
of symbols which changed how syntax highlighting looked.  The accepted
symbols were predefined: there was a `yellow-comments` style and a
`green-strings`, among others.

The problem was that the user could not, say, easily define a red hue
for their comments nor change the exact colour value for them.  The
design was hardcoded.

With `version-4` I am abstracting the colour palette and introducing
colour mappings.  The user can now provide overrides for values and
those mappings in a uniform fashion.

Using the `modus-operandi` theme as an example, I can make its
comments a shade of yellow:

```elisp
(setq modus-operandi-palette-overrides
      '((comment yellow)))
```

And here is with a red colour:

```elisp
(setq modus-operandi-palette-overrides
      '((comment red-faint)))
```

Reload the theme for changes to take effect.

Use the command `modus-themes-list-colors` to preview all the colours
in the palette.

To view all the colour values/mappings, visit a theme file such as
`modus-operandi-theme.el`.

## Semantic mappings

If you check the definition of each theme, you will find
easy-to-understand names such as these:

```
(builtin magenta-warmer)
(comment fg-dim)
(constant blue-cooler)
(docstring green-faint)
(fnname magenta)
(keyword magenta-cooler)
(preprocessor red-cooler)
(string blue-warmer)
(type cyan-cooler)
(variable cyan)
```

Want your keywords to be blue?  No problem!  Red strings?  Say no
more:

```elisp
(setq modus-operandi-palette-overrides
      '((keyword blue)
        (string red)))
```

## Meaningful colour names

In the past, colours were named like `magenta`, `magenta-alt`,
`magenta-alt-other` whereas now they are called `magenta`,
`magenta-warmer`, `magenta-cooler`.  You can thus expect the
`magenta-cooler` to be closer to blue and the `magenta-warmer` closer
to red.

Using the code I shared above, we can override colour values in the
same way.  For example, I want `red` to be a pure red and `blue` to be
pure blue:

```elisp
(setq modus-operandi-palette-overrides
      '((red "#ff0000")
        (blue "#0000ff")
        (keyword blue)
        (string red)))
```

## Fewer user options; more power

If you check the `version-4` branch, you will notice that **many user
options have been deprecated** ("user options" are the `defcustom`
variables).  We do not need them---and their complexity---when the
aforementioned mechanism gives the user almost complete control over
the looks of the theme.

A word of caution for those who used to override colours in previous
versions of the themes: the old user options will not work, nor will
the definition of colours as cons cells (e.g. `(red . "#ff0000")`).
Check how the themes are defined and copy+tweak the relevant entries
into the corresponding "overrides" variable.

The manual will include comprehensive examples along those lines.  If
something is unclear, you can always contact me.

Version 4 of the `modus-themes` will be available at the end of this
month or the beginning of the next one.  Your feedback on the
development process is most welcome.

[ I also have a little surprise for those who check the `version-4`
  branch right now: new themes, which are made possible by the cleaner
  design. ]
