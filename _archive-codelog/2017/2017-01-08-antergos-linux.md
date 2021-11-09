---
title: "Now using Arch Linux"
date: 2017-01-08
excerpt: "Some thoughts as well as my initial configurations for running Arch Linux and Antergos."
permalink: /codelog/using-arch-linux/
---
I recently wrote an article about my full transition to GNU/Linux, specifically Linux Mint. I still consider this to be the best option for the majority of use cases. Over the years I have installed Mint (the 17.x and 18.x branches) on several machines, old and new, without encountering any major issue whatsoever. Mint is reliable and comes with sane defaults. Both the Cinnamon and MATE desktop environments deliver on their promise. Linux Mint is my number one pick for anyone willing to move away from macOS and Windows.

Perhaps the greatest advantage of GNU/Linux over competing platforms is its extensibility and customisability. Each distro offers its own range of possibilities. Mint is somewhere in the middle between a curated and an open-ended experience. It comes with meaningful defaults and has access to Ubuntu and Debian packages. That provides scope for trying new things out. Yet its extensibility is somewhat hindered by the fact that such programs are not organised in a central repository. The user has to hunt for `.deb` releases or maintain an ever-growing list of PPAs. This is not a deal braker, but it does pose a concern when it comes to maintenance.

Users such as myself, who tend to explore and then adapt every aspect of their computing, require a system that is easier to customise without compromising its underlying integrity. Arch Linux promises exactly that. The very installation process is based on the premise that the user is willing to control everything pertaining to their setup. There are no preconfigurations. No 'defaults' and pre-installed packages to deal with.

Arch keeps things limited to the bare essentials. Everything else is a choice. As for package management, there exists the Arch User Repository (AUR) as an addition to the official ones. AUR includes every package I have ever searched for. With a bit of care, it is as reliable as its official counterpart.

## The initial setup

I set up Arch using the Feliz installer. Perhaps the use of such a script does not count as the 'canonical' way of doing things. However, it is a convenient option that does not detract from the end result. The manual process may offer a didactic experience of understanding the ins and outs of the system, which can prove useful for debugging various issues. Ultimately though, we care more about the day-to-day usage that happens post-installation. Feliz and any similar software is just fine in that regard.

I had tried out all major desktop environments except GNOME, so this has been my choice. My first impressions are positive. It is easy to use and configure to your liking.

The first thing I install once I log in is a new system font. Seriously. My choice is Fira Sans Semibold for window titles and the regular variant for all the rest. My monospaced choice as of late is Iosevka Term, though I do also like Hack and Source Code Pro.

Then I add the various parts of my web development workflow. Ruby Bundler, nodejs, npm, and git.

My terminal emulator is Terminix, though I might eventually switch back to Terminator. Speaking of the terminal, I tend to do lots of typically GUI work from the command line. I listen to my music collection with CMUS. My task manager is Taskwarrior. Mutt with Vim as its editor handles my email needs, while Abook stores my contacts. As for RSS/Atom feeds, there is Newsbeuter to keep things simple.

What I still need to settle on is a text editor for my web development needs. I am not sure if Atom, an Electron app, is the optimal choice, even though I do appreciate its features (and have created [40+ themes for it](https://protesilaos.com/schemes/)). Vim is okay, but I have yet to figure out how to use it with a tree view for folders, a 'minimap' of the entire code, and that kind of stuff. The default GNOME text editor has proven surprisingly good in the meantime. I might actually explore its potential (and perhaps port my colour schemes over).

I also maintain Libre Office on my machine. From my limited exposure to it, I can tell that it is quite an impressive piece of software. Still, I am not its target audience. For me plain text always is the preferred format. I keep it there for those cases where a colleague from my politics-related work sends me a `.docx` file.

Lastly, there is some eye candy to consider. I use the popular Arc theme. Though not the ones that try to emulate the macOS. Just [the standard version](https://github.com/horst3180/arc-theme).

## Also using Antergos

The case with the Feliz script only applies to one of my two computers. The other, an old MacBook Pro, is configured to run Antergos. I have seen this being described as a de facto Arch Linux 'installer', though I prefer to consider it a fully fledged distro.

Semantics aside, Antergos is a superb choice for getting a preconfigured Arch-based experience, while respecting the much-touted KISS principle. It has a neat installer and does not deviate fundamentally from the Arch paradigm. This makes it my second choice after Linux Mint for users new to the GNU/Linux world.

With all that noted, the purpose of any operating system is to make you productive. I have done my fair share of 'distro hopping', though only for the sake of finding the best system for my needs. Arch Linux, be it the vanilla install or Antergos, has exactly what I have been looking for.

Finally, a public service reminder. If you like a certain piece of free and open source software, try to set aside some money for donating to its development. GNU/Linux is *free* as in freedom (libre), though not necessarily as in beer (gratis).
