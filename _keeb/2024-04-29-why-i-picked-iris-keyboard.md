---
title: "Why I picked the Iris keyboard for my RSI"
excerpt: "I document my reasoning for selecting the Iris keyboard from keebio to improve my Repetitive Strain Injury."
---

In a recent video, I talked about my [RSI and keyboard
ergonomics](https://protesilaos.com/news/2024-04-11-my-rsi-keyboard-ergonomics/).
There I showed the split keyboard I have been using, called the "Iris"
by keebio (thanks again to "Andreas" for making this possible). The
reasoning behind my choice may be of interest to others, so I am
documenting it herein.

I am not affiliated with any of the entities I mention and am not
providing any related links for this reason.

## Requirements

I wanted a keyboard that consisted of two separate parts, so that I
could space them apart to keep my arm and wrist aligned on each hand.

I thought that a columnar stagger (explained in the aforementioned
video) would benefit me, as its combination with the split keyboard
enforces benign typing patterns like typing `b` with the left index,
not the right one (I use Qwerty, by the way).

The combined profile of the keys---cap and switch---should not be low.
I find those harder to use, as I bottom out more easily.

Lastly, I wanted my keyboard to use QMK firmware, because it is a
well-established open-source project. Programming the keyboard to do
what you want is, in my opinion, the irreducible factor of this
endeavour.

## Why not buy a more established option like the ZSA Moonlander or Dygma Defy?

The ZSA Moonlander looks promising, though I got the impression that
its thumb cluster would not work for me. I was concerned that those
bespoke thumb keys would be hard to replace, should I ever want to try
a different set of keycaps.

I also found its tenting setup strange with how it bends the thumb
cluster (tenting is when we raise the inner side of the keyboard, or
of each split in this case, to keep our arms closer to a more natural
position---we avoid "pronation").

As for other reasons not to opt for the Moonlander, its cost would
have been much higher than that of the Iris. Plus, I did not like its
appearance.

Another highly marketed option, based on my research, is the Dygma
Defy. It too has its own unique thumb keys, which may work great
though do entail limited compatibility. And it costs a small fortune
(perhaps for very good reasons---not judging).

## How about the MoErgo Glove80 or the Kinesis Advantage360?

Those keyboards are designed to create a well whose deepest point is
somewhere along the home row. Their goal is to make the upper and
lower rows easier to reach. I do not know if this is necessarily more
ergonomic, because it must also depend on the length of the fingers,
no? Due to this uncertainty, I did not want to take any risks.

Other than that, the Glove80 uses low-profile switches, which runs
counter to my requirements. While the Advantage360 has a fixed length
which has a built-in assumption about how far my hands are spaced out.
I did not even check the rest because of these.

## Why not build a keyboard for cheap using a kit?

A popular option among enthusiasts is to buy a kit and piece together
their new keyboard. This is something I will most probably do in the
future, though I did not want to take any chances at such an early
stage because of my injury. Any delay in easing my pain would make my
condition worse. I can always tinker with keyboard kits in the future.

In theory, the Do-It-Yourself route pushes the nominal price down as
you assume the assembly costs, paying opportunity cost for the time
spent tinkering. Though this will likely not be true for rookies, as
they will need to experiment a bit, breaking---and paying for---stuff
in the process, before they eventually get the hang of it.

Put differently, my understanding is that the argument in favour of
DIY is not chiefly financial: it rather is about the customisation
options it opens up and the feeling of accomplishment it engenders,
both of which appeal to me in principle.

## Number of keys and their firmware prerequisites

Many enthusiasts try to reduce the number of keys they are using to
concentrate everything around the home row. They do this by defining
more layers, using home-row modifiers, and combinations that translate
into other keys like a simultaneous press of `j` and `k` to send
`Esc`. As such, they do not need a number row or even a thumb cluster
with modifiers. It is an interesting approach that I might explore in
earnest at a later point.

I think going full reductionist without prior experience is a mistake.
It is better to have more keys for experimentation and to take things
slowly. The split and the columnar layout are already a huge change:
adding too many of those all at once will feel overwhelming.

Having more keys gives you flexibility. You can retain your muscle
memory and operate within your comfort zone. Once you are prepared to
reduce the number of effective keys, you simply set up QMK to disable
the extra keys on your board. If that works for you, then you know
what you are buying next, while blithely working with your new layout.
Otherwise you revert back to a known working setup.

That aside, the ultra-minimalist design relies on a well thought out
implementation of the relevant firmware features. Without home-row
modifiers and/or key combinations, it will be hard to use, if not
outright unusable.

As someone who writes A LOT, I am not a fan of the home-row modifiers
arrangement (where keys on the home row act as modifiers when held,
but otherwise send their usual code when tapped): it is error prone as
I keep misfiring no matter the tweaks I make to the firmware.
Compounding the problem is the fact that I use Emacs for all my
typing, so I might accidentally trigger some command that deletes too
much text, which is annoying.

For the number row, I do not share the concern of this being
troublesome to reach, given the columnar stagger. Though, yes, those
keys are harder to type correctly with a row stagger.

As for key combinations, I suspect they will have the same issues as
the home-row modifiers and I will keep mistriggering them. Well,
unless we are talking about some keys that are too far apart from each
other, in which case the combo will be more accurate but less
convenient to access.

My concern is with complexity. While we can add a zillion layers and
combinations with highly sophisticated interactions, I find it simpler
to just stretch my finger a tiny bit. Come on! Thumb clusters are also
easy to work with, but more on that below.

## The thumb cluster of the Iris and one-shot modifiers

If you look at the Iris, you will notice that the thumb clusters have
a shape like this on the left split:

```
                        ┼───4───┬
 ┬────────┬────────┬────┴───┬───┘
 └───1────┴───2────┴───3────┘
 ```

And its flipped version on the right...

The uppermost key, which I label as `4`, may be hard to press. I
personally do not have an issue here because:

- I use taller caps for the keys at either end of the cluster (`1` and
  `4`). This makes it easier to use my thumb without twisting it.

- I have set up one-shot modifiers, meaning that I do not have to
  press and hold those keys to do what I want.

One-shot keys are a QMK feature that allows us to register a "hold"
action for the next key. Instead of holding down `Shift` and then
typing a letter, we tap `Shift` and then the letter. The interval
between the two key presses is configurable: after that the one-shot
key expires (`ESC` produces the same effect on demand).

What is also configurable with QMK are one-shot keys that become
"sticky". This means that they pass their action to all following key
presses until we manually abort them. Think about typing the word
"QMK" by holding down `Shift`: you must press and hold the modifier
and then type the three letters. With sticky modifiers, you activate
the modifier, type `Q`, `M`, `K`, and then deactivate the modifier.

This "shift lock", "control lock", etc. is easy to access via a
multi-tap of the one-shot key. What counts as "multi" is configurable:
I set it to a double tap. Thus, I double tap `Shift` and then input
the longer sequence of shifted key codes: no pressure for the thumb.

These work in combinations as well, such as if we want to input `M-^`
in Emacs a few times, where we lock both `Shift` and `Alt` and then
type `6`. Tap those modifiers once to cancel their stickiness.

For the technicalities, check my QMK files:
<https://github.com/protesilaos/qmk/tree/master/keyboards/keebio/iris/keymaps/prot>.

## The simple tenting setup of the Iris

What I am using right now is a middle layer that has holes where we
can insert regular nuts and bolts. We place them in it and---voilá!---
there is the tenting angle we desire. It is simple and effective. I
have been typing this way for weeks and feel much better than before.

## What about a nice case?

Keebio is selling an aluminium case for the Iris, though (i) it is
expensive and (ii) it is not a requirement of mine. I guess the casing
will change the keyboard's acoustics, ceteris paribus, and will add
an extra "wow" factor to its looks. These are marginal changes, which
do not justify the price. The current sound profile is fine to me
as-is, while I am not going anywhere with the keyboard to be concerned
about its appearance: it looks good to me, which is all that matters.

## Is this the "end game"?

I think so, yes, even though I know this is a bold claim for a
newcomer. I did extensive research before making my decision. I knew
what my needs were, had a clear goal in mind, and decided accordingly
without hesitation. This is how I operate and do not renege on my
decisions.

The few tweaks I still want to make pertain to inconsequential
experiments with QMK (to refine RGB lighting feedback, mostly for
fun). I do not want to implement any other changes to the keyboard
itself, nor to further experiment with alternative switches or
keycaps. The Iris works for me and I treat it as a tool that empowers
me to do what I actually care about: to write at length.

If I ever choose to play around with keyboards, such as to build one
by using a kit, that will be for the recreational value of it, not out
of a pressing need for reform.
