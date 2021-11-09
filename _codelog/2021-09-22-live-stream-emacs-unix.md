---
title: "Live stream: Emacs and the Unix philosophy"
excerpt: "A talk about how GNU Emacs fits into the Unix philosophy."
layout: vlog
mediaid: "FmOYj0SyKfg"
---

This was a live stream that got recorded.  It started on 2021-09-26
13:00 +0300 and lasted for about two hours.

I talked about the persistent question of how Emacs conforms with the
Unix philosophy, what it means for a set of views to constitute a
philosophy, whether those tenets are generalisable, and what lessons may
be learnt from them for our day-to-day computing.

After the presentation was concluded, I joined the live chat for further
comments on a variety of issues.

The text of my talk is copied below.  It is written in Org notation:

```org
#+TITLE: Live: Emacs and the Unix philosophy
#+AUTHOR: Protesilaos Stavrou (https://protesilaos.com)
#+DATE: 2021-09-26

* How I approach the Emacs VS Unix problématique

Hello everyone!  My name is Protesilaos, also known as "Prot".  In this
live stream, which is being recorded as well, I will talk to you about
the Unix philosophy and how Emacs conforms with it while addressing its
main usability flaw.  The show notes are available on my website:
https://protesilaos.com/codelog/2021-09-22-live-stream-emacs-unix/

My approach to today's topic is informed by my experience as someone who
had used a combination of a tilling window manager, Tmux, Vim, various
ncurses-based programs (e.g. Mutt), and command-line utilities for years
before consolidating around GNU Emacs.  My perspective is further
informed by my background as a social scientist and, ultimately, a
philosopher.  Not as a programmer, though these days I do code a lot for
recreational or educational purposes.

In this presentation I will make arguments against dogmatism; against
misunderstandings in what Unix stands for and how it must work in the
real world.  I will also critically assess the vaunted notions of
minimalism and so-called "bloat" as they pertain to software and discuss
what the appropriate attitude should be when thinking about this and
concomitant issues.  The key word is "attitude": the disposition we
ought to have in order to avoid becoming dogmatic.

This is my second video on the topic.  I did one a couple of years ago,
shortly after I switched to Emacs.  I have also published an article:

+ Emacs mindset and Unix philosophy:
  https://protesilaos.com/codelog/2019-08-09-vlog-emacs-unix/
+ Comment on Unix versus Emacs:
  https://protesilaos.com/codelog/2020-12-28-comment-unix-vs-emacs/

The reason I am doing this again is because I keep getting questions
about my experience with Emacs; questions which typically reveal
deep-seated assumptions that are either outright untrue or ill
considered.

In short, much of this talk will be about theoretical issues.  While I
understand that coding is a technical endeavour, I still believe there
are important insights to be drawn from theoretical work; insights which
will eventually find their application in everyday scenaria.  Besides,
we cannot afford to assume the Unix philosophy as a technical constant
when it clearly is formulated as a /philosophy/.

Finally, note that I will participate in the live chat after I conclude
this presentation.  If you have any questions related to today's topic
or any other subject I cover on my website (https://protesilaos.com),
please let me know.

* Unix minimalism is not a dogma

The Unix philosophy consists of teachings that are based on decades of
experience with systems programming.  Those are encapsulated in the KISS
principle of engineering: Keep It Simple Stupid (or variants).

Unix values specialised tools that can interface with each other to
contribute to emergent workflows.  Its brand of minimalism rests on the
practical consideration of maintainability: both with regard to fixing
bugs and conserving programmer time.  The Unix philosophy prioritises
modularity and composability over monolith-like implementations.  Simple
designs can adapt to evolving circumstances while those that make all
sorts of assumptions and have lots of explicit or implicit dependencies
are unsustainable over the long-term.

Unix programmers did not invent all the concepts associated with their
philosophy.  Humanity had discovered them through aeons of continuous
experimentation and practical reasonableness.  And what better teacher
than the vastness of life all around us?  Natural systems consist of
subsystems, just like our body, forests, oceans, and so on.  In nature
we find division of labour or else the separation of concerns,
specialisation and compartmentalisation, composition of localised
patterns into emergent phenomena...  Everything.

This is not to discount the contributions of Unix, but rather to couch
them in terms of the wider milieu in which we operate.  By framing it
this way, we are better prepared to let go of views that are ultimately
detrimental to our life.  Such as the dogmatic belief that the Unix
philosophy is impeccable and must not be criticised.

Dogma is the misrepresentation of a context-dependent insight as a
universal truth.  In practical terms: when you find yourself not
listening to a counterpoint, consider whether you are giving the other
side a fair chance.  If not, you are most likely being dogmatic.

The Unix philosophy is not the undisputed source of truth.  As with
every corpus of thought, what we learn from Unix remains open to
interpretation.  This means that its followers must assume a sceptical
disposition.  They have to remain open-minded about cases where the
principles of their tradition should not be followed to the letter.  The
practitioner has to exercise judgement and use their discretion to find
the right answer for the task at hand.  Dogma is the enemy of every
school of thought.

Consider the difference between the disciple and the grandmaster.  The
student knows how to faithfully abide by all the precepts of their
tradition.  Whereas the grandmaster not only applies the rules but
understands their underpinnings and thus knows when to suspend their
application and why.  In other words, the student is prone to dogmatism
because of their enthusiasm coupled with their lack of perspective.

* Emacs conforms with the Unix philosophy

In analytical terms, Emacs has two facets to its being:

+ The Lisp interpreter :: We must think of it as the equivalent of a
  POSIX shell like =#!/bin/sh= or whatever environment we use to execute
  scripts.  With Emacs we run or "evaluate" Emacs Lisp code (Elisp).
  That is all we can do with it.
+ The interactive environment :: This is the counterpart of command-line
  shells like =bash=, with the difference being that its event loop, which
  is its interactivity, is more pronounced.  Simply put, Emacs is like a
  shell with superpowers, which looks a text editor upon first sight.
  And this is possible because it is built on top of the interpreter.

Those two aspects of Emacs are woven together into the same application,
making it a /computing environment/ rather than yet another text editor or
IDE.  Still, the analytical distinction is important in light of the
Unix philosophy.  As I already noted, Unix is all about sharp and
specialised tools that can be combined with one another: modularity and
composability.  Emacs is such a tool through its Lisp interpreter.

Just as it is perfectly fine to have a shell interpreter with which to
run arbitrary scripts, it is acceptable to have a Lisp machine for the
purposes of evaluating Lisp.  Similarly, it is customary to run an
interactive shell inside of a terminal emulator.  By the same token, it
is perfectly reasonable to use Emacs' own interactive environment to
interface with the Lisp interpreter.

Emacs should not be compared to Desktop Environments like GNOME or KDE,
or to tilling window managers such as i3, BSPWM, etc.  The reason is
that those are wrappers of otherwise disparate programs.  They basically
bundle different processes inside of a main session, where the joint
presence of distinct applications is a mere coincidence.

In contradistinction, Emacs only runs Elisp and what happens inside of
Emacs participates in the same environment.  This is best understood by
means of an example: if I want to change the font size in my current
BSPWM session, I have to edit the configuration file of my terminal
emulator, my settings daemon for GTK apps, Firefox, and so on.  In other
words, those applications do not know that they are all subprocesses of
the BSPWM session.  Whereas in Emacs, if I change the font size, the
effect is propagated across the entire Emacs environment.

This means that not only does Emacs conform with the Unix philosophy,
but it also has the potential to address its main flaw.  By following
Unix precepts we often find ourselves in scenaria where there is no
integration between the programs we use.  While Emacs ensures that we
get a singular experience /without hacks/: the same commands, the same
fonts and colours, the same paradigms of interaction, and so on.  This
makes Emacs an /integrated computing environment/.

* The integration that Emacs offers is not "bloat"

Which brings us to the dubious notion of bloat in software.  You will
find self-professed proponents of the Unix philosophy dismissing the
value proposition of Emacs on the premise that it is just doing too much
and thus does not abide by the tenets of the Unix faith.  This stems
from the misunderstanding of treating Emacs as a text editor.  Which
naturally raises questions, such as "why should Emacs ever be my Git
front-end, when I already have the command-line?" or "why use Emacs'
windows when Tmux is specialised in multiplexing?".

This is why I stressed that Emacs is a Lisp interpreter that only does
one thing: evaluate Lisp.  And so it is capable of all those wonderful
workflows like editing code, handling your agenda, doing presentations
with plain text like this one, and so on.  If you cavalierly talk about
bloat in Emacs, you are effectively making the argument that =#!/bin/sh=
is at fault because of what shell scripts the user may be running.

Then we have another problem with those who criticise Emacs from a
position of, dare I say, ignorance or based on rumours and hearsay.  And
that is that they themselves do not follow the simulacrum of the Unix
philosophy that is their dogma.  What I mean by that is that you will
often find them using Vim as their text editor.  Last time I checked,
Vim can do multiplexing, it has a concept of workspaces or tabs, it can
spawn a terminal with the =:term= command, and so on.  If you think that
Emacs violates the Unix tradition because it too can do the things that
Vim does, then why do you use Vim?  Why aren't you doing everything with
=ed= or perhaps =sed=?  Or, at the very least, why are you not switching to
=vi=, which is closer to what you claim to stand for.

Maybe then the problem is that you have misunderstood Unix altogether
and are being dogmatic.  Take a pause and think how your totalising
claims are detrimental to your own computing experience: if you follow
them to the letter, you will be missing out on quality-of-life advances
in software.  For what?  Plus you will be tacitly holding that the Unix
tradition is flawless, which is nonsense.

Make no mistake: Vim, Tmux, Mutt, Newsboat, tilling window managers are
all excellent programs in their own right.  But what about their
combination?  What about the /gestalt/?  They lack integration.  To
configure Vim you use Vimscript, Tmux has something like a shell syntax,
Mutt and Newsboat use something else, your window manager may
communicate with shell commands or might require editing a C header
file, and so on.  It is a bit of everything.  And their joint operation
is a mere coincidence, as I already explained: they do not share a
common basis.  Whereas Emacs only knows how to interpret Elisp and all
you do inside of it is an extension of that basic principle, to the
effect that you get what every GNU/Linux power user actually wants: a
singular computing experience that minimises the distance between their
mind and what the machine is doing.  What better minimalism than that?

* Understanding minimalism in context

Let's now consider minimalism as such.  I define minimalism as the
attitude of achieving minimum viable sufficiency for a given task.

To test whether something is minimalist, we must know what it is
designed to do.  Design, however, has two sides to it.  The first is
what the designer thinks is the telos.  The second is what the user
considers as the end goal of the design.

As an example, imagine a sword.  The smith who forged it fathomed a
telos where the sword is fit as a weapon or, at the very least, that it
has a cutting edge.  Now suppose that some collector buys this item and
installs it on their wall for decorative purposes, perhaps to show their
wealth and social status.  To understand the utility and end goal of
this sword, we have to account for the context or, as I say, for the
constitution of the case.  And that is because nothing has a standalone
presence: it always exists in a given context which contributes to its
actuality.

[ Read (among others): On role and actuality
  (https://protesilaos.com/books/2021-04-15-role-actuality/) ]

The same goes for minimalism, whether it is about software or not.  When
we assess the minimum viable sufficiency for a given task, we have to
consider the foresight of the designer or developer but also try to
anticipate the expectations of users.  In other words, there is no
innate minimalism; minimalism that is intrinsic to an otherwise
decontextualised thing.  We must always look at the context.

Allow me to tell you a personal experience with markdown editors from
the days I first switched to GNU/Linux in mid-2016.  I wanted something
that could centre text on the screen like how I am doing it in this
presentation.  It should also have spell checking for English and Greek.
And it should let me configure the colours on display and the size of
the fonts.  So I found several self-styled minimalist apps which would
lack at least one of those basic features.  Now you may think that
changing colours is "bloat", but to me it is a key usability feature,
especially when the designer has not considered applying good colour
contrast for legibility, else accessibility (by the way, I am the author
of the =modus-themes= which are also built into Emacs version 28---they
are designed for the highest legibility standard).

When software calls itself minimalist, it sometimes means that it
actually is incomplete and has not reached the state of minimum viable
sufficiency for the tasks it seeks out to accomplish.  And, by the by, I
will let you connect the dots when marketing folks peddle "minimalism".

* You don't have to switch to Emacs, though you might want to

In conclusion, I encourage you to exercise judgement when thinking about
how some philosophy influences your day-to-day experience.  Do not let
yourself fall into the trap of dogmatism and become a victim of your own
misunderstandings.  In practical terms, always give the other side of
the argument the benefit of the doubt, always keep an open mind, and
always maintain a dubitative and inquisitive disposition.

Emacs is all about integration.  And I already gave some examples, but
let me add another one here.  In Emacs, we have commands to introspect
the environment.  So I can invoke a command which tells me what a key
combination does (=describe-key=).  Or I can call another command which
informs me to which keys is a certain function bound to (=where-is=).
Whereas in my otherwise Unix-y tilling window manager, I have no
built-in way to introspect what the hotkey daemon (=sxhkd=) does when I
type in a certain key chord.  Similarly, my terminal emulator has no
such capabilities, nor do the programs that run inside of it like Vim
and Mutt.  Finding what you want is part of the reason you are using a
computer, so that you do not have to memorise everything.

Basic functionality does not really need that degree of homogeneity.
For instance, =grep= and =sed= get the job done perfectly well, whether
independently or in tandem.  The importance of integration becomes
evident when you operate at a higher level of emergence, where things
must work in concert for optimal results.

To me the Unix philosophy is very important.  It is what inspires me to
separate my programs based on their scope and, more generally, to avoid
duplication of effort.  It also guides me to pursue minimalist solutions
which are fit for their purpose.  I also am, however, a pragmatist who
understands that the Unix tradition is not a dogma.  We can find cases
where improvements can be made to it, such as with the integration of
applications.  When we have a layer of interconnectedness, such as the
one provided by Emacs, we get more consistent results for emergent
workflows, which ultimately lead to a superior end-user experience.

So, should you switch to Emacs?  The answer is "it depends".  If you
need a singular experience that allows you to draw linkages between your
various workflows, then I would say "yes".  Otherwise it really is up to
you.  Whatever you do, however, do it from a position of knowledge, with
a clear purpose, and remain committed to it.  Do not follow trends or
pernicious memes without applying common sense.  Emacs has a learning
curve, but so do all the disparate programs that are glued together in
an ad-hoc fashion in some GNU/Linux power user's setup.  You have to
work for the good things.

That's all for today's presentation, folks.  Now I will check the chat
and comment on any questions or remarks.  Thank you!
```

* * *

The video thumbnail is a tweak of the Levitating, Meditating,
Flute-playing Gnu under the terms of the GNU General Public License:
<https://www.gnu.org/graphics/meditate.html>.
