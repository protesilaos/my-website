---
title: "Where to start with mechanical keyboards"
excerpt: "My opinion on what you need to know to get started with mechanical keyboards."
---

Mechanical keyboards are tools that can improve the comfort of
computer work: to have a setup that allows for sustainable long-term
use. Two years ago, I was suffering from RSI. Switching to a split
mechanical keyboard while also taking care of all other variables in
my office setup helped me recover from the injury and remain highly
productive. Mechanical keyboards are expensive if you think of them as
mere keyboards, though they actually are cheap if you consider that
they can save you from visiting doctors too frequently.

To me, the most important quality of a keyboard is how easy it is to
use for a single typing session of, say, 30 minutes to an hour (there
should be a break afterwards). At the physical level, this refers to
its layout, the feel of the key switches, and the shape of the key
caps. Then there are other factors, which I consider secondary but
still important, such as the sound profile.

Acoustics contribute to "comfort", if we assume that a pleasantly
sounding board ultimately does not distract you, while something you
actively dislike will keep disturbing you.

There is no one answer on what to do, though I have arrived at some
crystallised thoughts that I describe below.

## Use one-shot modifiers or home-row modifiers

Before you even check a custom keyboard, research how you can use
either your operating system or dedicated software to get "one-shot
modifiers" (or "sticky modifiers") or "home-row modifiers" (alias
"home-row mods").

These are two different styles of configuration for accessing modifier
keys like `Ctrl` and `Shift`:

- The one-shot modifier scheme allows you to tap on a modifier and
  then hit a key to register a modifier+key input. For example, to
  input `Ctrl-c`, you press and release `Ctrl` and then type `c`.
  Modifiers can still be held down to perform their normal function,
  though the whole point of this approach is to ease the stress on any
  one finger by reducing how much each key needs to be held down.
- The home-row modifiers place the modifier keys on the home row
  (where `f` and `j` are on a Qwerty layout) under the existing keys
  and make them available as a press-and-hold actions. For example,
  the `j` key inputs its corresponding character on tap but acts as a
  `Ctrl` key when held down. This arrangement optimises for
  ease-of-reach, as the modifiers are where you rest your fingers,
  instead of being placed in the periphery of the board.

I personally prefer one-shot modifiers because (i) I prefer not to
press and hold too frequently, thus overworking specific fingers,
while (ii) I cannot get used to the more sensitive timing of home-row
modifiers.

As noted, you do not need a mechanical keyboard to set those up: your
existing hardware is enough. Though you can still benefit from a
custom keyboard, such as by placing all the modifiers on a thumb
cluster while still relying on one-shot modifiers, which is what I do.

## Use modifiers on both sides of the keyboard

No matter what you do, get used to activating a modifier with the
opposite hand to the one that inputs the desired character. For
example, `Ctrl-c` is the right `Ctrl` key and then `c` with the left
hand. On a custom mechanical keyboard you have the advantage of moving
the modifiers exactly where you need them to be. Though even on the
most generic board with one-shot modifiers, it is fairly easy to tap
any modifier key to get the job done.

Emacs users, for instance, are well aware of the tweak that makes the
`Caps Lock` a `Ctrl` key. While this is a good place for the left hand
`Ctrl` modifier, it does not alter the fact that one-handed `Ctrl-c`
is an awkward motion. More so if you get into the common Emacs key
bindings of `C-x C-s` and `C-x C-f`, among many others that are on the
left side of the Qwerty layout.

Same idea for all modifier keys: make an active effort to distribute
the workload.

Since I mentioned Emacs, I find that regular keyboards benefit not
only from one-shot modifiers but also from this arrangement around the
spacebar:

```
Super Alt Ctrl Space Ctrl Alt Super Fn
```

This way, the more frequently used `Ctrl` modifier is under the thumbs
and can be reached without curling those fingers too much, making it
easier to type all those control character sequences.

## More keys are easier than fewer keys

As you search around for mechanical keyboards, you will find a wide
variety of boards with a small number of keys. While those can be as
productive as a full sized board, they require heavier use of "layers"
to access all the key codes.

A layer is the functional equivalent of the `Shift` key. When `Shift`
is active, for example, the key `1` registers `!`. In the same spirit,
we can have another physical key, e.g. the spacebar, function as a
layer activation switch when it is held down, so that, say, `j`
becomes an arrow motion.

