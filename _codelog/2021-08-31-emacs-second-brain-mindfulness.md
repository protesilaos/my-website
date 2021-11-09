---
title: "Emacs as a 'second brain' and mindfulness"
excerpt: "A presentation on the sheer power of Emacs to improve your productivity as a 'second brain', but also a reminder to care about the 'first brain'."
layout: vlog
mediaid: "bFJO8ScRmj0"
---

In this recorded live stream, I offered a presentation that was divided
in two parts:

+ In the first, I talked in general about how Emacs can boost one's
  productivity through its sheer power, extensibility, and the
  interconnectedness of its environment.

+ While in the second I elaborated on the need to be mindful of our
  disposition towards knowledge and learning so that we give ourselves a
  chance to grow.

This ultimately is about how we go about maintaining an exomind with the
help of Emacs while being mindful of the quality of what goes into it.

Below is the text of the presentation (in Org format):

```org
#+TITLE: Live: Emacs note-taking and the mindful attitude
#+AUTHOR: Protesilaos Stavrou (https://protesilaos.com)
#+DATE: 2021-08-31

* Overview of how I plan to do live streams

Hello everyone!  My name is Protesilaos, also known as "Prot".

This is my first ever live stream.  I have never done one before nor
participated in any because my old computer could not handle it.  Now
that I have slightly better hardware, it is time to experiment with this
format.

[ I talked about my laptop woes in the last video:
  https://protesilaos.com/codelog/2021-08-29-emacs-community-new-pc/. ]

If there is anyone in the chat, feel welcome to send your questions and
I will reply to them once I conclude the presentation.  I am keeping the
chat here on the side though, so I might also answer some questions
while switching between chapters.

Today's topic and those of any live stream in the foreseeable future
will be about Emacs.  Though the connection may sometimes be tangential,
as I will be elaborating on broader themes as well.

What I will talk to you about today is the process of approaching a new
subject of sophistication or intellectual interest.  And I will link it
to Emacs' capacity to take notes with efficiency and, generally, help us
capture and then retrieve our thoughts.

If you wish to follow live streams that are exclusively about Emacs or
related technological topics, you can follow (A-Z):

+ Andrew Tropin :: https://www.youtube.com/channel/UCuj_loxODrOPxSsXDfJmpng
+ System Crafters (David Wilson) :: https://www.youtube.com/channel/UCAiiOTio8Yu69c3XnR7nQBQ
+ Xah Lee :: https://www.youtube.com/channel/UCXEJNKH9I4xsoyUNN3IL96A

There is also Sacha Chua, but I am not sure how often there are streams
there: https://www.youtube.com/channel/UClT2UAbC6j7TqOWurVhkuHQ.  Maybe
there is Twitch, but I am not familiar with it.

Perhaps there are other live streamers as well, but I am new to this, so
apologies if I have missed any.  Will include them next time.

Other useful Emacs-related videos:

+ Emacs Elements (Raoul Comninos) :: https://www.youtube.com/channel/UCe5excZqMeG1CIW-YhMTCEQ
+ Mike Zamansky :: https://www.youtube.com/channel/UCxkMDXQ5qzYOgXPRnOBrp1w

[ In my dotemacs, I maintain a section about other people's work.  The
  aforementioned and others are included: https://protesilaos.com/emacs/dotemacs. ]
* Taking notes in general

We document our ideas all the time, be it with pen and paper or by using
our software of choice.  It helps us clarify our thoughts and elucidate
concepts that would otherwise be hard to grasp.  We may also retrieve
information we have stored for later use.

When it comes to software, Emacs is a powerhouse for taking notes and
staying organised.  Apart from all its text-editing capabilities, its
ability to search recursively through files and edit the results
directly, its superb keyboard macros, and so on, the Emacs milieu has
the highly acclaimed Org mode.

At its core, Org is a lightweight markup language similar in spirit to
Markdown.  What makes Org special though is the ecosystem of Emacs Lisp
that has grown organically around it.  Users have been writing and
sharing code which let's you do practically everything with Org and the
'magic' of Emacs Lisp (Elisp).  For example:

1. Devise your own "Getting Things Done" workflow.
2. Organise your agenda, by scheduling tasks, adding appointment
   notifications, determining what should be tracked as a habit, etc.
3. Write a journal (org-journal).
4. Maintain a personal knowledge base using the zettelkasten method or
   some variant thereof (org-roam, zetteldeft).
5. Publish a website entirely with Org or, at least, by exporting
   specific documents to HTML (among numerous other formats).
6. Do literate programming.
7. Learn something new with flashcards and spaced repetition
   (org-drill).
8. Draw linkages between various contexts, such as by connecting a
   particular email message to a to-do item.

It seems that the possibilities are only limited by one's imagination.
Of course, all of the above can be achieved without using Org, provided
one is willing to experiment with alternatives and some custom code,
perhaps for educational or recreational purposes.

The point is that Emacs is all about choice.  It does not enforce a
specific workflow, nor does it come with stringent requirements of how
data should be stored and organised.  In other words, there isn't a
canonical way of using Emacs: that is always up to the user.

This is all possible because Emacs is programmable and extensible.  You
just write some ELisp and it can evaluate it live.  Though chances are
that there already exist packages which provide you with everything you
need to accomplish your goals.  In fact, you might never have to write
any code yourself and still be very effective with your Emacs usage.

* Emacs can help you develop a second brain

By using Emacs and Org with all of its accoutrements we can have the
basic components we need to set up our very own exomind or second brain.
This is a state where the distance between our mind and what the
software renders possible is reduced and where we can both add and
extract information in a near-frictionless fashion.  The second brain is
a higher state of efficiency.

What exactly goes into one's exomind will depend on their particular
requirements and how much time and effort they are willing to invest in
integrating their computing experience inside of Emacs.  I think it is
worth bringing everything into Emacs because of the innate
interconnectedness of its environment.

Some common tasks that can be done with Emacs:

1. Read RSS/Atom feeds (e.g. Elfeed).
2. Handle email correspondance (Gnus, Notmuch, Mu4e...)
3. Browse the Internet in a text-centric browser (EWW, Elpher).
4. Perform context-sensitive actions on the thing-at-point (Embark).
5. Seamlessly open your PGP/GPG-encrypted files (many built-in tools).
6. Bulk rename your files as if they were regular text, using ordinary
   text editing, keyboard macros, multiple cursors, and the like
   (Dired/Wdired).
7. Gain easy access to your ~pass~ store, where all your passwords are
   stored (pass, password-store).
8. Jump to any heading or "point of interest" in a file using ordinary
   search or more advanced patterns (built-in Imenu and extensions like
   Consult, and several completion frameworks such as Vertico).
9. Play back your music collection (Bongo, EMMS).

For all those and many others, you are always working in the same
environment, where it is trivial to either go from one place to the next
or to connect different packages in emergent workflows.  For example, to
have Elfeed interface with Bongo so that you can add the feed entry of
some music channel you are following directly to your playlist queue.

This is where Org comes in to play.  Specifically ~org-capture~ and
~org-store-link~.  These two commands can be used to quickly store any
kind of structured note and to create a direct link to the context it
was taken from.  A typical example is to read an important email and
capture it as a task that should appear in the Org agenda.

All those can be pieced together into a bigger system to reach that
higher state of productivity; that second brain.  But there is a catch!
Unlike the first brain, the second one does not think things through.
Its output will be as good or bad as your input.  And so there arises a
general problem of the state of mind one must have while documenting
their ideas about some newfound knowledge or piece of information.

* Remaining open to new ideas

As I said in the introduction, we want to be mindful of our attitude
when we are engaging with a new subject of sophistication or
intellectual pursuit.  Because even the most efficient text-editing
setup will not be able to affect our mindset, our dispotition towards
learning.

Maybe you have done this before or are aware of others who have done it:
you start reading a book and as you go through its pages you take
notes.  Maybe you will draw an underline under the text as you go
through it, or add some paper note there.  If the medium is digital, you
will be doing that with Emacs or something along those lines.

The point is that you are taking notes while still trying to parse new
information.  And that can prove problematic.  Sometimes the book, or
the resource more broadly, provides profound insights that require some
time to be fully understood and internalised.  You may have to read and
re-read the text before you are in a position to assess its content.

What happens then, is that if you write notes upon first encounter with
some new material, your input essentially codifies your previous
self---the one who was not yet aware of the book's teachings.  In other
words, those notes are not as useful as you would like to believe,
because they unconsiously embed your prior opinions.

When you engage with a new source that you consider worthy of your time,
at least based on first impressions, you want to give it some room to
grow or some time to sink in.

It is like how fermentation occurs over time.  Take wine production, for
example.  You start with grape juice that you store in a vessel, a
barrel perhaps.  After a few days, the liquid starts developing alcohol.
If you take out a portion of it, what you are getting is some unfinished
product.  Either some bad grape juice or something akin to the cheapest
plonk you can get on the market.  It is not good.  To truly appreciate
it, you have to let the fermentation process run its course.

Incoming ideas are just like that.  If you wrestle with them right away
and take a snapshot of your thoughts at the moment, you are effectively
consuming the unfinished article.  Whereas what you want is to refrain
from passing judgement upon first contact and allow the ideas the time
they need to come together.  This means that you may have to think about
them many times over.

No second brain will do that for you.  No second brain will prevent you
from storing notes that capture your unrefined or immature views.  No
second brain can tell you whether your inconsiderately captured notes
condition your current thought processes.  It is up to the first brain
to be mindful of the potential pitfalls.

* Avoid the dogma of self-identification through mindfulness

To take notes effectively with the intent of growing out of our mould,
we have to rely on our first brain, not the one that Emacs or some other
program/method may provide us with.  When we take notes, or generally
when we encounter something new, we essentially face a dilemma of either
(i) clinging on to our position or (ii) remaining open to the
possibility of refashioning ourselves.

If you hold firm in your views, such as when you read a new book and
comment on it in parallel, you are effectively implying that what you
already knew before reading the book is all you ever needed to know.
Put differently, you are developing a certain brand of dogmatism, of
insistance on the narrative you have about who you are and what it is
that you are doing.  Let me call this the "dogma of self-identification"
in which we do not recognise, tacitly or otherwise, the possibility of
not knowing something and where we claim to be capable of more than what
we actually are.

This is a trap that anyone who wants to flourish as a person should
actively try to avoid.  When we engage with new material, we want to be
mindful of our condition.  We must admit that we are not omniscient,
that we are fallible.  And we have to unequivocally tell ourselves how
our sense of self is a work-in-progress that remains open to influences
of all sorts.

There is no scope for pretense here.  No need to fake being tough or
smart or whatnot.  The open mind, the inquisitive spirit, has no trouble
acknowledging its inadequacies because it understands that it can only
improve by surfacing them, scrutinising them, and working towards
circumventing them.

And so, when we take notes---when we learn---our goal must be to always
keep open a window into the unknown.  Take as much time as you need to
think things through.  Give ideas the space they need to grow and become
fecund.  Then, just like the farmer who respects the land, reap the
fruits in a spirit of sustainability, in a way that allows ideas to grow
again perhaps by means of exposure to yet newer concepts.

What matters then is the attitude we have before implementing the
methodology.  The second brain may be powerful and extremely useful.
But it cannot think for itself and it cannot support the first brain in
rectifying its errors; errors which stem from a position of dogma.

Through such a mindful attitude we can expand our awareness of things
simply by being more considerate, more careful, more deliberate.  It is
not the volume or the efficiency.  It is not about productivity per se,
measured in some dubious unit of output.  This is about how we enrich
the quality of what goes into our mind and what eventually gets codified
into some note-taking system.

* Closing thoughts

As I mentioned in the introduction, I am new to the live-streaming
world.  Perhaps this format is the wrong one, but I just had to start
with something and see how it goes.

If there are any questions in the chat, I will answer them now.  They
can be related to what I just covered, or maybe to something else.  I
will try my best to be helpful.

In short:

+ Emacs can boost one's productivity through its sheer power,
  extensibility, and the interconnectedness of its environment.

+ The second brain is a good idea.  But it is not omnipotent.  You still
  have to put some serious effort into what you are doing.

  - This is true for Emacs in general and for every other field that
    involves some degree of sophistication.
  
+ We grow when we learn to let go.  And we are at our best when we are
  prepared to let go of our most cherished beliefs, such as our sense of
  self once taken as a snapshot.

+ Dogmatism, even one which is latent in what we do, is an impediment to
  our intellectual growth.  Without being mindful of our condition, we
  are forever trapped in a web of predispositions where we pretend to
  know more than we do.

As you could tell, part of this is tangentially about Emacs and even
about taking notes.  The emphasis is on our disposition, the attitude we
ought to maintain.  The rest follows from there and falls right in
place.

That's all.  Thank you for your attention!  Now let's check the chat for
any feedback, otherwise I am concluding this show.
```
