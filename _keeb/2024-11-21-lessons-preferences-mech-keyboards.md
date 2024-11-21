---
title: "What I have learnt about my mechanical keyboard preferences"
excerpt: "An overview of what I have figured out about mechanical keyboards and my preferences."
---

Anyone who has put some time in learning about mechanical keyboards
understands how deep the rabbit hole is. While all the relevant
magnitudes are measurable, the complexity of their interactions is
such that one person's optimal setup is another's bane. Against this
backdrop, I think it is futile to search for the one keyboard to rule
them all. This quest only guarantees a considerable financial
investment in endeavours which, at best, constitute lateral steps on
the path towards optimality.

My approach is thus that of the pragmatist: if I can get something
that is "good enough", I can forget about the keyboard and focus on
other tasks. I have been doing as much for a long time, having
recovered almost completely from Repetitive Strain Injury (RSI).
Though I have had my fair share of relatively small experiments along
the way.

I am sharing what I have learnt to (i) keep a record of my progress
hitherto and (ii) provide a resource for others who are interested in
another user's perspective on the matter.

## One-shot keys are my favourite feature

Perhaps the biggest improvement to my setup is the firmware level
(QMK) feature known as "one-shot keys". I use this for the modifiers
and some layer activation keys and, as such, call them "one-shot
modifiers", else OSM. With OSM configured, I type a modifier and then
within a configurable time window any key press is registered as
`Mod+Key`. I no longer put any pressure on thumbs or pinkies by
forcing them to hold down keys for too long over the course of an
extended typing session.

Another neat feature is the "modifier lock". I double tap a modifier
(the exact number of taps is configurable) to make it sticky. This
means that a double tap on `Shift` followed by `1`, `2`, and `3` will
produce `!@#`. A single tap on the locked modifier undoes the effect.
This makes it extra nice to input all capital letters or those long
key combinations in Emacs like `C-x C-k C-p` (bonus points if you know
what this does without looking it up).

I tried the popular "home-row modifiers" option of QMK but could not
make it work in a manner that is consistent with my typing. Whether my
technique is not compatible with it or the setup is inherently limited
is beside the point. What matters is that I cannot consistently type
prose when some key combinations mistrigger a modifier. And I do not
like to write prose by going back and forth in editing it---I prefer
the continuous writing approach, followed by a final spell check (also
why I activate the spell checker on demand).

The keyboard I am using is the Iris by Keebio (thanks to "Andreas" for
the gift! (not affiliated with that company, by the way)). It has a
thumb cluster where I place the modifiers I use the most. Check the
implementation details here:
<https://github.com/protesilaos/qmk/tree/master/keyboards/keebio/iris/keymaps/prot>.
I think that with OSM I would be content to even use a traditional
keyboard for a while without fear of suffering a relapse in my RSI.
This is because I would not need to twist my wrists to press and hold
any modifier. Make no mistake though: an ergonomic keyboard is the
superior option, ceteris paribus.

## Linear switches are my favourites

Taken in a vacuum, I find tactile switches very fun to type on. The
feedback they provide is unmistakable: it does not fail to capture my
attention. In a real-world scenario though, this quality is a major
weakness. When I am typing out a wall of text such as this one, I do
not need any extra indication that characters are printed on the
screen. I see them and can still hear the keyboard (no mechanical
keyboard is completely silent). Furthermore, the tactile bump is
considerably higher than the actuation point of the switch, meaning
that over the course of a prolonged typing session I will be exerting
more effort than necessary for a feature that has no added value to
me.

The Iris keyboard I got shipped with the Durock Shrimp switches
(Durock Shrimp Silent T1). I picked them because I thought I liked
this type of switch more than their linear or clicky counterparts. It
turns out that I do not appreciate the added weight to each key press.
Consider this: if you are comfortable typing on keys that actuate at
50gf, with tactiles you will be applying force that is closer to 60g.
You need to look at the peak tactile point to get a better sense of
how heavy the switches are: the actuation point will mislead you. (And
if the tactile point is too close to the actuation point you might as
well go directly for linears as the bump will be too small.)

When I started out with linear switches, I felt like typing against a
pillow. I could not tell by touch alone if my key presses were being
registered. There was no feedback other than an abrupt bottom out
event. It was disorienting. I did give them a fair chance though,
which helped me improve my technique as well become more familiar with
the linear feedback in general. It also made me realise how the in
vitro perception of a switch is distinct from its in vivo performance.
When I was trying the linear feedback without actually doing any work,
I was paying too close attention to where exactly the actuation point
is. In practice, this is not how it unfolds: I am writing something,
the fingers move around fairly quickly, and I am not focused on the
feel of each key press.

## Not all linears are the same

