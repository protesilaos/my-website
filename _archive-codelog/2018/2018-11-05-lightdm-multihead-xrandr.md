---
title: "Xrandr output for LightDM multihead"
subtitle: "A simple script for a dual monitor setup on my laptop"
excerpt: "Tips to configure LightDM to run the appropriate Xrandr command at startup. This also sets up dual monitor on BSPWM."
date: 2018-11-05
permalink: /codelog/lightdm-multihead-xrandr/
---

I have been running a dual monitor setup on my laptop for about a month
or so.  This is a Lenovo ThinkPad X220 with a display resolution of
1366x768.  I connect to it a 1920x1080 monitor via the VGA port.  It
enables me to configure [my custom working
environment](https://gitlab.com/protesilaos/dotfiles) to have separate
virtual desktops per display, which I consider a major productivity
boost to an already efficient workflow.

All was good. The one annoyance I had since the very beginning was the
display manager (`lightdm`) not adapting to my hardware automagically
(the display manager basically is the program that runs the login screen
and handles user sessions).  I could not find a way to instruct it to
use my monitors in the way I had laid them out, with the appropriate
settings for each.

This is no more.  Today I discovered a solution which, in hindsight, is
obvious.  LightDM can execute a script at startup.  The exact same
command I use to configure dual monitors on `bspwm` can be used by
`lightdm`.

## Script to set the correct Xrandr output

Here is the gist of my admittedly simplistic script in its current iteration.

I might modify it further, so if you are reading this at a future date, better
consult [my dotfiles](https://gitlab.com/protesilaos/dotfiles), specifically
the items inside the "bin" directory.
{:.warn}

    #!/bin/bash

    # ... text goes here (see actual file)...

    # set variable with the command we need to evaluate
	my_laptop_external_monitor=$(xrandr --query | grep 'VGA1 connected')

	# If the VGA1 port connects to a monitor, the output of the variable
	# will not be empty.  In which case it is assumed that I am using my
	# secondary display, whose resolution I know in advance.  If the
	# variable is empty, then no external monitor is connected.
	#
	# This is a simplistic approach which will not work if the external
	# monitor has another resolution.  It will also fail if executed from
	# another machine, say, another laptop that uses an HDMI connection
	# instead.
	if [ -n "$my_laptop_external_monitor" ]; then
		xrandr --output LVDS1 --primary --mode 1366x768 --rotate normal \
		--output VGA1 --mode 1920x1080 --rotate normal --right-of LVDS1
	else
		xrandr --output LVDS1 --mode 1366x768
	fi

I put this in a file inside my local "bin" directory, which I then make
executable with `chmod +x` (my `~/bin` is included in the `$PATH`—see my
dotfiles).

## Edit the LightDM configuration file

On Debian we need to edit `/etc/lightdm/lightdm.conf`, which requires
root privileges.  But first, make a backup of that file in case things
go awry.

Now search for `display-setup-script=`.  It should be commented out
(preceded by a `#`) and should have nothing following the equal sign.
This option is found under the settings heading for `[Seat:*]`.
Uncomment it by removing the column sign at the beginning of the line.
Then add the absolute path to the aforementioned script.

For example:

    [Seat:*]
    # other
    # options
    display-setup-script=/home/prot/bin/own_script_laptop_dual_monitor
    # more
    # options

Done!  LightDM now works the way I like it.  It presents the login
window and top panel on the monitor where the mouse cursor is on.  If
the cursor moves to the other monitor, so does the interface.  The
inactive screen only displays the wallpaper.

## An opportunity to simplify and refine my setup

Figuring out this fix provided a unique opportunity to revisit the
scripts I had initially developed.  I found some errors and duplication
of work, which I promptly addressed.

If you have come across a similar problem, please make sure you do not
copy-paste without understanding the meaning of these commands.  Also
note that the script presented herein is not designed to work in a
variety of multihead setups with arbitrary resolutions and a wide range
of possible combinations.  I know my hardware: this only caters to my
specific use case.

That granted, feel free to [contact me](https://protesilaos.com/contact/) in case you think I
can help you adapt this to your system.
