---
title: "Running Debian (unstable) as a daily driver"
subtitle: "A decent rolling release distro"
excerpt: "My main computer has failed. Arch Linux is not available for 32 bits. A decent rolling release distro for such cases is Debian unstable."
date: 2017-05-23
permalink: /codelog/debian-unstable-daily-driver/
---
My main computer failed. All I have left is an old 32 bit laptop. Seeing as Arch Linux no longer supports 32 bit architectures, I had to find another rolling release distro that would allow me to reproduce my desktop environment with minimal friction. I did not want to go with any of the Ubuntu spins, nor did I wish to revisit Linux Mint. These are fine pieces of work, but they do not provide two things I am looking for:

1. easy access to the latest software versions;
2. a minimal setup out of the box.

After doing some research and the necessary 'distro hopping', I settled on Debian's unstable branch. This is the rolling release variant, which technically is not meant for end users. The reason for its existence is to effectively provide for a fully fledged testing environment where new packages can be scrutinised for critical bugs and security flaws. Packages that have nothing reported against them after a certain period of time are moved into the "testing" branch and then into the main—the "stable"—Debian base.

## Not for everyone

Debian unstable is for those willing to take risks with their operating system. Instability can lead to breakage and data loss. Such a potentially deal-breaking downside is counter-balanced by the luxury of having access to the latest software. At its core, it is a choice between reliability and innovation.

For my case coming from Arch, a rolling release can be very stable, provided certain conditions. The user has to be careful with their system's maintenance and assume full responsibility over it. That means regular system updates. Removing unneeded packages. Reading error logs and addressing them accordingly. Trying to minimise exposure to obscure or highly volatile software. Working with the package manager rather than installing things manually. In short, one needs to be meticulous and willing to invest the necessary time.

## Debian unstable looks good

After about a day or so of configuring things, I have managed to practically reproduce the work environment I had on Arch. The only item I am kind of missing is qutebrowser, though I find Firefox with the VimFX add-on to be an excellent substitute.

What remains to be done henceforth is gain a better grasp of all the commands pertaining to package management. Arch's pacman is superb. I wonder whether Debian's apt, apt-get, apt-cache, and the like can be just as good. Still, they do get the job done and am happy with choosing Debian as my new daily driver.

As to what I will do once I eventually get some new hardware: I will *probably* switch back to Arch. The current laptop may be repurposed as a reliable, low-maintenance system, with the help of Debian's stable variant.

Whatever the case, the plethora of options in the GNU+Linux world opens up so many possibilities. Just wonderful!
