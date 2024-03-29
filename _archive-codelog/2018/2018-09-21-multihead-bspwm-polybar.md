---
title: "Dual monitor setup with BSPWM and Polybar"
subtitle: "A pleasant multihead system"
excerpt: "BSPWM handles multi head setups nicely. Same with polybar. Here are some instructions and comments."
date: 2018-09-21
permalink: /codelog/multihead-bspwm-polybar/
---
A few months ago, I provided a detailed guide on how to set up [BSPWM on
Debian Sid](https://protesilaos.com/codelog/how-to-bspwm-debian-sid/).  Several things have
changed since then.  Most notable among them is that I got hand of a
second monitor that I promptly incorporated in my workflow.  Here I
document the adaptations I had to make, while concluding with my first
impressions of what I got (plus a screen shot).

The code samples presented herein are representative of my setup as of
2018-09-21.  If you are reading this at a future date, chances are
I have introduced changes.  In such a case, you might want to browse
through [my dotfiles](https://gitlab.com/protesilaos/dotfiles), and/or
[contact me](https://protesilaos.com/contact/).
{:.warn}

## Let X know about the monitors

The display server needs to be configured in a way that mirrors the physical
layout of the monitors.  My primary monitor is the one that is built into my
laptop, the Lenovo X220.  The external monitor connects via a VGA port and is
positioned to the right of the laptop.

The `xrandr` utility helps us identify the available connected monitors,
or "outputs", with the command `xrandr -q`.

What I get from that:

```sh
xrandr -q

Screen 0: minimum 8 x 8, current 3286 x 1080, maximum 32767 x 32767
LVDS1 connected primary 1366x768+0+0 (normal left inverted right x axis y axis) 280mm x 160mm
   1366x768      60.00*+
   1360x768      59.96
   1280x720      59.86    60.00    59.74
   1024x768      60.00
   1024x576      60.00    59.90    59.82
   960x540       60.00    59.63    59.82
   800x600       60.32    56.25
   864x486       60.00    59.92    59.57
   640x480       59.94
   720x405       59.51    60.00    58.99
   680x384       60.00
   640x360       59.84    59.32    60.00
DP1 disconnected (normal left inverted right x axis y axis)
DP2 disconnected (normal left inverted right x axis y axis)
DP3 disconnected (normal left inverted right x axis y axis)
HDMI1 disconnected (normal left inverted right x axis y axis)
HDMI2 disconnected (normal left inverted right x axis y axis)
HDMI3 disconnected (normal left inverted right x axis y axis)
VGA1 connected 1920x1080+1366+0 (normal left inverted right x axis y axis) 480mm x 270mm
   1920x1080     60.00*+
   1680x1050     59.95
   1600x900      60.00
   1280x1024     75.02    60.02
   1440x900      59.89
   1280x800      59.81
   1152x864      75.00
   1280x720      60.00
   1024x768      75.03    70.07    60.00
   832x624       74.55
   800x600       72.19    75.00    60.32    56.25
   640x480       75.00    72.81    66.67    59.94
   720x400       70.08
VIRTUAL1 disconnected (normal left inverted right x axis y axis)
```

And by including only the ones that are connected, I have:

```sh
xrandr -q | grep -w connected

LVDS1 connected primary 1366x768+0+0 (normal left inverted right x axis y axis) 280mm x 160mm
VGA1 connected 1920x1080+1366+0 (normal left inverted right x axis y axis) 480mm x 270mm
```

As such, my two monitors are named LVDS1, which is the primary one on the
laptop, and VGA1 for the external one.

What I want to do with this piece of information is tell the X display
server to configure my monitors appropriately whenever I launch a BSPWM
session. Here is the `xrandr` command:

```sh
xrandr --output LVDS1 --primary --mode 1366x768 --rotate normal --output VGA1 --mode 1920x1080 --rotate normal --right-of LVDS1
```

## Auto starting inside BSPWM

Now I want to have some basic shell scripting in place, to check whether
the external monitor is actually connected to the laptop.

First, this snippet is included in my `bspwmrc`:

```sh
# run the xrandr command if an external monitor is connected to the
# laptop.  This must be executed before the polybar command, so that
# polybar can set the two separate bars properly.
if [ -x $HOME/bin/own_script_bspwm_laptop_dual_monitor ];then
    own_script_bspwm_laptop_dual_monitor
fi
```

And here is the content of that command:

```sh
#!/bin/bash

# set up the two monitors for bspwm
# NOTE This is a simplistic approach because I already know the settings I
# want to apply.
my_laptop_external_monitor=$(xrandr --query | grep 'VGA1')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    xrandr --output LVDS1 --primary --mode 1366x768 --rotate normal --output VGA1 --mode 1920x1080 --rotate normal --right-of LVDS1
fi
```

Maybe there are some things that could be done more efficiently, but
this seems to work for the time being.

## Per monitor workspaces

In BSPWM each monitor contains desktops, or else workspaces.  While each
workspace indicates a binary tree with nodes—basically windows in their
given arrangement.

To have specific workspaces on each monitor, add this to `bspwmrc`:

```sh
bspc monitor LVDS1 -d 1 2 3 4 5
bspc monitor VGA1 -d 6 7 8 9 0
```

Note the names of the monitors, as where recognised by `xrandr`.

Now, when switching to desktops 1…5 the focus is on the primary monitor,
while 6…0 on the second one.

Almost done.

## Run two separate bars with polybar

The reason I want two bars is to display information about the
workspaces that are occupied on a per monitor basis.  Besides, this
opens up the possibility for fine grained control where, say, the
laptop's bar shows the `xbacklight` powered brightness level of the
screen, while the external monitor's bar has no use of such a module (it
does not use `xbacklight`).

There are two parts to tackling this:

1. Define the two bars in the `polybar` configuration file.
2. Launch the second bar, if the external monitor is connected.

## Configs for the two bars

Here are only the relevant parts from the `polybar` config.  Refer to
[my dotfiles](https://gitlab.com/protesilaos/dotfiles), specifically the
contents of the "bspwm" and "polybar" directories for my actual
configuration files.

```
[bar/top]
bottom = false
monitor = LVDS1

modules-left = bspwm mpd
modules-right = keyboard battery backlight temperature volume datetime powermenu

[bar/top_external]
bottom = false
monitor = VGA1

modules-left = bspwm mpd
modules-right = keyboard volume datetime powermenu
```

The module that requires attention is the one about `bspwm`.  The
following makes sure that each bar displays only the workspaces
assigned to the given monitor.

```
[module/bspwm]
type = internal/bspwm

pin-workspaces = true
```

Again, these are not the full configs.  Just the absolutely necessary
parts.  With them in place, `polybar` will show information about the
occupied workspaces of each monitor.  As such, the `top_external` bar
will only include workspaces 6…0, while `top` will have 1…5, as per the
settings in `bspwmrc`.

## Launch the two bars on startup

This is my current script for calling `polybar`:

```sh
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar top &

my_laptop_external_monitor=$(xrandr --query | grep 'VGA1')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    polybar top_external &
fi
```

You will notice the same conditional statement at the end which I used
above to run `xrandr` if necessary.  This script is now auto started from
within `bspwmrc`, *after* the script that configures the layout of the
monitors.  **The sequence is absolutely critical**, otherwise `polybar` is
not made aware of the two monitors and fails to position them properly.

```sh
# NOTE the path to the polybar executable.  This is the default location
# when compiling from source.
if [ -x /usr/local/bin/polybar ]; then
	bash $HOME/.config/polybar/launch.sh
fi
```

Putting it all together, the "autostart" section of my `bspwmrc` looks
like this:

```sh
# autostart
# ============================

sxhkd &
xrdb -merge $HOME/.Xresources

# run the xrandr command if an external monitor is connected to the
# laptop.  This must be executed before the polybar command, so that
# polybar can set the two separate bars properly.
if [ -x bin/own_script_bspwm_laptop_dual_monitor ];then
    own_script_bspwm_laptop_dual_monitor
fi

# NOTE the path to the polybar executable.  This is the default location
# when compiling from source.
if [ -x /usr/local/bin/polybar ]; then
    bash $HOME/.config/polybar/launch.sh
fi
```

## First impressions


I had never used a dual monitor setup before.  I had no notion of what
to expect.  As such, I cautiously started out with a GNOME session to
see how a major Desktop Environment handles things.  In GNOME, the
second monitor is basically a continuation of the current workspace,
with no apparent way of turning the two monitors into standalone
environments.  I do not like that.  I much prefer BSPWM's approach where
monitors contain *separate* workspaces.  Furthermore, GNOME does not
show the activities overview and the top bar in both monitors, which
introduces friction to the kind of workflow I envision.

Whereas a multiheaded BSPWM is a joy to work with.  Apart from the above
configurations, I did not have to change any of my key bindings to have
everything function as required.  Switching to a virtual desktop will
shift the focus to the corresponding monitor.  Great!  And yet, while
workspaces are divided between monitors, window switching still follows
an intuitive scheme of treating the two monitors as a unified space.
Put concretely, if I start from a focused window on the left of the
primary display and keep shifting focus to the right, I eventually
'cross over' to the second monitor on whatever node is displayed there.
Same with the commands that swap the position of two nodes.  I guess
this is the best of both worlds: actually separate, visually contiguous.

That granted, this is just my first day on this setup.  Things are
likely to change as I continue tinkering with the various options.

On a final note, running a bespoke environment such as my BSPWM-based
setup admittedly has a higher barrier to entry than the likes of the
major DEs, with the upside of a potentially superior experience.

## Meta

Obligatory screen shot of what I am actually looking at:

![bspwm_dual_monitor](/assets/images/attachments/bspwm_dual_monitor_sample.png)

The blank area on the left is due to the different screen resolutions.
It is only visible on the screenshot, not in the actual environment.  I
guess due to how X handles things and how `scrot` captures the output.

The terminal on the left monitor is running a `tmux` session, with only
a couple of active panes (yes, a tiling WM and a terminal multiplexer
are not mutually exclusive).

If you look closely, you will notice that the top bars only display a
subset of the available workspaces.  That is because I hide all empty
workspaces (see my `polybar` config).

Finally, the notification on the right top corner is provided by
`dunst`.  I have configured it to display notifications on the monitor
where the *keyboard* is active.
