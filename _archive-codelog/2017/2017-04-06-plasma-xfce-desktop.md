---
title: "From Plasma 5 to XFCE 4"
subtitle: "When less is more"
excerpt: "After two full weeks on KDE Plasma 5, I decided to switch to XFCE 4. Gets the job done."
date: 2017-04-06
permalink: /codelog/plasma-xfce-desktop/
---
**UPDATE 2018-06-26:** This post is out of date.  
I have since switched full time to Debian Sid. I currently use a highly customised environment around `bspwm`.
{:.critical}

In a recent article about my experience with Arch Linux I had mentioned how I went with the Cinnamon desktop environment after testing GNOME 3. I have known Cinnamon from my Linux Mint days. It is top notch, though the Arch packages are a bit buggy. I thus needed a more stable and probably mainstream alternative. Something like KDE Plasma 5.

My initial impression of Plasma 5 was not particularly positive. I found its multiple option panels overwhelming. However, in the spirit of giving every piece of software a fair chance, I did make the switch. Plasma 5 was my only DE for two full weeks or so. My verdict is that it is a superb piece of work, especially for those with a penchant for a little bit of extra stylistic flair.

Let me put it this way: if I want to show off the power of a GNU/Linux system to an average user with a Windows or macOS background, I will most probably start with a regular Plasma 5 session.

That noted, I am the kind of user who is more keyboard-and-command-line centric. My email client is Mutt. RSS with Newsbeuter. Music with CMUS. Tasks with Taskwarrior. Vim for writing. You get the idea. Fancy animations and special effects are largely superfluous in my kind of work flow, even though I much appreciate them.

The only reason I have not yet switched to a tilling window manager is that my screen is not as large as I would like it to be. So my quest to find a DE that is customisable yet focused on function led me to XFCE 4. I had tried it a few times before, but it always seemed a bit unsettling. Maybe its looks were too outdated, or perhaps the default options did not suit my case. Whatever the reason, I thought of XFCE 4 as a lesser alternative, one suitable only for ageing hardware. The fact that the last major update to version 4.12 was about two years ago further reinforced that idea.

Yet that is the wrong mindset. Web development has skewed my expectations on versioning. If something has not received a version bump in a few weeks or months, then it might be out of date. While there are instances where that is indeed the case, it is not true for many things in the Linux world. XFCE 4 is a mature piece of software that offers everything one needs for a solid computing experience.

It does take some time though to configure exactly to one's liking. What I found most annoying at first was the ability to set keyboard shortcuts. On the other DEs there is a specific options panel where all the major events are documented and can be edited accordingly. For example, on Plasma 5 the shortcut to change the speaker volume is rendered explicit. Just type in your shortcut and the system will check whether there is a conflict or not. Whereas in XFCE, I had to navigate to `All Settings` > `Keyboard` > `Application Shortcuts` and then add custom key bindings for the following seemingly arcane statements:

```shell
sh -c "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -5%" # Lowers volume
sh -c "pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +5%" # Increases volume
```

I found this counter-intuitive until I realised that these are shell commands. Which means that actions I would otherwise need a terminal for are only a key binding away. In practical terms, I could finally use `cmus-remote` with ease. So, if CMUS is running, the following will handle the basic media controls:

```shell
cmus-remote --next      # Next track
cmus-remote --previous  # Previous track
cmus-remote --pause     # Toggle play/pause
```

This feature is particularly powerful, even though I obviously do not consider it newbie-friendly. It also is an excellent means of circumventing some of the rather odd omissions of XFCE, such as the lack of a built-in tool to lock the screen. There is a section in the XFCE Arch wiki which does offer some insight on the matter. The gist is that the user must set their own locking system. Again, bad for new users but excellent news for tinkerers such as yours truly. I went ahead and installed `i3lock`. Then set the following command to my preferred key binding:

```shell
i3lock -f -e --image="~/path/to/image.png"
```

What may well be seen as a weakness, i.e. the absence of meaningful defaults, can be turned into a strength. XFCE 4 is stable and light on system resources. It is a workhorse. Gets the job done, but there are better candidates for the show floor.

Make no mistake though. It does not fall short in the looks department. It just is not flamboyant. Add a good theme, probably Arc, an icon set like Papirus, and a cursor theme such as Breeze, and you got yourself a sleek, modern desktop environment.

Having tried all other major DEs, I have come to consider XFCE 4 the best choice for my needs. I do, nonetheless, recognise its drawbacks. It is not ideal for new users. For such cases I continue to recommend either Mate or Plasma 5. That granted, I intend to add more content to my [dotfiles](https://gitlab.com/protesilaos/dotfiles), just in case anyone else is interested in replicating (or learning from) my configs.

As a teaser, here is a quick look at my favourite tools at the time of writing (key bindings in the comments)

```shell
exo-open --launch TerminalEmulator ranger       # <Alt>1
exo-open --launch WebBrowser                    # <Alt>2
exo-open --launch TerminalEmulator newsbeuter   # <Alt>3
exo-open --launch TerminalEmulator mutt         # <Alt>4
exo-open --launch TerminalEmulator nvim         # <Alt>5
exo-open --launch TerminalEmulator cmus         # <Alt>6

# General purpose terminals
exo-open --launch TerminalEmulator              # <Alt>W
xfce4-terminal --drop-down                      # <Alt>Q
```
