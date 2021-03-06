---
title: 'Default Emacs completion and extras'
excerpt: 'Video demo of my current completion framework that is pieced together using the original minibuffer and several modules.'
layout: vlog
mediaid: '43Dg5zYPHTU'
---

In this video I offer an overview of my current completion framework for
Emacs.  It consists of a set of modules that are pieced together into a
robust system.  The centrepiece is the standard minibuffer.

The text of the presentation is available right below (`org-mode`
notation).  Refer to my Emacs configuration file ("dotemacs") for the
implementation details of my completion framework and everything else I
currently have: <https://protesilaos.com/emacs/dotemacs>.

* * *

```org
#+TITLE: Default Emacs completion and extras
#+AUTHOR: Protesilaos Stavrou · protesilaos.com

* Piecing together a completion framework

Today I will talk to you about how I currently handle completion in
Emacs.  The plan is to tour you around the various tools I use; tools
which comprise my system for narrowing down a list of candidates.

My system consists of the following constituents:

+ Default minibuffer (exactly what you get when you run =emacs -Q= from
  the command line).
+ =orderless= completion style, which extends the built-in list of pattern
  matching =completion-styles=.
+ =embark= to visualise the list of completion candidates, as well as
  provide actions on a per-item or per-set basis.
+ =consult= to enhance several minibuffer-centric commands.
+ =marginalia= to provide meta-information to various completion lists.

All of the above are modular tools that are independent of each other
yet can operate in tandem.  One can, for example, use =icomplete= or
=selectrum= instead of the default minibuffer.

* Orderless and the built-in ~partial-completion~

As its name suggests, Orderless matches groups out-of-order.  A "group"
can be one among many styles, including a regular expression, a literal
string, an initialism, and so on.  The styles are configurable, while
the list is comprehensive.

Orderless has a concept of "style dispatchers".  Those are user-defined
single characters that are used as a suffix to each group and assign to
it a particular pattern matching style.  For example, I use the equals
sign to declare that a group should be read as a literal string.

While the built-in =partial-completion= covers the niche of dynamic
completion for certain commands.  A case in point is with the =find-file=
command (=C-x C-f=), where it can expand an abbreviated path =~/.l/s/fo=
into =~/.local/share/fonts=.

* Embark for per-item actions (part 1)

The best way to conceptualise Embark is as a contextual menu.  It lets
you carry out context-dependent actions on targets.

What constitutes a "target" will depend on the case: it can it the
current item in the completion list, the symbol at point, or some URL
right under the cursor.  Your conduit to this mode of operation is the
=embark-act= command, which you should bind to a convenient key (=C-,= in my
case).

Let us try these actions on individual targets:

+ Get help for =embark-act= by placing point over it.
+ Browse https://protesilaos.com/emacs/modus-themes with =eww=.  Then save the
  link to the kill-ring and yank from there afterwards.
+ Run =describe-function= and insert some function here.
+ Run =M-x switch-buffers= and then kill a buffer instead of switching to
  it.

Each context is bound to a keymap.  The keymap holds the associations
between key bindings and commands that you may call on the given target.

To learn more about the commands you can use after invoking =embark-act=,
type =C-h= (or set up =which-key=---check my dotemacs for the implementation
details).

[ remember that =C-h= as a suffix to any key chord, is a standard way to
  get a Help buffer for all keys that complete the chord ]

* Embark for per-set actions (part 2)

Other than act on a per-item basis, Embark can operate on entire sets of
targets.  Allow me to introduce this concept with an example: we invoke
=M-x describe-keymap= and then search for "embark" to find all keymaps
that pertain to the various contexts in which Embark can perform
meaningful tasks (I bind that help command to =C-h K=).  Now we use
=embark-occur= to produce a persistent buffer with the list of candidates.
It will still run the default action on each target.

You have also seen Embark's "live occur", but let me formally introduce
it to you.  This is a buffer that is initially linked to an active
minibuffer session.  It gets auto-updated to match the input in the
minibuffer and to narrow the list of candidates accordingly.  So if I
call =M-x switch-buffers= (=C-x b=) and type something, this "live occur"
will show me what the matching buffers are.

Because these are standard buffers, we can store them on the disk and
revisit them in the future.  Use =M-x write-file= (=C-x C-w=).

Embark offers another neat utility: =embark-export=.  It produces a buffer
whose major mode matches the category of the targets: =dired-mode= for
files/directories and =ibuffer-mode= for buffers.  Then you can benefit
from the power of those modes.

This per-set functionality of Embark is what allows us to use the
default minibuffer for all completions.  While we could add =icomplete= or
=selectrum= to the mix, there is no need for such an addition.  Embark
live occur merely shows the candidates that are already there and which
the minibuffer is fully aware of.

* Consult for enhanced minibuffer commands

=consult= has a dual purpose:

1. Enhance existing commands, like =M-x imenu= or =M-x switch-to-buffer=.
2. Provide new functionality, such as =consult-line=, =consult-mark=, and
   asynchronously updating grep/find commands.

What this "enhancement" means depends on the case.  Commands such as
those that navigate lines, get an optional preview.  The likes of
=consult-imenu= offer a concept of filtering per type of input: this is
called "narrowing" in Consult's verbiage and is controlled by a key map.

Let us try some common workflows to witness the synergies between the
modules that comprise my system.

+ Visit a large Org file.  Invoke =consult-outline= and produce a
  persistent buffer out of it with =embark-occur=.  This works as an index
  of buffer positions, a "table of contents" if you will.

+ Call =consult-imenu= and use =consult-narrow= to filter by the type of the
  syntactic constructs.

* Marginalia for completion annotations

Finally we have =marginalia=, which you have already seen in the various
Embark live occur buffers I have put on display.  It enriches completion
candidates with pertinent meta information.

Here are some commands that benefit from such annotations:

+ all =describe-*= commands present the first line of the doc string.

+ =switch-to-buffer= (=C-x b=) documents the buffer's major mode and status,
  as well as its underlying file's path.

+ =find-file= (=C-x C-f=) includes the file size, permissions and date.

You get the idea.

Currently those annotations are decorative, in the sense that you cannot
use them as filter predicates or have something like =orderless= do
perform pattern matching against them.  Still, I find this lightweight
utility to be quite valuable.

* A system I can understand

About a year ago I switched from Ivy to Icomplete.  I wanted to simplify
my setup in order to make sense of it.  Doing so helped me learn some
Elisp, mostly through trial and error, and by relying on Emacs'
introspection utilities.  This reminded me of the value proposition of
modularity: a system of linkable-yet-standalone tools is robust in its
own right, while it can be constructed and deconstructed at will both in
pursuit of utilitarian ends and for educational purposes.

By piecing together a system out of Embark, Consult, Orderless,
Marginalia, the default minibuffer, and my extras, I am in a position to
clearly comprehend what is going on.  This is not knowledge for its own
sake: it has the tangible benefit of equipping me with the means to
extend or otherwise tweak my completion framework so that it aligns with
my expectations.

I thus wish to congratulate the authors of those packages.  We have Omar
Antolín Camarena, who develops =embark= and =orderless=.  While Daniel
Mendler produces =consult= (among others).  While both of them maintain
the =marginalia= library.  I really appreciate what they do: their code is
top-notch, but they also invest a lot of effort in documentation.
Manuals and informative READMEs are of paramount importance in bridging
the gap between developers and users.  You read the instructions and you
learn how the thing works.  Then, once you have the requisite confidence
in your abilities, you can delve into the source code.

Here is my rule of thumb: if a project has good docs, then it shows that
the developer is dedicated and meticulous in their work.  Use that as
your guide when picking software.  I am happy to have done so.

* Further information

Refer to my "dotemacs" for my complete setup:
<https://protesilaos.com/emacs/dotemacs>.

And check the Git repositories of all those projects:

+ <https://github.com/minad/consult>
+ <https://github.com/oantolin/embark>
+ <https://github.com/minad/marginalia>
+ <https://github.com/oantolin/orderless>
```
