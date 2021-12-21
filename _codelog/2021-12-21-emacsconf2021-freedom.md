---
title: "EmacsConf 2021: How Emacs made me appreciate software freedom"
excerpt: "My presentation at EmacsConf 2021 on Emacs, software freedom, and the spirit of sharing."
layout: vlog
mediaid: "OE3mfOp5ZDI"
---

This is a republication of my presentation at EmacsConf 2021.  I am
posting it on my own channel for archiving purposes.  Original:
<https://emacsconf.org/2021/talks/freedom/>.

The video was recorded on November 5, 2021.

What follows is the text of the presentation in Org notation.  Note that
I had mistakenly said "consubstantive" instead of "consubstantial" but
only realised it after I concluded the recording...  This is rectified
in the text:

```org
#+TITLE: EmacsConf 2021: How Emacs made me appreciate software freedom
#+AUTHOR: Protesilaos Stavrou (https://protesilaos.com)
#+DATE: 2021-11-27

* About me and this talk

Hello EmacsConf!  My name is Protesilaos, also known as "Prot".  I am
joining you from the mountains of Cyprus.  Cyprus is an island in the
Eastern Mediterranean Sea.

My presentation focuses on the intersection between software freedom and
what we find in the Emacs milieu.  Here "the Emacs milieu" encompasses
two magnitudes: (i) the program we use and (ii) the diverse, global
community of people that has grown organically around it.  I will talk
to you about how Emacs made me appreciate software freedom and helped me
exercise it to its full potential.  Personal anecdotes are not the main
focus of this talk.  Rather, they serve the ancillary role of making
certain insights more relatable.

The presentation is theoretical in nature and targeted at a general
audience.  No knowledge of programming is required.  It is assumed,
however, that you are familiar with some basic concepts, such as the
fact that Emacs is extended with the Emacs Lisp programming language, or
that Emacs is a GNU project that champions end-user software freedom.

Let's start with a few words about me before elaborating further:

+ I was born in Greece in 1988 and was raised there. As a kid I was not
  into tech-related activities.  All I cared about was playing football
  (soccer) and staying outdoors.  My formal education is in the
  humanities (liberal arts).  I had a career in politics.  I lived in
  Brussels, Belgium and worked at the European Parliament, among others.

+ After some intense soul-searching I realised I did not want to be a
  political operator any more and made radical changes in my life.  I
  have since come to terms with the fact that I am a philosopher.

+ I am not a programmer.  Neither by trade nor formal education.  I code
  for leisure.  I was not tech-savvy until my mid-20s.  I have been
  using GNU/Linux distributions since the summer of 2016.  While I
  switched to Emacs full-time in the summer of 2019.  Before that switch
  I was running a bespoke environment that involved several standalone
  programs like Vim, Tmux, and a tiling window manager.
  
+ I am the creator and maintainer of the =modus-themes= (=modus-operandi=,
  =modus-vivendi=).  These are designed to conform with the highest
  accessibility standard for legibility and optionally support the needs
  of users with red-green colour deficiency (deuteranopia).  The themes
  are built into Emacs version 28 or higher.  A section of my website is
  dedicated to my Emacs-related contributions.

For the remainder of this 40-minute talk, I will explain how Emacs made
me appreciate software freedom, how it empowers me in my day-to-day
computing, and the lessons I have drawn from that liberating experience.

* The inherent Emacs qualities for an autodidact

Emacs has this reputation of being extremely hard to learn and difficult
to get started with.  So how does someone like me, who was not even
tech-literate a few years ago, go on to use Emacs effectively?  How do
you start from zero, with no knowledge of Lisp and with only a
rudimentary grasp of programming, to eventually maintain packages for
Emacs and even contribute directly to emacs.git and other sources?

The answer to these and related questions lies in the very description
of Emacs as a "self-documenting" piece of software.  It means that Emacs
has a robust Help system which informs you about the state of a given
construct.  Such as what the original and current values of a variable
are.  Or whether some function is being "advised", else dynamically
adjusted, by another function and what that advice amounts to.

The self-documenting nature of Emacs is combined with the fact that it
consists of free software.  Not only do we get information about what
Emacs knows, but have the underlying code readily available to us.  For
example, every Help buffer provides a link to the source of the item it
references.  We can study and edit that as we wish.

Self-documentation and free software are blended together with a third
quality of Emacs: its implementation as a Lisp machine or else its
ability to evaluate Lisp code and make use of it directly.  The ubiquity
and uniformity of the Lisp interpreter together with the immediacy of
its results help one learn how to use Emacs and how to write Emacs Lisp
expressions.  For someone who is self-taught like me and who often
learns through a process of trial and error, this is of great value.

Learning how to use Emacs and how to write in ELisp is the basic
skillset you need to also start extending Emacs for your own use, or
even for publishing packages and making contributions to emacs.git.
That is because the skills you acquire by tinkering with your =init.el= as
a beginner will always stay with you throughout your time as an Emacs
user.  That is empowering in itself.  It rewards your investment in time
and effort.  The more you learn, the more capable you become to enact
change, to configure things to your liking and develop the exact
workflow that you want without making any compromises.

Compare that to, say, my tiling window manager.  I can configure it with
a shell script.  So I learn POSIX shell or, let's say, Bash.  But my
knowledge of the shell does not extend to modifying the behaviour of the
window manager as such, because that is not implemented as a shell
script but in another language.  So for an autodidact like me, it is
more difficult to learn yet another paradigm before I can achieve what I
want.  How do you make that extra step without self-documentation and
the immediacy as well as transparency that you get from the Emacs Lisp
interpreter?  It is more demanding.  Which makes Emacs comparatively
easier when we account for the longer-term effort involved.

* The interconnectedness of the Emacs space

As I already mentioned, Emacs rewards you for the investment in time and
effort you put into it.  In my experience, this makes it easier to
master than a combination of otherwise disparate tools, each with its
own paradigm of interaction and particularities of implementation.

Before switching to Emacs, I was using a combination of standalone
programs as part of a bespoke computing environment that I had pieced
together.  The program called "Mutt" would handle my emails, Newsboat
dealt with my RSS feeds, the Music Player Daemon took care of my music
collection, while I was doing work inside of a terminal emulator which
was running a multiplexer (tmux) and Vim for on-the-fly text editing.
Each of these, and others related to them, are fine in their own right.
But their gestalt leaves something to be desired.  Their lack of
homogeneity meant that I could not develop portable skills between them.
What holds true in Vim does not apply to the multiplexer.  The prevalent
methods in the email client cannot be used in the RSS reader, and so on.

Whereas everything that is implemented in Emacs Lisp partakes in the
same environment automatically.  If, say, you know how to use keyboard
macros to edit code, you already know how to use the exact same skill
to, say, create and delete windows in a process that involves text
editing and some elaborate file management operations with Dired.  If
you have a command that scrolls down half a screen, it immediately works
in all your buffers regardless of whether their major mode is about
reading emails, editing text, enqueuing songs to a playlist, and so on.

Emacs provides a level of integration that I consider peerless.
Everything the user deals with is implemented in ELisp.  And all the
user edits is ultimately done with ELisp.  As such, the environment
itself provides the conditions for drawing linkages between different,
yet +consubstantive+ consubstantial, modes of interaction.  For example, I
use =bongo.el= to play back songs from my music collection.  My =~/Music=
directory is configured to have a special minor mode, so when I access
it with =dired= it has commands that allow me to enqueue albums/songs,
create playlists, etc.  Also, I have an ~org-capture~ template which lets
me store the details of the currently playing track and tag it
accordingly.  Continuing with the example of Bongo, I make it interface
with my RSS reader, =elfeed.el=, by having the latter add podcast and
video links to the former's playback queue.  All this is done by simply
re-using the same ELisp skills I learnt while configuring and extending
Emacs.

The interconnectedness of the Emacs space empowers the end-user.  It
makes such emergent workflows possible.  And the best part is that there
are no dirty hacks involved: it is an innate feature of the system.  You
are leveraging the freedom that Emacs gives you in a way that confers
agency on you.  You assume the initiative.  It gives you confidence to
continue honing your skills in anticipation of further optimising---and
controlling in full---your own integrated computing environment.

* The documentation culture of the Emacs community

If what I have mentioned thus far was all there was to the Emacs
experience, there would still be something to be desired.  Because while
self-documentation is great, it is meant to draw from---and be a
complement to---some hand-written material.  Both new and existing users
must be able to read what something is supposed to do, what its main
points of entry are, how it relates to other parts, and so on.  This is
about the human aspect of Emacs, the strong documentation culture of its
community, rather than an irreducible feature of the program we use.

As a matter of packaging etiquette, every non-trivial form in an Elisp
library must have a documentation string.  What a variable or function
does needs to be spelt out in clear terms.  Furthermore, the best and
most well maintained packages, whether those are built into Emacs or
distributed via an Emacs Lisp Package Archive, come with their own Info
manual.  Unlike a generic README, those manuals are more like fully
fledged books, with a table of contents, cross-references, and indices
for concepts, functions, variables, key bindings...  In short, there is
a tradition around programming with Emacs Lisp which values informative,
high quality guidelines intended for end-users.

Apart from what each individual package does, Emacs itself ships with a
helpful tutorial for newcomers, a comprehensive manual, a book targeted
at non-programmers titled "An Introduction to Programming in Emacs
Lisp", as well as a reference manual for Emacs Lisp itself.  All this
material, all that wealth of knowledge, is readily available to the
end-user through the built-in Info reader.  The details on how to access
the Info reader are already explained in the initial learn-by-doing
tutorial.  For people like me who are self-taught, the documentation
culture of the community ensures that we are not left behind.  It gives
us the chance to learn from the experts and to become better ourselves.

Writing concise and clear documentation is also beneficial for those who
do it: it helps them clarify their ideas and improve their communication
skills.  These contribute to fostering a more humane social element.  In
my experience, the Emacs community has a propensity against becoming
elitist.  It helps integrate new members by not hiding anything from
them, on top of Emacs' inherent emancipatory qualities as described
before (self-documentation, Elisp interpreter, free software).  At the
same time, the community strives for excellence so it expects newcomers
to do their part in reading what is generously offered to them.  There
is a difference between sharing knowledge and spoon-feeding it to users.
The latter method keeps users dependent on it and is thus detrimental to
them in the long run.  The Emacs community disseminates what it knows
and wants newcomers to assume agency and be responsible for doing their
part in learning how things work.  The community's documentation culture
and uncompromising standards ensure that even once-unskilled users like
me can be productive with Emacs and unleash its full potential.  What
newcomers need is commitment and an open mind to study what they have.

* The Promethean Ideal of freeing know-how and expertise

The documentation culture of the Emacs community springs from a
consideration of practicality.  When you explain what your program does,
it is more likely that others will show interest in it and incorporate
it in their workflow.  Whereas freed source code that is distributed
without any accompanying documentation will most likely only attract a
handful of enthusiastic hackers.  Still good, but could be better.

Apart from its practical use though, writing documentation for the
end-user shows a spirit of altruism, an ethos of caring for others and
wanting to empower them in their endeavours.  It essentially is the same
as helping someone; helping them escape from the ignorance that
contributes to their sense of powerlessness.  I experienced this myself:
by reading the docs, I was able to go from an unskilled rookie to a
competent Emacs user.  Part of that competence consists in maintaining
Elisp packages and contributing code directly to emacs.git.  Writing
documentation is about disseminating knowledge and expertise, not
keeping it as an exclusive right of some elite.

Allow me then to liken this to the ancient Greek myth of Prometheas
(Prometheus).  Prometheas was a titan, or else a deity, who decided to
teach the know-how of handling fire to humanity.  The art of fire is an
allegory about know-how in general, not specifically pyrotechnics.  So
Prometheas liberated that key knowledge by taking it away from the
exclusivity of the gods and bringing it into the domain of humankind as
a libre resource.  This act of altruism propelled humanity to new
heights.  Every field of expertise is about handling "fire", in the
figurative sense of implementing essential know-how.

Why would Prometheas, an exalted being, ever bother with the fallible
and frail humanity?  Why did a god want to empower humans instead of,
say, making them dependent on the know-how of "fire"?  If we look at the
world around us, we witness how its overlords are unscrupulously trying
to enclose the commons and take advantage of expertise in order to
exploit us.  Why would Prometheas not do the same thing and enslave us
for the rest of eternity?  The answer is that unlike this world's
aspiring tyrants, Prometheas represents a higher conscience, one that is
not corrupted by egocentrism and the greed of short-term profiteering.
This higher conscience makes sense of the bigger picture and can foresee
that the distribution of know-how empowers those who access it freely to
reach their potential.  It is no coincidence that the ancient sages used
the name "Prometheas", meaning the "prescient one", the "foreseer".

This is a lesson on the outlook we ought to maintain, where we aspire to
our highest.  We want to be the best version of ourselves, by being more
like Prometheas.  We want our actions to be guided by this Promethean
Ideal of liberating know-how, of making expertise readily available, and
of providing others with the chance to prosper.  When we all do so, we
are collectively better-off.  Free software is a microcosm of that.

* The 'killer apps' of Emacs

Let's be a bit more practical now.  Many new users are attracted to
Emacs because it has one or a few immensely useful applications they
would like to use.  This typically covers Org and/or one of its numerous
accoutrements.  Though there are other excellent packages like Magit.

The fact that Emacs has such killer apps is good.  It shows that its
extensibility is not some theoretical upside of the Lisp interpreter.
It has tangible utility to a wide user base, including those who do not
write Elisp themselves.  Furthermore, those killer apps are good as they
help bring newcomers and potential future contributors to the fold,
while they provide real value to the existing members of the community.
The more people we have and the happier they are with Emacs, the higher
the chances that we receive some new ideas or code from them.

The notion of a killer app does, however, come with a latent downside
when targeted at outsiders to the Emacs milieu.  And that is because
packages like Org and Magit do not have a standalone presence.  They are
always used in Emacs or, rather, together with the rest of Emacs.  Which
means that the user has to know what to expect from Emacs.

You may be aware of the type of user who proclaims that they want to
boost their productivity but who also expects immediate results.  When
you bring the "killer app" rhetoric to such a crowd, you run the risk of
misleading them into a false sense of self-confidence and concomitant
expectations of success.  Such users may be tempted to try Org, Magit,
and others but are most likely going to endure a frustrating experience
overall.  The reason is that they are oblivious to what Emacs is and
what is required to get started with it on a sustainable basis.

Org, Magit, and friends are fantastic tools in their own right.  But
they still are part of Emacs.  To use them effectively you have to
develop at least a modicum of understanding on what Emacs does.  You
must be patient and approach this endeavour with an open mind.  Go
through the tutorial, familiarise yourself with the Help system, make a
habit out of reading Info manuals, and take things slowly.  No killer
app can ever be a substitute for commitment to a cause; no vaunted life
hack will ever provide a direct conduit to some fountain of wisdom.

With regard to software freedom and user empowerment, what I have learnt
is that the impulse for the killer app ought to emanate from a position
of knowledge.  First we need to temper our expectations and prefer
propitious growth in learning over instant gratification.  With Emacs,
we have a strong foundation for our computing freedom: it consists of
the inherent qualities of the program together with the documentation
culture and creativity of the community.  Once we learn how to benefit
from those, we have everything we need to become proficient in all the
modes of interaction that are available to us.  Think of it as choosing
Emacs and Org, Emacs and Magit, Emacs and Org and Magit, et cetera.

* You can't be an Emacs tourist

What I just talked about implies that you cannot simply switch to Emacs
over the weekend or on a whimsy.  You can't use it opportunistically to
run a quick demo with which to impress your peers and win some inane
"nerd cred".  Forget about such frivolous superficialities.  Emacs is a
sophisticated tool intended for some serious work.  It has been around
for several decades and it incorporates the knowledge of a diverse group
of contributors.  Even if you want to use Emacs just for Org mode or
whatever killer app, you still have to try to learn things in earnest.
You still need to read the relevant Info manual, understand how to make
changes to the plethora of user options on offer, and generally don't
feel lost while working with Emacs.  This is more so if you use Emacs to
its full potential as an integrated computing environment; as your
general purpose interface to the computer, where you handle uniformly
coding and writing prose, your email correspondence, your RSS feeds,
your music collection, your agenda and to-do lists, and so on.

The difficulty of Emacs is much higher for those who approach it without
understanding what they are getting themselves into.  Or for those who
are naive enough to believe that they can cheat their way out of
learning the fundamentals.  The gist is that you cannot be an Emacs
tourist.  You can't go into Emacsland thinking that you will spend a
couple of memorable days there and head back home to regale others with
stories about your adventures.  It does not work that way.  You commit
to Emacs for the long-term, for the freedom it offers you.  Freedom in
the moral sense but also in the very practical ways in which you can
mould and extend your personal workflows with precision.

Now you may wonder why do I mention those things?  Shouldn't we make
Emacs easier for everyone?  Yes, we should make everything as simple as
possible.  Though that still does not refashion Emacs into something
entirely different.  We continue to have a potent tool at our disposal
that we must treat with the requisite respect.  Take, for instance, the
various frameworks that set up Emacs in an opinionated way so that
newcomers get everything set up for them out-of-the-box.  There is
nothing wrong with those frameworks.  In fact, a large part of the
community uses them to great effect.  However, the point stands: even
after every package has been set up for you, you still have to put in
the work in making use of your newfound computing freedom.

But, you may insist, is that not some sort of gate-keeping?  Are you not
being an elitist by telling people how they must invest time and effort
in making the best out of their Emacs experience?  No, I think this is
not elitism.  There are no secrets here, no artificial barriers to
entry, no impediments to making progress, no tricks and gimmicks.  It
just is a statement of fact.  Freedom entails responsibility.  It
requires people to take the initiative and assert control over the
factors that are within their reach.  Freedom ultimately means that we
no longer remain dependent on being spoon-fed.  We assume agency.

* Emacs as a champion of software freedom

To my mind, Emacs is the embodiment of the GNU project's ethos.
Everything you expect from a program that is underpinned by the values
of software freedom is found in Emacs.  What you get is not merely an
ethical tool, important though that is, but also a gift that will keep
on giving; a gift for your further empowerment as a computer user.

I understood that software freedom is not about liberating the code
itself.  It is about sharing libre code in order to emancipate the user.
The best way to achieve that is by emulating Prometheas: don't just give
people the so-called "fire"; offer them the underlying know-how.

Emacs taught me the virtues of software freedom in a way that nothing
else in the GNU/Linux space ever did.  Here's an example from a few
years ago.  I needed a Markdown editor.  I wanted it to centre the body
of the text on display.  It should have configurable font families and
point sizes.  Spell checking for Greek and English should be included.
The colours had to be editable as well, so I could adjust them to a
level of legibility I was comfortable with.  While there were plenty of
libre programs, I did not find one I could control and inspect to the
extent I can with Emacs.  Which made me feel that I had stagnated: there
was an indelible line dividing users from developers.

Whereas Emacs invites you to blur the distinction between user and
developer.  It furnishes the means to become proficient in it.  While
the community complements those with its documentation culture and
overall creativity.  You start off as a complete ignoramus but soon pick
up skills that remain useful for as long as you work with Emacs.  And if
you really want to take it a step further, you know where to look for
inspiration and guidance.  Before you realise it, you start writing code
in Elisp and can one day share it with others.

What I have learnt over the past 2.5 years as an Emacs user is that if
you go from scratch and are meticulous in your approach, you will need a
few days or weeks before everything starts to make sense.  After that
initial awkward phase during which you familiarise yourself with the
basics, everything else will become easier to learn.  It is a matter of
gaining more experience, one step at a time.  As with every field of
expertise, Emacs expects you to work for it and to earn it.  For me that
is worth it.  In terms of being malleable in a consistent way and
transparent in what it does, Emacs is in a league of its own.

In conclusion, Emacs allowed me to assert control over a great portion
of my quotidian computing.  It helped me grow out of the state of
ignorance I was in; a state that rendered me powerless to use the
computer exactly how I wanted.  For that I am grateful.  I now consider
it my duty to contribute back to this wonderful project and community.

Thanks for your attention!  Special thanks to the EmacsConf volunteers!
```
