---
title: "Emacs: colour theory and techniques used in the Modus themes"
excerpt: "An overview of the colour theory used in my Modus themes for GNU Emacs."
---

In a previous report on the development of the Modus themes, I analysed
[how I picked bespoke
colours](https://protesilaos.com/codelog/2022-04-20-modus-themes-case-study-avy/)
for the `avy` package and related faces.  The draft included a section
on colour theory, but I ultimately decided to delete it and dedicate a
standalone post on this subject.

As you probably know by now, the `modus-themes` are designed in
accordance with the WCAG AAA standard for colour contrast, which
represents a minimum contrast ratio of 7:1 in relative luminance between
any given combination of background and foreground colour values.  In
simple terms, the themes are designed to be highly legible.

What is not obvious and what I don't often bring attention to is the
knowledge that informs the choice of colours.  Getting the 7:1 contrast
is but a small part of the design.  Without understanding how colours
work, which combinations are optimal and for what purpose, the result
will always leave something to be desired.

What follows is a primer.  It does not exhaust the topic, though it
should give you an idea of the sort of knowledge that underpins this
project.

## Primary colours

For our purposes, the three basic colours are red, green, and blue.
They are known as "primary colours" because we can combine them to
derive all other values but they cannot be derived from others.

In hexadecimal Red-Green-Blue (RGB) notation, the primary colours
represent the three channels of light in the form of `#RRGGBB`, with
each digit accepting a value of `[0-9a-f]`.  The `#ff0000` is the purest
red, as the red channel of light is at its maximum while the other two
are empty.  Similarly, `#00ff00` is pure green and `#0000ff` is pure
blue.

## Secondary colours

If we imagine the primary colours as a triangle, we can then derive
combinations on each of its sides.  Drawing figures is not my strong
point, but here is the idea:

```
      red
     /   \
    /     \
green-----blue
``` 

Red and green produce yellow.  This is represented as `#ffff00`.  Just
by looking at the hex code, we can see the full channel of red and
green, which is exactly what we did by combining the two primary
colours.

Red and blue constitute magenta.  This is expressed as `#ff00ff`.

While green and blue create cyan, else `#00ffff`.

```
yellow-----magenta
     \    /
      \  /
      cyan
```

Putting it all together produces a hexagon:

```
         red
       /     \
      /       \
 yellow       magenta
     |         |
     |         |
 green         blue
      \       /
       \     /
        cyan
```

By continuing to combine adjacent colours we end up with a circle, which
is also known as a "colour wheel".

The spectrum of all those colours can eventually be split in to two
parts: the side which includes cyan-green, green, green-yellow, yellow,
yellow-red, and red is the "warm" side, while the other is the "cold"
one (or "cool", if you will).  More on this point below.

## Luminance of the primary and secondary colours

To get a sense of how those basic values compare to pure black and white
(`#000000` and `#ffffff`, respectively), we rely on the WCAG formula.
The `modus-themes-wcag-formula` and `modus-themes-contrast` functions
handle the technicalities:

```elisp
;; This is the WCAG formula: https://www.w3.org/TR/WCAG20-TECHS/G18.html
(defun modus-themes-wcag-formula (hex)
  "Get WCAG value of color value HEX.
The value is defined in hexadecimal RGB notation, such as those in
`modus-themes-operandi-colors' and `modus-themes-vivendi-colors'."
  (cl-loop for k in '(0.2126 0.7152 0.0722)
           for x in (color-name-to-rgb hex)
           sum (* k (if (<= x 0.03928)
                        (/ x 12.92)
                      (expt (/ (+ x 0.055) 1.055) 2.4)))))

;;;###autoload
(defun modus-themes-contrast (c1 c2)
  "Measure WCAG contrast ratio between C1 and C2.
C1 and C2 are color values written in hexadecimal RGB."
  (let ((ct (/ (+ (modus-themes-wcag-formula c1) 0.05)
               (+ (modus-themes-wcag-formula c2) 0.05))))
    (max ct (/ ct))))