There is the obvious metric of weight as well as other qualities like
sound profile and smoothness, but [what I realised
recently](https://protesilaos.com/keeb/2024-11-14-gateron-yellow-mechanical-key-switches/)
is that the real deal for me is the delta between the actuation point
and the bottom out force. It has a noticeable effect on typing feel
while writing. A fairly "horizontal" force curve like that of the
Keychron K Pro Silver switches slows me down while writing at speed
because the keys do not have anything to prevent me from bottoming out
hard and losing momentum. By contrast, a more "diagonal" force curve
provides extra resistance at the bottom of the spring. It makes it
easier to notice you are past the actuation point and it also results
in both a cushioned bottoming out as well as a stronger rebound event.

As such, when buying mechanical key switches, always pay close
attention to the data. You want to get an accurate force curve or, at
least, to understand how flat or steep that would look like. For my
use-case, the flatter profile of the Keychron Silvers was appropriate
when my RSI was at its worst state. Now I am all for a more pronounced
slope to the force curve, like that of the Gateron G Pro 3.0 Yellow
switches. There is no one-size-fits-all. What matters is to understand
what your needs are.

## Cherry keycaps are peerless

I tried low profile keys, the MT3 keycap set, OEM, and the MOA profile
(check my [Final thoughts on MOA keycaps and spherical tops in
general](https://protesilaos.com/keeb/2024-10-13-final-thoughts-moa-spherical-tops/)).
What practice has shown me is that Cherry are the best for me:

- The cylindrical tops are forgiving to off-centre key presses.
- The surface area of the cap tops is not too large, which balances
  out the above point when it comes to getting a feel of where you are
  on the keyboard.
- The cylindrical tops do not cradle the fingers and thus let them
  slide around easier.
- The sculptured or stepped heights between the rows further improve
  the sense of orientation through touch. For my Iris keyboard in
  particular, they also allow me to place taller keys at the furthest
  and closest point in the thumb cluster, thus reducing the amount of
  stretching or curling involved.

I admit that I was sceptical about the popularity of the Cherry
profile. I was thinking that maybe the reason they are ubiquitous is
because of market hype or some trendy fashion statement in picking the
premium designs manufactured by GMK (the company that has the original
Cherry company moulds). While I still have no interest in paying a
small fortune for keycaps, I do recognise that the Cherry profile as
such (which you can find for cheap everywhere), is the real deal and a
testament to engineering excellence.

Looking at Keychron's wide range of options to get a sense of some
market dynamics, they seem to favour spherical tops (whenever they are
not selling a board with Cherry caps). Their OSA and KSA sets are
proof of that, with the latter looking very similar to MT3. If I was
buying a keyboard from them right now, I would be opting for the
barebones option and then picking up one of their Cherry sets.

For another comparison from a well-known manufacturer, Tai-Hao offers
two types of sculptured profiles: OEM, which is basically Cherry with
minor tweaks (I guess historically done to avoid patent issues?), and
Cubic which have the OEM height but a bigger surface area at the top.
If I had to make a choice between those two, it would be in favour of
OEM: the smaller surface area must be understood holistically with the
way cylindrical tops do not cradle the fingers, as I noted above.

Between Cherry and OEM, I cannot really tell the difference while
typing. It all depends on the build quality of the specific set. What
I am using right now is the Keychron Cherry Dolch Red set that a
keyboard enthusiast who prefers to remain anonymous gave me as a gift.
It is produced from PBT and is done using the double-shot technique.
On this note, I do not care about PBT versus ABS materials. The MT3
set I have is made out of ABS and is very nice to work with, my
dislike for the profile itself notwithstanding.

## Determine what you are working towards

All my experiments with the keyboard are done to bring me closer to a
comfortable typing experience. I write a lot and thus need a setup
that empowers me accordingly. Understanding the "why" we are doing
something is a precondition for refining it with intent. Otherwise, it
is easy to get lost in the sea of options and end up paying exorbitant
fees on gimmicks.

Market prices are a good indicator in this regard: a 30 EUR Cherry
profile keycap set will deliver almost the same experience as those
extra costly GMK designs. (More than 100 EUR for a base set!? Come on
mate!) While you are still learning about your peculiar requirements,
refrain from all those products that promise to deliver top-class
quality: you might not like it and it is questionable how much you
need it, anyway.

Unless you are specifically keen on tinkering with mechanical
keyboards for the sake of exploration, consider this a trap: some
experimentation is necessary to figure out what you need, but when it
becomes a distraction from your duties you know you are overdoing it.
Same principle if you are hoarding keyboards with the rationalisation
that you are keeping them in your daily rotation. As such, try to
maintain a pragmatic outlook in settling for a build that is "good
enough" and, perhaps, committing to make incremental refinements to it
over the longer-term.
