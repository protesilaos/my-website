---
title: "Modus themes: case study on Avy faces and colour combinations"
excerpt: "Analysis of colour combinations for the modus-themes using Emacs' Avy package."
---

I have always maintained that the `modus-themes` are not "colour
schemes".  We do not simply pick colours values that look pleasant in
abstract.  We also do not merely target a generic contrast ratio that
satisfies the 7:1 target (WCAG AAA) as we always consider the use-case
or applicable context.  The purpose of a theme is to optimise the
presentation of any given interface.  Read more in the manual:
<https://protesilaos.com/emacs/modus-themes#h:a956dbd3-8fd2-4f5d-8b01-5f881268cf2b>.

What follows is an analysis of how I reviewed the colours that are
currently used by the `modus-themes` for Oleh Krehel's `avy` package, as
well as Daniel Mendler's `corfu-quick` and `vertico-quick` (part of the
`corfu` and `vertico` projects, respectively).

In case you don't know, Avy lets the user jump to a visible location in
the buffer.  It does so by overlaying the target with colour-coded
characters.  Due to the ephemeral nature of those highlights, they need
to be intense to pop out yet also be as legible as possible to aid the
user hit the right keys quickly.

At the end of this publication I provide a verbatim copy of the source
file, which is in Org notation (check the Annex).

In the following tables we are using these functions:

```elisp
(defalias 'Λ 'modus-themes-contrast)
(defalias 'Δ 'color-distance)
```

## Modus operandi

```
|               |         | #000000 | #000000 | Comment                               |
|---------------+---------+---------+---------+---------------------------------------|
| red           | #ff8888 |    9.13 |  284999 | Red is awkward                        |
| red ligher    | #ffbbbb |   13.08 |  392911 | Too desaturated; still awkward        |
| green         | #6ffe6f |   16.08 |  322171 | All bright greens are great           |
| green darker  | #4fe07f |   12.30 |  262076 | Read analysis below                   |
| blue          | #77c0ff |   10.77 |  361794 | Too dark                              |
| yellow        | #ffee00 |   17.48 |  392183 | Like the green                        |
| yellow darker | #dff000 |   16.60 |  354353 | Read analysis                         |
| magenta       | #ffaaff |   12.45 |  444173 | Read analysis                         |
| purple        | #cbafff |   11.12 |  393569 | Like the blue                         |
| cyan          | #7feaff |   15.12 |  437579 | Less bright than the green, but great |
#+TBLFM: $3='(Λ $2 @1$3);%.2f :: $4='(Δ $2 @1$4)
```

This table confirms my theory that the inherently darker colours,
especially blue, are not good when all of the following are met:

1. They are used as a background.
2. The foreground is black.
3. The surface area is one-character-long (like a cursor block).
4. There are adjacent colours to this block which have a high
   intensity/saturation.
5. There are other highlights in the buffer (e.g. syntax colouration)
   which may also be fairly intense.
6. The backdrop is white.
7. The one-character-long highlights are scattered across the buffer.

The three basic colours are red (`#ff0000`), green (`#00ff00`), blue
(`#0000ff`).  Of the three, the darkest is blue, which is why it has the
highest contrast against white (`#ffffff`) and the lowest against black
(`#000000`).

```
|              |         | #ffffff | #000000 |
|--------------+---------+---------+---------|
| pure red     | #ff0000 |    4.00 |    5.25 |
| pure yellow  | #ffff00 |    1.07 |   19.56 |
| pure green   | #00ff00 |    1.37 |   15.30 |
| pure blue    | #0000ff |    8.59 |    2.44 |
| pure cyan    | #00ffff |    1.25 |   16.75 |
| pure magenta | #ff00ff |    3.14 |    6.70 |
#+TBLFM: $3='(Λ $2 @1$3);%.2f :: $4='(Λ $2 @1$4);%.2f
```

Read more on the choice of colours in the themes' manual:
<https://protesilaos.com/emacs/modus-themes#h:0b26cb47-9733-4cb1-87d9-50850cb0386e>.

