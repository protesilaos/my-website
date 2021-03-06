---
title: 'My Modus themes are now shipped with Emacs'
excerpt: 'Video presentation about what it means for my highly accessible themes to be part of the upstream Emacs distribution.'
layout: vlog
mediaid: 'a3GW9kxmpqA'
---

I am happy to announce that my highly accessible themes for Emacs,
`modus-operandi` (light) and `modus-vivendi` (dark), are now part of the
upstream Emacs distribution.

In this presentation I explain what this means and what my plans are for
the future.  I also use this opportunity to express my gratitude for the
help I have received over the last year or so that I have been
developing the Modus themes.

Below is the text of the presentation.  I explained how to make a video
such as this one in a recent demo that I published.  Make sure you check
my backlog and my dotemacs (or just contact me if you cannot find them).

## Text of the presentation

```org
#+TITLE: The Modus themes are built into Emacs
#+AUTHOR: Protesilaos Stavrou · protesilaos.com
#+DATE: 2020-08-27

* The Modus themes are in the Emacs 'master' branch

As of commit =c1b0515=, my two accessible themes are bundled up together
with the upstream Emacs distribution.

In case you do not know, these are the themes I use in all my videos:
=modus-operandi= (light) and =modus-vivendi= (dark).  They are designed to
conform with the /highest accessibility standard/ for colour contrast
between background and foreground values in any given combination.  The
standard's technical name is "WCAG AAA": it represents a minimum
contrast ratio of 7:1.

The themes are in Emacs' =master= branch.  Only people who track the
latest developments will receive them.  Most users run a stable release
of Emacs, the latest of which is version =27.1=.  Whereas the current
state of development is on version =28.0.50=.

So if you are on a stable release /you still need to install the
packages/: directly from git, or from MELPA, MELPA Stable, GNU ELPA,
Guix, Debian (now in Sid and eventually in next-stable).

** Backstory on how it happened

Earlier this week Stefan Kangas, a core Emacs contributor, opened a bug
report (#43019) asking to include the themes in Emacs.  I was added in
Cc, as well as Eli Zaretskii, Emacs' maintainer.

Eli approved of the request.  They asked for my permission to use the
themes.  I said "yes" but told to wait a few more days to prepare a new
tagged release that was already planned.

Once I notified them of the new release, Stefan Kangas pushed the
changes to =master=.  So here we are :)

** Emacs bundles the latest tagged release of the themes

I have decided at this early stage to share the most recent stable
version of the themes.  We are on version =0.12.0= as of this recording
(have been releasing them on a monthly cadence).

Normally I would have synced the latest commit from my project, but this
is not possible right now because I do not have push privileges to
Emacs' git repository.  Instead, I must contact the mailing list so that
someone else will make the changes for me.

As you can imagine, it would be too difficult to go through such a
process each time I wrote a change to the themes.

If I ever gain direct access to upstream Emacs, then I will happily sync
the built-in themes with the latest state of my =master= branch.

** Next steps

I have no plans to slow down.  There have been almost 1.000 commits in
about a year, since I started the project.  Many of them are tricky and
have required lots of testing.

I consider it my duty to give something back to this community that has
greatly helped me with my day-to-day computing experience (free/libre
software in general and Emacs in particular).

Some highlights:

+ The themes are *highly configurable*.  There are lots of customisation
  options that control the looks of practically everything.

+ A new HTML version of the Modus themes' README is available on my
  website: https://protesilaos.com/emacs/modus-themes

+ Preparations have already started for the next tagged release, which
  will become version =0.13.0= (tentative).  It will be synced with Emacs
  once it is published.

+ Earlier today I pushed a commit that introduces a new customisation
  option for controlling the overall looks of diffs (=magit=, =diff-mode=,
  =ediff=, =smerge-mode=, =vdiff=).  Let me demo it right away!

* A community effort

I have been working on the Modus themes ever since I started using Emacs
a bit more than a year ago.  The first stable release was in
November 2019.  Lots of users have helped me ever since.

I wish to thank the following people for their contributions during this
time (sort A-Z).

+ Anders Johansson :: Sent the first patch which inspired me to develop
  more advanced customisation options (employing =if=, =pcase=, etc.).
+ André Alexandre Gomes :: Helped me test and ultimately fix tricky yet
  critical issues with byte compilation.  Also influenced the design of
  several Org interfaces.
+ Basil L. Contovounesios :: Simplified the code for evaluating faces.
  Also fixed some errors and inconsistencies.  Basil is a core Emacs
  contributor and seems to specialise on precise, surgical edits.
+ Damien Cassou :: Helped me identify potential issues with =flycheck=
  (and =flymake=), =notmuch=, and Magit's blame interface (=magit-blame=).
+ Dhavan Vaidya :: The maintainer of the Debian package that includes
  both themes (currently in Debian Sid).
+ Len Trigg :: Introduced the idea of reusing or overriding theme
  colours in user configs.  There are DIY options (check README).
+ Manuel Uberti :: Sent feedback in a multitude of issues, helping me
  add support for a tonne of packages and make =helm= look great.
+ Mark Burton :: Several issues that improved the looks of Org tables
  and Org agenda.

Continues…

** A community effort (continued)

+ Murilo Pereira :: Reported the first issue, which helped me realise
  the need for more colour variation to meet the needs of Emacs.
+ Shreyas Ragavan :: Offered insights over a range of issues and
  maintained a keen eye for tricky details.  Helped improve support for
  packages.
+ User "Ben" :: Recommended improvements for "mixed fonts" in Org.  Also
  helped with the aesthetics of =tab-bar-mode= (Emacs 27) and related.
+ User "dinko" :: Identified an incorrect expression that related to the
  Org "rainbow blocks" style (see README for custom options).
+ User "Fourchaux" :: Identified the bug with byte compilation.  Also
  reported other issues with colour inconsistencies.
+ User "okamsn" :: Suggested a refactor of all bold weights.  This lets
  users specify what "bold" means, such as =semibold= (see README).

Also thanks to everyone else who opened an issue.

Aaron Jensen, Alexey Shmalko, Arif Rezai, David Edmondson, Davor Rotim,
Divan Santana, Fredrik, Gerry Agbobada, Gianluca Recchia, Michael
Goldenberg, Moesasji, Pierre Téchoueyres, Ryan Phillips, TheBlob42,
Thibaut Verron, Trey Merkley, Uri Sharf, Vincent Foley, doolio, tycho
garen

I do not know who maintains the Guix packages.  Please let me know, so
that I can add it in the README.  Thanks anyway!

All contributions are valuable.  They help me improve things.

** Indirect contributions

Thanks to Fabrice Niessen, the Leuven theme's developer, for maintaining
such a popular project and for offering inspiration on one of the
customisation options I defined (Org sectioned headings).

Thanks to Bozhidar Batsov, the maintainer of, /inter alia/, the Emacs port
of the Zenburn theme, from whence I copied a =defmacro= that helped
improve the way the themes would set their colours.  This macro also
allows for the advanced DIY customisation options I already mentioned.

** Thanks to others

I must also express my gratitude to these core Emacs contributors:

+ Stefan Monnier :: A long-time Emacs contributor and the driving force
  behind GNU ELPA.  Emacs =master= takes the themes from there.
+ Stefan Kangas :: For setting things in motion that eventually led to
  the inclusion of the themes in Emacs.
+ Eli Zaretskii :: Approved of the request to include the themes and
  recommended a NEWS entry to announce their inclusion.

Personally, I have benefited immensely from the contributions of Omar
Antolín Camarena.  Omar is the developer of several packages that I use
in my dotemacs.  I learnt a lot from his code, but also from answers he
gave to my questions.

* “Form follows function”

In conclusion, I wish to say that we can always benefit from more
contributions about the overall design of Emacs.

There was a mega-thread on the emacs-devel mailing list a little while
ago covering the broad theme of “why is Emacs so square?”.  It
highlighted the fact that we need more motivated individuals to do work
on the aesthetics of Emacs.

Which brings me to the adage of “form follows function”.  While I agree
with its salient point, I think it obfuscates the fact that /there is no
such thing as formless function/.  A developer will have to come up with
some kind of presentation.  There always exists some implicit design
philosophy.

So what we really need is to somehow bring together those who are
focused on the mechanics of things with those who can help build more
usable interfaces.

We use computers to make our life easier.  We must not fall into the
trap of assuming as constant the transient constraints imposed by a
given implementation.  The status quo is not an excuse for inertia.

You can always help, even if you have no knowledge of how Emacs works or
know how to code.  Even reporting an issue is a good start.  Anything
that helps refine the looks of Emacs is a step in the right direction.
```
