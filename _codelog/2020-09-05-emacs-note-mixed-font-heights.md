---
title: 'Emacs: note on mixed font heights'
excerpt: 'How to set font sizes in a way that does not break ‘text-scale-adjust’.'
---

In a recent entry on [configuring mixed
fonts](https://protesilaos.com/codelog/2020-07-17-emacs-mixed-fonts-org/),
I outlined how to specify your typefaces of choice by configuring the
`default`, `variable-pitch`, and `fixed-pitch` faces.  This would allow
you to benefit from variegated typography, such as having paragraph text
rendered in a proportionately spaced font, while inline code is
displayed as monospaced.

The overall approach of controlling the three basic faces is fine, but
the code I shared had the unintended consequence of breaking the
built-in `text-scale-adjust` command (by default bound to `C-x C-+`,
`C-x C--`, `C-x C-0`).  Here I issue a corrective to the technique that
was used before.

## The code that breaks ‘text-scale-adjust’

This is the gist of what I was using for several months:

```elisp
(set-face-attribute 'default nil :font "Hack-16")
(set-face-attribute 'fixed-pitch nil :font "Hack-16")
(set-face-attribute 'variable-pitch nil :font "FiraGO-16")
```

A variant of the above can be expressed as follows:

```elisp
(set-face-attribute 'default nil :family "Hack" :height 160)
(set-face-attribute 'fixed-pitch nil :family "Hack" :height 160)
(set-face-attribute 'variable-pitch nil :family "FiraGO" :height 160)
```

If you set fonts this way and try to use `text-scale-adjust` in a buffer
with mixed fonts, you will notice that only the main text, affected by
the `default` face, gets scaled.  The rest retain their height—not good.

This is because of a hard-wired assumption in the `text-scale-adjust`
command to only target the `default` face: `variable-pitch` and
`fixed-pitch` remain in tact, thus breaking our expectations.

The problem consists in the fact that we are specifying an absolute size
for each font family.  Whereas we should be benefiting from relative
sizes that all have a single point of reference, which is easy to do.

## The recommended way to set font heights with faces

Let us re-purpose the sample code from the previous section, in order to
get the behaviour we expect out of `text-scale-adjust`.

```elisp
(set-face-attribute 'default nil :font "Hack-16")
(set-face-attribute 'fixed-pitch nil :family "Hack" :height 1.0)
(set-face-attribute 'variable-pitch nil :family "FiraGO" :height 1.0)
```

A alternative to the above is this:

```elisp
(set-face-attribute 'default nil :family "Hack" :height 160)
(set-face-attribute 'fixed-pitch nil :family "Hack")
(set-face-attribute 'variable-pitch nil :family "FiraGO")
```

Notice that we set an absolute point size only for the `default` face.
While we instruct Emacs to interpret the height of `fixed-pitch` and
`variable-pitch` as relative to that constant.  Therein lies the
difference between integer and floating point values for the `:height`
attribute (remember to consult `C-h f set-face-attribute`).

Strictly speaking, the `:height 1.0` is not necessary, unless you are
overriding a prior state.  It is what applies when the specification is
omitted.  Rendering it explicit here helps us spot the subtleties in
notation and be clear about what is at play.

## Details are tricky

I was using the old technique for several months, adjusting fonts
through a bespoke function of mine that altered their absolute sizes.
What inspired me to investigate and eventually address this issue is a
particular statement in the doc string of `set-face-attribute`:

> Note that for the ‘default’ face, you must specify an absolute height
> (since there is nothing for it to be relative to).

Which implied that if the `default` was a constant, all other faces
could simply have a relative height.  This is because of the peculiar
nature of that face to serve as the foundation upon which all others are
established.  As such, a `:height` with a floating point is a multiple
of the `default` font size.  Simple and effective!

I am now happily using `text-scale-adjust` in tandem with the tools I
mentioned in my recent video about [“Focused editing” for
Emacs](https://protesilaos.com/codelog/2020-07-16-emacs-focused-editing/).

This information is also documented in the [official manual of the Modus
themes](https://protesilaos.com/emacs/modus-themes/) because they are designed
to cope well with mixed font scenaria, such as when the user decides to
enable the built-in `variable-pitch-mode`.