This means that among the three base colours green is the best when
combined with black.  The implication is that any value which has a
dominant contribution of green (such as yellow and cyan) is also good,
while any colour that is closer to blue---or, to a lesser extent,
red---is not good enough.

By "contribution of green" we refer to the green channel of light, as
seen in a hexadecimal colour code: `#RRGGBB` (red-green-blue).

Here a "good" colour is one that (i) retains its saturation unlike, say,
`#ffbbbb` in the table further above, and (ii) provides a highly legible
result when the aforementioned conditions are met.

Thus far it appears that the colour palette for `modus-operandi` in this
particular case has to consist of green, yellow, and cyan.  Because
green and cyan look very similar, they must not be presented
side-by-side.  Both contrast well with yellow, so any sequence with
yellow in the middle should be serviceable, _or so we might think_.
Because green is not used often in the `modus-themes` for technical
reasons, cyan is a better candidate to start the sequence, hence
cyan-yellow-green.

However, there is a catch!  A sequence of cyan-yellow-green will be too
bright and difficult to use.  If all colours are equally intense, then
we cannot guide the eye to where it needs to focus, which is the first
character in the given sequence.  Consequently, we have to apply
comparatively darker colours, ruling out both bright yellow and bright
green.  We need a sequence where:

1. The first colour is intense.
2. The other two are saturated but slightly less so.
3. All three colours are distinct when seen side-by-side, but also as
   two (or more) triplets, so that the first and third constrast with
   each other.

To cut the long story short, the optimal sequence consists of shades of
cyan-magenta-yellow.

```
|         |         | #000000 | #000000 |
|---------+---------+---------+---------|
| cyan    | #7feaff |   15.12 |  437579 |
| magenta | #ffaaff |   12.45 |  444173 |
| yellow  | #dff000 |   16.60 |  354353 |
#+TBLFM: $3='(Λ $2 @1$3);%.2f :: $4='(Δ $2 @1$4)
```

This shows that we did not simply opt for the brighest colours but
considered their combinations in their context.  Oftentimes a somewhat
less intense colour improves the overall presentation because it imposes
a rhythm that allows the eye to discern a pattern more effectively.

We thus avoid a trap that would indubitably lead us to make
exaggerations.  Read more about the matter in the themes' manual:
<https://protesilaos.com/emacs/modus-themes#h:44284e1f-fab8-4c4f-92f0-544728a7c91e>.

## Modus vivendi

For the dark theme, things are marginally easier to manage.  The human
eye can discern finer differences in colour with greater accuracy
against a dark backdrop, especially a pure black one (at least this is
what my experiments indicate).  Colour is a representation of light,
while black is formalised as the absence of light as seen in the empty
three channels (`#000000`) of the hexadecimal RGB notation for black
(notwithstanding display technology which will show black with light
emitting from the monitor).

The main point of differentiation here compared to `modus-operandi` is
that the coloured backgrounds will now have to be combined with a white
foreground, so they must not be too dark else they blend into the
background.  What was noted above about green being the naturally
brightest is now working against it.

Not to belabour the point as you already understand this is not an
arbitrary choice.  We follow the same sequence of cyan-magenta-yellow
for inter-theme consistency, though the exact colours for
`modus-vivendi` are as follows:

```
|         |         | #ffffff | #ffffff |
|---------+---------+---------+---------|
| cyan    | #0050af |    7.59 |  303418 |
| magenta | #7f1f7f |    8.73 |  284836 |
| yellow  | #625a00 |    7.04 |  327872 |
#+TBLFM: $3='(Λ $2 @1$3);%.2f :: $4='(Δ $2 @1$4)
```

The fact that the contrast ratio and colour distance are lower compared
to their counterparts in the light theme is not a problem.  It simply
illustrates the point that finer details in colouration are easier to
discern against a black backdrop.  Put differently, it is difficult to
design a light theme, while it is fairly easy to make a dark theme that
is replete with exaggerations.

## Themes are not colour schemes

