---
title: "My plan to switch from Debian Unstable to Stable"
subtitle: "Rolling release is not needed for all use cases"
excerpt: "Plan to gracefully migrate from Debian Sid to the next Debian Stable. Use APT sources and preferences. Run a system that is not bleeding edge."
date: 2018-10-05
permalink: /codelog/debian-sid-stable-plan/
---
I am currently running Debian Unstable (aka "Debian Sid") on three
machines.  I think it is an excellent choice for anyone looking to use
Debian while still deploying a rolling release Operating System.  As my
priorities are changing, I want to transition to the stable branch.
With Debian Buster expected some time in mid-2019, here is my plan for
enacting such change.

## A bit of context first

I was an Arch Linux user prior to migrating to Debian some ~16 months
ago.  Debian's unstable branch was the natural choice for making the
switch as seamless as possible.  I did not want to disrupt my setup.  It
was dependent on some of the features that were available in the newer
package versions provided by Arch.

So here I am about 1.5 years later.  Fully satisfied with the decision I
made.  Debian Sid has been excellent thus far.

That granted, I find the much-vaunted advantages of a rolling release
distribution to be context-dependent.  It matters what software you rely
on and whether any new features are integral to your workflow.

Put simply, if you want to run a KDE Plasma or a GNOME desktop with all
the new niceties, then rolling release or something closer to the
bleeding edge is the way to go.  If, however, you do not care about
newer technologies like Wayland, and are running a custom working
environment such as my BSPWM (see [my
dotfiles](https://gitlab.com/protesilaos/dotfiles)), then the
maintenance overhead of a rolling distro outweighs the potential
benefits of having the latest version of everything.

Most tools I rely on are CLI programs.  These do not change much.  For
example, I use `neomutt` as my mail client.  All the features I need are
already available.  If `neomutt` were to retain its feature set forever,
I would still be happy with it.  Same with `newsboat`, `taskwarrior`
(executable is `task`), `tmux`…  And the list goes on.

## The plan for switching to Debian Buster

This is **highly experimental.**   I am **not an expert in Debian**
system administration.  **I do not recommend you try this.** Especially
not on mission critical systems.
{:.critical}

Debian Buster (aka Debian 10) is expected a bit less than a year from
now.  This is the right moment to prepare for the transition from
Unstable to the next Stable.  It gives my systems enough time to
gradually settle in the state of the current Debian Testing branch and
keep track of it while it enters the feature freeze.

The plan hinges on APT and involves some basic pinning preferences.  I
want to run a *mixed distribution* that includes sources from both
`testing` and `unstable`. 

These are my apt sources:

    # Security updates (stable)
    deb http://security.debian.org/debian-security stable/updates main contrib non-free
    deb-src http://security.debian.org/debian-security stable/updates main contrib non-free

    # Debian Testing
    deb http://ftp.gr.debian.org/debian/ testing main contrib non-free
    deb-src http://ftp.gr.debian.org/debian/ testing main contrib non-free

    # Debian Unstable
    deb http://ftp.gr.debian.org/debian/ unstable main contrib non-free
    deb-src http://ftp.gr.debian.org/debian/ unstable main contrib non-free

And here are the corresponding preferences: 

	Package: *
	Pin: release a=testing
	Pin-Priority: 500

	Package: *
	Pin: release a=unstable
	Pin-Priority: 200

These instruct `apt` to keep track of packages from the `testing` branch
and only look at `unstable` when requested packages are not available
there.  Given enough time, it will make my Debian Unstable systems
indistinguishable from Debian Testing.

The inclusion of the `debian-security` sources is for those cases where
a package has migrated directly from `unstable` to `stable`.  Examples
that come to mind are the latest `firefox-esr` and `thunderbird`.

When the feature freeze starts, I will effectively be running Debian
Testing, which is the pre-release of the next stable distribution.

Then the idea is to follow the announcements about when Debian 10 will
become available.  A few days prior to its official release, I will edit
my `apt` sources again to look like this:

    deb http://ftp.gr.debian.org/debian/ stable main non-free contrib
    deb-src http://ftp.gr.debian.org/debian/ stable main non-free contrib

    deb http://security.debian.org/debian-security stable/updates main contrib non-free
    deb-src http://security.debian.org/debian-security stable/updates main contrib non-free

    # stable-updates, previously known as 'volatile'
    deb http://ftp.gr.debian.org/debian/ stable-updates main contrib non-free
    deb-src http://ftp.gr.debian.org/debian/ stable-updates main contrib non-free

Notice that I added a few more entries, which I adapted from the default
options that are provided on a clean Debian 9 install.  *These are
subject to change.*

Once I have the new sources in place, I will remove the aforementioned
pinning rules.  I only want to track `stable`.

## Learning by doing

Debian does not officially support any graceful move from Unstable to
Stable.  *This is highly experimental.*  I have backups in place in case
something goes awry.

The truth is I have had no issues whatsoever with Debian Sid.  But that
is partly due to my diligence with system administration.  It takes time
and dedication; resources that could be managed more efficiently.  Given
that my main tools do not need to be on the bleeding edge, such
commitment offers a marginal benefit at best.

The afore-described venture would presumably fail miserably if I were
running major software groups that update frequently, such as GNOME or
KDE.  All I now have on my systems apart from the core packages is BSPWM
and related extras, my CLI tools, Firefox and Thunderbird, and Xfce as a
backup Desktop Environment (before I had GNOME and MATE).

I expect the transition to the next Debian Stable to be smooth because I
am not trying to rush things and downgrade packages in bulk.  What is
basically happening is a self imposed package freeze in anticipation of
the official introduction of Debian 10.  Some manual downgrades may
still be required, but these should be limited in scope or at least
easier to figure out.
