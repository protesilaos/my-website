---
title: 'How I forked lemonbar-xft'
excerpt: 'Steps to reproduce the up-to-date fork of lemonbar with support for fontconfig.'
date: 2019-06-24T00:00:00+00:00
---

I decided to maintain my own fork of Lemonbar with support for Xft,
because GitHub user _krypt-n_ [seems to have lost
interest](https://github.com/krypt-n/bar/pull/37#issuecomment-473265449)
in their project.

My fork is on GitLab:
[https://gitlab.com/protesilaos/lemonbar-xft](https://gitlab.com/protesilaos/lemonbar-xft).
Here I want to tell you the steps I followed to produce it.

Start by cloning upstream (all my links will be for SSH connections,
which require an appropriately-configured GitHub account):

	git clone git@github.com:LemonBoy/bar.git ~/lemonbar-upstream

Now also clone the fork with Xft support:

	git clone git@github.com:krypt-n/bar.git ~/lemonbar-xft-discontinued

Switch to the upstream repo:

	cd ~/lemonbar-upstream

Prepare to pull in the Xft fork:

	git remote add xft ~/lemonbar-xft-discontinued
	git fetch xft

Now create a new branch with the fork:

	git checkout -b xft-port

Then merge `master` into `xft-port`:

	git merge master

You are mostly done.  I just added an extra file that explains what this
fork is about.  It is named "README-xft" and has the following:

	Personal fork of Lemonbar with Xft support
	==========================================

	The purpose of this fork is to keep up with upstream while maintaining
	the changes by GitHub user krypt-n who seems to have lots interest in
	the project.[0]

	The contributions by krypt-n allow Xft support (to use typefaces
	supported by fontconfig).  Upstream Lemonbar appears to be unable or
	unwilling to merge them into master.[1]

	I have decided to maintain this project, because I want to use it as
	part of my custom desktop session on Debian 10 Buster.[2]

	[0]: https://github.com/krypt-n/bar/pull/37#issuecomment-473265449
	[1]: https://github.com/LemonBoy/bar/issues/188
	[2]: https://gitlab.com/protesilaos/dotfiles

Lastly, I did the following to push my fork to GitLab:

	git remote add lemonbar-xft-current git@gitlab.com:protesilaos/lemonbar-xft.git
	git push -u lemonbar-xft-current --all

Done!  Read my previous entry on [how to compile this fork on Debian 10
Buster](https://protesilaos.com/codelog/2019-06-23-lemonbar-xft-new/).
