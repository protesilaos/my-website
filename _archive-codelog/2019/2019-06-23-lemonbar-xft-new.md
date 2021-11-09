---
title: 'Compile Lemonbar Xft on Debian 10 Buster'
excerpt: 'How to get the fork of lemonbar that supports fontconfig on Debian 10 Buster.'
---

**UPDATE 2019-06-24.**  I created [my own
fork](https://gitlab.com/protesilaos/lemonbar-xft) for this very
purpose.  See [how I forked
lemonbar-xft](https://protesilaos.com/codelog/2019-06-24-lemonbar-xft-howto/).

* * *

Lemonbar is a lightweight program that draws a panel on the viewport.
The information on display is whatever is pipped to it.

## The problem: upstream only works with bitmap fonts

Upstream `lemonbar` lacks support for proportional fonts and the
corresponding interface with `fontconfig`.

This is a disappointment because fixed/bitmap typefaces leave much to be
desired:

* support for Greek glyphs is limited to a handful of typefaces such as
  `terminus`, `fixed`, `times`;
* the quality of bold variants can be lower than the regular ones;
* only specific point sizes work well;
* colours are less distinct on a light background.

## The solution: compile lemonbar-xft (my fork)

There is a popular alternative by GitHub user _krypt-n_ that provides
Xft support, but seems to [have been
discontinued](https://github.com/krypt-n/bar/pull/37#issuecomment-473265449).
So I have decided to pick it up and maintain it.  To make sure it syncs
with upstream's `master` branch and builds correctly.

So let us get going.  First we need to get the build dependencies for
Debian 10 Buster:

	sudo apt install build-essential libx11-dev libxft-dev libx11-xcb-dev libxcb-randr0-dev libxcb-xinerama0-dev

Now clone my `lemonbar-xft` fork:

	git clone https://gitlab.com/protesilaos/lemonbar-xft.git

Switch to that directory:

	cd lemonbar-xft

Compile it and install it system-wide:

	make
	sudo make install

Or if you are like me, compile it just for your current user, by placing
the artifacts in your home directory.  This assumes you have configured
`$HOME/bin` to be part of `PATH`.

	make PREFIX="$HOME" install

Uninstalling it requires the same steps, except you just pass the
`uninstall` argument.

Done!  Now `lemonbar` can use any typeface supported by `fontconfig`.
Make sure you `apt remove lemonbar` in case you had the upstream
package.

## Closing thoughts

I generally stick to the packages provided by Debian.  This is an
exception because:

1. Lemonbar is developed at a slow pace, so I can afford to inspect all
   commits.
2. It is a small program that compiles in virtually no time.  I am
   fairly confident that combined with the above, the compilation
   process will not become more complex in the foreseeable future.
3. Upstream does not offer any good reason why it does not consider Xft
   support (see [#188](https://github.com/LemonBoy/bar/issues/188)).
   This leads me to believe that there will be no progress on this
   front, at least not with how things currently stand.

The above granted, I am still not sure whether I will make changes to my
[custom desktop session](https://gitlab.com/protesilaos/dotfiles), which
still uses upstream `lemonbar`.  I might just add a reference in my
[Prot's Dots For Debian](https://protesilaos.com/pdfd/) for users that
want to follow the instruction documented herein.
