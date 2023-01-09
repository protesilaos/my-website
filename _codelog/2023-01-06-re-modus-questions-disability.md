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

* * *

**UPDATE 2023-01-08 08:58 +0200** Below is the follow-up discussion:
<https://lists.sr.ht/~protesilaos/modus-themes/%3C875ydhzf75.fsf%40protesilaos.com%3E>.

* * *

> As I do not have a reading disability, I am especially glad that my
> cohort is included in what modus targets.
>
> In the interest of investigating how to improve modus' defaults, in
> the next section, I will pretend that you were defending the following
> statement: "Modus's default contrast levels are ideal for their
> respective target usage scenarios.",

That is not the premise of the themes' design.  "Ideal" cannot be
reconciled with the point I made that there is no such thing as a
one-size-fits-all.  The ideal cannot exist.  The themes are highly
customisable in an attempt to accommodate as many use-cases as possible.
There are many factors involved and it is still possible that the themes
are not suitable for a given user.

>  and I will play the part of the attacker.  I will try to address your
> points that directly relate to this. If I miss or misinterpret any of
> them or if anything is unclear, please let me know.

I am fine with this approach.  It helps us discuss aspects of the design
that are not obvious.

> My main and strongest argument is that there exist studies supporting
> the fact that, though high contrast increases visual recognition, it
> increases visual stress over long periods; ergo, high contrast may not
> be generally desirable for those without reading disabilities. If you
> want to skip to this strongest argument, search for "science."

I have checked several of those in the past.  The methodologies always
come with caveats and/or are not directly applicable to our
applications.  "Science" in this case is not about natural constants but
the nuanced interplay between multiple factors and the individual's
subjectivity.  There is room for interpretation and scope for further
research.

> > Legibility benefits everyone.  When we spend long hours in front of
> > the computer, we need the optimal setup that does not tire out our
> > eyes. This is not just a function of colour though and it is a
> > mistake to think of accessibility as a one-size-fits-all.
>
> Agreed; however, modus-operandi/vivendi each contains only **one** set
> of default values that **all** of its users will interact with (at
> first, at least).

The themes are highly customisable.  We can only start with one set of
defaults.  I admit that the out-of-the-box experience is not suitable
for everyone and would expect this to be true for every theme.

