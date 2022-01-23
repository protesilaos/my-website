---
title: "Re: add the Modus themes to base16?"
subtitle: "Analysis of colour schemes for terminal emulators and why such ports are inappropriate"
excerpt: "Why it is not a good idea to add modus-operandi and modus-vivendi to the base16 project."
---

I have received a variant of this a few times already:

> Why don't you add `modus-operandi` and `modus-vivendi` to the base16
> project?  It will give you free access to all the templates it
> supports.  There is no need to manually port them over from Emacs.

For context, [base16](https://github.com/chriskempson/base16) is a
collection of colour palettes and template files to generate so-called
'themes' for a variety of applications.  I put the _themes_ in quotes
because I think there is an important distinction to be made between a
colour scheme and a theme.  Read the manual for the technicalities,
while I use the remainder of this entry to explain some not-so-obvious
issues with procedurally generated 'themes':

* [Are these color schemes?](https://protesilaos.com/emacs/modus-themes#h:a956dbd3-8fd2-4f5d-8b01-5f881268cf2b)
* [Port the Modus themes to other platforms?](https://protesilaos.com/emacs/modus-themes#h:7156b949-917d-488e-9a72-59f70d80729c)

## The origins of the 16-colour palette

base16 is fine in its own right, though it is not the right tool for
porting the Modus themes to other apps.  The base16 project inherits a
constraint from terminal emulators where it expects a palette to consist
of 16 colour values.  These represent the {0..15} ANSI escape sequences
that map to the following terminal colours (`termcol` for short):

| ANSI sequence | Colour name    |
|---------------|----------------|
| termcol0      | black          |
| termcol1      | red            |
| termcol2      | green          |
| termcol3      | yellow         |
| termcol4      | blue           |
| termcol5      | magenta        |
| termcol6      | cyan           |
| termcol7      | white          |
| termcol8      | bright black   |
| termcol9      | bright red     |
| termcol10     | bright green   |
| termcol11     | bright yellow  |
| termcol12     | bright blue    |
| termcol13     | bright magenta |
| termcol14     | bright cyan    |
| termcol15     | bright white   |

For terminals such as XTerm, URxvt, Alacritty, Kitty, and the like, a
16-colour palette is perfect: it does exactly what it is supposed to,
which is to define the colour value for `termcol{0..15}`.  Those will
usually produce good results in shell output, but become problematic in
ncurses-based programs that want to apply background colours.  The
reason stems from the very design of the 16-colour palette, where you
need to know the base background in order to establish the relationship
(i.e. contrast ratio or overall looks) between it, each variant of
coloured text, and all coloured texts in tandem.  Put differently, the
16-colour palette has implicit rules on its possible combinations where
`termcol{0,7,8,15}` are the de facto backgrounds and all the rest are
the nominal foregrounds.

For themes that target an accessible contrast ratio in relative
luminance, the actual usable base backgrounds are reduced to two: either
`termcol{0,8}` for dark variants or `termcol{7,15}` for light ones.
Which means that any CLI tool that hardcodes combinations such as
`termcol0+termcol2` will not look good on a light variant (and the
inverse for dark variants).

## The 16-colour palette does not grant full control

We can already grasp the implications of this constraint, which are
encapsulated in the insight that **the designer does not exert full
control over their design**.  The 16 ANSI escape sequences are, at best,
a colour scheme which does not determine how values are mapped to
constructs in each context.

I state as much from a position of experience, having developed the
[tempus-themes](https://gitlab.com/protesilaos/tempus-themes), which are
the spiritual ancestor of the Modus themes for Emacs (also check the
[tempus-themes-generator](https://gitlab.com/protesilaos/tempus-themes-generator)
for an alternative to base16).  My woes with colour inconsistencies
stemming from the fragmented landscape of CLI and ncurses-based programs
is one of the reasons I switched to Emacs in the summer of 2019 (in
previous publications I have explained at length how Emacs furnishes the
means for an integrated computing experience).

## A practical example with the colouration of diffs

To return to the technical constraints of a 16-colour palette, consider
for example, the case of diffs.  You have removed lines in red, added
lines in green (there can also be yellow lines and other things that
need to be colourised, but let's keep it simple).  Check out how Magit
(a top-tier Emacs package) displays diffs as sets of hunks that can be
acted upon, where the hunk-at-point uses different colours to achieve a
highlight effect.  In such a context, we need distinct shades red/green
(and others) to make the hunk-at-point stand out and/or to dim the other
hunks.  This cannot be achieved with 16 colours for two reasons:

* We already explained how values like `termcol{1,2,9,10}` are conceived
  as foregrounds.  They should work well side-by-side when they colour
  text against the main backgrounds (those being `termcol{0,8}` or
  `termcol{7,15}`).  When you use the foregrounds as backgrounds, the
  original assumption no longer holds, because the red and green colours
  were not designed for the express purpose of looking good side-by-side
  _as backgrounds_.  By the same token, the pairs `termcol1`+`termcol9`
  as well as `termcol2`+`termcol10` are not necessarily distinct enough
  when they are used as backgrounds, or their distinction does not look
  good in the context of diffs.

* If the designer were to decide on defining some `termcol` entries as
  backgrounds, say `termcol9` and `termcol10`, then they would encounter
  other problems in the output of CLI or ncurses-based programs that
  would continue to map those values to text, not the text's background.
  In short, we return to what I already stated regarding the designer's
  lack of control over their design.

Despite these constraints, it is common to have terminal emulators
colourise diffs.  They will either use red/green as foregrounds, which
looks okay, or they will invert the colours with red/green working as
backgrounds which might look usable though it likely is too intense.
Even so, we are dealing with a scenario where we are forced to make the
compromise of using colours that are not optimised for their given
context.  Things get worse when we factor in the need for the visuals of
interactivity, à la Magit.

## No theme must force itself to the 16-colour palette

There is no technical reason why we should cling on to the legacy of
terminal emulators.  Programs like Emacs can use colour with greater
precision, which helps add much-needed nuance to each interface.  We are
losing the nuance, the context-specific optimisations, when we force
ourselves to conform with the constraints of base16 or the
tempus-themes.  (Remember to read the entries in the Modus themes'
manual I linked to regarding the distinction between colour schemes and
themes, as well as the prospect of a port of the themes to other
platforms.)

To illustrate the point of not using a 16-colour palette, consider the
differences between [the original
Solarized](https://ethanschoonover.com/solarized/) by Ethan Schoonover
and how it compares to its [Emacs
port](https://github.com/bbatsov/solarized-emacs) by Bozhidar Batsov,
Thomas Frössman, and others.  Like base16, Schoonover's Solarized was
also designed with terminal emulators in mind, although it semantically
does not provide what terminals expect as `termcol{10,11,12,14}` since
those are shades of gray instead of "bright {green, yellow, blue,
cyan}".  Whereas the Emacs port is not a faithful one, as it does not
limit itself to the original palette---and that is the right thing to
do.  Here is a sample from `solarized-palettes.el`:

```elisp
(defvar solarized-dark-color-palette-alist
  '(;; solarized-dark palette
    (base03      . "#002b36")
    (base02      . "#073642")
    (base01      . "#586e75")
    (base00      . "#657b83")
    (base0       . "#839496")
    (base1       . "#93a1a1")
    (base2       . "#eee8d5")
    (base3       . "#fdf6e3")
    (yellow      . "#b58900")
    (orange      . "#cb4b16")
    (red         . "#dc322f")
    (magenta     . "#d33682")
    (violet      . "#6c71c4")
    (blue        . "#268bd2")
    (cyan        . "#2aa198")
    (green       . "#859900")
    (yellow-1bg  . "#273532")
    (yellow-1fg  . "#af8f41")
    (yellow-2bg  . "#433e20")
    (yellow-2fg  . "#b39a5e")
    (yellow-d    . "#866300")
    (yellow-l    . "#e1af4b")
    (orange-1bg  . "#2b2d2e")
    (orange-1fg  . "#ca6f48")
    (orange-2bg  . "#4d2c1f")
    (orange-2fg  . "#c47c5d")
    (orange-d    . "#992700")
    (orange-l    . "#fb7640")
    (red-1bg     . "#2d2c31")
    (red-1fg     . "#d66556")
    (red-2bg     . "#532725")
    (red-2fg     . "#ce7667")
    (red-d       . "#a7020a")
    (red-l       . "#ff6849")
    (magenta-1bg . "#272d3c")
    (magenta-1fg . "#cc6791")
    (magenta-2bg . "#4c2942")
    (magenta-2fg . "#c47896")
    (magenta-d   . "#a00559")
    (magenta-l   . "#ff699e")
    (violet-1bg  . "#0c3144")
    (violet-1fg  . "#8085c0")
    (violet-2bg  . "#1a365a")
    (violet-2fg  . "#888dbc")
    (violet-d    . "#243e9b")
    (violet-l    . "#8d85e7")
    (blue-1bg    . "#003547")
    (blue-1fg    . "#5c93c5")
    (blue-2bg    . "#003f5e")
    (blue-2fg    . "#709bc3")
    (blue-d      . "#0061a8")
    (blue-l      . "#74adf5")
    (cyan-1bg    . "#013841")
    (cyan-1fg    . "#54a099")
    (cyan-2bg    . "#00464a")
    (cyan-2fg    . "#6ba8a2")
    (cyan-d      . "#007d76")
    (cyan-l      . "#6ccec0")
    (green-1bg   . "#1d3732")
    (green-1fg   . "#8c9a43")
    (green-2bg   . "#2f4321")
    (green-2fg   . "#97a35f")
    (green-d     . "#5b7300")
    (green-l     . "#b3c34d")
    ;; palette end
    )
  "The solarized color palette alist.")
```

These are not all the effective colours of the Emacs Solarized port, as
it also has code for colour blending.  Still, it is clear that the
notion of 16 colours is discarded because it is unsuitable for the
demands of a fully fledged theme.

## Colour mapping needs attention to detail

Now let us return to the problems with procedurally generated 'themes'
from base16 and specifically the idea of getting ports to all those
other apps "for free".  Are those templates good for our purposes?  With
the exception of terminal emulators, which will simply map the colour
values to the `termcol` entries, the answer is negative because each of
those templates tries to force a colour palette that was intended for
terminal emulators to work as a general-purpose theme.  Each of those
templates does not consider the contextuality of any given combination
of colours.  This is not because the people who wrote those templates
are careless: it has to do with the fact that the 16-colour palette is
not appropriate for all those cases.  One size does not fit all.

The quality of ports is something I take very seriously (again, check
the links to the Modus themes' manual).  base16 has a port for Emacs,
which can help us shed light on another aspect of the design: the
overall rhythm of the applicable colours in each context.  Compare those
two screenshots, which I got from Peach Melpa:

<a href="{{'/assets/images/attachments/2022-01-23-peach-melpa-base16-emacs.png' | absolute_url }}"><img alt="base16-atelier-heath sample" src="{{ '/assets/images/attachments/2022-01-23-peach-melpa-base16-emacs.png' | absolute_url }}"/></a>

<https://peach-melpa.org/themes/base16-theme?lang=js&variant=base16-atelier-heath>

<a href="{{'/assets/images/attachments/2022-01-23-peach-melpa-modus-emacs.png' | absolute_url }}"><img alt="modus-vivendi sample" src="{{ '/assets/images/attachments/2022-01-23-peach-melpa-modus-emacs.png' | absolute_url }}"/></a>

<https://peach-melpa.org/themes/modus-themes?lang=js&variant=modus-vivendi>

The specific variant of base16 does not matter, as the colour mapping is
constant.  You will notice that they use in this context purple, orange,
red, and yellow.  I find this presentation awkward because there is no
need to use complementary colours (purple+orange) to amplify the
distinction between constructs of the same code.  You have those colours
effectively shouting at you "hey I am here".  For a theme with subtle
colour values, this might not be a major problem, but it would look
horrible if we were to apply the intensity of the Modus themes.

Now check how Modus Vivendi uses colour: blue, cyan, purple.  We do not
have wide differences in hueness because we do not need to exaggerate
the distinction between the various constructs.  There is no competition
at play, nothing to call unwarranted attention to itself.  I only use
complementary colours (e.g. blue VS yellow) in contexts where the
distinction is significant.

Then we have the aspect of colour psychology: the inconsiderate use of
red/yellow makes it more difficult to make errors or warnings call
attention to themselves.

Anyhow, this is not to imply that the Modus themes are perfect because
each major-mode in Emacs will have its own ideas on how faces apply to
any given construct.  Still, we try our best to optimise the effective
colours in their context and thus we do not impose an arbitrary limit on
how many colours the palette must have.  Without knowing the context, we
cannot say anything about the propriety of any given colour combination
even if it satisfies the minimum 7:1 contrast ratio that we target.

Some more entries from my themes' manual:

* [Is the contrast ratio about adjacent
  colors?](https://protesilaos.com/emacs/modus-themes#h:5ce7ae2e-9348-4e55-b4cf-9302345b1826)
* [What does it mean to avoid
  exaggerations?](https://protesilaos.com/emacs/modus-themes#h:44284e1f-fab8-4c4f-92f0-544728a7c91e)
* [Why are colors mostly variants of blue, magenta,
  cyan?](https://protesilaos.com/emacs/modus-themes#h:0b26cb47-9733-4cb1-87d9-50850cb0386e)

## No quick-and-dirty ports

To recapitulate:

* Colour schemes are not themes.
* The 16-colour palette is not appropriate for fully fledged themes.
* What mostly works for terminal emulators does not necessarily apply to
  other programs.  One size does not fit all.
* I have no faith in base16, the tempus-themes-generator, or equivalent,
  to deliver high quality themes for any type of program because of the
  inherent limitations of the 16-colour palette.
* Colour mapping cannot be done on a whimsy.

To be clear: this is not a critique of base16 as the same applies to my
own tempus-themes.  Read it as the distillation of years of
experimentation or, rather, as a warning not to take theme development
lightly.

You are still free to use whichever port you want, though I will never
debase the quality of this project by supporting ports that are simply
not up to our standards (and we haven't even covered the customisability
of the Modus themes and the power it gives to the end-user---again, read
the manual).
