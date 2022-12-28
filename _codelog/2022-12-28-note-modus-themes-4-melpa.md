---
title: "Emacs: note for MELPA or Git users of the Modus themes ahead of version 4"
excerpt: "Overview of the breaking changes that are coming in the new version of the 'modus-themes' for Emacs."
---

I plan to release the `modus-themes` version 4 this Sunday.  It is the
largest changeset to date, touching on practically every line in the
code base.  Before tagging a release, I want to merge the `version-4`
branch into `main`---will probably do so later today.  This merge will
introduce **lots of breaking changes** for users who track the Git
repository, such as those who use the MELPA package or handle things
with `straight.el`.

## Overview of breaking changes

In lieu of the detailed change log that will accompany the tagged
release:

- Many user options are obsolete.
- Remaining user options are simplified.
- Changes to colours are done through a comprehensive system of
  palette overrides.  Watch [this video demo](https://protesilaos.com/codelog/2022-12-17-modus-themes-v4-demo/)
  I produced a few days ago or search the manual for _"Option for
  palette overrides"_ after I merge the branch.
- The manual provides many ready-to-use code blocks that showcase the
  potential of the new overrides' mechanism.
- Some big packages are no longer supported: `dired+`, `helm`,
  `treemacs`.  They have too many features, making it impossible for
  an outsider like me to test them.

Note that **virtually all custom theme code will not work** with the
new version of the themes.  For example, if you were using the macro
`modus-themes-with-colors` and were passing the `,class`
specification, this is now replaced by `,c` in the source code.  I did
it intentionally to force users to read the new palette, as the old
names will not work while many colours have been removed.  For
instance, `blue-alt` is now called `blue-warmer`, while something like
`bg-special-cold` is gone.

You most likely **have no need for custom code**.  The overrides are
comprehensive and will cover most use-cases.  Check the documentation
and contact me if you have any questions.

The safest approach is to start with a simple configuration that just
loads the theme of choice.  Then you can gradually set things up the
way you like.

## The new semantic mappings

Unlike the old overrides, the new system relies on _semantic colour
mappings_ so there is no need to tinker with colour values.  All
overrides are defined as user options.  There is a shared variable,
`modus-themes-common-palette-overrides` as well as theme-specific ones
like `modus-operandi-palette-overrides`.

For ready-made presets, try either of those:

```elisp
;; Tone down almost all colors.
(setq modus-themes-common-palette-overrides
      modus-themes-preset-overrides-faint)

;; Amplify coloration across all interfaces.
(setq modus-themes-common-palette-overrides
      modus-themes-preset-overrides-intense)
```

Though there is no need to stick to the presets.  The whole point is
to particularise the aesthetics.  A trivial example from the manual:

```elisp
;; Increase intensity of Org TODO and DONE
(setq modus-themes-common-palette-overrides
      '((prose-done green-intense)
        (prose-todo red-intense)))
```

You can read in the above snippet the `prose-done` and `prose-todo`
mappings.  Want your `DONE` to be grey and `TODO` magenta?  No need to
ask me to hardcode some alternative and complicate the code---just
change the relevant values and reload the theme for changes to take
effect.  The documentation (or the aforementioned video) explains how
to find all the information.

Another example of semantic colours to make the Modus themes draw
primarily from the green-blue side of the spectrum:

```elisp
;; Mimic `ef-bio' theme (from my `ef-themes') for code syntax
;; highlighting, while still using the Modus colors (and other
;; mappings).
(setq modus-themes-common-palette-overrides
      '((builtin green)
        (comment yellow-faint)
        (constant blue)
        (fnname green-warmer)
        (keyword green-cooler)
        (preprocessor green)
        (docstring green-faint)
        (string magenta-cooler)
        (type cyan-warmer)
        (variable blue-warmer)))
```

Don't like yellow comments?  How about changing the value to
`red-faint`?  The 10x developer programs with yellow strings?  Peak
productivity is now within your grasp!  You are vociferous, thinking
that keywords should be blue?  Make overrides, not war.

You get the idea.  And remember that I am here to help.

## More Modus themes

The Modus themes now consist of six themes, divided into three
subgroups.  Quote from the manual:

> - **Main themes:** `modus-operandi` is the project's main light theme,
>   while `modus-vivendi` is its dark counterpart.  These two themes are
>   part of the project since its inception.  They are designed to cover
>   a broad range of needs and are, in the opinion of the author, the
>   reference for what a highly legible "default" theme should look
>   like.
> 
> - **Tinted themes:** `modus-operandi-tinted` and `modus-vivendi-tinted`
>   are variants of the two main themes.  They slightly tone down the
>   intensity of the background and provide a bit more color variety.
>   `modus-operandi-tinted` has a set of base tones that are shades of
>   light ochre (earthly colors), while `modus-vivendi-tinted` gives a
>   night sky impression.
> 
> - **Deuteranopia themes:** `modus-operandi-deuteranopia` and its
>   companion `modus-vivendi-deuteranopia` are optimized for users with
>   red-green color deficiency.  This means that they do not use red and
>   green hues for color-coding purposes, such as for diff removed and
>   added lines.  Instead, they implement colors that are discernible by
>   users with deueteranopia or deuteranomaly (mostly yellow and blue
>   hues).

## More power to the user

Please give this major rewrite a fair chance.  I am not taking taking
anything away from the user.  On the contrary, I am introducing a
system that is far more powerful (yet simpler) than anything we had
before.  The rewrite simplifies the code base and makes it easier for
me to maintain the project long-term.  Furthermore, version 4 makes it
easy to define new themes with `modus-themes-theme`, hence the four
new members of the family (tinkerers can easily derive their own
themes by studying the source code and copy-pasting accordingly).