> The most reasonable method of choosing this set is probably to go for
> the utilitarian philosophy, i.e., to maximize the cumulative sum of
> "value" across all usages, i.e., by optimizing the following elisp
> sexp: `(seq-reduce #'+ (seq-map
> #'get-value-that-modus-operandi-gives-for-usage
> all-modus-operandi-usages) 0)` (Idem for modus-vivendi, mutatis
> mutandis)
>
> ```
> <details>
> <summary>Note</summary>
> <be>
> ```
>
> (Hopefully, this markdown dropdown works wherever you're reading it!)

I use plain text: the markdown does not do anything.  I get the point
though.

> In practice, it is probably impossible to obtain a complete
> `all-modus-operandi-usages` list (and doing so would be an invasion of
> privacy!). Further, `#'get-value-that-modus-operandi-gives-for-usage`
> is probably impossible to define. What does "value" mean? How does one
> conclusively measure "productivity increases"? How does one
> conclusively measure "enjoyment"? AFAIK these are all poorly defined
> terms and/or open questions, but even so, it is useful to consider
> them.

I agree with your questions.  It is why there is room for
interpretation.

> Therefore, a theme designer has to make many guesses and
> approximations based on intuition rather than hard evidence or logic.

A quote of what I wrote a long time ago which is consistent with this
(though the rest of the article may not be applicable code-wise):

    My opinion is that this endeavour stands at the intersection of art
    and science.  We employ scientific insight in support of our
    choices, while we exercise artistic judgement or freedom in
    interpreting the propriety of every result in its particular
    context.  And we do so in a non-dogmatic way, meaning that we are
    prepared at all times to review our work and challenge our
    assumptions.

    <https://protesilaos.com/codelog/2021-01-11-modus-themes-review-select-faint-colours/>

> Henceforth, let us refer to "the cumulative sum of value across all
> target users." by the shorthand *value*.

Fine.

> > we need to account for typography, the settings of the monitor for
> > brightness and sharpness (among others), and how the overall
> > environment affects the distribution of light.
>
> Agreed; however, as modus has no control over these variables, a theme
> designer has to guess which defaults will maximize *value* across the
> distribution of these variables formed by the theme's usage scenarios.

I think those guesses will still leave something to be desired.  It
ultimately is up to the user to take care of their setup.  In the
manual, I have a section that mentions those other factors:
<https://protesilaos.com/emacs/modus-themes#h:f60cc2ae-129d-47c0-9849-4f6bbd87d8be>

On some GNU/Linux distros the default monospaced font is Liberation
Mono: it has problems with too faint typographic colour (how pronounced
the text looks).  The otherwise excellent Source Code Pro, which might
be the default on Arch Linux with the GNOME desktop, is too thin and
hard to read at some point sizes.

Using modus-vivendi right now, if I switch my font to Source Code Pro at
height 90, I get a "halo effect" around the text that gives it a
red/pink tint.  The other factors remain constant: this change alone
makes Emacs inaccessible for me.  Note that I use small text in general
and the height 90 is not a problem per se.

My point is that colour alone, no matter its intensity, does not
guarantee optimal results for any given user.

> > When we target accessible colour combinations, we already preclude
> > those bad design choices from ever occurring.
>
> Agreed; however, this doesn't imply that one cannot avoid these bad
> design choices without accessible color combinations. I.e., this does
> not prove that accessible color combinations are necessary for good
> design (in the sense that you described).

In such a case, that is an implicit use of legibility criteria.
Granted, the contrast ratio may be lower, but the intent is the same:
make the text readable.  I used those extreme examples to illustrate
this point, not to defend a specific target of contrast.  Same for my
original comment about legibility being for everyone and then remarking
that "legibility" is not a one-size-fits-all.

>> If Modus is too much, there is always my 'ef-themes'
>
> AFAIU 'ef-themes' have the objective disadvantage of not supporting as
> many packages as modus does.
> They also have the subjective disadvantage of not being built into
> Emacs. To me, this is a disadvantage because it makes it so that the
> chances that the package is maintained when you lose interest are
> lower.

I think the "built into Emacs" notion can be misleading.  The code
will not be more maintainable if it is in Emacs, because we still need
someone to take care of it.  That "someone" can do the same work in a
fork outside emacs.git and share their package on GNU ELPA, MELPA, or
whatever.  Some of my favourite packages are not a part of Emacs
(e.g. `vertico`, `consult`, `orderless`, `notmuch`, `magit`, `denote`
(in no particular order)).

[ If anything, maintaining a project independent of Emacs is easier in
  terms of paperwork/workflow. ]

Just focusing on the code, my themes have not been affected at all by
their inclusion in Emacs, let alone improved.

The themes are practically "shipped with Emacs": they are still
developed externally.  This means that the actual work of maintaining
the package is not "part of Emacs", in the sense that Emacs maintainers
do not partake in the process.

Sure, them being built-in is convenient for users (and extra work for
me), though their inclusion as such does not provide sufficient
information about the quality and maintainability of the package.  If a
package is good, it is good regardless of whether it is in emacs.git.
If it has a community of eager developers around it, one/some will step
up to maintain it, regardless of where its code is.

To your other point, the `ef-themes` support many packages and more
can be included.  The difference between them and the `modus-themes`
is small in this regard.

>> Every hue against shades of grey looks awkward, even if it passes the
>> 7:1 contrast ratio.
>
> - "Looks awkward" seems too subjective of a statement to be a basis of
> design that targets a general audience. How do you know it looks
> awkward for the target usage? Do you know of data that supports it?
> - Shades of gray vary wildly, and dark modes that I estimate closer to
> optimal *value* go for the very dark shades. For example, the editor
> portion on Intellij IDEA's [new dark
> theme](https://www.jetbrains.com/help/idea/new-ui.html#7f7ba68)
> - In my experience, making changes and building new habits is almost
> always somewhat awkward. Have you given these shades of grey enough
> time to properly assess their awkwardness?

I have used and developed such themes before and am no longer fond of
them (to varying degrees of dissatisfaction):

- <https://protesilaos.com/prot16/> (this is the oldest and least methodical)
- <https://protesilaos.com/tempus-themes/>

Yes, the "looks awkward" is subjective as is theme design at-large.  The
Intellij sample you provide does not appeal to me as I find lots of the
colours shown there to exhibit the kind of awkwardness I allude to.

Grey is problematic in terms of contrast because it competes for
attention with the foreground and thus limits the available hues that
can be contrasted/compared with each other: it does not give differently
coloured text the chance to stand out relative to each other.  For
general syntax highlighting this is mostly fine, though it is a problem
for semantic/significant colour-coding.

We have this robust constraint with the Modus themes when some colours
need to be displayed on the mode line, which is grey by default.  The
colour-coding of errors, warnings, and other information on the mode
line is not as good as it should be because the hueness of those
indicators is "absorbed" (outcompeted) by the underlying grey
background.  The colours we use look similar due to the limitations
imposed by the underlying grey.

[The following paragraph is not directly related to our discussion, but
I include it as it is relavant for my project.]

The Intellij sample uses "warm" colours for text highlighting (orange,
yellow, ...).  The light variant, however, applies "cool" colours to the
same constructs (blue, purple, ...).  The two themes are unrelated in
this regard.  Whereas when we switch between the Modus themes, we want
to retain all the paradigms we establish: there has to be inter-theme
consistency as well, otherwise we just have two standalone themes that
happen to be packaged together.

>> What we need to consider here is the application in question. YouTube
>> does not produce an Org agenda, for example, or something like the
>> Magit buffers and general programming syntax highlighting.
>
> I completely agree. And probably one of the most notable differences
> is that an Emacs theme that maximizes *value* probably needs to
> optimize for long reading sessions, whereas youtube.com, google.com,
> and most applications that use material design do not.

Indeed.  Design-wise, those websites/apps are controlled environments,
where their designers influence aspects such as padding, line spacing,
and typography.  We do not have this luxury when providing an Emacs
theme.  Whatever we offer will always be a compromise in this regard
(unless we ship a theme that actively rewrites parts of Emacs beside
modifying faces).

> Therefore, I looked into the contrast levels of the dark themes of
> other applications that probably optimize for long-reading-session
> usage. I looked only into dark themes because I suspect that in the
> area of light themes, given that black text on a white background is
> so ubiquitous, users are generally uncomfortable with and unwilling to
> give a chance to anything other than that, and so theme designers,
> including those involved in million-dollar R&D projects, do not
> deviate from that even if doing so could bring measurable advantages
> for the willing user.

There are plenty of light themes that are not black-on-white, by the
way.  Perhaps the most popular among them is Solarized by Ethan
Schoonover: I consider it one of the best colour schemes for coding,
although I still find it inaccessible at my preferred text size and
lighting conditions (not counting derivatives of Solarized which amplify
the contrast, as those are no longer the original and I have not tried
them).

> Note that this choice by theme designers makes sense from the
> utilitarian perspective, given that *value* probably must take comfort
> into account.
>
> - Kindle cloud reader: uses black background but uses light gray text
> instead of white (non-full contrast)
> screenshot: https://imgur.com/a/6DRKbXn
>
> If you'd like to take a look, you can "buy" [this free
> book](https://www.amazon.com/Masterpieces-you-have-read-before-ebook/dp/B07QDJRRXF/ref=sr_1_3?keywords=Public+Domain+Books&qid=1673019195&s=digital-text&sr=1-3)
> and then open it [here](https://read.amazon.com/kindle-library).

The problem here is that we are still not comparing the same
use-cases.  This book has uniform colouration: what it does is
perfectly fine.  Try scenaria where we need to impose some sort of
structure, like nested quotes in an email/message buffer, syntax
highlighting, differentiation of "main" and "ancillary" elements like
Org paragraph text and the `PROPERTIES` drawers, and so on.  Consider,
further, that this "structure" cannot be brought about with changes to
padding, indentation, and the like, the way an ebook/website design
can.  If grey is our base colour, the secondary ones will have to be
even more faint, at which point they will not be as usable.

This is a matter of visual rhythm and why the context matters.  If all
elements look about the same, it is hard to find what we are looking
for.  When we read a book, we focus on that.  In that scenario, the
ebook you show is okay.  But in Emacs we can have all sorts of buffers
side-by-side, each displaying different types of information.  The book
is a controlled environment, whereas how a user will set up their
workflow with Emacs is largely unknown.

My experience over the years tells me that the visual rhythm must be
varied (text with different levels of intensity for different types of
constructs).  Whether this variance should be pronounced or subdued is a
matter of preference, hence the extensive customisability of the themes,
including the preset overrides for "faint" or "intense" styles.

> - Intellij IDEA [new dark
> theme](https://www.jetbrains.com/help/idea/new-ui.html#7f7ba68): uses
> dark gray background and light gray text (non-full contrast)
> If you'd like to take a look, the monetarily-free community edition
> can be downloaded
> [here](https://www.jetbrains.com/idea/download/#section=linux). Then,
> in settings, enable New UI.

I have seen it before and would not use it for the reasons I explained
concerning grey.

> However, we can only speculate on what these designs are optimizing
> for (e.g., how much of the design was done for marketing?). A much
> better place to look at is science.
>
> The following quote is from the introduction of a scientific paper
> with DOI "10.1117/1.oe.53.11.113102" (which you can view in
> https://sci-hub.se/ by pasting the DOI in the "enter your reference"
> text box).
>
>  > According to Knoblauch et al., a large contrast in luminance
>  > increases visual recognition,12 whereas the continuity of the
>  > contrast has contributed to visual discomfort.
>
> The introduction talks more about this, and it references a few other
> studies that support this statement.

I feel we are not making one-to-one comparisons.  This is specifically
about smartphone displays and covers black and white tones.  The method
shifts the tones over time.  How much of that relates to the kind of
considerations that apply to an Emacs-centric workflow?  Think about
Org, Magit, Grep, shells, prog-mode, completions, extending a region
with isearch, displaying key bindings and active arguments/values with
transient.el, etc..  Then add to this the fact that those can be
displayed side-by-side in an Emacs frame.

Moreover, consider the form factor of a monitor that may be considerably
wider than that of a palm/phone and how that influences one's peripheral
vision (your eyes do not focus on a narrow strip of intense light).

We do not have a monochromatic theme and we do not work in a controlled
environment.  Trying to find the optimal relationship between black and
white is not sufficient in our case: we must also factor in how those
two enable all other colours (and meaningful colour-coding).  We will
still need to err on the side of caution or otherwise make some sort of
compromise in our choices about default values.

>> As a theme designer, I do not determine how a buffer is generated, so
>> I must operate at a different level of abstraction that requires more
>> adaptability.
>
> I understand that this point indeed synergizes with black or white
> backgrounds, as those increases the available set of colors that
> satisfy all constraints, but it is a point against the requirement of
> a 7:1 ratio (lowering the required ratio would open up more colors and
> give more adaptability).

There is an inescapable trade-off.  The 7:1 contrast (which is not
perfect, by the way) is, in my view, a design that is consistent with
the notion of "err on the side of caution".  It prioritises legibility
at the expense of aesthetics.  Yes, the range of colours is more limited
compared to lower contrast ratios, though it still is more than what we
use.

Think about Solarized for a moment and consider "thematic consistency".
Just because its lower contrast allows more colours does not mean that
those would also fit in with the theme: they would look ugly by virtue
of deviating considerably from the established patterns.  Try to pick
colours that would feel natural for Solarized and you will notice that
your choices are much more limited than you think would be possible by
the lower contrast ratio.

The adaptability you allude to is central to the Modus themes and is
provided via their numerous customisation options.  The user can lower
the contrast substantially by overriding the relevant colours.

The WCAG guidelines on colour contrast rest on assumptions about text
size and weight.  The rule is that the larger or heavier the font, the
lower the contrast can be.  I would add that the greater the
padding/spacing, the easier it is to spot something.  Same for larger
surface areas, as we already discussed.  And same for the lower the
"competition for attention" between adjacent colours.

Test the following with any Modus theme, ceteris paribus, and consider
which one is more comfortable:

- Put this text in an empty buffer and set the font to your regular
  reading height:

```elisp
(setq this-is-a-test "ts")
```

- Now evaluate those three in separate sessions and decide when the string
  value "ts" is easier to read:

```elisp
(modus-themes-with-colors
  (set-face-attribute 'font-lock-string-face nil :box `(:line-width -3 :color ,string)))

(modus-themes-with-colors
  (set-face-attribute 'font-lock-string-face nil :box `(:line-width -3 :color ,border)))

(modus-themes-with-colors
  (set-face-attribute 'font-lock-string-face nil :box `(:line-width -3 :color ,bg-dim)))
```

Do you prefer the default or one of the boxed styles?  And which of the
boxes?  My point here is that we cannot opine about colour relations in
abstract: the context matters.  You can see that the addition of a
prominent box that is tightly framing the text and competes for
attention with it makes things more difficult.  How much "more"?  That
will depend on the specifics of each case.

>> By the way, I recently bought an Android smartphone, which I only use
>> to make videos while walking: it's accessibility leaves much to be
>> desired and I would rather have those "millions of dollars" invested
>> in some better cause.
>
> That's interesting. I've interacted very little with accessibility
> options anywhere, but I was under the impression that Google put a lot
> of effort into this. I wonder if your smartphone's Android flavor
> customized away some of Google's work or if there was some important
> setting you didn't enable. My impressions could also be wrong, of
> course.

Maybe it deviates from Google's guidelines, as it is a Samsung device.
Though Samsung is a giant in its own right.  At any rate, I did not mean
to use this as an argument for my points, so let's ignore it for now.
Sorry for the tangent!

>> Companies have a built-in incentive to reinvent their design every
>> few years so they can peddle the same tired products as brand
>> new. Whereas with Emacs and free software at-large we should aim for
>> a timeless design that is not driven by the pressure of greedy
>> investors for year-on-year fiscal growth. Just because Google and
>> friends do things a certain way does not mean we must copy them
>> uncritically. The context matters.
>
> I agree, and, in accordance with "The context matters," the presence
> of this built-in incentive does not mean we should immediately discard
> their advancements as mere marketing tactics. Marketing is very
> complex, as it deeply relates to human psychology, which is an
> unsolved question. One could guess that marketing is complex based on
> the very fact that large companies spending a lot on it still seem to
> be viewed negatively by most or, at least, many (e.g., Meta, Apple,
> Amazon, Google). As a result, often, the more lucrative endeavor is to
> make the best product one can.

Indeed, marketing is complex and should not be discounted qua marketing.
Though the pressing need to redesign everything every so often is driven
by outside factors and must then be rationalised accordingly.  My view
is that a megacorporation reinventing their visual identity does not
necessarily mean that they are making some genuine advances in the
field.  Plus, we still have to consider the use-cases that are pertinent
to Emacs.

>> This is a misleading test.  When we talk about legibility, we care
>> about text, not objects with a large surface area. I can easily
>> discern such large objects even if they have the faintest of greys.
>
> That is a great point - I should've probably thought of this and,
> thus, perhaps not shared that link.

No worries!  It is relevant in other ways and I do factor it in.  When
we have a coloured background, we need to account for its approximate
surface area as well as its duration (if transient) in order to
estimate its optimal intensity.  This is why `isearch` matches are
more colourful than, say, the default background of the fringes.

What your example shows correctly, and what I do as well, is that the
more permanent and large an area is, the less intensity it requires to
stand out.

> Finally, I have more questions:
> - Do you have scientific and/or data-driven references that support
> any part of modus-themes' design (e.g. the colour theory)? I scanned a
> few modus-themes posts and google-searched `site:protesilaos.com DOI`
> but found nothing.

No, nothing specific beside the W3C's guidelines which themselves are
subject to interpretation.  I have read many studies over the years but
this ultimately is "art", strictly speaking.  I have done tests with
neighbours on different monitors, including this last month, with a
variety of typographic settings and have also read lots of feedback from
users.  None of this is exact.  I will not hide behind papers that I do
not consider relevant to the specifics of the case.

Even the 7:1 contrast ratio is problematic in many cases, such as a
coloured background with a two-letter-long small text that has no
padding around it.

If I market my themes as exact science, I am simply lying.  So I won't.

> Why did you make the tinted versions?

Because many users where using the old overrides I had in the manual
which produced approximations of those versions.  People told me they
found them pleasant to work with.

> Is there a different colour theory for the tinted versions? If so,
> have you discussed or can you discuss more about it?

No, it is the same idea.

* * *

**UPDATE 2023-01-09 03:49 +0200:** What follows is the final part of
this exchange:
<https://lists.sr.ht/~protesilaos/modus-themes/%3C875ydhzf75.fsf%40protesilaos.com%3E#%3C87fscktr43.fsf@protesilaos.com%3E>.

* * *

> You have convinced me that modus has very good defaults for its target
> audience and that my previous implicit proposition of having modus
> declare that its target audience is only people with reading
> disabilities was bad.

I think this exchange is informative.  It touches on aspects of the
design that we usually don't talk about.  Thank you for giving me this
opportunity!

Taking a step back, the mistake I did with the tempus-themes (from my
pre-Emacs days) was to place too much emphasis on colour contrast in
abstract.  This means that I was thinking in terms of the relations
between colour values themselves.  I did not have a critical eye for the
application of those colours---and their combinations---in their
context.  The distillation of this realisation is that a colour scheme
is not a theme (and a theme in Emacs is not a fully fledged
architecture).

In the tempus-themes I avoided maximum contrast for the kind of reasons
you alluded to.  Yet in the context of applications that require a
variety of colour-coding paradigms, I realised that I was making a
subtle mistake: I was moving towards the imposition of a uniform visual
rhythm.  This is not about the minimum contrast ratio or desired target,
but the overall distribution of contrast in combinations between
adjacent colours in the given interface.  We do not want all foreground
values to "speak" at the same pitch as then we cannot discern patterns
as easily.  We need some variety between relative highs and lows.  This
is what the maximum contrast between black and white enables for Modus:
sufficient manoeuvring space while also conforming with the 7:1 target
for colour contrast against the background.

With the `ef-themes`, say, `ef-night` or `ef-summer` I do the same
thing except the target is much lower.  As such, there is no need for
a black-and-white combination as a starting point.

> In the next two sections (separated via --- ), I comment on the parts
> of your reply that most led me to understand (feel free to skip if
> uninterested).

I am interested and always read everything: it helps me understand
things better.

> I was thinking only of text-to-background, and so I thought that the
> 21:1 from the black/white pairing was excessive. I finally understood
> some key points about how these choices deeply affect the relationship
> between the accent colors:

I did that for years and know exactly how it feels.

> Regarding non-black or non-white backgrounds:
>
> > Grey [...] does not give differently coloured text the chance to
> > stand out relative to each other.
>
> Regarding non-black or non-white text:
>
> > If grey is our base colour, the secondary ones will have to be
> > even fainter, at which point they will not be as usable.
>
> (for me, the key to this understanding was simulating how the math for
> calculating accent colors is different with black or white vs gray)

Yes, that makes sense.  I noticed those constraints while I was
developing the understanding that "a colour scheme is not a theme".  It
all comes down to decisions such as how to denote active/inactive mode
lines, tabs, Magit diff hunks, the region, etc. while still keeping
those legible and colour-codable (if needed).

> And I finally understood the next point explains distinguishable
> accent colors are much more important for Emacs themes
> that-control-only-color than most other applications' themes; one has
> to account for the absolute worst case where there are no other
> distinguishing mechanisms (e.g., padding):
>
> > Try scenaria where we need to impose some sort of structure, like
> > nested quotes in an email/message buffer, syntax highlighting,
> > differentiation of "main" and "ancillary" elements like Org
> > paragraph text and the PROPERTIES drawers, and so on.  Consider,
> > further, that this "structure" cannot be brought about with
> > changes to padding, indentation, and the like, the way an
> > book/website design can.
>
> I think this situation is indeed very unique, and therefore one is
> unlikely to find high-quality science that properly addresses it.

If I had full control over every aspect of the design, I would place
more emphasis on typography and the use of negative space.  For
instance, using symbols or appropriate indicators helps reduce reliance
on colour.  To give a crude example, imagine a ⚠️ emoji next to an Org
agenda scheduled item: it gives us the freedom to reduce the saturation
of the applicable colour because we now have another element of
differentiation that helps the user discern the pattern.

As one user put it nicely, my role is that of the gardener NOT the
architect: I have to work with what is available and do not get to
refactor Emacs in the service of the theme.

> > > - Why did you make the tinted versions?
> >
> > Because many users where using the old overrides I had in the manual
> > which produced approximations of those versions.  People told me they
> > found them pleasant to work with.
>
> I expect that many users (including myself) will have a preference for
> it. Given that:
> - light-grey-on-dark-grey is so ubiquitous for dark modes
> - most emacs users use other applications besides emacs
> - most people tend to stay close to defaults (I wonder if this holds
> when replacing "people" with "emacs users", but I think it does),
> A think a very reasonable approach for such users is to use
> modus-tinted for consistency across applications and increase their
> monitor's contrast if need be.
>
> Also, I see the tinted themes mentioned very prominently in the
> modus-themes manual. That is exactly the approach I would have taken
> as well, given their popularity.

Yes, this makes sense.

> I'd like to clarify some things I may have expressed poorly. If you
> had already understood them originally, and therefore this
> clarification is unneeded, feel free to skip it:

Thanks for taking the time to do this!

> > > I will pretend that you were defending the following statement:
> > > "Modus's default contrast levels are ideal for their respective
> > > target usage scenarios.",
> >
> > That is not the premise of the themes' design.  "Ideal" cannot be
> > reconciled with the point I made that there is no such thing as a
> > one-size-fits-all.  The ideal cannot exist.
>
> If the definition of "ideal" is "optimal for each individual usage,"
> (which I henceforth assume you are using), your statement is
> objectively true (assuming a 'normal' definition of  "individual"
> here), and proving so is simple (both in practice and in theory):
>     each usage is individual THEREFORE each usage can have different
> product settings for optimal product value THEREFORE there can be no
> one product setting that maximizes product value across all usages.
> I hope the above is clear; I could express these *value*-related ideas
> better with logical and mathematical symbols, but I don't know whether
> they are part of your vocabulary. Further, this is far from being
> formal proof (for example, there are a bunch of things I didn't
> formally define), but hopefully, the logic I am trying to convey is
> clear.

Yes, this is clear and is what I had in mind.  Basically, we have to
make compromises and perform a leap of faith in the face of uncertainty.

> I was using another definition of "ideal": "maximizes the cumulative
> sum of value across all target usages" (previously explained). This
> one *can* exist in theory (assuming one has a formal definition of
> "value"), but in practice, it cannot (because of many problems
> previously discussed, e.g., the fact that we *do not* in fact, have a
> formal definition of value).

I intuitively agree with you.  The problem is one of application.

> Note that I use "usage" and not "user"; a single user can have
> multiple usages: e.g., modus-operandi during the day and modus-vivendi
> at night.

Good point!

[ We could say that "you" are not "the same" because you are a function
  of an environment that has undergone change, but this is not changing
  the point. ]

> Tangent: in fact, a definition closer to reality is to define each
> instant of time as a separate usage. This definition could be used in
> practice as the basis for an optimization target of software with AI
> components capable of continuously scanning the user's eyes and brain
> and dynamically and continuously adapting the theme based on the
> readings. Of course, such an application is far from the context of
> modus, and I don't see how this definition would be useful for modus;
> ergo, I labeled it a tangent.

In general, I am always open to improvements and to understand those
concepts better.  Evidence of this eagerness is the recent revision of
some grey values that I slightly intensified to avoid scenaria of
"invisible" backgrounds (e.g. with monitors that have inaccurate colour
reproduction capabilities).

> > I admit that the out-of-the-box experience is not suitable for
> > everyone and would expect this to be true for every theme.
>
> Right, and with your definition of "ideal," you can repeat that
> sentence substituting "would expect this to be true" for the much
> stronger "is true," and it would remain correct (following what I
> previously "proved").

Agreed.

> I clarify these things so I can ask: Do you agree that my definition
> of "ideal" is probably what one should strive for with their product,
> as it is probably the closest thing to "one-size-fits-all"?

Conceptually yes.  The tricky part is to express that as the finished
article.  Once you get into the technicalities of the theme, you realise
that "the devil is in the details".

> > The code will not be more maintainable if it is in Emacs, because
> > we still need someone to take care of it.
>
> You're right. I believe there is an unformalized consensus that all
> files in the emacs source are in scope for maintenance by Emacs
> maintainers. However, Emacs is unfortunately undermaintained (one
> example of this is eshell, which is notoriously lacking in
> documentation). So, this consensus does not mean much by itself.

Emacs is understaffed and underfunded (actually not funded at all, as
far as I can tell).  Maintaining emacs.git right now is a Herculean
task and I think the inclusion of even more packages (like the
`modus-themes`) adds to the maintenance burden.

I feel that a more sustainable approach is this notion that has been
floating around on the Emacs development mailing list (emacs-devel) of
producing an Emacs tarball that bundles packages from GNU ELPA.  This
would allow the maintainers to decouple the true "core Emacs" from all
the extras like Org, the `modus-themes`, and a zillion other packages.
The end-product would still be the same for the user, but internally
the work would be reorganised in a more decentralised fashion.

The organisation model is currently centralist-and-centralising with
one/two maintainers having to oversee a ton of work across multiple
subsystems.  It works right now because the current maintainers are
tenacious, but we are still overly reliant on individual availability.

Just look at the situation with ido-mode: icomplete.el developed
functionality to replace (mimic?, duplicate?) Ido in the form of
fido-mode and has since defined a total of four minor modes.  Instead
of streamlining the experience, we ended up with Ido plus all the
Icomplete variants (plus the standard *Completions* buffer).  If Ido
is still a thing, why have Fido?  Maintaining all that does not come
for free.

Anyhow, this is running off on a tangent.  I am happy that the
`modus-themes` are built into Emacs ("shipped with Emacs", as I wrote
before) though I prefer to think about the bigger picture.

