---
title: "Flatpak themes in BSPWM"
subtitle: "Theme goodness and live switching"
excerpt: "How I use Flatpak themes with my tiling window manager (BSPWM)."
date: 2018-10-11
permalink: /codelog/bspwm-flatpak-themes/
---

I have some Flatpaks installed.  They offer the convenience of using
software that is not in the Debian repos or that would require pulling
in lots of dependencies.

From a usability perspective, all Flatpaks I have tried are agnostic to
the desktop environment.  They work exactly the same on a fully fledged
desktop environment such as GNOME, or in my custom BSPWM session.

One inconvenience for first time users is that by default Flatpak apps
will not inherit the active theme.  They use Adwaita or Breeze instead
(or whaterver the fall back option is).  There is nothing wrong with
those choices per se, though it is annoying to have applications look
completely different from each other, especially when wanting to use a
global dark theme, or just have a consistent look and feel.

## Install Flatpak themes

Fortunately Flatpak does support theming and the solution is fairly
simple.  The user only needs to download the Flatpak version of their
favourite theme.

Here is the gist of it, taken from [TingPing's
blog](https://blog.tingping.se/2017/05/11/flatpak-theming.html).

First, we need to enable the Flathub repo:

    flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo

Then it is possible to get a list of all available themes with this command:

    flatpak remote-ls flathub | grep org.gtk.Gtk3theme

Here is how I install the Arc theme variants:

    flatpak install flathub org.gtk.Gtk3theme.Arc org.gtk.Gtk3theme.Arc-Darker org.gtk.Gtk3theme.Arc-Dark

Now, when I open a Flatpak app inside a complete DE it uses the Arc
theme that I assigned in the settings manager.

## But BSPWM has no settings manager

BSPWM follows a minimalist approach to design.  It quite literally is
just a window manager.  As such, all the conveniences of an integrated
desktop environment must be implemented separately.

Within a generic BSPWM session, Flatpak apps will just use their default
theme.  There is no way to change it, even after having followed the
instructions above.

The reason is that Flatpak does not read from the system's `/usr`
directory.  But also that the Flatpak runtime only 'listens' to such
configurations from a settings manager program running in the
background.  In GNOME, MATE, etc. the settings daemon is enabled at
startup.  Whereas in BSPWM (and other tiling WMs), we have to cater to
that ourselves.

The solution is to auto start a lightweight settings manager when logging
into the BSPWM session.  I have chosen `xfsettingsd` from the Xfce
project, though I expect this to work with any similar piece of
software.

Within my `bspwmrc` I run this (which could be cleaned up a bit):

	if [ -x /usr/bin/flatpak ]; then
		if [ -x /usr/bin/xfsettingsd ]; then
			xfsettingsd
		fi
	fi

Now Flatpaks inherit the GTK theme of my choice.  No more Adwaita when
all I want is Arc.

## Advanced usage for live theme switching

In a fully fledged DE you go into the theme settings, set your choice
and [usually] have it propagate to all running windows.  You witness the
change as it happens.  But in BSPWM there is no settings menu, so no
readily apparent way of interacting with these options.  The good thing
is that running a settings manager means being able to interact with it
via the command line.  This is also the case for `xfsettingsd` which
'listens' to commands from the `xfconf-query` tool (GNOME and MATE have
something similar with `gsettings`).

Using `xfconf-query` has a bit of a learning curve, because you need to
figure out the various parameters.  But once you get the hang of it,
everything follows naturally.

These are the commands I have an immediate need for:

	xfconf-query -c xsettings -p /Net/ThemeName -s Arc
	xfconf-query -c xsettings -p /Net/IconThemeName -s Papirus

And their equivalents for the dark theme:

	xfconf-query -c xsettings -p /Net/ThemeName -s Arc-Dark
	xfconf-query -c xsettings -p /Net/IconThemeName -s Papirus-Dark

Issuing these commands will have an immediate effect on all running
windows.  To take this a step further, we can implement a script which
handles the theme switch.  I already have one as part of my dotfiles,
which loads a [Tempus theme](https://protesilaos.com/tempus-themes/) of my choice.  Since the
Tempus collection is divided into light and dark themes, I also change
the GTK options accordingly.

Here is a quick demo running a terminal, GNOME Clocks as a Flatpak, and
Thunar (it is a bit slower than usual because of screen recording):

![bspwm_update_running_apps_demo](https://thumbs.gfycat.com/AliveShortCougar-size_restricted.gif)

And here is the link to [the higher quality
GIF](https://gfycat.com/AliveShortCougar).

## A work in progress

This is something I only introduced a few days ago.  There may be a few
things that I have not taken into consideration or that could be
optimised further.

For more on how I implement this, see the "bin" directory of [my
dotfiles](https://gitlab.com/protesilaos/dotfiles), specifically the
`own_script_update_environment_theme` and the `tempusmenu` which is an
interface for it.

Be warned, I use GNU Stow to manage my dots.  Do not try to copy/paste
things without accounting for the overall integration between the
various parts of my custom desktop session.