Using layers is something you can get used to, but (i) it has a
learning curve and (ii) too many layers may still be uncomfortable if
you are constantly pressing and holding a key to input certain
frequently needed characters.

A good compromise is a keyboard in the 50% to 65% range. This
percentage refers to the number of keys relative to a full sized
layout. Those smaller offerings do not have a number pad, the
navigation cluster (`Home`, `PgUp`, etc.), and function keys (e.g.
`F1`), depending on their exact size. The idea is that you get access
to the most commonly needed key codes as dedicated physical keys,
while the rest is to be done with the use of layers.

As an example, my keyboard (the Iris Revision 8 by Keebio that I got
as a gift from "Andreas") does not have a navigation cluster. I have
defined the `space` and `return` keys as layer toggles when held, such
that `h`, `j`, `k`, `l` correspond to the arrow keys `left`, `down`,
`up`, and `right`, respectively. Similarly, `y`, `u`, `i`, and `o`
perform the bigger analogous motions of `home`, `pgdn`, `pgup`, and
`end`. Because space and enter are directly under my thumbs, it is
very easy for me to move around when I need to.

[ Here is my complete configuration for the Iris:
  <https://github.com/protesilaos/qmk/tree/master/keyboards/keebio/iris/keymaps/prot>. ]

Even if you plan to experiment with fewer keys, it is easier to just
disable, say, the number row than work at the outset without it.

## Opt for a mainstream switch first

Once you spend enough time researching mechanical keyboards, you will
know that there are many factors that contribute to the feel of a key
switch, beside their classification as "linear", "tactile", and
"clicky". Those involve the material of its housing and stem, how long
the pole and the spring are, and the amount of lubrication it has.
Each configuration results in a different typing feedback and sound
profile.

You can explore those options at your own pace, if you want, though I
strongly encourage you to not overthink this step. Pick whichever
mainstream switch the keyboard vendor is giving you. When in doubt,
ask for their baseline "tactile" switch. This is a kind of switch with
a bumpy typing feel, such that you are confident you pressed a key.

In terms of sound profile, the only real consideration for a newcomer
is whether the switch is silent or not. Technically, no mechanical
switch is ever "silent" due to the mechanics involved, though they are
quiet enough that you could use them in an office setup without
trouble.

If you work from home or in a place where you could disturb others,
pick a silent tactile switch and then check what else you need to
dampen the sound of your board. Rely on a deskmat, for example, and
consider adding some foam to the inside of your keyboard's housing.

## Pick Cherry profile key caps

As with everything in this field, there is a ton of options for the
kind of caps you install on top of your switches. Again, I suggest you
stick to the mainstream, even though other designs have their merits
and fervent proponents.

The "Cherry" profile keycaps, in reference to the company that
pioneered them, strike a good balance between all the factors that go
into a key cap's design. They are typically thick enough to not feel
brittle, have a decent surface area while still leaving sufficient
space between keys to make it easier to type accurately, are short but
still have varying height to make the keys further away from the home
row easier to reach, and have a broad cylindrical top to not
aggressively punish off-centre key presses.

Owning to its popularity, the Cherry profile offers the widest range
of options for colourways to choose from, going from classical
monotonous styles to flamboyant ones. And if you ever want to upgrade
on higher quality materials, chances are you will find Cherry as the
number one choice among premium offerings.

## Make sure your keyboard is customisable

This typically means that it is powered by QMK. This is an open source
project for keyboard firmware. It allows you to modify how your board
works. In the most common case, you will have the freedom to map key
codes to physical keys and implement your own layers. Then there is
the whole setup with the modifiers, as I explained earlier, where you
set the timing of what counts as "one-shot" or how long does a press
take to qualify as a "hold" action instead of a "tap". These sort of
technicalities will ultimately affect how you type. You will find what
works best for you through trial and error.

## Whatever you do, avoid FOMO

The Fear Of Missing Out can be quite high when there are so many
competing yet seemingly equally viable configurations to work towards.
Understand that there are diminishing returns or even negative returns
to scale. There is no such thing as the perfect setup. Find one that
is comfortable enough and has an acceptable sound profile. In other
words, tend towards minimum viable usability, which is not a difficult
target, instead of maximal gratification, which forever remains an
elusive goal.

Good luck!
