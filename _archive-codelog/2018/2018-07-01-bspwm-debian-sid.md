---
title: "How to: BSPWM on Debian Sid"
subtitle: "Plus extras to replicate my work environment"
excerpt: "Complete guide to set up Debian Sid/Unstable with a custom tiling window manager environment. Uses my meticulously designed configurations."
date: 2018-07-01
permalink: /codelog/how-to-bspwm-debian-sid/
---

**Update 2019-05-15:**  This post is out-of-date.  DO NOT FOLLOW ITS
INTRUCTIONS.
{:.critical}

**Update 2019-05-15:** These instructions have been superseded by my new book: [Prot's Dots For
Debian](https://protesilaos.com/pdfd/).  That is the comprehensive guide
to reproducing my setup on Debian 10 'buster'.
{:.info}

**Update 2019-05-15:** For video demos, see my [screen casts](https://protesilaos.com/code-casts/).
{:.note}

Original text below.

* * *

I have been running Debian Sid for about a year now. Overall, I think it is an excellent rolling release GNU/Linux distribution. Debian is my distro of choice because of (i) its importance to the free software world, (ii) its diverse community, (iii) its politics and stance on free software,[^NoteDFSGNonFree] and (iv) the fact that it is an "enterprise-grade" operating system without being backed by any one company (e.g. Ubuntu).

Debian is not an ideal choice for beginners. It does not try to make the experience the most user friendly or to provide everything "out of the box". Users coming from distros such as the Ubuntu flavours or Linux Mint, thinking that they will just "cut out the middleman" and go directly to the source, are in for a hard time.

A Debian user is expected to mould their system into their own needs, to make configurations and adaptations for their particular case. For example, you cannot use `sudo` with your regular user, unless you configure it to do so. The `lightdm` login screen will not show the user list by default. You will probably have to configure `fontconfig` in order to have consistent fonts across applications, such as in `chromium`. All desktop environments offer a basic experience, unlike the care and polish that goes into something like the Linux Mint editions or Ubuntu MATE. And so on. As such, I would argue that Debian is targeted at experienced GNU/Linux users.

In this article, I document all the steps I take to get my custom desktop session on Debian *Sid*. The core of my setup is the Binary Space Partitioning Window Manager (BSPWM). It is a tilling window manager, similar to the arguably more popular i3 (i3WM).

First some demos, then a few words about Debian release channels, a short note of why I prefer BSPWM over i3, and then the instructions.

## 1 Demonstrations

*Any large gaps between windows are for demo purposes only, as I prefer to work with values between 0-5.*

### 1.1 Screenshot

![bspwm sample screenshot](https://gitlab.com/protesilaos/dotfiles-screenshots/raw/master/2019-03-26_multihead-dark-theme.png)

### 1.2 Quick view of BSPWM motions

![BSPWM motions demo](https://thumbs.gfycat.com/KaleidoscopicPleasantAmmonite-size_restricted.gif)

[Higher quality demo of BSPWM motions](https://gfycat.com/KaleidoscopicPleasantAmmonite).

### 1.3 Change environment theme

Demo of a script that changes all themes on demand, from terminals to command line utilities, the system bar, etc. It is invoked by my `tempusmenu`: a `dmenu` script that provides the available options. The [Tempus themes](https://protesilaos.com/tempus-themes/) are compliant *at minimum* with the WCAG AA accessibility standard for colour contrast.

![bspwm demo of theme change](https://thumbs.gfycat.com/HandmadeSimplisticBetafish-size_restricted.gif)

[Higher quality of environment theme change demo](https://gfycat.com/HandmadeSimplisticBetafish).

## 2 A few words about Debian Sid and Debian release channels

Debian is divided in four release channels: Stable, Testing, Unstable, and Experimental. Packages migrate from the last to the first in sequence, after being subjected to careful scrutiny where release critical bugs and security holes are identified and addressed.

The Stable release is the one recommended to regular users and readily available through the project's homepage. It currently sits at version 9.4 and is codenamed "Stretch". Stable gets a major release about once every two years, though there is no rigid release schedule. It is published when it is ready. Package versions remain on the same major version throughout the distribution's life cycle, with minor fixes and security updates being the ones pushed down to users. Choose Stable if you intend to set up a system that requires very little maintenance, such as a home server or a generic desktop computer system.

Testing is the next Stable release, currently codenamed "Buster". It occupies the space between Stable and Unstable. In technical terms, Testing *as such* is a rolling release model, though the various code names are better described as semi-rolling.[^NoteTestingRolling] I think Testing covers a specific niche. It should not be used by Debian users who need access to newer packages and are prepared to assume the responsibility inherent in running bleeding edge software (more on that in the following subsection).

The Unstable branch gets newer packages, which are subject to regular updates. Unstable is always codenamed 'Sid'. It never has an actual version number, because it follows a rolling release model. Packages are updated as they come. Sid is only defined by approximation, based on what the current Testing branch is called. As such, the *current state* of Sid is internally referred to as Buster/Sid. Use Sid if you want to have a bleeding edge system and are prepared to resolve any problems as they arise.

As for Experimental, its name denotes its function. It is meant for Debian developers.

### 2.1 Why Sid instead of Testing

The three-fold reason I favour Sid over Testing is as follows:

- **Responsibility is yours.** You want to run a rolling release distribution. You should not expect it to be as hassle-free as Stable. If you value stability above everything else, you should not be thinking about switching to Testing/Sid. Use Debian Stable, an Ubuntu LTS release, or Linux Mint.
- **Testing offers the illusion of stability.** If you read various comparisons online, there is this belief that you should use Testing over Sid because it has the best of both worlds. It is more like running Stable with newer packages. I find this kind of misleading. Testing is still a rolling release distribution, so *responsibility is yours*.
- **Testing can remain broken for longer.** If you go into Testing thinking that it is perfectly stable, then you will run into trouble. And when you do come across problems, they will persist for longer compared to Sid. The reason is that upstream fixes go to Sid first and only after a certain period of time do they migrate to Testing.

In other words, I think Sid makes it crystal clear that you are responsible for your system. Whereas Testing can give the impression that you can sort of cheat your way into having both bleeding edge software and stability. That is the wrong mentality to have if you are to use a rolling release distro. If, however, you know exactly what you are doing, there is almost no difference between Testing and Sid: it is just a matter of how close to the bleeding edge you want to be.

At any rate, I consider the package `apt-listbugs` essential to running either of these options (more on that in the installation instructions below).

## 3 Why BSPWM over i3WM

BSWPM represents windows as the leaves of a binary tree, dividing the working area between a focused node and a stack of inactive windows (technically a window spiral).

GNU/Linux users may already be familiar with i3, a popular tiling window manager. I have used `i3wm` for quite a while. Both the upstream and the popular `i3-gaps` fork (which is not in the Debian repos). Overall, it is an excellent choice, but I think BSPWM is slightly better. For me, the main advantages are:

1. Follows the UNIX philosophy. Does not come bundled with its own status bar or any extras. BSPWM is quite literally a window manager and nothing else.
2. The configuration file is a shell executable, which allows scripting (e.g. if program exists, then run it, else do nothing) or sourcing other files.
3. The hotkey daemon, which handles interaction with BSPWM, has a clean syntax that allows the declaration of multiple key bindings at once. Also recognises events like activating the command on key release or on repeat. Finally, it provides the option of defining key chord chains (multiple key presses to run a command).
4. Unlike upstream i3, BSPWM offers the option for gaps between windows. Yeah, huge gaps are a gimmick. But small ones can be a productivity boost. This is not really an advantage if we compile `i3-gaps` from source, but mostly a convenience to get gaps from the official `bspwm` Debian package.

## 4 Installation instructions

These instructions may be updated at a future date. I do, in particular, plan to add a table of contents and expand on some further customisations the user may want to consider.
{:.info}

The following instructions were implemented on 2018-06-30 on a clean Debian 9.4 install, using the latest available net install option. The hardware is Lenovo ThinkPad X220.
{:.note}

**Do not try these instructions on mission critical infrastructure.** Use a Virtual Machine or a spare computer. These work on my Lenovo ThinkPad X220 laptop and the Lenovo H30-05 desktop. Your mileage may vary. I do not claim to know how different hardware configurations will behave. **The responsibility is yours. Proceed at your own risk.**
{:.critical}

### 4.1 Setting up a clean Debian install

I prefer to use the [net install of the current Stable release](https://www.debian.org/distrib/netinst). If you have a machine that does not have Ethernet access, or requires non-free drivers for Wi-Fi, then you will be better served by [one of those](https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/).

The reason I first install Debian Stable and then switch to Sid, is to have a solid starting point. There are ways to install Sid directly, but your timing might coincide with the presence of a major bug in a core piece of software. The package `apt-listbugs` (more on that below) will protect you from such unpleasant surprises.

During the installation process, you will be asked to choose your major system components. A Desktop Environment, an SSH server, a print server, etc. I always keep the first option checked, then [using the space key to toggle on/off] I add MATE, SSH server, remove the print server, and keep the standard system utilities.

Here is a representation:

```
[x] Debian desktop environment
[ ] ... GNOME
[ ] ... Xfce
[ ] ... KDE
[ ] ... Cinnamon
[x] ... MATE
[ ] ... LXDE
[ ] web server
[ ] print server
[x] SSH server
[x] standard system utilities
```

You will get Debian Stable running the MATE desktop environment. I always choose a DE because it makes certain things easier, like network access and a functioning Xorg display server. It also provides a decent fallback option, as well as something that could be used by other users in the house or a guest.

Now to prepare for the transition to Debian Sid. Open a terminal and type the following commands (lines starting with `#` are comments and should not be added to the command line).

```sh
# Switch to the root user (password was defined at install time)
su

# update the package archives
apt update

# install some core packages, especially `apt-listbugs`
# `apt-listbugs` is essential if you want to run Sid or even Testing
apt install sudo vim apt-listbugs build-essential

# add your username to the sudo group
adduser USERNAME sudo
```

Reboot your system.

### 4.2 Preparing the update to Sid

Now edit `/etc/apt/sources.list` to enable Sid (you must be the root user or run with `sudo`). You will need to replace all references to `stable` or `stretch` with `sid`. This is the right time to also include support for non-free packages if you need them.

This is all I have in my APT sources file, using the mirrors from Greece:

```sh
deb http://ftp.gr.debian.org/debian/ sid main contrib non-free
deb-src http://ftp.gr.debian.org/debian/ sid main contrib non-free
```

Save your changes. Now type the following commands in a terminal (use `sudo` as regular user, omit it if you login with `su`):

```sh
# refresh the package lists with references from Debian Sid
sudo apt update

# perform a full system upgrade
sudo apt full-upgrade
```

These will start the process of converting Stable to Sid. The process might mess up with the fonts in your terminal, but is otherwise quite straightforward. Let it run and do not do anything in the meantime.

Note though, that at the time of writing, there are some critical bugs that require your attention. `apt-listbugs` will print a list with short descriptions, and you have the option to open an HTML file with links to the full bug reports. To complete the upgrade, you might have to pin some packages (keep them at their current version). This can be done at the prompt of `apt-listbugs` with this command:

```sh
p <package-name>
```

My actual pinning was this:

```sh
p synaptic libgpg-error0 efibootmgr libdrm-radeon1
```

You will then have to select "NO" and type `sudo apt full-upgrade` to repeat the process while excluding the pinned packages.

Those pinned packages are stored in `/etc/apt/preferences.d/apt-listbugs`. Remember to periodically check if the problems have been fixed. Lots of pinned packages might cause unpredictable behaviour.

The upgrade will take a while, depending on your connection speed. Mine was about an hour.

Reboot once done. You are now running Debian Sid with the latest MATE desktop. Congratulations!

### 4.3 Setting up my BSPWM environment

Log back in to MATE for the last time. Or use a TTY if you wish. We are almost done.

#### 4.3.1 Getting the core packages

Now to install my custom environment. You might want to build the system yourself, in which case it is better to just install the essentials. Seeing though as you are reading this guide, I would recommend you install the essentials plus the extras. The following commands will also pull in all the relevant dependencies.

```sh
# essentials
sudo apt install git stow curl scrot feh materia-gtk-theme rxvt-unicode bspwm suckless-tools sxhkd xbacklight compton dunst libnotify-bin rsync i3lock lxappearance

# essentials + extras
sudo apt install git stow curl qtpass fonts-roboto fonts-hack-ttf neomutt abook ranger newsboat scrot feh materia-gtk-theme rxvt-unicode mpd mpc ncmpcpp bspwm suckless-tools sxhkd xbacklight compton dunst mpv youtube-dl imagemagick libnotify-bin taskwarrior w3m zathura firefox thunderbird redshift dtrx rsync i3lock lxappearance fonts-font-awesome
```

#### 4.3.2 Install the Mint-Y icons

These are all the packages we need from the official repositories. Now on to get the icon theme I employ in my notification system (defined in the `~/.config/dunst/dunstrc` file). I choose the Mint-Y icon theme because it is quite complete and consistent. Open a terminal and run:

```sh
# Get the source files
git clone https://github.com/linuxmint/mint-y-icons.git --depth 1

# Enter the mint-y-icons directory
cd mint-y-icons

# Sync the source files to the system (makes the icons available to all users) 
sudo rsync -avzr usr/share/icons/* /usr/share/icons/
```

Note that the last command uses `rsync` instead of `cp`. The former is good for incremental updates. So you can periodically `cd` into the icons' source code (as above), run `git pull` to get the latest updates, and then execute the `rsync` command as shown above to pass only those updates to the system files (`rsync` is an awesome tool).

#### 4.3.3 Install Polybar

Unlike your standard Desktop Environment, BSPWM does not come bundled with anything. BSPWM is just the window manager program. Does one thing and does it well. To get a decent system panel, we can use `lemonbar` from the official repositories, but I think that is not the best option. Instead I opt to compile `polybar` from source. Prepare a terminal for the following commands.

These will get you the dependencies:

```sh
# prepare polybar from source
# instructions https://github.com/jaagr/polybar/wiki/Compiling

## install dependencies
sudo apt install cmake cmake-data pkg-config libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libmpdclient-dev libiw-dev libnl-3-dev
```

Now to retrieve the source code and compile it:

```sh
## get source and compile
git clone --recursive https://github.com/jaagr/polybar
mkdir polybar/build
cd polybar/build
cmake ..
sudo make install
```

#### 4.3.4 Get my dotfiles (customisations)

Before proceeding, make sure you check this short blog post of mine about how I use [GNU Stow with my dotfiles](https://protesilaos.com/codelog/gnu-stow-dotfiles/).
{:.warn}

All packages are in place. Now we need the dotfiles to complete the process. As I tend to tweak things here and there, I link you to the [current version of my dotfiles, which is v2.1.0](https://gitlab.com/protesilaos/dotfiles/tags/v2.1.0). You must download that version, decompress it in your `$HOME` directory, rename it "dotfiles-prot" (or something that works for you), and then prepare to run the following (here is the [canonical link to my dotfiles](https://gitlab.com/protesilaos/dotfiles), if you wish to clone the repo).

```sh
# switch your current directory to my dotfiles
cd ~/dotfiles-prot

# use stow to create symlinks
# all parts of the desktop session go to their right place
# here are my essentials
stow bin bspwm cli-tools colours extra fonts gtk shell polybar vim xorg music
```

After running the `stow` command, check the files in the `xorg-extra` directory. There are instructions on how to fix xbacklight if it is not working.

Just to be sure, reboot you system. Done! You can now choose to log in to BSPWM from the login screen (which should be `lightdm` if you selected the MATE desktop).

Do not delete my dotfiles after running `stow`. It will break all the symlinks it created. Similarly, do not reorganise things. If you want to customise things, first familiarise yourself with `stow`. Then make a copy of my dotfiles, add your adaptations, and use those to create the symlinks. I strongly encourage you to use `stow`. It saves you from a lot of manual work and makes your dotfiles portable and easy to deploy.
{:.warn}

## 5 Using the new system

### 5.1 Custom key chords
To see all available key bindings, read this file `~/.config/sxhkd/sxhkdrc`. Below are the basics (I have tried to define key bindings that do not conflict with any of the programs I have used):

```
Key bindings for my BSPWM setup
followed by their description
===============================

Basic motions
-------------

Vi like motions:

    super + h   Focus window to the left
    super + l   Focus window to the right
    super + j   Focus window to the bottom
    super + k   Focus window to the top

    super + shift + h   Move focused window to the left
    super + shift + l   Move focused window to the right
    super + shift + j   Move focused window to the bottom
    super + shift + k   Move focused window to the top

Window operations:

    super + q   Close window
    super + shift + q   Kill window

    super + m   Toggle monocle view (the equivalent of maximise)
    super + f   Toggle full screen view
    super + space   Toggle floating/tiling

Workspace operations:

    super + 1   Switch to workspace 1
    super + 2   Switch to workspace 2
... same up to 9

    super + shift + 1   Move focused window to workspace 1
    super + shift + 2   Move focused window to workspace 2
... same up to 9

    super + ctrl + shift + 1   Move and follow focused window to workspace 1
    super + ctrl + shift + 2   Move and follow focused window to workspace 2
... same up to 9

Main tools:

    super + d         Open dmenu (for launching programs)
    super + return    Open a urxvt instance

Key chord chains
----------------
These are multiple key presses to perform an action.
See comments in sxhkdrc about why I choose those letters.

Commands that affect the environment:

    super + e ; s   Reload the sxhkdrc (when making changes)
    super + e ; p   Reload polybar

Commands that invoke executables (see sxhkdrc for all the commands):

    super + x ; 1   Run Firefox
    super + x ; 2   Run a terminal with ranger (file manager)
    super + x ; 3   Run a terminal with newsboat (feed reader)
```

### 5.2 The file manager

Now that you know the basic shortcuts, you may want to personalise your setup. Start with adding your wallpaper. Open `ranger` by typing `super + x ; 2` (super and x, followed by 2). Once inside `ranger`, you can navigate using Vi motions or type `gpc` to go to your pictures folder (all shortcuts are defined in `~/.config/ranger/rc.conf`). Set the selection over the image you want and type `Cbg` to set your new background. Similarly, you can define a lock screen image, by typing `Clk`.

### 5.3 Auto starting programs

To see what programs are auto started, see `~/.config/bspwm/bspwmrc`, as well as `~/.xsessionrc`, `~/profile`, and `~/.config/autostart`.

### 5.4 The Tempus themes

All the colours you see are part of my [Tempus themes](https://protesilaos.com/tempus-themes/) project. The one you get is Tempus Dusk, which is a dark theme with slightly desaturated colours. To switch to something else, type `super + e ; t`. A drop-down menu will appear. Either type your choice and press enter or use the arrow keys and press enter. Some themes are light, others are dark.

Open terminals should be updated live (though not CLI programs, like `vim` or `ranger`), but GUI applications must typically be closed and opened again for changes to take effect.

To customise what GTK themes and icons are used in this switch, you must edit this script `~/bin/own_script_update_environment_theme` (search for the definition of the `modify_gtk3` function—current GTK themes are Materia, while icons are Mint-Y). This script also changes the wallpaper if you go from a dark to a light theme and vice versa. To define the image for dark and light themes respectively, add the images of your choice at `~/Pictures/theme/dark.jpg` and `~/Pictures/theme/light.jpg` (edit the script if you wish to either disable this or use a different location—the function is `modify_wallpaper`).

### 5.5 Password manager (optional)

Consider setting up `pass` (or `qtpass`) as your password manager. If you do, you can conveniently copy your stored passwords to the clipboard (with a timed auto clear) by bringing up the `passmenu` with `super + p` (for me, this is one of the best things ever). The interface is the same as with all my `dmenu` implementations (such as the theme switch from the previous paragraph). Type your search or use the arrows and hit the return key.

There are many more things you will learn as you use the system. I recommend you develop a good understanding of my dotfiles. Many of the files therein include inline comments and define all of the custom actions I rely on.

### 5.6 Add your music (optional)

We need to set up the Music Player Daemon using a per-user install.

```sh
# disable the systemd service
# we autostart mpd from the bspwm environment
sudo systemctl disable mpd

# switch to the mpd local config directory
cd ~/.config/mpd

# create the directory where playlist data is stored
mkdir playlists

# create the files mpd needs to run
touch database log pid state sticker.sql
```

To update the `mpd` database (assuming the presence of files at `~/Music`) either run `mpc update` in a terminal or type `ncmpcpp` and then press `u`. If your music is in a different directory, edit the path in this file `~/.config/mpd/mpd.conf`.

You may need to reboot for the `systemd` service to stop interfering with your setup.

To play music, learn how to use `ncmpcpp` (I typically switch to screen 4, by hitting `4`, then `A` and hit enter for an empty prompt which adds all available music to the playlist, then I toggle on repeat mode with `r` and random order with `z`).

If you do not like `ncmpcpp`, I highly recommend `cantata`, a graphical MPD frontend using the Qt toolkit.

### 5.7 Use newsboat for RSS feeds (optional)

To actually use `newsboat` (shortcut is `super + x ; 3`), you first need to provide a file with links to RSS/Atom feeds. This should be placed at `~/.config/newsboat/urls`. Here is a sample:

```sh
# Just a feed URL per line
https://protesilaos.com/politics.xml
https://protesilaos.com/codelog.xml

# The words inside quotes are tags, separated by a space.
# Tags can be used to filter content (see filters below).
https://protesilaos.com/politics.xml "Blogs Politics"
https://protesilaos.com/codelog.xml "Blogs FOSS"

https://gitlab.com/protesilaos/dotfiles.atom "Packages"
https://github.com/ubuntu-mate/mate-tweak/releases.atom "Packages"

# Filters
# =======

# What goes after `query:` is the text that newsboat displays
"query:Blogs:tags # \"Blogs\""
"query:Git Packages:tags # \"Packages\""

"query:Unread Articles:unread = \"yes\""
```

Configure this program to your liking by editing `~/.config/newsboat/config`. For all available options, check `man newsboat`.

### 5.8 Configure the notification daemon (optional)

The daemon that handles notifications is `dunst`. Its options file is located at `~/.config/dunst/dunstrc`.

For example, in case you want to change the icons that `dunst` uses, edit the paths in this:

```conf
# Paths to default icons.
icon_folders = /usr/share/icons/Mint-Y/actions/32/:/usr/share/icons/Mint-Y/animations:/usr/share/icons/Mint-Y/apps/32/:/usr/share/icons/Mint-Y/categories:/usr/share/icons/Mint-Y/devices/32/:/usr/share/icons/Mint-Y/mimetypes/32/:/usr/share/icons/Mint-Y/panel/32/:/usr/share/icons/Mint-Y/places:/usr/share/icons/Mint-Y/status
```

To read about all the available settings, see `man dunst`.

Note that the colours are changed every time you run the commands that change the Tempus themes (see above).

#### 5.8.1 Custom notifications (optional)

If you want to create your own notifications, check `man notify-send`. Here are some examples:

```sh
# Generic test
notify-send "Test title" "Test body of text"

# Generic test with a generic icon
# uses the icon paths defined in `~/.config/dunst/dunstrc`
notify-send -i firefox "Test title" "Test body of text"

# Generic test with absolute path to icon
notify-send -i /usr/share/icons/Mint-Y/apps/32/firefox.png "Test title" "Test body of text"

# Display the output of another command
# Show the status of the Music Player Daemon in a custom format
notify-send -i rhythmbox "Now Playing" "$(mpc --format '%artist% ~ %title% \[%album%\]' current)"
```

## 6 Further steps

### 6.1 General maintenance of Debian Sid

I always like to maintain a "Debian maintenance" file where I document all customisations I make which are not part of the official release (such as installing Polybar). I recommend you do the same and always keep track of custom files you add here and there, otherwise you will clutter your system. That might cause problems down the way.

Also remember to run `sudo apt update` before installing packages that pull in new dependencies. The last thing you want is package conflicts arising from a combination of older and newer packages. As for upgrading packages, I always run `sudo apt full-upgrade` because it removes packages that become obsolete. Remove orphan packages with `sudo apt autoremove`.

You already read about `apt-listbugs` that it stores its data at `/etc/apt/preferences.d/apt-listbugs`. In case you forgot about it, or I have not stressed enough the importance of this package, here is an excerpt from `man apt-listbugs`:

> apt-listbugs is a tool which retrieves bug reports from the Debian Bug Tracking System and lists them. In particular, it is intended to be invoked before each installation or upgrade by APT, or other compatible package managers, in order to check whether the installation/upgrade is safe.
>
> In the typical use case, the user is installing or upgrading a number of packages with APT or some other compatible package manager. Before the package installation or upgrade is actually  performed, apt-listbugs is automatically invoked: it queries the Debian Bug Tracking System for bugs (of certain configured severities) that would be introduced into the system by the installation or upgrade; if any such bug is found, apt-listbugs warns the user and asks how to proceed. Among other things, the user has the opportunity to continue, to abort the installation or upgrade, or to pin some packages  (so  that  the  unsafe installation or upgrade is deferred). However, pinning is not effective immediately, and requires restarting the APT session (by aborting and then re-running the same APT command).

Always inspect the output of this program and act on it. Debian Sid expects you to take full responsibility over the maintenance of your system. Furthermore, make sure you periodically check the packages that you pinned in case a fix has been provided.

### 6.2 Nodejs environment (optional)

Debian provides packages for `nodejs` but I find them problematic. Instead I follow the [official instructions](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions). I did:

```sh
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt-get install -y build-essential
```

### 6.3 Ruby environment (optional)

This website is powered by Jekyll, a static site generator that is built with Ruby. I need the following to get my local testing environment:

```sh
sudo apt install ruby ruby-dev ruby-bundler zlib1g-dev
```

### 6.4 Clean up GTK themes, icons, fonts (optional)

Unless you enjoy having a large collection of available fonts and themes (or are using one of the following), you will probably want to remove much of what is available:

```sh
sudo apt remove albatross-gtk-theme blackbird-gtk-theme bluebird-gtk-theme greybird-gtk-theme murrine-themes mate-icon-theme-faenza gnome-icon-theme fonts-droid-fallback fonts-sil-gentium fonts-sil-gentium-basic fonts-linuxlibertine fonts-vlgothic fonts-crosextra-carlito fonts-crosextra-caladea fonts-lato
```

If you want to add some excellent alternatives, I recommend these:

```sh
sudo apt install arc-theme papirus-icon-theme fonts-noto-hinted fonts-noto-mono
```

## 7 Troubleshooting

### 7.1 Polybar is missing

Note that `polybar` will not appear on screen if it does not recognise the active monitor. You need to edit `~/.config/polybar/config`. Search for "monitor" and change the value based on the output of `xrandr`.

I find my connected monitor by typing this in a terminal `xrandr | grep -w connected`. You get something like this:

```sh
xrandr | grep -w connected

VGA-0 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 480mm x 270mm
```

What you are looking for is the very first part, `VGA-0` in this case.

### 7.2 URxvt does not show bold fonts

The configuration file for `urxvt` (package name is `rxvt-unicode`) is placed in a custom location: `~/.my_urxvt/config`. I used to have these font definitions:

```conf
URxvt.font: xft:Hack:pixelsize=14,xft:DejaVu Sans Mono:pixelsize=14
URxvt.boldFont: xft:Hack:pixelsize=14:bold,xft:DejaVu Sans Mono:pixelsize=14:bold
URxvt.italicFont: xft:Hack:pixelsize=14:italic,xft:DejaVu Sans Mono:pixelsize=14:italic
URxvt.bolditalicFont: xft:Hack:pixelsize=14:bold:italic,xft:DejaVu Sans Mono:pixelsize=14:bold:italic
```

But they do not seem to work any longer. So I changed to these:

```conf
URxvt.font: xft:Hack:style=Regular:pixelsize=14,xft:DejaVu Sans Mono:style=Book:pixelsize=14
URxvt.italicFont: xft:Hack:style=Italic:pixelsize=14,xft:DejaVu Sans Mono:style=Italic:pixelsize=14
URxvt.boldFont: xft:Hack:style=Bold:pixelsize=14,xft:DejaVu Sans Mono:style=Bold:pixelsize=14
URxvt.boldItalicFont: xft:Hack:style=Bold Italic:pixelsize=14,xft:DejaVu Sans Mono:style=Bold Italic:pixelsize=14
```

## Enjoy your new system

I hope you make good use of these instructions and that you appreciate Debian Sid and BSPWM (and all the rest) as much as I do. While I have written this guide in a user-friendly way, I strongly encourage you to research *everything* before proceeding. **This is not a guide for inexperienced users who do not fully understand the effects of the commands they type in the terminal.**

For any questions or recommendations, feel free to [contact me](https://protesilaos.com/contact/).

[^NoteDFSGNonFree]: The Free Software Foundation does not include Debian in its [list of fully free GNU/Linux distributions](https://www.gnu.org/distros/free-distros.en.html), probably because Debian offers a convenient way to include non-free packages (mainly drivers and firmware). The FSF's stance is understandable, but I think Debian's realism is beneficial overall. Getting hardware that does not require any propriety code is quite tricky and typically comes at a premium. Not everyone can afford that.

[^NoteTestingRolling]: What I mean is that if you define `testing` in your apt sources you will always remain on that branch, whereas setting it to `buster` will currently put you on Testing but eventually leave you on it once it becomes the new `stable`. 
