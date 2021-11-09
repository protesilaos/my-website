---
title: 'Why I switched to Emacs'
subtitle: 'In pursuit of an integrated computing environment'
excerpt: 'Documenting the reasons that led me to switch away from Vim+Tmux+Bwpm+CLI to just use Emacs.'
---

Followers of my website's [codelog](https://protesilaos.com/codelog)
section are aware that I am an Emacs user since the start of July.
They also know that prior to that, I was using a custom desktop
session involving bspwm, tmux, vim, and relevant command-line
utilities.

While I have already produced a lot of content on Emacs, I have yet to
tackle directly the underlying "why" that led to the switch.  So let
us start from the beginning.

## The realisation of heterogeneity

In early July 2019 I [published the final version of "Prot's Dots For
Debian"](https://protesilaos.com/pdfd).  This is a book detailing the
various aspects of my custom desktop session, i.e. my _previous_
computing environment setup.  What I learnt through the process of
writing PDFD is that it is intrinsically difficult to maintain a
heterogeneous, highly customised, system.

Documenting it is hard, because the different components utilise their
own language and paradigms.  For example, the tmux and vim configs use
a key binding notation similar to Emacs.  Whereas bspwm's hotkey
daemon (sxhkd) uses its own syntax.  This is not to suggest that it is
inferior software, just that such disparities introduce friction.
There are many cases like this which quickly add up.

Heterogeneity also affects the very definition and implementation of
the configurations.  Take the placement of the dotfiles as a case in
point.  Some files must be placed directly at `$HOME`, others in a
subdirectory inside `$XDG_CONFIG_HOME` (else `~/.config`), and others
still in their own directory inside `$HOME`.  Without guidance, it can
be difficult to place things where they belong.  I had to use GNU Stow
to keep the dotfiles under control, otherwise the process would be too
tedious and prone to error.

To be clear: my previous setup was quite productive.  It, nonetheless,
lacks the level of integration one expects from a singular computing
experience.  The combination of disparate tools can offer the
impression of an integrated working environment.  They can work _just
fine_, but never reach the ultimate potential of a bespoke system that
is consistent throughout.

## Why integration matters

Consistency is important because it minimises or eliminates the
friction of switching contexts.  If everything works and looks the
same, you can maintain your rhythm, staying "in the flow" for longer.

I am the kind of person who notices minor details in the interface.
Inconsistencies distract and bother me.  They hamper my productivity.
This is no hyperbole.  I _really_ need to exert full control over my
UI, otherwise I feel the urge to stop what I am doing and fix the
perceived problem.

This is, by the by, why I do not care at all about the frivolous
customisations people post on the various online fora for *nix
enthusiasts—the whole "ricing" thing.  Sure, they catch the eye.  And
that is exactly where the problem lies!  Your focus must be on the
content, not its surroundings.

But I digress…

## Enter Emacs

As I discussed in my latest vlog on the [Emacs mindset and Unix
philosophy](https://protesilaos.com/codelog/2019-08-09-vlog-emacs-unix/),
using Emacs is perfectly in line with the intentions of the
terminal/CLI power user.  It is, in other words, a continuation of the
underlying rationale that went into my bspwm session; an extension of
the ideas underpinning PDFD.

Emacs conforms with the notion of optimal performance at a given task:
it interprets lisp in splendid fashion.  This allows it to be an
application platform for everything that is written in elisp.  And
there is a lot!

Allow me to regale you with a short background story, before stating
anew the main thesis of my last vlog.  I actually attempted a switch
to Emacs as early as mid-March 2018—and I [wrote about it shortly
thereafter](https://protesilaos.com/codelog/trying-emacs/).

That did not go as expected, in large part because of my expectations:
I thought of Emacs as a drop-in replacement for Vim, plus a few
extras.  Big mistake!  While it is true that it is a text editor and
can be used exclusively in that capacity, Emacs is at the absolute
peak of its powers when it is treated as an application platform.  At
the time, I wanted to finalise my custom desktop session, so I could
not commit to the change.

With PDFD out, I feel that cycle was completed successfully.  I learnt
a lot in the process, including the downsides of a heterogeneous
custom desktop session.

## Emacs as the epicentre of an Integrated Computing Environment

My renewed interest in Emacs is neither hype nor fancy.  I truly
believe that using Emacs as an application platform is the way to a
consistent computing experience.

Bringing everything into Emacs makes perfect sense:

* One language to rule them all (elisp).  You no longer need to bother
  with a multitude of configuration formats and practices.  To this
  end, chances are you can configure _everything_ about your system in
  a single file that is trivial to employ anywhere Emacs can run.  My
  [Emacs init file](https://protesilaos.com/emacs/dotemacs), written
  using the literate programming paradigm, is a case in point
  (granted, it is still in its infancy as of this writing).
* Consistent key bindings.  Particularly true with the standard Emacs
  key or with custom key chords that follow the same principles.  Vi
  emulation can also deliver the desired results, but the process is
  more involved.
* Same UI paradigms.  For example, killing a line in a buffer is the
  same as killing a line in an `emms` playlist, or performing the same
  action inside of a writable `dired` or `occur` buffer.
* Shared colours and styles ("faces").  A good theme is all you need.
  My [Modus themes](https://gitlab.com/protesilaos/modus-themes)
  ensure a consistent contrast ratio between foreground and background
  values of 7:1 or higher.  This conforms with the loftiest
  accessibility standard (WCAG AAA).  Furthermore, _Modus_ employs
  colour and typographic elements as a way of conveying the meaning of
  an interface, such as by highlighting the constructs of a regular
  expression in a more intense colour than those matched by a
  wildcard within the same search.
  
I am taking this to its logical end.  I already switched away from my
bspwm session because I needed to eliminate all the key chords that
the window manager would rely upon.  Now I am using Xfce on Debian 10
'buster' with _all hotkeys disabled_.  I need them for Emacs.
Especially those that involve `Super`.  There is no such thing as too
many modifier keys!

## Incremental progress

Do not bother comparing Emacs with Vim.  They fulfil a different role.
Just use Emacs as the cornerstone of your Integrated Computing
Environment.  If you cannot live without Vim, then get the packages
for that.  I do, nonetheless, urge you to make an honest attempt at
using just the Emacs keys (I was a Vim user for ~3 years and switched
easily in less than a month).

Whatever you do, I recommend you take things slowly.  Try to learn one
function at a time: use default shortcuts or simply `M-x FUNCTION`.
Every action in Emacs is, in fact, implemented as a function (based on
my short experience).  Continuous practice will train your mind and
muscle memory to the Emacs workflows.  You might struggle at first,
but things will start making sense very quickly if you nail one thing
at a time.

Here is how I am doing it:

* Go by the official manual.  Identify a chapter with information you
  would like to put to the test.  Practice that.
* Search what others are doing with that workflow or set of commands.
  Check their tweaks and assess whether they make sense for your
  setup.
* If there is something you feel is not good enough, try finding a
  package for it.  Chances are someone out there had the same problem
  as you and decided to write some elisp for it.
* When implementing your own key chords, examine whether they conflict
  with some important function you could potentially need.  This task
  will become easier once you know which modes/workflows you use the
  most.
* Learn how to use the built-in documentation.  It is an invaluable
  skill for the entirety of your life as an Emacs user.
  
The gist is that you should be learning by doing.  It takes patience
and dedication.  Study and reuse other people's code, but do not
blindly copy-paste things: patterns of behaviour you do not understand
will quickly accumulate, resulting in a potentially fragmented,
frustrating experience.

The key is to not expect instant gratification.  I know, this is how
most of the world works these days.  Thankfully, Emacs runs contrary
to the zeitgeist: it caters to the user who cares deeply about the
quality and functionality of their tools.
