---
title: "About Emacs themes, Solarized, and wallpapers"
excerpt: "My reply to questions I got about Emacs themes, the Solarized colour schemed, and my preference of wallpaper."
---

JTR from the blog _The Art Of Not Asking Why_ sent me a few questions
regarding Emacs themes, my opinion on the Solarized colour scheme, and
even my choice of wallpaper.

JTR asks about Solarized because I consider Ethan Schoonover's
Solarized an excellent project, given what Ethan was trying to
achieve. I asked JTR if I could publish my thoughts and they agreed.
JTR has also written the article [Back to Solarized](https://taonaw.com/2026/08/12/back-to-solarized.html).

Note that throughout this article I am only commenting on Ethan
Schoonover's Solarized (the original Solarized). There are many
Solarized-like themes out there with lots of additions on top,
including higher colour contrast, which are separate themes as far as
I am concerned.

I should also point out something I always mention: themes are a
personal choice and there are many factors that go into what a person
wants. Keep in mind that readability is also a matter of font size,
ambient light, and the screen brightness you are using.

To give a simple example, `modus-operandi` in a very dark room with
maximum screen brightness at a fairly large font size will most
probably harm you and is thus a terrible choice. But the same setup on
a sunny Cyprus day in my well-light house is how you can read the
screen without distractions.

Generally though, people forget to adjust their screen brightness, so
always do that and rely on environmental light to not tire out your eyes.

## Be mindful of the context

> Have your thoughts changed about Solarized since the creation of
> Modus themes? Later, did they change after you created the
> ef-themes?

In short, no as the technological realities for my case and for the
original Solarized remain the same. Ethan Schoonover wanted to have a
colour scheme that would work reasonably well with terminal emulators
and, by extension, Vim. Most terminal emulators let you define 16
colour values. Then applications running inside the terminal can map
those to the objects they display.

Applications running inside the terminal cannot change the 16 colour
values of the terminal. This means that Ethan's Vim configuration
necessarily had to have a light and a dark theme that worked with the
same 16 colours. Ethan could have developed two distinct colour
schemes for the terminal, which would then underpin two separate Vim
themes, but I understand how this is a more complex arrangement.

My older [Tempus themes](https://github.com/protesilaos/tempus-themes)
project, from my pre-Emacs days, is for terminals, Vim, and friends.
Same idea for its predecessor, [Prot16](https://github.com/protesilaos/prot16).

I think both of those older projects are fundamentally flawed because
the technological constraints they are designed to work in result in
all sorts of little compromises. To give an example that many Linux
users may have noticed: if you use a light theme in a terminal and do
`apt update && apt upgrade` you will get the progress bar with a green
background and a black foreground. Colour schemes cannot change that
combination, so they make that text virtually unreadable (in a
terminal, colour combinations should always be ACCENT + BACKGROUND,
not ACCENT + BLACK/WHITE, as the accents are always designed to be
visible against the background).

## There cannot be one Solarized

Even though the original Solarized was designed to be a single theme,
in practice it is not and cannot become as much. There is Solarized
Light and Solarized Dark, sharing those same 16 colours. Solarized
light has a background that is closer to yellow, while its dark
counterpart's background is closer to blue. This means that accent
values which are picked to work with both eventually do not work
equally well as they do not evoke the same feeling.

Without even considering the specific values of the Solarized palette,
a combination of blue/cyan, magenta, and purple as foreground colours
will be on the opposite side of the spectrum to the yellow background
and on the same side as the blue background. This means that if we
pick blue/cyan, magenta, and purple as our main colours we have a
light theme (yellow) with a completely different feel than the dark
theme (blue) even though they are supposed to be the "same Solarized".

Let me outline this for you:

| Foreground colours         | Solarized Light background | Solarized Dark background |
|----------------------------+----------------------------+---------------------------|
| green, yellow, red/orange  | Same side                  | Other side                |
| blue/cyan, magenta, purple | Other side                 | Same side                 |

So if we force the same mapping of foreground colours, then we have
two themes with contrasting harmonies and necessarily distinct
characters. In this context we begin to appreciate the importance of
judgement: sometimes you achieve likeness through difference. For the
table above, inter-theme likeness exists on the diagonals, so either
have both themes with "same side" combinations or both themes with
"other side" combinations.

This concerns the predominant colours. A theme that uses all accents
in equal proportion will look very busy and thus run into other problems.

The designer can, of course, pick a colour that does not follow the
overall pattern to produce an emphasis of some sort. Though they
cannot start with emphasis as their baseline.

## One set of values leads to compromises

Because Solarized Light and Solarized Dark are designed to share the
same palette, individual values are picked as a matter of compromise,
even though they are "equally good" on paper in terms of distance as
measured by various luminance metrics. The blue used for the light
theme, for example, must also be good enough with the dark theme. But
"good enough" for both may not be optimal for either.

Concretely, the Solarized blue stands out more in the light version
than in the dark version (because of the complementarity between
yellow and blue). If the light effect is supposed to evoke sunlight on
a surface, and if that is the reason green and yellow are desaturated,
then the blue should not be as saturated for the light theme. It would
have to be a considerably more washed out colour. Though the blue has
to be fairly saturated to be readable on the Solarized Dark
background and still look like a blue, hence the compromise.

Same idea for the green and yellow colours which are consistent with
the light background but would require tweaks to be harmonious with
the dark background.

The magenta does not fit any background: it stands out as an
exaggeration. To be consistent with the light background, it has to be
less saturated. To fit the dark background, it needs to have greater
contribution from the blue channel of light (i.e. move closer to
purple) or become more pink. But moving in either direction
compromises the opposite theme...

There is no "bright green" (terminal colour 10), "bright yellow"
(terminal colour 11), "bright blue" (terminal colour 12), and "bright
cyan" (terminal colour 14). I believe this is because they would not
fit both Solarized Light and Solarized Dark.

## My themes are designed for Emacs

As noted, Ethan's Solarized was developed with a specific technology
in mind. The same is true for my case: I develop all my themes to work
with Emacs. This typically means that I can rely on more than 16
colours and each theme can have its own colour values.

For example, if I choose to apply a green background colour to the
"current match" in a search, its value is not the same green I would
use for, say, a "DONE" keyword in Org. Whereas in a terminal with 16
colours what you normally do is invert background and foreground
colour combinations, which results in things standing out more than
they need to (and becomes overwhelming when you want to use many such
elements).

Each of my themes relies on its own palette. If I tweak one theme's
colour values, I am only affecting that one theme. Because each theme
is its own design, I can make things similar by making them different.
For example, `modus-operandi-tinted` is a "yellow-red theme"
(simplifying greatly now) but its counterpart `modus-vivendi-tinted`
is a "blue-purple" theme. On paper, this description alone makes them
very different. But in terms of character, they both communicate a
similar feel, owning to considerations that follow from what I
mentioned above.

Additionally, each theme has its own colour mappings. This means that
I do not have to make every theme use, for example, blue for links.
In Emacs, I have greater control over what each "application" does, by
configuring the relevant faces. There still are constraints, as I
cannot for example decide which faces are applied to what portion of
text, but this is generally not a problem.

## Differences between my theme projects

> What's the difference between prot16 and your ef-themes? They seem
> to cover similar ideas, but it doesn't look like prot16 has been
> updated.

My older projects are for terminal emulators. It is why they were
inspired by Solarized. Terminals only have colour schemes though, not
themes. The designer cannot control how colours are mapped to objects,
so they have no means of enforcing thematic consistency.

A colour scheme sets the 16 values, but otherwise has no mappings for
things such as "here is an error message" or "this is a progress bar
and things are going well", or even to specify "I only want green and
blue here, but never magenta".

If a colour-coded message gets a style, it will typically be hardcoded
to red, green, or yellow. And if the colour scheme wants to support
users with blue-yellow colour deficiency, for example, it will have to
add a yellow value where the nominal red is (terminal colour 1 and
terminal colour 9). But doing so leads to weird issues because,
fundamentally, we are conflating colour names with colour mappings
(there may be an application that wants to use yellow text on a red
background, but now that actually becomes yellow on yellow, so you get
the idea).

In Emacs, a theme designer has more control. They can specify colour
values and write exactly how they are used by the relevant faces. For
example, we do not only define "blue" but also say "I want keywords in
programming modes to be blue".

The constraint in Emacs is which faces do packages define and how
exactly they apply them to elements of the display. A theme cannot,
for instance, dictate how many separate faces a programming mode will
add to its text. Furthermore, a theme cannot govern how generic faces,
like `font-lock-variable-use-face` are set by modes to do things they
are not supposed to do (for example, a mode specifies that face
because they like its green colour in the one theme the author is
using, but the thing being styled is not a variable and that specific
face does not produce an optimal result in its context).

Additionally, themes cannot determine the surrounding text. For
example, the Org export dispatcher has keys wrapped in square brackets
(and I sent a patch that was merged a long time ago to have decent
colours there by default when no theme is used). The bracketing is
something the theme cannot change, so it has to do strange things to
produce readable text because in an `[i]` indicator it is hard to
discern the `i` due to how the square brackets limit the perceived
boundaries---and you need to apply a highlight so that the user knows
which exporter they are picking. An `[ i ]` is somewhat easier in this
regard and a variation of it without the square brackets is even more
flexible as then the theme can apply all the colour and typography
attributes it needs.

Another constraint with Emacs is that we do not have real padding and
margins, the way those are understood in CSS. I think this is fine for
the majority of cases, but can be a problem sometimes such as when we
need to use a coloured background that spans a small portion of text
(e.g. with the Org dispatcher or with the style of rendered keys like
`<home>`).

The gist is that Emacs gives the theme designer more control and in a
more integrated way than a terminal+TUIs arrangement. This results in
a coherent experience. Terminal-centric environments cannot have that
to the same level because of disparate applications trying to form one
computing environment, each doing its own thing in the process. I
tried inter-application consistency in the terminal, discovered its
limitations, and is the single most important reason why I switched to
Emacs.

## Contrast and readability

> My understanding is that the contrast for Solarized wasn't good
> enough for you. I don't know if you have my issue specifically
> (<https://taonaw.com/2023/07/05/halatoion-and-accessiblity.html>),
> but I'm curious: don't you get halation as well? Doesn't it bother
> you, especially if you switch from a dark theme to something
> lighter? (For example, you read something with a dark background and
> light text, then switch to a page that has a light background and
> dark text)?

We measure contrast between colours to have an imperfect approximation
of what might work in the average scenario. Though readability is
influenced by many more factors beyond the applicable colours.
Consider the environmental light and the brightness of the monitor. In
addition, check the font size and even the font family you are using.
Many font families can produce a halo effect at different sizes,
regardless of colour combinations.

Have an extra source of light beside the monitor's. If you do not, the
eye focuses on one spot, which is more tiresome. And always adjust the
screen brightness to not be too bright or too dim relative to the
environment.

As for fonts, you may benefit from a design that has more open shapes.
The exact size is also a factor.

For example, I have a font called [Aporetic](https://github.com/protesilaos/aporetic)
that is derived from [Iosevka](https://github.com/be5invis/Iosevka).
What motivated me to do my own thing is the original monospaced `m` of
Iosevka (maybe it is changed now), which blurred into a box at small
point sizes and was thus not nice to read.

The Hack font I used to use (and which I had also modified), had
similar issues. The Ubuntu Mono font that Ubuntu and derivative Linux
distributions rely on, can have a `g` with a very short descender at
certain point sizes, as well as a dotted zero where the dot is off
centre.

I can go on to great details but you get the idea: you have to check
all the variables and find what works for you. I am confident in
stating that this is never a theme-specific issue.

As for switching between applications, these days most desktop
environments have a concept of a light/dark preference, which many
websites also follow. For example, GNOME has a menu from where you can
toggle the "Dark Style" on/off.

The specific problem you will encounter with Solarized is that
practically no other application or website uses it or similar
colours. So either you will have to set Solarized everywhere you can,
or you will be switching from the yellowish/blueish background to
white/black, with whatever context-switching friction that may have.

## Thoughts on wallpapers

> This is an extra one I'm curious about: what are your thoughts about
> wallpapers? I noticed, the few times I worked with you and on video,
> that usually you have a natural scene. Have you ever switched to
> something else (like a drawing, perhaps an artwork, or maybe even a
> technical scheme)?

I have used wallpapers of all sorts and find that pictures I take of
landscapes or flowers are the best for me. The reason is that they
avoid exaggerations. Many pictures that are used for wallpapers are
designed to show something in a more pronounced way and are thus
calling for your attention. That is fine when the object of attention
is the art piece. But when I am doing work on the computer, I do not
want other elements to be competing for attention with whatever it is
I am working on.

"Avoiding exaggerations" is a principle that informs my lifestyle. It
also is why I prefer to live in the mountains and to spend plenty of
time outdoors. The mountains do not have the intense stimuli a city
has. In a city there are bright lights everywhere, a faster pace to
motions, and sharper noises all around. Whereas the mountains are
subtle, even though they are full of life.

People who go on a retreat say "I went to this holy place and found
peace", when in reality what likely happened is that they reduced
their exposure to exaggerated stimuli and were thus able to lower
their baseline intensity for a little while.

Because we are also conditioned by our habits, we do not realise just
how much we have gotten used to things in our milieu, even when those
are not benign to us.

People want magical solutions when the basics will suffice. We are
heavily influenced by our environment and the elements we are exposed
to. A stressful place will increase our stress levels. A harmonious
place will make us more harmonious. Inconsiderate food choices will
disturb us long-term, a poor work-life balance will harm us, and so
on.

People think they can brute force their way into calmness or focus by
means of "truly believing" in their project. This is a fool's errand.
Changing the scenery and relevant lifestyle will be far more effective
than whatever willpower one thinks they can muster on demand.
