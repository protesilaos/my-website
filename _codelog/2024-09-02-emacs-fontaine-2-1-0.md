---
title: 'Emacs: fontaine version 2.1.0'
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

## Version 2.1.0 on 2024-09-02

Fontaine is in a stable state and I find it very useful every day.
This release includes some small quality-of-life improvements.


### Use the `fontaine-toggle-preset` command

It will switch between the last preset and the one you are currently
using. If it cannot find an older preset, it will prompt for one using
minibuffer completion.

Presets are set with the `fontaine-set-preset` command, either
interactively or from Lisp (e.g. in the `init.el` file).

Internally, `fontaine-toggle-preset` takes care to only switch between
existing presets, so old preset names (such as from the time of some
experiment) will be skipped if they are not part of the current value
of `fontaine-presets`.


### All entries in the `fontaine-presets` accept and optional width attribute

This is for users who need to set an explicit width value to the
underlying face they are targeting. This, of course, depends on the
capabilities of the font family that is used. Those that do not
support varying widths will have no effect.

The width attribute for all existing entries is composed by the name
of the face plus the `-width` suffix, such as `:fixed-pitch-width`.
Check the Fontaine manual for a complete example.

Thanks to Adam Porter for making the suggestion to cover the width
attribute in issue 6: <https://github.com/protesilaos/fontaine/issues/6>.

The `fontaine-presets` can look very long if all values are set, as we
cover all typography-related faces and all their attributes. But do
not let this intimidate you. Your configuration can be short and still
highly usable. For example:

    (setq fontaine-presets
          '((coding ; get the fallback values and override the `:default-height'
             :default-height 120)
            (reading  ; change more stuff from the fallback values
             :default-height 140
             :default-family "Fira Sans"
             :fixed-pitch-family "Fira Mono"
             :variable-pitch-family "Merriweather")
            (presentation
             :inherit reading ; copy the attributes of `reading', then override the `:default-height'
             :default-height 220)
            (t ; everything falls back to this
             :default-family "Iosevka Comfy"
             :default-height 100
             :fixed-pitch-family "Iosevka Comfy Motion"
             :variable-pitch-family "Iosevka Comfy Duo")))

With these, you can switch between `coding`, `reading`, and
`presentation` to match your evolving workflow requirements.

These allow you to switch between not only different font families,
but also font combinations to match a certain style, with higher or
lower heights, and so on.


### The `fontaine-set-preset` prompt only uses relevant default presets

When you invoke the command `fontaine-set-preset` it tries to find a
previous preset to set it as the default minibuffer value. This means
that if you press `RET` without selecting anything, the default will
be used (check with your minibuffer package in case this does not
happen, or contact me if you need help).

Before, the default value was the last selected preset. This could be
out-of-date though if the `fontaine-presets` were rewritten in the
meantime. Now we take care to only produce a default value that is
among those specified in the `fontaine-presets`.
