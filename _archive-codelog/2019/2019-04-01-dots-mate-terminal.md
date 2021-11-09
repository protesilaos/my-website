---
title: 'Switching to MATE Terminal'
subtitle: 'Breaking changes to my dotfiles'
excerpt: 'I have changed my default terminal emulator from Simple Terminal to MATE Terminal.'
---

I have changed my default terminal emulator from Simple Terminal (ST) to
MATE Terminal (MT).  In the process, I modified 46 files, making 214
additions and 7843 deletions.  I also learned how to properly use
`dconf` to control `mate-terminal` programmatically.

The [commit message from the
merge](https://gitlab.com/protesilaos/dotfiles/commit/0cc77016cf5cf85bb115c650725b36f6858021b8)
into `master` provides a detailed explanation (please ignore any typo or
odd comma).  The gist of it is that the new choice is better for
portability and maintainability, while also offering a few minor
usability benefits.

> This is a major review of my dotfiles.  It intends to replace my
> default choice of terminal emulator.
> 
> Below is an excerpt of the commit message that signalled the start of
> this process.
> 
> ---
> 
> Context: after extensive testing, I have decided to change my default
> choice of terminal emulator to MT.  The previous default was my custom
> build of the Simple Terminal (ST), by the Suckless community. Here is
> the reasoning, in outline form:
> 
> * MT is already installed on my system, because MATE is my fallback
>   option for a fully fledged desktop environment.
> 
> * ST has build dependencies, meaning that a user of my dotfiles must
>   first follow the instructions in the README that is bundled with
>   ST's source code.  Without these dependencies, ST will fail to build
>   when performing an environment theme update (using either my
>   `tempusmenu` or `own_script_update_environment_theme`).
> 
> * ST needs to be recompiled for a theme change to occur.  MT updates
>   faster (courtesy of `own_script_mate_terminal_setup`) and is less
>   taxing on system resources in this specific instance (my laptop's
>   fan is not activated).
> 
> * ST has major problems drawing box characters without extensive
>   patching.  Only at specific point sizes, does the selected font draw
>   continuous lines.  Whereas MT has no such issues.
> 
> * ST cannot draw emoji characters, while it requires an extra package
>   for symbolic fonts (see its README) in order not to segfault when
>   trying to display them.  MT supports emoji.  Now, it may seem
>   superfluous to have such a feature, but it is important once you
>   consider that people add emoji in emails or blog posts that can
>   ultimately be read through the terminal (such as via `neomutt` and
>   `newsboat` respectively).  While the font problems are not major,
>   they do add up (terminals are all about text, after all).
> 
> * From an aesthetic perspective, ST is not very well suited to the
>   dynamic size adjustments that happen in a tiling WM.  It tends to
>   create an inner padding when set at specific window sizes.  This is
>   most noticeable while running tmux (which I do all the time), where
>   the status line will have a large distance from the bottom and right
>   sides.  Admittedly, MT is not perfect in this regard, though it is
>   better.
> 
> * MT does not expose its theming options via a typical dotfile, but
>   still is easy to configure programmatically using dconf (what
>   `own_script_mate_terminal_setup` does).
> 
> * Other terminals that use the VTE widget (this is actually the
>   terminal emulator part, while MT is the implementation/framework)
>   such as {GNOME,Xfce} Terminal and Tilix, would also have the same
>   advantages as MT.  However, they are not installed by default, while
>   Tilix has a ton of other features that I do not need (thanks to
>   tmux).
> 
> * URxvt (Rxvt-Unicode), which is a popular choice for minimalist
>   window managers, exhibits similar problems to ST when it comes to
>   font drawing.  It also is not installed by default.  Furthermore,
>   I am not sure whether it is still maintained or not as version 9.22
>   is the one available across Stretch, Buster, Sid.
> 
> * Konsole on its own is an excellent choice, but not for my particular
>   use case.  It pulls in what seems like half the KDE-related package
>   list.
> 
> * I am writing a book on how anyone can reproduce my custom desktop
>   session on Debian 10 'buster' (planned for publication in late
>   April, early May 2019).  Any kind of friction, is a hit on
>   usability.
