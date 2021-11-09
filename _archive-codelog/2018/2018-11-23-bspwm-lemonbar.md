---
title: 'My BSPWM now uses Lemonbar'
subtitle: 'A bespoke panel for my desktop session'
excerpt: 'I switched to Lemonbar: it is in the Debian repos and offered me a chance to learn how to dynamically display information about my system.'
---
I am now using Lemonbar to draw a panel for my custom working
environment.  I was running [Polybar](https://github.com/jaagr/polybar)
before.  The reasons for the switch are documented herein.

In practice, this means that the `master` branch of [my
dotfiles](https://gitlab.com/protesilaos/dotfiles) is considered
unstable until further notice (see the README for demos with the new
panel).

## Stick with the Debian repos

To get Lemonbar execute:

    sudo apt install lemonbar

Compare that to Polybar, which is not available in the official
repositories.  One has to compile it from source.  A complication that
can lead to inconveniences down the road.  What if in the near future I
would also have to hunt down some of its new dependencies?  And what if
Debian Stable, which I intend to [switch to once Buster is
out](https://protesilaos.com/codelog/debian-sid-stable-plan/), does not have the version
numbers needed to compile from source?  What if conflicts arise?

I actively try to avoid making a FrankenDebian.  The only package I have
no hesitation compiling from source is my fork of Simple Terminal by the
Suckless community.[^MySTFork]  For all the rest, I try to rely only on
packages provided by the official mirrors and make sure never to mix and
match from the various Debian channels (stable, testing, unstable, …).

There are cases where building directly from upstream is necessary.
Such as when a piece of software is an absolute requirement for a given
task and where no adequate alternatives are present.  This is not the
case with Polybar.  It is not an integral part of my workflow, while
there are alternatives available, including the option to use something
like `xfce4-panel` in tandem with `bspwm`.

## Have fun scripting

Make no mistake: I like Polybar.  It is a tool that covers most use
cases and its modules work well with fairly little effort.  Its
configuration file is easy to understand.  It uses a standard way for
modifying the looks of the various pieces of information on display.
Furthermore, it supports Xft fonts (proportional, outline font files
like `.ttf`) and can display glyph icons with iconic typefaces such as
FontAwesome.

With all this power comes the downside of skipping an important learning
session on how to retrieve all the data Polybar can present.  You want
Polybar to display `bspwm` workspaces and the flags of the focused node?
Just add the relevant module to the config file and you are good to go.
Now try getting that yourself to realise how much more demanding the
task becomes.

Seeing as I was looking for alternatives anyhow, I decided to opt for
Lemonbar.  What this tool does is draw an empty panel.  There are no
modules built in.  No defined configuration file to add the stuff you
need.  Nothing.  Lemonbar will just print the output of a command, same
as what you would expect in the shell.  Example:

    echo "Hello world" | lemonbar -p

This pipes the output of `echo` to the panel.  The `-p` flag makes the
panel stay in place.  This is where scripting comes in: get it to
display information dynamically, place it in the appropriate position,
format it as needed, and so on.

Not to bother you with the details, check out my [Lemonbar script,
called
"melonpanel"](https://gitlab.com/protesilaos/dotfiles/blob/master/bin/bin/melonpanel)
for the implementation, as well as my `bspwmrc` and `sxhkdrc` to see how
it fits in with the rest of the system.

## Scripts are more portable than source code

I want to make my dotfiles easy to deploy on new systems.  Having to
compile software is the opposite of what I target.  I prefer to run one
`apt install` with all the packages I need and then use GNU Stow on my
dotfiles.  Everything will be in place within minutes.  Eventually this
process will be scripted so that `./install.sh` will streamline the 
work.

I attach great importance to portability: my custom desktop session
should ultimately be reproducible.  The dotfiles must work on any clean
install of the next Debian stable release (codenamed "Buster").  This is
an ambitious, complex, multi-faceted task.  Removing bottlenecks will
only be to its benefit.  My plan is never to have to compile a piece of
software from source and then expect the user to maintain the package.
Debian is not meant for that kind of setup (well-justified exceptions
notwithstanding).

Lemonbar it is then!

[^MySTFork]:  My fork of the Simple Terminal by Suckless is distributed with my dotfiles.  There is a precompiled binary inside the "bin" directory as well as the source code inside "st".  Additionally, my fork has [its own repo](https://gitlab.com/protesilaos/st).
