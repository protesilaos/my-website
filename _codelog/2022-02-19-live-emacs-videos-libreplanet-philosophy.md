---
title: "Live stream: Emacs, LibrePlanet 2022, philosophy"
excerpt: "A live talk about my Emacs videos, LibrePlanet 2022, and philosophy-related presentations."
layout: vlog
mediaid: "pKnKDJqI3Ro"
---

On Saturday 2022-02-19 at 12:30 +0200 I will hold a live stream.  The
text of the presentation (`org-mode` notation):

```org
#+TITLE: Live: Emacs videos, LibrePlanet 2022, philosophy presentations
#+AUTHOR: Protesilaos Stavrou (https://protesilaos.com)
#+DATE: 2022-02-19

Hello everyone!  I have been meaning to do a live stream for a while
now, but could not make it happen due to various reasons: the weather
was bad, my Internet connection was intermittent, there always was
maintenance work for my Emacs packages as well as new releases...  You
get the idea.

Anyhow, I have some brief announcements to make and then we can check
the chat for any questions.  I posted the schedule for this stream about
30 minutes ago, so I don't expect anyone to show up.  No worries!  You
will get the recorded version.



* Completion UIs in the modus-themes

Earlier this week I published version =2.1.0=: it is already available
in all the package archives and emacs.git.  However there is a set of
stylistic constraints in the user option ~modus-themes-completions~.  I
am currently finalising its refactoring so that it accepts an ~alist~
type of value.  **This is a backward incompatible change** meaning that
old values will be ignored gracefully: you will get the default looks
and will need to update ~modus-themes-completions~ according to its new
documentation.

Sample of the far more powerful/flexible redesign:

#+begin_src emacs-lisp
(setq modus-themes-completions
      '((matches . (extrabold background intense))
        (selection . (semibold accented intense))
        (popup . (accented))))

;; OR the same list of properties for all keys:

(setq modus-themes-completions
      '((t . (extrabold intense))))
#+end_src

Once this refactoring is complete, I will publish version =2.2.0=.  This
will be an exception to the rule, as I normally tag a release every
month or so.

The change log entry will explain the details.  Thank you for your
understanding!



* My talk at LibrePlanet 2022

I will deliver a presentation about Emacs and the notion of "living in
freedom".  Most of it will be philosophical, though there will be
technical insights about Emacs and its practical use as a liberating
program.

LibrePlanet is an annual event organised by the Free Software
Foundation: https://libreplanet.org/2022/.

I still cannot be more specific about the event.  This will change in
the coming days or weeks.  Please stay tuned on my website's code blog
section: https://protesilaos.com/codelog.



* No more Emacs tutorials/demos

I have decided to talk about Emacs only in relation to some wider theme,
such as what I will do at LibrePlanet 2022.  The reason is that I no
longer have time to do videos about Emacs AND also maintain my Emacs
packages: the latter take up most of my free time already and I think
they deserve to be prioritised.

As an aside: the disproportionate workload is one of the reasons I
removed =use-package= from my dotemacs.  Making my setup considerably
/harder to reproduce/ raised the barrier to entry, thus sorting out low
effort questions I would receive practically on a daily basis.  I always
made it clear in the README that my dotfiles are not a distro or
something you just plug-n-play, but here we are...  This is consistent
with my position against spoon-feeding new users---and you already know
I take documentation very seriously, which is not the same thing.



* Philosophy videos

I already published two long presentations on philosophy.  There are
many more to follow.  My approach is to be understandable to a general
audience.  You do not need to have studied philosophy before, though
that definitely helps.

The thing with philosophy is that you can say something profound without
sounding or looking profound.  There is no need for certificates, other
figments of social status, professorial palaver, increasingly obscure
jargon...  This is how I live philosophy, anyway, and will stay that
way.

I understand no-one necessarily signed up to this channel for that type
of content.  Now is a good time to search for alternatives.



* Moving to the live chat

So that's all for today folks.  Thank you for your attention!  I will
now read the chat, in case there is anything there, otherwise I am
closing this.
```

* * *

The video thumbnail is a tweak of the Levitating, Meditating,
Flute-playing Gnu under the terms of the GNU General Public License:
https://www.gnu.org/graphics/meditate.html
