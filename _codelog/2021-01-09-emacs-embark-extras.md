---
title: 'Embark and my extras (Emacs)'
excerpt: 'Video demo of embark.el and how I extend it to make my Emacs workflows more efficient.'
layout: vlog
mediaid: 'uoP9ZYdNCHg'
---

In this video I provide an overview of Embark's features.  I discuss
everything from the basic concepts of acting on targets, to how you can
extend it as your front-end for completion candidates.  There is also a
demonstration of `embark-become` and how that can be used to make your
minibuffer-centric workflows more efficient.

The text of the presentation is copied below (`org-mode` notation).
Refer to my Emacs configuration file ("dotemacs") for the implementation
details: <https://protesilaos.com/emacs/dotemacs>.  And check the Git
repositories of the projects I covered:

+ <https://github.com/oantolin/embark>
+ <https://github.com/minad/consult>

* * *

```org
#+TITLE: Emacs: Embark and my extras
#+AUTHOR: Protesilaos Stavrou · protesilaos.com

* Brief introduction to Embark

Embark provides a unified framework of regular Emacs keymaps which let
you carry out /contextually relevant actions/ on *targets* through a common
*point of entry*, typically a /prefix key/.

+ "Actions" are standard Emacs commands, such as =describe-symbol= or some
  interactive command you have defined that reads an argument from the
  minibuffer.

+ "Targets" are semantically sensitive constructs, such as the symbol at
  point, a URL, a file name, the active region, or the current
  completion candidate in the minibuffer (or the completions'
  buffer---more on that in the next section).  Embark has so-called
  "classifiers" which help it determine the category that the target
  belongs to.

+ The "contextually relevant [actions]" are defined in keymaps whose
  scope matches the category of the target.  So =embark-file-map= holds
  all key and command assossiations for when Embark recognises a file
  name as its target.  =embark-region-map= is for actions pertaining to
  the active region; =embark-buffer-map= for buffer names that you access
  through, say, =switch-to-buffer= (=C-x b=).  And so on.

+ As for the "point of entry" or "prefix key", it is an Embark command,
  such as =embark-act=, =embark-act-noexit=, or =embark-become=.  Those
  activate the appropriate keymap, thus granting you access to the
  relevant commands.

Embark can act on individual targets (e.g. the region) or sets of
targets (e.g. the list of minibuffer completion candidates).
* Embark collections and how to cycle completions

Here we will be discussing Embark's ability to act on a set of targets.
Our specific case is to instruct it (via a hook), to automatically
gather the completion candidates of the minibuffer and put them in a
live-updating buffer.  In other words: a front-end to the minibuffer's
underlying completion mechanisms.

Let's test this with =switch-to-buffer= (=C-x b=) and some input that we
provide.  The "Embark Collect" buffer pops up and shows us what we are
currently matching.  We can then produce a snapshot or export this set
to an appropriate major-mode (=ibuffer-mode= in this case).

I received a lot of questions about my workflow with the Embark
completions buffer.  The idea was:

+ How do you select an item when you narrow to a short list?
+ Do you manually switch from the minibuffer to the completions?

The short answer is that I have written some extensions that handle this
"candidate cycling".

The long answer is best illustrated by an example (the following is a
natural cycling behaviour):

+ =C-n= in the minibuffer takes us to the top of the completions' buffer.
+ =C-p= in the minibuffer moves to the completions' bottom.
+ =C-n= inside the completions' buffer moves the line normally or, when at
  the end, switches to the minibuffer.
+ =C-p= inside the completions' buffer also moves the line, though in the
  opposite direction, and when at the top it switches to the minibuffer.

* Perform default action while cycling

A common workflow with Embark is to produce a snapshot of the
minibuffer's collection you have narrowed to and then inspect that
buffer.

Let's try this with =M-x describe-keymap RET embark= (I bind that help to
=C-h K=).  Then we produce a snapshot with =embark-act= (you have a key
binding for that) and =S= for =embark-collect-snapshot=.

In this buffer we can move up and down normally and hit =RET= when we want
to perform the default action which, in this case, is to get a help
buffer for the symbol at point.

With my =C-M-n= or =C-M-p= we essentially combine =C-n= or =C-p= into a single
motion.  This is useful when we want to continue from one line to the
next, such as by inspecting the help buffer of each of those embark
keymaps that we got the snapshot for.

[ this is a concept I got from Ivy's own version of operating on sets of
  targets ]
* Manual previews for Consult commands (consult.el)

Those specific "move+act" motions allow me to get manual previews for
all =consult.el= commands, even though I use the default minibuffer.
Otherwise I would need to use some other library to cycle candidates,
like =icomplete= or =selectrum=.

So here is an example with =consult-line= and purposeful manual previews:

+ Search a file for a pattern
+ Cycle the Embark candidates
+ Use =C-M-j= to "preview" the line at point or, =C-M-n= / =C-M-p= to preview
  the next/previous one and move the point there (the latter two accept
  a numeric argument)

The benefit of this workflow is that I can display a preview only when I
want to and, most importantly, I do it from inside the Embark buffer
instead of the minibuffer (which is why I can avoid Icomplete or
Selectrum).

NOTE: consult can be configured to display previews manually or on a
case-by-case basis, though I feel you only benefit from that if you are
using it with Icomplete or Selectrum.
* A look at ~embark-become~ and cross-package integration

One of my goals with extending Embark for my personal needs is to have
some fluidity or seamlessness while performing minibuffer-centric
actions.  This can be achieved with the =embark-become= command: it lets
you re-use the current minibuffer's input in another minibuffer command.

The default =embark-become= lets you switch contexts between =find-file=
(=C-x C-f=) and =switch-to-buffer= (=C-x b=).  Start either of those actions,
type something, and the invoke =embark-become= to switch to the other (you
should bind =embark-become= to some key---see my dotemacs).

The design of Embark is based on the principle of scoping actions inside
keymaps.  Each of those keymaps applies to a context that Embark can
interpret by reading the category of what is being completed against or
what the target at point is.  Long story short: we can bind our own
actions to keys in each of those contexts and/or we can define our own
keymaps (general or specific) to extend the default options.

What I have here is a work in progress, but consider those two scenaria
with Consult commands for (1) grep and find, (2) outline and line
search:

1. We can invoke the relevant grep command and then decide that what we
   were actually looking for is a find operation.  So we rely on
   =embark-become= to take us from one place to the next without losing
   what we have already inserted in the minibuffer.
2. Same principle for =consult-outline= and =consult-line=, where we may be
   searching for a pattern that exists in a heading only to realise that
   we wanted to query for all lines instead.  =embark-become= to the
   rescue!

* Further information

Refer to my "dotemacs" for the complete setup:
<https://protesilaos.com/emacs/dotemacs>.

And check the Git repositories of the projects:

+ <https://github.com/oantolin/embark>
+ <https://github.com/minad/consult>
```
