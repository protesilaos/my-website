---
title: 'Emacs: ef-themes version 2.0.0'
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



## Version 2.0.0 on 2025-11-09

The Ef themes are now derived from my Modus themes. This means that
they inherit the wide face coverage and extensive customisability of
Modus, while retaining their stylistic flair.

The Ef themes no longer provide any user options of their own. Each of
the options we had before is now an alias for the Modus equivalent. As
part of this transition, the Ef themes actually gain new customisation
options, which are documented herein.

Furthermore, the Ef themes do not define any commands to load a theme.
What we had before is once again an alias for the equivalent Modus
command.

The manual of the Ef themes describes these compatibility
arrangements. Further documentation and code samples are available in
the manual of the Modus themes:

-   **Info page:** Evaluate  `(info "(modus-themes) Top")`.
-   **Weg page:** Visit <https://protesilaos.com/emacs/modus-themes>.


### Old user options and hooks are mere aliases for Modus options

| Old name                           | Is alias for CURRENT NAME             |
|------------------------------------+---------------------------------------|
| ef-themes-disable-other-themes     | modus-themes-disable-other-themes     |
| ef-themes-to-toggle                | modus-themes-to-toggle                |
| ef-themes-to-rotate                | modus-themes-to-rotate                |
| ef-themes-italic-constructs        | modus-themes-italic-constructs        |
| ef-themes-bold-constructs          | modus-themes-bold-constructs          |
| ef-themes-variable-pitch-ui        | modus-themes-variable-pitch-ui        |
| ef-themes-mixed-fonts              | modus-themes-mixed-fonts              |
| ef-themes-headings                 | modus-themes-headings                 |
| ef-themes-completions              | modus-themes-completions              |
| ef-themes-prompts                  | modus-themes-prompts                  |
| ef-themes-common-palette-overrides | modus-themes-common-palette-overrides |
| ef-themes-post-load-hook           | modus-themes-after-load-theme-hook    |
| ef-themes-after-load-theme-hook    | modus-themes-after-load-theme-hook    |

Please read their respective documentation strings.

If you use Ef and possibly other Modus derivatives, you may prefer to
switch all your user options to the Modus ones. This way you can keep
a unified configuration for all your themes.


### Fewer bold and italic faces by default, more as an opt-in clause

In the past, the Ef themes did not provide an option to disable the
extensive use of a bold font weight and italic font slant. Whereas now
those are controlled by the user options `modus-themes-bold-constructs`
and `modus-themes-italic-constructs`. By default, when they are `nil`,
bold and italics are used only when necessary. Set these user options
to `t` to have bold and italics in more places.


<a id="h:00ba7745-7d69-4e96-b81a-b0269d83ce0f"></a>

### Loading only Ef themes with the convenience wrappers we provide

All the old commands Ef provided for loading one of its themes will
still work as before, meaning that they will only ever show and load a
theme that belongs to the Ef collection.

Internally, these commands are now using the Modus infrastructure and
are then limiting the set of themes to the Ef collection. They are
thus convenience wrappers around the equivalent Modus commands.

-   `ef-themes-toggle`
-   `ef-themes-rotate`
-   `ef-themes-select`
-   `ef-themes-load-random`
-   `ef-themes-load-random-dark`
-   `ef-themes-load-random-light`

Additionally, the commands `ef-themes-list-colors` and
`ef-themes-list-colors-current` use the relevant Modus functionality
under the hood while working only with the Ef themes.


<a id="h:a51893c3-9a52-4707-8a1e-3ff4642de6cf"></a>

### Combining core Modus themes with all their derivatives

The minor mode `modus-themes-include-derivatives-mode` makes all the
theme-loading commands that Modus defines consider all core and
derivative themes. This means that something like `modus-themes-select`
will offer `modus-operandi` and `ef-summer` as two of the many
possible candidates.

In this scenario, the Modus and Ef collections become part of a larger
family of themes as opposed to only considering one or the other
([Loading only Ef themes with the convenience wrappers we provide](#h:00ba7745-7d69-4e96-b81a-b0269d83ce0f)).
Enable `modus-themes-include-derivatives-mode` and then access them
all with the following commands:

-   `modus-themes-toggle`
-   `modus-themes-rotate`
-   `modus-themes-select`
-   `modus-themes-load-random`
-   `modus-themes-load-random-dark`
-   `modus-themes-load-random-light`
-   `modus-themes-list-colors`
-   `modus-themes-list-colors-current`

Consult the manual of the Modus themes for further details and/or read
the documentation string of each command.


### Taking over the Modus commands altogether

The minor mode `ef-themes-take-over-modus-themes-mode` makes all Modus
commands that load a theme consider only Ef themes. This is the
opposite of allowing different theme collections to be blended
together ([Combining core Modus themes with all their derivatives](#h:a51893c3-9a52-4707-8a1e-3ff4642de6cf)).
It effectively is the same as using one of the convenience wrapper
commands we already provide ([Loading only Ef themes with the convenience wrappers we provide](#h:00ba7745-7d69-4e96-b81a-b0269d83ce0f)).

This minor mode exists to accommodate the needs of users who install
both the Modus and Ef theme packages (and possibly other Modus
derivatives). They can maintain a single/shared configuration and then
decide when to enable `ef-themes-take-over-modus-themes-mode` to
switch to using just the Ef themes.

For example, in the morning the user only wants to consider the Modus
themes, but during the evening they only likee the Ef themes. In this
scenario, a key binding to, say, `modus-themes-rotate` does not need
to be updated: it internally reads only Ef themes when
`ef-themes-take-over-modus-themes-mode` is enable. When this minor
mode is disabled, that same key binding will revert to doing what it
did before (load only a core Modus theme or Modus plus derivatives if
`modus-themes-include-derivatives-mode` is enabled).


### More semantic palette mappings

Modus has always had a more comprehensive palette than Ef. Now they
are on par. Concretely, this means that users can customise more of
the theme's style to their liking. Use the commands that list/preview
a palette to learn about all the available options.

The manual of the Modus themes covers the palette and user-defined
overrides at great length. It also includes code samples that you can
use as a starting point. And if something is unclear, you are welcome
to contact me.


### Many more faces are covered

The wide face/package coverage of Modus is now inherited by the Ef
themes. If some interface you are using does not look right, then the
underlying faces are probably not supported yet. Contact me and I will
take care of it right away.
