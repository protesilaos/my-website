---
title: 'Why Emacs itself is my “favourite Emacs package”'
excerpt: 'A presentation that highlights the core attributes of Emacs and explains why we should focus on workflows.'
layout: vlog
mediaid: 'RiXK7NALgRs'
---

In this video blog I talk about the persistent question of "the killer
app" that gets asked in the Emacs community.  I explain why I think the
identification of a single package is often not enough to appreciate the
true value proposition of Emacs.  My case emphasises the importance of
workflows; workflows that typically combine lots of distinct tools and
benefit from core Emacs attributes.  It is the whole system that
matters, because all those packages---in their given combinations---make
up our day-to-day computing experience with Emacs.

The text of the presentation is written in `org-mode` notation and is
reproduced below.  Also check my Emacs configuration file, from where
you can get the code I use: <https://protesilaos.com/emacs/dotemacs>.

* * *

```org
#+TITLE: Vlog: Emacs is my “favourite Emacs package”
#+AUTHOR: Protesilaos Stavrou · protesilaos.com

* Getting into the Emacs mindset

I will to talk to you about my approach to a recurring topic in the
Emacs community, best encapsulated in this question:

/What is your favourite package?/

Similar formulations:

+ What is the one thing that makes Emacs indispensable to you?
+ Which is Emacs' killer app?

Such questions can lead us to valuable findings.  There is truth to be
had in the insights drawn from them and we must learn as much as we can
in the process.

Note though that this type of inquiry expects from us to engage in an
analytical exercise that extracts an object from its milieu.  It puts us
in a frame of mind that can miss the true value proposition of Emacs.

The problématique comes with the latent risk of holding us captive to a
frame of mind characterised by *decontextualisation*, of examining an
object without reference to the environment that renders it possible.

Instead of thinking about workflows that can take you from one context
to another, we are expected to identify some silo of functionalities.
Are we then underestimating everything else that contributes to our
day-to-day /experience/ with Emacs?

* Don't ignore the forest while looking at the tree

Now before I get misunderstood: yes, Org and Magit are great; yes, there
are lots of individual packages that make your life easier; and yes,
there is value in finding which package[s] people enjoy the most.

What about the combination of all utilities?  What about the *gestalt*?

If you claim that “my favourite package is X” and then fail to couch
your statement in terms of the rest of the toolkit you rely on, you are
likely to underappreciate---or altogether ignore---the true value
proposition of Emacs.

You do not acknowledge how the whole system is pieced together.  More
importantly, you may not realise the potential of Emacs' extensibility,
which is dynamic or case-dependent.

In other words, Emacs provides the means to implement a metaphor like
that of the vaunted Unix pipes across its entire space.  In practical
terms, you can connect your email client to your agenda, your RSS reader
to your custom note-taking system, your music manager to your directory
editor, and so on.  And all these can benefit from interfaces for
searching, editing in bulk, etc.

My claim here is that most of the times there is no one package or
narrow subset that make Emacs great.  It rather is the linkages between
several pieces of code that make Emacs a pleasure to work with.  They
contribute to predictable-yet-flexible workflows.  These keep Emacs
relevant and, dare I say, intriguing.

* The three core attributes of Emacs

Emacs is programmable and introspectable.  Both presuppose transparency.
These make the Emacs experience open-ended.

+ Programmable :: One set of features can be made to interface with
  another, even though it was not conceived with the express purpose of
  optimising for that particular scenario.  What can be done with Emacs
  is not predetermined.  There is always scope for something new.

+ Introspectable :: The user can examine the entire code base or a
  specific implementation and, potentially, figure out how to connect to
  it through some other tool.  This is further supported by the robust
  self-documentation facilities of Emacs, as well as the high quality of
  material that is readily available through the built-in Info reader.
  Introspection has contributed to the /documentation culture/ that
  characterises the Emacs community at-large.

+ Transparent :: Emacs does not conceal its internals.  Virtually every
  case can be handled using the same language the code is written in
  (Emacs Lisp) while benefiting from live evaluation of new code.  You
  change something and you see it in action.  Combined with the
  self-documenting nature of Emacs, transparency provides insight into
  practically every single construct that makes up Elisp.  Which
  empowers us to make best use of Emacs' programmability.

When considered together, these engender the *interconnectedness* that
defines the Emacs space.
* Introspection in action

Quick demo of running =C-h o= (=describe-symbol=) over =mapcar= and =mapconcat=
and then testing those expressions.

#+begin_src emacs-lisp
(mapcar #'upcase '("one" "two" "three"))

(mapconcat #'upcase '("one" "two" "three") "-")
#+end_src

We can use =C-x C-e= (=eval-last-sexp=) to get live feedback of what each
function does.

We can check the log with =C-h e= (=view-echo-area-messages=).

These are the rudimentary tools you rely on to start using ELisp.  They
offer you the means to experiment with how to extend Emacs.
* A quick look at combining tools

Now let me switch to another window layout, where I have some plain text
files in a standard directory.  Nothing fancy here.  Just to show how
standard Emacs tools can combine together to deliver a consistent
computing experience.

+ Switching to another layout involves the built-in tabs (=tab-bar-mode=)
  plus some bespoke code of mine.
+ Find file at point using a filename or just part of a file (=C-x C-f M-n=).
+ Use a completion framework (=icomplete-mode= in my case).
+ Benefit from a pattern-matching style (=orderless= for me).
+ Jump to the directory that contains the file (=dired-jump=).
+ While in Dired, jump to an item using completion (=dired-goto-file=).
+ Or filter the Dired list and then find the item (=% m= potentially
  followed by =t k=).

* Interconnectedness in the Emacs space

My point is to highlight the true value of Emacs' extensibility.  Which
is realised in the connections you make between several pieces of
functionality.

And, as I already mentioned, one package does not need to know about the
presence of another /in advance/.

Your focus should be on the workflow.  On the whole system that helps
you get things done with Emacs.  Because that is what your actual
experience is about.  You benefit from the set of /emergent qualities/
that become available in the combination of otherwise disparate pieces
of functionality.

Let me stress the importance of interconnectedness in the Emacs space by
showing you another quick demo that combines three distinct packages
that were not developed for the express purpose of being combined
together:

+ =elfeed= for reading RSS/Atom feeds.
+ =bongo= for managing media files or links.
+ And my own experimental note-taking system (=usls=).

Finally, this entire presentation is made possible by combining several
tools:

+ =org-mode=
+ =olivetti-mode=
+ =org-tree-slide-mode=
+ =variable-pitch-mode=
+ my own commands for setting fonts
```
