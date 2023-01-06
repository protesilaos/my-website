---
title: "Re: Questions around suitability of modus-themes for those that don't have reading disabilities"
excerpt: "My comprehensive answers to whether the Modus themes for Emacs are only for people with disabilities.  In short, they are for everyone."
---

The following is an exchange that took place [on the mailing list of
the Modus
themes](https://lists.sr.ht/~protesilaos/modus-themes/%3CCA%2BddoUx0GFb15oQ%3Du%3Dy7oBcZanQn8As3uN50Aj%3D%3DwXTh-Tm31w%40mail.gmail.com%3E).
I am reproducing it here as it will probably reach a wider audience.

* * *

> Hi Prot, thank you for modus-themes! The following are are genuine
> questions; no offense is meant.

Hello there!

Yes, these are good questions.  I do not take offence as I always
maintain a distance between myself and my ideas/projects---this is
philosophy, no worries!

I know the present message is shared on the mailing list, though I will
also repost it on my website.  I think it is relevant to a lot of
people.

> 1) I'm confused as to the modus-themes' intended audience; is it just
> for those with reading disabilities?

Legibility benefits everyone.  When we spend long hours in front of the
computer, we need the optimal setup that does not tire out our eyes.
This is not just a function of colour though and it is a mistake to
think of accessibility as a one-size-fits-all.  Apart from the effective
colours, we need to account for typography, the settings of the monitor
for brightness and sharpness (among others), and how the overall
environment affects the distribution of light.

In general, we need text that is crisp, colours that are easy to spot
without being over-the-top, and the appropriate environmental conditions
to prevent the eye from focusing only on a single source of light.

Suppose you have no disability.  Try a light theme with a bitmap font
like Terminus for 8 hours.  It will be a tormenting experience!  To
maximamise the difficulty, do it in a dark room with the monitor's
brightness set to its maximum value.

Actually, don't try that on yourself.  A few seconds will already give
you the hint you need: legibility is for everyone and inconsiderate
choices will harm even those with eagle-eyed vision.

Accessible colour combinations have the inherent benefit of avoiding
awkward pairings.  Again, this is not about disability.  Try to read a
pure green text on a pure red background, magenta on orange, yellow on
grey, and the like.  Do it for a few hours.  You cannot or, if you can,
you will do it at the cost of your health.

When we target accessible colour combinations, we already preclude those
bad design choices from ever occurring.  Picking a random set of colour
values is easy.  The difficulty consists in pairing and combining
colours in such ways as to eliminate the aforementioned awkwardness.

Legibility is not defined in a vacuum.  We need to study each interface
and be careful with the colour harmonies implemented therein.  I have
covered this before in my publication "colour theory and techniques used
in the Modus themes":
<https://protesilaos.com/codelog/2022-04-21-modus-themes-colour-theory/>.

[ Some details may not apply, but the general ideas remain constant. ]

The gist of this "colour theory" is to avoid exaggerations: do not
emphasise the emphasis, do not intensify what does not need intensity,
and so on.  Simply put, avoid the "angry fruit salad" that plagues most
themes.

> 2) Given that you use it, do you have a reading disability?

I have myopia and astigmatism.  I can use low contrast themes if forced
to, though I simply dislike them.  If Modus is too much, there is always
my `ef-themes` which target a lower contrast ratio and are a bit more
colourful (still highly legible though).

I should reiterate here the point about accessibility not being a
one-size-fits-all.  I have designed the Modus themes to be highly
customisable.  The recent release of version 4 epitomises this effort,
by giving the user near full control over the looks of the theme (check
the manual for "palette overrides").  There are lots---and I mean
LOTS---of scenaria where the user needs to deviate from the default
style: someone needs more pronounced grey values, another prefers to
desaturate the appearance of certain constructs, a third wants to reduce
the colouration of the Org agenda but amplify it elsewhere, and so on.
Modus accommodates all those diverse needs.

Again, this is not about disability but "comfort".  We can think of it
in simple terms as "if something does not feel right TO YOU, then it is
not right".

