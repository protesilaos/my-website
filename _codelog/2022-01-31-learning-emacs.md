---
title: "Learning Emacs and Elisp"
excerpt: "Video introduction to the basics of learning Emacs and Emacs Lisp (Elisp)"
layout: vlog
mediaid: "46w9e4GAjsU"
---

In this video I explain how to use Emacs' Help system to get information
about the environment.  This is part of the basic skillset one needs to
make good use of Emacs.  I also talk about relevant information
regarding functions and variables as well as how to get started with
Emacs Lisp (Elisp).

Below is the text of the presentation.  Consider it a continuation of
what I have already been sharing in [my dotemacs](https://protesilaos.com/emacs/dotemacs)
about the frequently asked question _How do you learn Emacs?_.

```org
#+TITLE: Learning Emacs and Elisp
#+AUTHOR: Protesilaos Stavrou (https://protesilaos.com)
#+DATE: 2022-01-31



* Use a decent interface for completions

The best thing you can do to upgrade your Emacs setup is to use an
interface that visualises the available options whenever you use the
minibuffer, such as with the =M-x= key.

There are several options, though I recommend you get started with a
nimble tool called "Vertico" by Daniel Mendler: it is excellent for
newcomers as well as highly configurable for more experienced users.
One of the best Emacs packages on offer.

Before installing a package or updating existing ones, you need to
refresh the archive's index: =M-x package-refresh-contents=.

Then install the package =M-x package-install= followed by =vertico=.

Either do =M-x vertico-mode= or add this to your configuration and
evaluate it:

#+begin_src emacs-lisp
(vertico-mode 1)
#+end_src



* The Help system is your best friend

You can always learn by watching videos such as mine or those of David
Wilson (System Crafters), Andrew Tropin, Mike Zamansky, Raoul Comninos
(Emacs Elements), and others, though the best option will always be to
rely on your own means and leverage the self-documenting nature of
Emacs.  In other words, to become a competent user you need to master
the Help system.

All help commands start with the =C-h= key.  Get started with those:

+ C-h f :: Help for /functions/.
+ C-h v :: Help for /variables/.
+ C-h o :: Help for functions /or/ variables.
+ C-h k :: Help for the given /key/ binding.
+ C-h w :: Help for /where/ the given command is bound to.
+ C-h m :: Help for the current /modes/ (major and minor).

When the point is over a symbol (proper name) of a function or variable,
the =C-h f=, =C-h v=, or =C-h o= will use that as the default choice.

Note that when the symbol of a function or variable contains two dashes
=--= then it means that it is intended for use inside the file/package
that defines it.  Exercise caution if you plan to incorporate those in
your setup, as they might change without prior notice.



* The C-h as a prefix and as a suffix

In the previous section we demonstrated key sequences that start with
=C-h=.  This means that =C-h= is used as a prefix.  There is, however, the
option to use this key as a suffix to any sequence that is not yet
concluded.

For example, Emacs has lots of commands that start with =C-x r=.  These
relate to registers, bookmarks, and rectangle operations.  To produce a
Help buffer that shows us all the extensions to that sequence, we append
=C-h= to it, so =C-x r C-h=.

You can even use the =C-h= /suffix/ for the =C-h= /prefix/.  This is a fancy way
of saying that =C-h C-h= will present a special view about the available
help functions.

If you are using the =embark= package by Omar Antolín Camarena and do not
want to produce a Help buffer for the =C-h= suffix, add this to your
configuration:

#+begin_src emacs-lisp
(setq prefix-help-command #'embark-prefix-help-command)
#+end_src

Though make a habit to always learn the defaults before making sweeping
changes.  Otherwise you may not appreciate what is on offer and might
not fully understand how your system is pieced together.



* How to read manuals (they are not novels!)

Emacs is a powerful piece of software.  Its potential is unlocked only
after you become familiar with it.  That requires commitment, patience,
and persistence.

In other words: you learn Emacs one step at a time.  Part of that
process involves reading the wealth of documentation that is available
through the built-in Info reader.  Access it with =C-h i= and then use
=C-h m= to learn all about that mode.

Because the Emacs manual is a special file that you will be visiting
often, it has its own key binding: =C-h r= (think of "r" as a mnemonic for
"read").

As with all technical documentation, you do not read them in one go.
They are not stories.  Instead, you study them one snippet at a time.
Once you learn about it, you move to the next one, gradually broadening
your knowledge (and/or refining your setup).



* Tinker with Emacs Lisp (Elisp)

When you are comfortable with the aforementioned, you might want to
start tweaking Emacs to your liking by writing your own code.  As with
all things Emacs: keep it slow and steady.

I learnt Elisp without being a programmer and with no background
knowledge in Lisp or related.  Now, after 2.5 years of using Emacs, I am
at a point where I am "good enough" with my skills and have been
maintaining lots of code/packages.

Let's start with a very simple scenario, which is drawn from my early
days with Emacs.

+ Suppose you want to write a function that will be bound to a key.

+ Those are called "commands" because they are interactive.

+ This command will move the point (the cursor) 15 lines at a time in
  the given direction.

+ Type =C-h k= and follow it up with =C-n= or =C-p= (the commands that move to
  the next/previous line).  You will learn that those are called
  ~next-line~ and ~previous-line~, respectively.  The Help buffer tells you
  that these commands accept a numeric argument to move N lines at a
  time.  And it also includes a direct link to the source code.  By
  looking at source code you will eventually infer that functions are
  declared with the ~defun~ keyword (technically a Lisp macro).



With those in mind, you switch to the =*scratch*= buffer and start
experimenting:

#+begin_src emacs-lisp
(defun my-next-15-lines ()
  "Move to the next 15 lines."
  (interactive)                   ; this turns a function into a command
  (next-line 15))

(defun my-previous-15-lines ()
  "Move to the previous 15 lines."
  (interactive)
  (previous-line 15))
#+end_src

If you read the aforementioned Help buffer closely, you will realise
that your code can be improved, because the right command for custom
code is to use ~forward-line~.  So you update things accordingly:

#+begin_src emacs-lisp
(defun my-next-15-lines ()
  "Move to the next 15 lines."
  (interactive)
  (forward-line 15))

(defun my-previous-15-lines ()
  "Move to the previous 15 lines."
  (interactive)
  (forward-line -15))
#+end_src

Now you want to bind those to Ctrl+Shift and then n/p.  To learn how
Emacs represents any key, use =C-h k= and then type it.  You will get
=C-S-n= and =C-S-p=.

The manual explains how to write key bindings.  Here is how I do it:

#+begin_src emacs-lisp
(define-key global-map (kbd "C-S-n") #'my-next-15-lines)
(define-key global-map (kbd "C-S-p") #'my-previous-15-lines)
#+end_src

Notice that the =global-map= applies to all major modes.  Many commands
apply only to specific modes and thus have their own keymaps.  The =C-h k=
buffer informs you accordingly.



* Experiment with Elisp conditionality

Building on the previous example, let's add some variables and
conditions to the mix.  Here is a basic variable:

#+begin_src emacs-lisp
(defvar my-first-toggle nil
  "If non-nil, do stuff.")
#+end_src

[ Evaluate code by moving to its end and typing =C-x C-e= or in Elisp
  buffers with =C-M-x= with point inside of it.  There is also the =M-:=
  way, but let's keep it simple. ]

Let's go to the =*scratch*= and start experimenting:

#+begin_src emacs-lisp
(if my-first-toggle
    (message "It is true")
  (message "It is not true"))
#+end_src

While this may not be practical, let's add a third command which re-uses
the previous two:

#+begin_src emacs-lisp
(defun my-next-15-lines ()
  "Move to the next 15 lines."
  (interactive)
  (forward-line 15))

(defun my-previous-15-lines ()
  "Move to the previous 15 lines."
  (interactive)
  (forward-line -15))

(defun my-next-or-prev-15-lines ()
  "Move to the next or previous 15 lines.
The motion depends on the value of `my-first-toggle'."
  (interactive)
  (if my-first-toggle
      (my-next-15-lines)
    (my-previous-15-lines)))
