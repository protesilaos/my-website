---
title: "Live stream: My Emacs packages and other publications"
excerpt: "A live talk about my Emacs packages and other publications."
layout: vlog
mediaid: "tcvOd_yvBdI"
---

**UPDATE 2022-04-26 13:46 +0300:** Added the text of the presentation.

On Tuesday 2022-04-26 at 14:00 +0300 I will hold a live stream.  The
main topic will be an overview of [my packages for
Emacs](https://protesilaos.com/emacs).  I will also briefly talk about
my other publications.  Then I shall join the chat to comment on any
remarks or comments made by the audience.

```org
#+TITLE: Live: My Emacs packages and other publications
#+AUTHOR: Protesilaos Stavrou (https://protesilaos.com)
#+DATE: 2022-04-26

Hello everyone!  My name is Protesilaos, also known as "Prot".  I
realised I had some free time this afternoon, so I decided to do this
live stream.  Unfortunately, I could not announce it long in advance.

What I want to do today is provide you with a status update on what I
have been doing.  Most of it is about Emacs, though I will briefly
mention a few other publications.

* My newest package: =fontaine=

I pushed the initial commits shortly before doing this video and there
still are some minor tasks I need to finalise.  An easy-to-install
package will be available in the coming days (let's say before the end
of this week).

Fontaine lets the user manage font configurations using presets.  For
example, you can have a =regular= preset for your everyday editing and a
=presentation= preset for when you need a different set of fonts.  Let me
show you in practice, by invoking the command ~fontaine-set-preset~.

A preset looks like this:

#+begin_src emacs-lisp
(regular
 :default-family "Iosevka Comfy"
 :default-weight normal
 :default-height 100
 :fixed-pitch-family nil ; falls back to :default-family
 :fixed-pitch-weight nil ; falls back to :default-weight
 :fixed-pitch-height 1.0
 :variable-pitch-family "FiraGO"
 :variable-pitch-weight normal
 :variable-pitch-height 1.05
 :bold-family nil ; use whatever the underlying face has
 :bold-weight bold
 :italic-family nil
 :italic-slant italic
 :line-spacing nil)
#+end_src

All are stored in the user option ~fontaine-presets~.

Stay tuned on my website's code blog section for related updates:
https://protesilaos.com/codelog.

* Last week's packages: =cursory= and =tmr=

Last week I published two new packages on GNU ELPA (the official package
archive of Emacs).

+ =cursory= is the same concept as =fontaine= though the implementation
  details differ considerably.  The user can define preset cursor
  styles, which control everything from the shape of the cursor to its
  blinking interval.  Changing between presets is possible via a command
  that prompt for completion: ~cursory-set-preset~.  I use this to quickly
  switch between an "editing friendly" style and a "presentation mode"
  alternative.  The former is a faster blinking bar or underscore, while
  the latter is a slow blinking box.

+ =tmr= is a simple package for setting a timer.  Once the timer elapses,
  it sends a desktop notification and plays a sound.  Timers are set via
  the ~tmr~ command using a convenient notation.  If you give it a plain
  number, it interprets it as N minutes.  If you add an =s= suffix, then
  the number is in seconds, while an =h= suffix refers to hours.  Timers
  can have an optional description, such as "bake bread" and "prepare
  tea".  A buffer containing the log with the timer starts and ends is
  available, while another command lets the user cancel a running timer.

If you try them out, please let me know if there is something you think
we could improve or change.

* Other Emacs-related updates

1. I have migrated all my Emacs packages to SourceHut.  Each of them now
   references its new git repo and corresponding mailing list.  Example
   for the =modus-themes=:

   + Homepage: https://protesilaos.com/emacs/modus-themes.
   + Git repository: https://git.sr.ht/~protesilaos/modus-themes.
   + Mailing list: https://lists.sr.ht/~protesilaos/modus-themes.

   Mirror on GitHub and GitLab are available, in case you prefer to use
   those platforms.

2. The development of my =mct= package is put on hold.  I have decided to
   discontinue it due to changes in emacs.git which indicate that Emacs
   will have its own mct-like capabilities.  It is not useful to
   replicate what is already built into Emacs, nor it is worth
   developing against a moving target.  As an alternative, I encourage
   to try what Emacs 29 has to offer or use the =vertico= package by
   Daniel Mendler (what I am using right now).

3. I gave a lengthy interview to InfoQ China about Emacs and some
   everyday-life issues:
   https://protesilaos.com/codelog/2022-04-10-interview-infoq-china-emacs-life/.
   Thanks to Kimmy Luo (罗燕珊) for doing this!

4. My =pulsar=, =logos=, =lin= have all been updated to their latest versions.
   They are stable and am very happy with what they offer.  More links
   and relevant information: https://protesilaos.com/emacs/.

* Publications on philosophy

In February, during my last live stream, I said that I was planning to
do more videos on philosophy.  All three videos I recorded were done in
that month, but I have not had the time to prepare another one.  The
plan remains the same and I hope to produce a new entry in the coming
days (no promises though).  The current entries in this series:

+ 2022-02-21 Conventions, relativism, and cosmopolitanism:
  https://protesilaos.com/books/2022-02-21-relativism-cosmopolitanism/.
+ 2022-02-16 Ataraxia, moderation, and mysticism:
  https://protesilaos.com/books/2022-02-16-ataraxia-moderation-mysticism/.
+ 2022-02-05 Cosmos, Logos, and the living universe:
  https://protesilaos.com/books/2022-02-05-cosmos-logos-living-universe/.

I have, nonetheless, written at length on philosophical themes.  One
such case was the presentation I did for LibrePlanet 2022 about Emacs
and living in freedom:
https://protesilaos.com/codelog/2022-03-22-libreplanet-emacs-living-freedom/.
Other publications are posted in the "commentary" section of my website,
as they pertain to various practical cases.  Since early March, I have
these:

+ 2022-04-26 On ambitious goals, expectations, and false wants:
  https://protesilaos.com/commentary/2022-04-26-ambitious-goals-expectations-false-wants/.
+ 2022-04-18 On specialisation, moderation, and difficult life choices:
  https://protesilaos.com/commentary/2022-04-18-specialisation-moderation-life-choices/.
+ 2022-04-07 On Cosmic transfiguration and the afterlife:
  https://protesilaos.com/commentary/2022-04-07-transfiguration-afterlife/.
+ 2022-04-06 On relationships, expectations, and dehumanisation:
  https://protesilaos.com/commentary/2022-04-06-relationships-expectations-dehumanisation/.
  *READ IT WITH AN OPEN MIND*.
+ 2022-03-06 On wisdom guiding the action:
  https://protesilaos.com/commentary/2022-03-06-wisdom-action/.
+ 2022-03-06 About the world as simulation:
  https://protesilaos.com/commentary/2022-03-06-cosmos-simulation/.

* Publications on politics

I always want to write more about politics, but I seldom have the free
time to commit to the task.  I still managed to write two essays this
month:

+ 2022-04-13 A leftist perspective on the war in Ukraine:
  https://protesilaos.com/politics/2022-04-13-leftist-view-ukraine-war/.
+ 2022-04-22 Comment on “Why 1% Of The World’s Population Controls 45%
  Of The Wealth”:
  https://protesilaos.com/politics/2022-04-22-comment-inequality/

* Concluding remarks and time for the live chat

That's an overview of what I have done since the last live stream.
Obviously, this does not cover the minutia of developing the Emacs
packages, writing documentation, dealing with discussion on the mailing
lists, et cetera.

If there are any questions or remarks in the live chat, I will address
them now.
```

* * *

The video thumbnail is a tweak of the Levitating, Meditating,
Flute-playing Gnu under the terms of the GNU General Public License:
<https://www.gnu.org/graphics/meditate.html>.
