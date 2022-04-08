---
title: 'On the design of the Modus themes (Emacs)'
excerpt: 'Technical notes on the design of my highly-accessible Modus themes for Emacs.'
---

The "Modus themes" are a pair of themes for Emacs that conform with the
WCAG AAA accessibility standard for colour contrast between background
and foreground values.  This is the highest standard of its kind for
making text readable, representing a minimum contrast ratio of 7:1.

There is a light and a dark theme.  The former is called "Modus
Operandi", while the latter is "Modus Vivendi".

In this article I document the principles that inform my decision-making
in the design of these themes, though the insights apply more generally.

If you want to see how the themes look in practice, you can watch some
of my [videos on Emacs](https://protesilaos.com/code-casts/) or refer to
this [collection of screenshots](https://protesilaos.com/emacs/modus-themes-pictures).

## What is colour

For our purposes, "colour" is the amalgamation of three distinct
channels of light: red, green, blue.  By combining them in different
amounts we get what we understand as orange, turquoise, violet, etc.

Red, in the sense of "pure red", is a combination of the three channels
of light where only the red component is at its fullest, while the
others are contributing nothing.  Same for the other colours that
correspond to the remaining light channels.

White, in its purest, is the combination of the three channels with each
contributing as much as possible.  Whereas black is derived by having
the channels contribute zero.

Couched in those terms, white and black are "colours" (in other domains
they are described as "tones" that produce "tints" or "shades" when
combined with hues).

I distinguish between "base" and "accent" values.  The grey scale is
part of the base group, while any other colour that derives from the
accentuation of one or two light channels belongs to the accent's group.

At its core, a palette consists of eight colours.  Six accents plus
white and black.  The six are: red, green, blue, yellow, cyan, magenta.

To be clear about the accents that result from the three channels of
light, consider these possibilities:

```
red   + green = yellow
green + blue  = cyan
blue  + red   = magenta
```

## Colour notation

The total number of colours is a function of the amount that each
channel of light can accept.  With current technology this is 256, which
means:

```
256 × 256 × 256 = 16,777,216
```

We can represent a colour using zero-based decimal notation, so values
from 0 to 255 for each channel of light (e.g. `255,0,0` is pure red), or
we can use hexadecimal notation, where possible values are 0-9 and a-f
with each of the RGB channels having either one or two entries.

A hexadecimal representation of `#f00` is interpreted as equivalent to
`#ff0000`.  To avoid confusion and allow for more possible combinations,
I always use the six-digit-long format.

## Choosing colours

The design of the palette's main colours is governed by the inherent
luminance of the six primary accent values.  The following table shows
the contrast ratio of each of them relative to pure white and pure black
respectively.  The colour values are written in hexadecimal RGB notation
with `#ffffff` representing the maximum (white) and `#000000` the
minimum (black).

| Hexadecimal (name) | ffffff (white) | 000000 (black) |
|--------------------|----------------|----------------|
| ff0000 (red)       | 3.99           | 5.25           |
| 00ff00 (green)     | 1.37           | 15.3           |
| 0000ff (blue)      | 8.59           | 2.44           |
| ffff00 (yellow)    | 1.07           | 19.5           |
| 00ffff (cyan)      | 1.25           | 16.7           |
| ff00ff (magenta)   | 3.13           | 6.69           |

For reference, the maximum contrast ratio is 21:1 between black and
white, while the minimum is always 1:1.  These ratios are derived from a
[scientific formula](https://www.w3.org/TR/WCAG20-TECHS/G18.html) that
underpins the WCAG standard (you can use an online tool to perform the
calculations or try my `clr` shell script that is distributed as part of
[my dotfiles](https://gitlab.com/protesilaos/dotfiles)).

The table shows us indirectly that each channel of light is assigned a
unique weight in the calculation of the final luminance, which is
reflected in the different contrast ratios of red, green, blue.  This
means that for the purposes of colour contrast we cannot equate the
amount of each channel with its total contribution.  Our intuition that
`#ff0000` is the same as `#0000ff` in terms of distance relative to zero
cannot guide us by itself in selecting between the two.

We need a more qualified understanding of the mechanics of these three
channels of light, predicated on the relative weights that the formula
defines for red, green, blue respectively.  These are the precise
numbers:

```
L = 0.2126 * R + 0.7152 * G + 0.0722 * B
```

The general rules for luminance that we can deduce from the
aforementioned are outlined thus:

- "More green" means "lighter".
- "More green" and "more red" means "even lighter".
- "More blue" and to a lesser extent "more red" is the right way to
  tweak colours without completely changing their luminance.

In practice, adding a bit of blue makes virtually no difference to a
colour's luminance, while a good amount of it can help distinguish two
accent values.  For example `#aa0000` is a red that has 7.75 contrast
with white, while `#aa0077` is a magenta that has 7.05 contrast (recall
that 7:1 is our minimum target).  We see how "a lot" of blue added to
our particular red made little difference in the total luminance of the
new colour, while it did have a greater effect on the perception of
these two colours (you can use `rainbow-mode` for Emacs to preview valid
values).

Now some insights about the choice of colour for use in the themes:

- When designing a light theme, all colours need to rely on the blue
  channel of light and, to a lesser extent, on the red one.  You cannot
  develop a fully fledged accessible light theme that makes extensive
  use of green, yellow, cyan, while also trying to keep colours fairly
  distinct from each other.
- When designing a dark theme, you cannot rely on green, yellow, cyan as
  your main colours because they will look much more luminant than other
  accents, unless you lower their values to a point where they no longer
  approximate their pure representation.

These mean that the most common colours for both the light and dark
variants have to be derived by combining blue and red, with green being
the channel that adjusts the relative luminance.  Hence the various
shades of pink, purple, azure, teal that are most used in the Modus
themes to highlight text.

Combined with insights from colour psychology, we must rule out red as a
valid colour for syntax highlighting.  Red calls too much attention to
itself.  It is reserved for cases where such a property is desired, such
as when presenting an error message.  Similar principles apply to the
use of yellow and green: they are used to signify something that has a
special meaning in its context.

## The importance of knowing the background

It is impossible to pick a colour without knowing the context it will be
used in.  We thus start by identifying our main background value.

When selecting multiple colours for the purposes of developing a theme,
we know that their common point of reference is the background on which
they will be used.  The background is a constant.  For my light theme
the main one is white; for the dark it is black.

There are many cases where a different background needs to be used in
order to render a certain function explicit and unambiguous.  For
example, to represent a matching search term, draw the selected region,
and so on.  For each of these scenaria we use the potentially
purpose-specific background as our guide for choosing the possible
colours that are allowed to be used with it as foreground values.  As
always, our overarching objective is conformance with the WCAG AAA
standard.

It is for this reason that the Modus themes have several palette subsets
with inline commentary on the colours they may be combined with (see
source code).  For instance, the red intended for text on the mode line
differs from the one used in the main buffer because the mode line has a
background that is a particular shade of grey.

Emacs allows for different combinations of text and colour properties:
what is called a "face".  Such faces empower us to implement these
palette subsets with precision.

## Part art, part science

Theme development stands at the intersection of art and science:

+ Science allows us to measure the luminance of colours and decide on
  the acceptable values for any given combination of foreground and
  background.
+ While the choice of one among possible combinations to denote the
  function of a given construct (interface or code element) is a matter
  of art.

It is not pertinent to this essay to investigate the exact proportion of
each of these magnitudes to the delivery of the final outcome.  Perhaps
art is just an imprecise science waiting to be refined further by a
yet-to-be-discovered method.  At any rate, art is also governed by
principles such as consistency, frugality, and temperance.

The Modus themes are designed with an intention to avoid exaggerations
or what may be described as a "rainbow effect".  There are cases where
science would allow us to combine variants of red, green, blue, yellow,
magenta, cyan all in one place.  Nothing would be technically wrong once
the colour contrast criterion is satisfied.  It would however look ugly
by being excessive, flamboyant.

This is the tacit minimalism of the Modus themes: the visual aspect of a
state of affairs is expressed by using as few colours as deemed
necessary.  There should be no imbalance in the visual "rhythm" of the
highlighted text: a highly-luminant colour next to a considerably darker
one all trying to present parts that are semantically similar or
connatural is a bad choice; and "bad choice" implies the lack of a
thematic thread running through all applicable colour combinations.

I understand minimalism as minimum viable completeness, basically
meaning that "it works" without requiring any further additions to
continue to work well and with such additions delivering diminishing
returns to scale or even being detrimental to the task of avoiding
exaggerations (i.e. the notion of enforcing a _theme_).

Differences of degree or nuances should also be discernible in the use
of colour, in line with rhythmic consistency.  For example, in the Modus
themes documentation strings are a more subtle blue than literal
strings.  They could have been green, for instance, but that would
introduce too much variation for semantically similar functions:
scientifically correct, artistically sub-optimal.

## Try the themes

The Modus themes are available in MELPA and MELPA Stable already for a
few months now, while they were recently admitted to the official ELPA
repository.  They are distributed as standalone packages, in case you
want to use one but not the other.

I am continuously refining the themes and expanding support for packages
(face groups) in the Emacs milieu.  This is necessary to ensure a
consistent experience for all users.

I am happy for the feedback I have received, including but not limited
to email messages.  Meanwhile, [Manuel Uberti has published a blog
entry](https://manueluberti.eu//emacs/2020/03/16/modus-themes/)
detailing how Modus Operandi has addressed a persistent issue with light
themes.  Given this opportunity, I must also thank Manuel for the
valuable issues (and concomitant feedback) reported in the [project's
git repo](https://gitlab.com/protesilaos/modus-themes).

My commitment to accessibility of the WCAG AAA sort comes from the
realisation that legibility is the single most important characteristic
of any text-heavy interface.  Emacs is all about text; and text should
not pose a barrier to entry.

Use a reliable and unassuming typeface that does not draw too thin
letter forms or demand constant attention to its peculiarities (such as
[my patched "Hack"](https://gitlab.com/protesilaos/hack-font-mod)) and
apply a theme that prioritises good colour contrast.
