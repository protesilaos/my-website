---
title: "Re: Emacs and keyboard ergonomics"
excerpt: "I comment on keyboard ergonomics and Emacs key bindings."
---

This is an excerpt from an exchange that I am reproducing with
permission from my correspondent. I am not sharing their contact
details.

* * *

> As I understand, you're using the regular keybindings in emacs. I'm
> trying to transition away from the vim way of editing text and was
> wondering if you're using a more ergonomic approach for your text
> editing needs. I remember you were using some ergo split keyboards
> for that?

Indeed, I have a split mechanical keyboard (a gift from a person who
identifies as "Andreas"). It is the Iris revision 8 by Keebio. I also
have a regular full-sized keyboard (a gift from Arialdo Martini),
which is the Keychron K5.

[ Keyboard-related articles of mine: <https://protesilaos.com/keeb/>. ]

The split keyboard is nice, though it is not a magical solution. Even
with a regular form factor keyboard, I can work with the standard
Emacs keys without any problem. What helps me the most is to configure
one-shot modifiers. This means that I can tap (press once, then
release) a modifier key, then tap a regular key to register it as a
modifier+key event. For example, `C-x` is this: tap `Ctrl`, then tap
`x`. `Shift` tapping is especially nice for prose, by the way, and
eases the pressure on the otherwise weak pinky. The time window for
registering a one-shot modifier is configurable.

The other useful tweak for a regular keyboard is to rearrange the
layout of the modifiers. I prefer this order:

```
Super Alt Ctrl Space Ctrl Alt Super
```

[ If there is a `Menu` key, move it to the right corner and consider
  assigning it to the Compose key if you are on Linux. ]

Now `Ctrl` is under the thumb, which is especially nice for Emacs.
`Alt` and `Super` can be swapped, if you use `Super` more heavily
(e.g. with a tiling window manager). But the important part is to keep
`Ctrl` close to the `Space` key.

Whatever you do though, remember to use both sets of modifiers. For
example, `C-x` involves the right hand for `Ctrl` and the left hand
for `x`. `C-p` needs the left hand for `Ctrl` and the right hand for
`p`. This way you distribute the burden so no one side is overworked
(and, of course, you take regular breaks from typing altogether).

Lots of Emacs users will rebind `Caps Lock` to `Ctrl`. While this is
fine in its own right, it tends to embed bad habits, such as with
using only the left hand to register the very common `C-a`, `C-e`,
`C-d`, `C-f`, `C-s`, `C-r`, `C-w`, `C-g`, `C-z`, `C-x`, `C-c`, `C-v`.
Exclusive left-handed use involves awkward twisting of the muscles
which will probably hurt you over time. Plus, the left pinky is forced
to press and hold a key while being stretched---looks bad. Again,
distribute the load.

The final part that makes everything easier is to configure a "layer"
key. When you press and hold this key, other keys register a different
input than normal. For example, `Caps Lock` can be the layer key,
which then makes `h`, `j`, `k`, `l` act as arrow keys. Same idea for
mapping `Home`, `PgDn`, `PgUp`, `End` someplace that makes sense (mine
are on `y`, `u`, `i`, `o`). I prefer to have `Space` as that layer
key: it only is a layer when I press and hold it, otherwise it
performs the ordinary function of the `Space` key.

It is okay to press and hold `Space` because you do it with your
relatively strong thumbs. Better have it this way than pressing and
holding with the pinkies.

All this can be achieved with software such as `kanata`. A custom
keyboard with QMK firmware can get the same configuration embedded
directly in the keyboard (so it works without any special program
running on the computer). Kanata will be the cheaper solution and is
probably better overall if you consider that it can apply to a
laptop's keyboard.

A mistake in all this is to think that an expensive keyboard is
inherently more ergonomic. If you keep curling, overextending, or
anyhow stressing your muscles the injuries will occur regardless. A
new keyboard can help if you use it as an opportunity to retrain your
muscle memory.

Custom keyboards have potential advantages in terms of comfort because
you can change the switches and keycaps that they use. For example,
you can pick a lighter or heavier switch to match your typing
technique. Then you can combine it with a shallower or steeper keycap
profile to get the most out of that setup. There is no right or wrong
here. It is a matter of optimising on top of the strong fundamentals
that I outlined above.

As for `evil-mode` in Emacs, I think it is a good solution overall.
You do, however, need to install the `evil-collection` package and
probably also configure lots of other key bindings to get exactly what
you want. There are other packages that give you modal editing, though
I have only ever used `evil-mode` in earnest: it is fine.

That granted, I find that I do not like modal editing in general. It
is especially inconvenient for me when I write at length (which I do a
lot) because I tend to produce a wall of text in one go. Having a
modal interface gives me no advantage in this common scenario. I also
doubt it ever gave me the edge while programming. The bottleneck is
how quickly and clearly I can think, not how fast I can edit lines of
text (though, yes, Vim's paradigm is powerful).

Consider then the overall comfort of your setup. Both in terms of the
ergonomics of hardware but also how much effort it takes to maintain
your Emacs configuration. The standard approach to key bindings gives
you something that "just works" with practically every package you
install. It may feel awkward in the beginning if you are coming from
the Vim keys, but will be the most robust solution long-term from the
perspective of maintainability.