```

With the help of Org tables (or just `orgtbl-mode`), we get these
contrast ratios:


```
| Name    |         | #ffffff | #000000 |
|---------+---------+---------+---------|
| red     | #ff0000 |    4.00 |    5.25 |
| yellow  | #ffff00 |    1.07 |   19.56 |
| green   | #00ff00 |    1.37 |   15.30 |
| cyan    | #00ffff |    1.25 |   16.75 |
| blue    | #0000ff |    8.59 |    2.44 |
| magenta | #ff00ff |    3.14 |    6.70 |
#+TBLFM: $3='(modus-themes-contrast $2 @1$3);%0.2f :: $4='(modus-themes-contrast $2 @1$4);%0.2f
```

By studying the values, we observe some interesting patterns:

* Blue has a contrast ratio well above 7:1 when compared to white.  This
  means that blue is inherently a dark colour and so it always contrasts
  well with white.  Because of this property, blue has a very low
  luminance relative to black.
* Green, and every colour that has the full contribution of the green
  channel of light, is inherently luminant.  We can see how green,
  yellow, and cyan almost have a 1:1 contrast with white and a very high
  contrast against black (the highest is black:white of 21:1---yellow is
  almost 20:1).
* Red lies somewhere in between blue and green.  It fails the 7:1 test
  against both black and white.

The WCAG formula assigns a weight to each of the three channels of
light.  While I do not know the exact method, my experience suggests
this is the right approach.  We can see the weights in this part of the
above snippet:

```elisp
;; The respective weight of red, green, blue
'(0.2126 0.7152 0.0722)
```

In practical terms, what this means is that a high dose of blue has a
negligible effect on the overall luminance of the resulting colour,
while a small dose of green has a noticeable impact, and red is
somewhere in the middle.

Because of the 7:1 threshold, our values cannot be like those of the
primary and secondary colours.  We have to find permutations between the
extremes.  In doing so, we need to calibrate hex codes to get the
desired results.  This is easy to do once we understand how the channels
of light determine the luminance of the value we choose (of course, they
also affect the hue and saturation, but let's keep it simple).

## The cyan-blue-magenta side of the spectrum

The colours we use the most are concentrated on the "cold" side of the
spectrum.  These predominantly are variants of cyan, blue, and magenta.
Calling them "cold" is not accurate and not true to the contextual
subjectivity of colour, but it serves as a banal metaphor to capture the
overall character of the themes.

What I mean by "contextual subjectivity" is how we perceive differences
in colour in any given case.  For instance, magenta is a cold colour in
absolute terms because it has contribution from the blue channel of
light.  But in a context where all colours are variants of blue, a
single magenta will stand out as the warmest.

Furthermore, each colour can be conceptualised as having its own cold
and warm variants.  This is why in the themes we have triplets of red,
green, blue, yellow, magenta, and cyan like the palette variables
`magenta`, `magenta-alt` (warmer), `magenta-alt-other` (colder).  Use
the command `modus-themes-list-colors` (or
`modus-themes-list-colors-current`) to produce a preview of the entire
palette of either `modus-operandi` or `modus-vivendi`.

At any rate, the reason we apply such colours has to do with the
relative weight of the three channels of light in tandem with the need
for variety in the effective palette.

Quote [from the themes' manual on the
matter](https://protesilaos.com/emacs/modus-themes#h:0b26cb47-9733-4cb1-87d9-50850cb0386e):

> [By studying the table with the contrast ratios of the primary and
> secondary colours] We can then infer that red and blue, in different
> combinations, with green acting as calibrator for luminance, will give
> us fairly moderate colors that pass the 7:1 target.  Blue with a bit
> of green produce appropriate variants of cyan.  Similarly, blue
> combined with some red and hints of green give us suitable shades of
> purple.
> 
> Due to the need of maintaining some difference in hueness between
> adjacent colors, it is not possible to make red, green, and yellow the
> main colors, because blue cannot be used to control their luminance
> and, thus the relevant space will shrink considerably.

This, however, is not a mere matter of convenience.  These colours also
look consistent, which brings us to the next point.

## Harmony in colour combinations

Remember that hexagon I drew earlier and how I wrote it can be extended
to become a circle?  We can use it as a mental image with which to
derive colour harmonies.  There are five basic ways to think of
harmonious relations:

* **monochromatic**, which uses values from the same part of the
  spectrum (e.g. only blues);
* **analogous**, which encompasses values from a continuum of hues in
  the spectrum (e.g. cyan, blue, purple);
* **complementary**, which consists of colours on opposite sides of the
  spectrum (e.g. blue and yellow, red and cyan);
* **triadic**, which covers three colours that form a triangle inside
  the spectrum (e.g. cyan-magenta-yellow);
* **tetradic**, which is made up of two pairs of complementary values
  and can be drawn as a rectangle inside the spectrum.

Depending on the context, we use all those harmonies, with the analogous
being the most common one.  Note though that this is not a hard-and-fast
rule, as we sometimes may have a "mostly" analogous style, where all
colours look similar except one which stands out a bit more (because the
requirements of the interface demand as much---for example, the "unread"
tag in the email listing of notmuch.el).

Complementarity is tricky to manage.  Its wanton use is, in my opinion,
a sign of an incomplete or needlessly overdone theme.  This is because
complementary colours stand out more, ceteris paribus.  When everything
tries to call unwarranted attention to itself, it implicitly expends the
user's energy on trivialities.  Add to that typographic qualities like
bold weight and italics, and you have a cacophony of visual noise.

Complementarity is important though and essential in the appropriate
context.  In the `modus-themes` we rely on it when we need to draw a
clear distinction between two adjacent elements ("need" is the operative
term).

Triadic and tetradic relations are seldom required, but knowledge of
them saves us from trouble.  A case in point is the cyan-magenta-yellow
triplet I established for the Avy colours (check the link in the
introduction).  That is a triadic relation and those happen to be the
secondary colours.

Note though that I do not use an actual colour wheel.  My understanding
of it is in abstract.  As such, when I claim that the variants of
cyan-magenta-yellow that are used for Avy are triadic, I do not mean it
in the rigorous mathematical sense of them representing an actual
triangle.  Because themes are not colour schemes, we have to consider
the function of colour: I decided to make one a bit more saturated than
the others to help guide the eye to where it needs to focus first.  As
such, mathematical precision is not the goal.  Same principle for
complementary colours and all the other harmonies.

## The visual rhythm

I cannot quantify this "rhythm".  Theme development stands at the
intersection of art and science.  Consider this the artistic part, the
_je ne sais quoi_ that defines the project.

I see the rhythm as a variation in levels of luminance, hueness, and
saturation between the applicable colours.  Put simply, not all colours
have a 7:1 contrast, as that would make them all look about the same.
It would be dull and monotonous.  Some are a bit more luminant than
others.  Such subtle changes help guide the eye to where it needs to
focus.

Additional considerations here involve typographic attributes but also
the placement of text in the buffer.  Once again, themes are not colour
schemes, meaning that we must consider the particularities of text and
concomitant functionality in any given interface.

We never want to make exaggerations, because their cumulative effect
will burden the user.  We use complementary colours when it is
absolutely necessary.  We avoid clustering intense colours and,
generally, try to give attention to whichever construct truly deserves
it.

The key is to actually test how colours work in practice when applied to
text.  Do we get something usable?  Or do we have a gestalt form that
constantly reminds the user "hey, look how pretty I am!"?  We want the
design to help the user.  Nothing more, nothing less.

Finally, we do not control the placement of faces.  We simply specify
their attributes.  It is the task of the underlying code (e.g. major or
minor mode) to map faces to constructs.  As such, we don't always get
the perfect or most desirable outcome, though we at least try to
approximate it.