What is described here for Avy is not the exception to some otherwise
casual work of picking pretty colour values.  All contexts require this
sort of attention to detail.

The key takeaway is that themes are not colour schemes: one must not
select colour values without accounting for the particularities of the
context.

The guideline for Elisp hackers who want to use Emacs faces and/or
implement colouration is that they should avoid hardcoded values or
anonymous (ad-hoc) faces.  We have `defface` for a good reason.

If you think this design can be improved further, please join the
mailing list of the Modus themes:
<https://lists.sr.ht/~protesilaos/modus-themes>.

## Annex

```
#+TITLE: Modus themes: case study on Avy faces and colour combinations
#+AUTHOR: Protesilaos Stavrou (https://protesilaos.com)
#+DATE: 2022-04-20

In the following tables we are using these functions:

#+begin_src emacs-lisp
(defalias 'Λ 'modus-themes-contrast)
(defalias 'Δ 'color-distance)
#+end_src

* Modus operandi

|               |         | #000000 | #000000 | Comment                               |
|---------------+---------+---------+---------+---------------------------------------|
| red           | #ff8888 |    9.13 |  284999 | Red is awkward                        |
| red ligher    | #ffbbbb |   13.08 |  392911 | Too desaturated; still awkward        |
| green         | #6ffe6f |   16.08 |  322171 | All bright greens are great           |
| green darker  | #4fe07f |   12.30 |  262076 | Read analysis below                   |
| blue          | #77c0ff |   10.77 |  361794 | Too dark                              |
| yellow        | #ffee00 |   17.48 |  392183 | Like the green                        |
| yellow darker | #dff000 |   16.60 |  354353 | Read analysis                         |
| magenta       | #ffaaff |   12.45 |  444173 | Read analysis                         |
| purple        | #cbafff |   11.12 |  393569 | Like the blue                         |
| cyan          | #7feaff |   15.12 |  437579 | Less bright than the green, but great |
#+TBLFM: $3='(Λ $2 @1$3);%.2f :: $4='(Δ $2 @1$4)

This table confirms my theory that the inherently darker colours,
especially blue, are not good when all of the following are met:

1. They are used as a background.
2. The foreground is black.
3. The surface area is one-character-long (like a cursor block).
4. There are adjacent colours to this block which have a high
   intensity/saturation.
5. There are other highlights in the buffer (e.g. syntax colouration)
   which may also be fairly intense.
6. The backdrop is white.
7. The one-character-long highlights are scattered across the buffer.

The three basic colours are red (=#ff0000=), green (=#00ff00=), blue
(=#0000ff=).  Of the three, the darkest is blue, which is why it has the
highest contrast against white (=#ffffff=) and the lowest against black
(=#000000=).

|              |         | #ffffff | #000000 |
|--------------+---------+---------+---------|
| pure red     | #ff0000 |    4.00 |    5.25 |
| pure yellow  | #ffff00 |    1.07 |   19.56 |
| pure green   | #00ff00 |    1.37 |   15.30 |
| pure blue    | #0000ff |    8.59 |    2.44 |
| pure cyan    | #00ffff |    1.25 |   16.75 |
| pure magenta | #ff00ff |    3.14 |    6.70 |
#+TBLFM: $3='(Λ $2 @1$3);%.2f :: $4='(Λ $2 @1$4);%.2f

Read more on the choice of colours in the themes' manual:
<https://protesilaos.com/emacs/modus-themes#h:0b26cb47-9733-4cb1-87d9-50850cb0386e>.

This means that among the three base colours green is the best when
combined with black.  The implication is that any value which has a
dominant contribution of green (such as yellow and cyan) is also good,
while any colour that is closer to blue---or, to a lesser extent,
red---is not good enough.

By "contribution of green" we refer to the green channel of light, as
seen in a hexadecimal colour code: =#RRGGBB= (red-green-blue).

Here a "good" colour is one that (i) retains its saturation unlike, say,
=#ffbbbb= in the table further above, and (ii) provides a highly legible
result when the aforementioned conditions are met.

Thus far it appears that the colour palette for ~modus-operandi~ in this
particular case has to consist of green, yellow, and cyan.  Because
green and cyan look very similar, they must not be presented
side-by-side.  Both contrast well with yellow, so any sequence with
yellow in the middle should be serviceable, /or so we might think/.
Because green is not used often in the =modus-themes= for technical
reasons, cyan is a better candidate to start the sequence, hence
cyan-yellow-green.

However, there is a catch!  A sequence of cyan-yellow-green will be too
bright and difficult to use.  If all colours are equally intense, then
we cannot guide the eye to where it needs to focus, which is the first
character in the given sequence.  Consequently, we have to apply
comparatively darker colours, ruling out both bright yellow and bright
green.  We need a sequence where:

1. The first colour is intense.
2. The other two are saturated but slightly less so.
3. All three colours are distinct when seen side-by-side, but also as
   two (or more) triplets, so that the first and third constrast with
   each other.

To cut the long story short, the optimal sequence consists of shades of
cyan-magenta-yellow.

|         |         | #000000 | #000000 |
|---------+---------+---------+---------|
| cyan    | #7feaff |   15.12 |  437579 |
| magenta | #ffaaff |   12.45 |  444173 |
| yellow  | #dff000 |   16.60 |  354353 |
#+TBLFM: $3='(Λ $2 @1$3);%.2f :: $4='(Δ $2 @1$4)

This shows that we did not simply opt for the brighest colours but
considered their combinations in their context.  Oftentimes a somewhat
less intense colour improves the overall presentation because it imposes
a rhythm that allows the eye to discern a pattern more effectively.

We thus avoid a trap that would indubitably lead us to make
exaggerations.  Read more about the matter in the themes' manual:
<https://protesilaos.com/emacs/modus-themes#h:44284e1f-fab8-4c4f-92f0-544728a7c91e>.

* Modus vivendi

For the dark theme, things are marginally easier to manage.  The human
eye can discern finer differences in colour with greater accuracy
against a dark backdrop, especially a pure black one (at least this is
what my experiments indicate).  Colour is a representation of light,
while black is formalised as the absence of light as seen in the empty
three channels (`#000000`) of the hexadecimal RGB notation for black
(notwithstanding display technology which will show black with light
emitting from the monitor).