Of course, designing for accessibility means that we also cater to the
needs of people with disabilities.  I have received many messages from
users who tell me that I have literally made their life better.  This is
not an exaggeration when you think that you need the computer/Emacs to
be comfortable over extended sessions.

> 3) If `modus-vivendi` is intended for also for a general audience,
> why did it go for a `#000000` background? Note that almost all dark
> themes, including those that have millions of dollars in design R&D
> invested, do not use such high contrast ratios and do not use a
> completely black background, I believe because high contrast ratios
> increasing eye strain, see:
>
> By google:
> - <https://m2.material.io/design/color/dark-theme.html#properties>
> - See also google.com and youtube.com dark modes.

I disagree with them.  Grey reduces the range of colours we can use.
Every hue against shades of grey looks awkward, even if it passes the
7:1 contrast ratio.

What we need to consider here is the application in question.  YouTube
does not produce an Org agenda, for example, or something like the Magit
buffers and general programming syntax highlighting.  To use that
website as a reference is to start with the wrong basis.  Same for all
those Android apps that have simple and controlled/predictable
interfaces.  In Emacs, we encounter a wide range of buffers with all
sorts of colour combinations and particular requirements.  As a theme
designer, I do not determine how a buffer is generated so I must operate
at a different level of abstraction that requires more adaptability.

As I explain in the themes' manual, it is of paramount importance to
avoid instances of discrimination.  Quote (apply it to the above,
mutatis mutandis):

> Again, one must exercise judgement in order to avoid discrimination,
> where "discrimination" refers to:
> 
> + The treatment of substantially different magnitudes as if they were of
>   the same class.
> + Or the treatment of the same class of magnitudes as if they were of a
>   different class.
> 
> (To treat similar things differently; to treat dissimilar things alike.)
> 
> <https://protesilaos.com/emacs/modus-themes#h:a956dbd3-8fd2-4f5d-8b01-5f881268cf2b>

Again, legibility is not a function of colour in a vacuum.  Consider
environmental light, typography, and hardware.  Many fonts produce a
"halo effect" at certain point sizes because of the shape of their
glyphs in tandem with the vertical/horizontal spacing and the monitor's
sharpness.  It is simplistic to attribute this to colour alone.

Black (`#000000`) is perfectly fine, though we cannot reduce
`modus-vivendi` to just "black": it is so much more than that.

What is mentioned about shadows is not relevant for Emacs.  Whether
those effects actually improve accessibility is another discussion.  I
consider them a gimmick (and is one of the reasons I prefer to do as
much as possible within Emacs instead of web apps).  By the way, I
recently bought an Android smartphone, which I only use to make videos
while walking: its accessibility leaves much to be desired and I would
rather have those "millions of dollars" invested in some better cause.

Companies have a built-in incentive to reinvent their design every few
years so they can peddle the same tired products as brand new.  Whereas
with Emacs and free software at-large we should aim for a timeless
design that is not driven by the pressure of greedy investors for
year-on-year fiscal growth.  Just because Google and friends do things a
certain way does not mean we must copy them uncritically.  The context
matters.

> A quora answer I think is correct:
> <https://www.quora.com/Are-dark-themes-for-IDEs-and-code-editors-good-for-the-eyes/answer/Christian-Baune?ch=10&oid=14295776&share=28a593b6&srid=5m9E7&target_type=answer>

This is a misleading test.  When we talk about legibility, we care about
text, not objects with a large surface area.  I can easily discern such
large objects even if they have the faintest of greys.  Try the same
faint grey with small text for 8 hours: that is what we care about---and
we want to avoid.

> 4) Do the "tinted" versions have less contrast, given that they don't
> use `#000000` and `#FFFFFF` backgrounds?

Yes, their contrast is a bit lower, though their character is still
decisively "Modus".  As always, the palette can be customised and I am
here to help anyone who needs guidance or ideas (contact me in private
if you prefer).

> Thanks again!

You are welcome!

All the best,  
Prot

--  
Protesilaos Stavrou  
<https://protesilaos.com>