#+end_src



A more realistic scenario in this case is to let your command accept
arguments (i.e. parameters that govern its behaviour).  The simplest one
is the =C-u= prefix argument, which you type before the key of the
command.

To read such an argument, you need this:

#+begin_src emacs-lisp
(defun my-next-or-prev-15-lines (&optional arg)
  "Move to the next or previous 15 lines.
With optional prefix ARG, move to the next lines.  Else to the previous ones."
  (interactive "P")
  (if my-first-toggle
      (my-next-15-lines)
    (my-previous-15-lines)))
#+end_src

Type =C-h f= and then search for ~interactive~.  It tells you other presets
it accepts (you can always write your own, but that is advanced stuff).

Notice the use of the =&optional= type.  Without it, the command would
return an error if it where not called with the prefix argument.  That
would, in turn, make the ~if~ meaningless, because it would always be
true.



* Practice and be patient

Learn the fundamentals.  The skill that will always be useful is to use
the Help system (and Emacs' introspectable nature in general, but let's
not get technical).

Be patient.  There is no shortcut to expertise.  All experts started out
as rookies.  This also means that you learn from your mistakes through a
process of trial and error: it is okay.

Tinker with Elisp by trying to understand small patterns.  Then
experiment with ways to combine them into larger designs.

Complement the official resources with other learning material, such as
blog posts, videos, and the code of other people.

Always---always---read the documentation!
```
