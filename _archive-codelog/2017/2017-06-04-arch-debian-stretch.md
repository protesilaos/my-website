---
title: "Switched from Arch Linux to Debian"
subtitle: "Arch is wonderful but stability is more so"
excerpt: "My switch from Arch Linux to Debian 9 (stretch) is due to a change in priorities. Stability comes first."
date: 2017-06-04
permalink: /codelog/arch-debian-9-switch/
---
Let me preface this article with a little bit of history as to how I got here. About a year ago I moved from macOS to GNU/Linux full time. I had been using free software systems for several years and had installed Ubuntu and derivatives on a number of machines. However, I never had the chance to dig deep into the internals in order to appreciate the added value of GNU/Linux. I just treated it as a matter of convenience.

My first libre OS of choice was Linux Mint 17.3. I still consider this to be a top tier distribution, not just a newbie friendly choice. It delivers exactly what one would expect from a desktop computer. The 'problem' with Mint is that it works so well out of the box that there is little to no need to ever use the command line and, more generally, learn about what does what in the system. 

Realising the potential for knowledge, I migrated over to Arch Linux where I learned, among others, the importance of a package manager for the OS (pacman is superb, but the AUR is overrated). I also appreciated the extra care it takes to maintain the system in good standing. Arch was a didactic experience, one that allowed me to, among others, experiment with all major desktop environments as well as some tilling window managers.

Thanks to Arch I enriched my understanding of the GNU/Linux world and am now able to use even a 'beginner' distro for rather advanced purposes. 

## Debian 9 and my desktop environment

I am an Xfce user, while most of my day-to-day computing happens in the terminal. With the exception of a few packages, I have no real need for the latest and greatest. Major Xfce updates are few and far between. The same is true for Vim, Mutt, Newsbeuter, Cmus, Taskwarrior. Even my hardware is pretty standard, which means that I always stick with the LTS kernel. With this kind of setup the added value of Arch's bleeding edge approach is negligible.

Seeing as Debian 9 is a few days away from its official release, I decided to switch to it. I have seen Debian being described as a newbie OS, but I find that notion to be largely mistaken. Out of the box it offers a very basic setup. The user needs to configure all sorts of things to their liking. Which is where my experience with Arch comes in handy. Configuring the mirror lists is straightforward. The transition from pacman to apt is much easier than I had expected. As for package versions, Debian 9 is not far behind the bleeding edge. Everything I need is usable and very reliable.

## Avoid the FrankenDebian aberration

Debian is central to a great deal of things in the GNU/Linux world. There probably is a `.deb` package out there for every kind of program. And therein lies a potential vector for *instability*. Much like Arch's AUR, access to a large pool of software does not go hand-in-hand with reliability.

It is trivial to install stuff from random sources, make heavy use of backporting, and the like. But this sort of practice will most certainly engender package conflicts, cause breakage, and make things difficult when full upgrades are needed.

In short, sticking to the official repos and keeping things where they are intended to be is the most reliable course of action.

## The desktop is critical too

The main tenet of Debian is to prioritise stability over recency. This is much appreciated and indeed implemented in mission critical contexts. Not so much on the desktop though, where running the latest and 'greatest' tends to be the norm.

My understanding is that the much-touted average user is much better off having a stable system, given that they may have a lot of trouble fixing any breakage. As for the more advanced user, it seems that most tools are maintained at a state where they are fully functional, always with the option to cherry pick on updates via backports. The cases where the bleeding edge is preferred to the baseline tends to be the exception rather than the norm.

The desktop is critical too. Losing data, or wasting valuable time debugging the system is not particularly appealing. Though that can still be a good learning experience, instability or the higher risk of breakage end up being a distraction that hampers productivity.

Debian is rock solid. I would still not recommend it to someone with little experience of GNU/Linux. For those cases there is Ubuntu and friends or Linux Mint. I recall finding Debian 7 and 8 extremely difficult to work with. It is my newly acquired knowledge from Arch that makes me feel comfortable with the Debian way and the rather austere approach it has on package management and maintenance.

What I tell people is to give Arch Linux a fair chance. They will be grateful. If they are okay with the occasional need to reconfigure their system, they can stick with that OS. But for anyone just interested in getting things done, I can only point them towards Debian or, at least, some of its derivatives.

As for the itch to try new things, I do maintain an old laptop on the Debian sid (unstable) branch. But seeing as this does not have support for security patches, it should not be treated as a fully fledged rolling release distro for everyday use.

Stability is a bliss, especially when the priority is on getting work done.
