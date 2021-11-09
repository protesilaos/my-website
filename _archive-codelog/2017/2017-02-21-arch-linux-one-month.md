---
title: "Arch Linux: a month later"
subtitle: "An all-round reliable distro"
excerpt: "My experience with Arch is largely positive. After experimenting with customisations, I have settled on my preferred setup."
date: 2017-02-21
permalink: /codelog/arch-linux-one-month/
---
I have been doing all of my computing on a GNU/Linux machine for the last six months or so. I started off with Linux Mint: a distro that I have used before on a number of occassions and which I continue to consider the best option for newcomers. At the turn of the year I decided to make the switch to Arch Linux. My motivation was two-fold: (i) have immediate access to the latest package releases, and (ii) be able to customise the OS to my liking.

After an extended phase of experimentation with various customisations and combinations, I have settled on a fairly standard setup based on the Cinnamon desktop environment. I do like the XFCE4 and MATE desktops, but both are based on older frameworks. My concern is that some app I would absolutely need would not be backward compatible for them (maybe this assumption is completely misplaced, as I have yet to come across such a scenario). As for GNOME 3 and Plasma 5, I find the former to be more suitable to a touch device, and the latter to be unnecessarily complex in the options it offers. Neither satisfies my needs. 

Customisation should be done in moderation. Or so I learned. Going all out with fancy tools such as compiz is cool at first, but ultimately detracts from productivity. There is always some minute issue that could be tweaked further. The attention turns to the superficialities rather than the substance. My experience suggests that customisation is good only insofar as it removes perceived friction. Even 'eye candy' can fall in that category, such as when changing the theme helps stare at the screen for longer periods. But beware of the law of diminishing returns and the potentially negative returns to scale! Constant tweaking for the sake of change is bad.

Based on my usage thus far, Arch has three strengths:

1. its comprehensive wiki;
2. its minimal, DIY approach;
3. the Arch User Repository.

Arch has made my life as a web developer much easier. For example, I recall having to install Ruby on Linux Mint. It was a rather tedious process. I had to follow a guide and was ultimately unsure as to whether my configuration was robust to a range of possible bugs. On Arch it is a simple package, centrally controlled via pacman. Same with every Ruby gem.

Where Arch can get really tricky is on the AUR front. When I first tried to install the Atom editor, I was encountered with errors which originated from one of its dependencies (wrong PGP signature for nodejs-lts-boron). The exact problem was fairly easy to address, but it goes to show that unbridled use of the AUR can cause trouble and frustration down the way. I have thus adopted a conservative approach. I limit my AUR exposure by having all core functions rely on official packages. AUR is for complementary or otherwise non-critical stuff.

What my tour of the main DE's has offered me is a better understanding of toolkits and the range of experiences offered in the GNU/Linux world. For instance, I have found the XFCE4-terminal to be better suited to my needs than its GNOME counterpart. I like that it is easy to theme (see my [Prot16 collection](https://protesilaos.com/schemes/)) and use it within Cinnamon. It nonetheless is the case that most of my tools are DE-independent. Vim for writing and coding (I never use the GUI mode). Mutt for emails. Taskwarrior for task management. Cmus for music. Newsbeuter for RSS/Atom feeds. All are CLI tools.

Arch Linux offers near endless possibilities. There are so many aspects of the operating system that can be changed to one's liking. There is, however, a trade-off between stability and customisability. The source of possible errors does not seem to be with Arch's rolling release model, but with the idiosynracies of package combinations installed by the user. Every instance of the OS can be unique to the use case. For me, the power of Arch is best leveraged in expanding the core experience, such as by gaining access to the latest and greatest packages and fixes. To this end, I find this distro to be particularly reliable both with regard to its underlying stability and extensibility. The key to having both is moderation. At least that is the gist of it from a month or so of heavy usage.