The main point of differentiation here compared to ~modus-operandi~ is
that the coloured backgrounds will now have to be combined with a white
foreground, so they must not be too dark else they blend into the
background.  What was noted above about green being the naturally
brightest is now working against it.

Not to belabour the point as you already understand this is not an
arbitrary choice.  We follow the same sequence of cyan-magenta-yellow
for inter-theme consistency, though the exact colours for
~modus-vivendi~ are as follows:

|         |         | #ffffff | #ffffff |
|---------+---------+---------+---------|
| cyan    | #0050af |    7.59 |  303418 |
| magenta | #7f1f7f |    8.73 |  284836 |
| yellow  | #625a00 |    7.04 |  327872 |
#+TBLFM: $3='(Λ $2 @1$3);%.2f :: $4='(Δ $2 @1$4)

The fact that the contrast ratio and colour distance are lower compared
to their counterparts in the light theme is not a problem.  It simply
illustrates the point that finer details in colouration are easier to
discern against a black backdrop.  Put differently, it is difficult to
design a light theme, while it is fairly easy to make a dark theme that
is replete with exaggerations.

* Themes are not colour schemes

What is described here for Avy is not the exception to some otherwise
casual work of picking pretty colour values.  All contexts require this
sort of attention to detail.

The key takeaway is that themes are not colour schemes: one must not
select colour values without accounting for the particularities of the
context.

The guideline for Elisp hackers who want to use Emacs faces and/or
implement colouration is that they should avoid hardcoded values or
anonymous (ad-hoc) faces.  We have ~defface~ for a good reason.

If you think this design can be improved further, please join the
mailing list of the Modus themes:
<https://lists.sr.ht/~protesilaos/modus-themes>.
```
