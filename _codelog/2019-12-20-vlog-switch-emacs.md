---
title: 'All about switching to Emacs (video blog)'
excerpt: 'In this video I offer the information you need before deciding to switch to GNU Emacs.'
layout: vlog
mediaid: 'FLjbKuoBlXs'
---

In this video presentation I talk at length about the theme of switching
to GNU Emacs.  I first discuss what exactly makes Emacs unique.  Then I
talk the issue of the Emacs key bindings and their underlying method.  I
also offer some thoughts for when it would be a bad idea to switch to
Emacs, concluding that this is a decision that needs to be thought
through very carefully.

The presentation was done inside of Emacs, using nothing but plain text,
which I append in the Annex below.

Copy the code from [my dotemacs](https://protesilaos.com/emacs/dotemacs).


## Annex with the plain text of the presentation

```
#+TITLE: Vlog: switching to Emacs
#+AUTHOR: Protesilaos Stavrou (https://protesilaos.com/)

* Switching to Emacs

Why you might want to switch.  Or why you may be better off without it.

** Emacs as a platform

These are the absolute essentials of what make Emacs special.

*** Emacs is not just a text editor

Emacs is a lisp interpreter:

+ Its core is written in C.
+ And most of what you work with is done in elisp (emacs lisp).

Emacs was never meant to just edit text.

It is designed to be extended in order to meet the user's needs.

/Extensibility/ is the quintessential Emacs quality.

You can modify any piece of elisp /in real time/.

Just evaluate some relevant function (modify an existing one or write
something new).

Extensibility presupposes /instrospectable/ functionality.  You can:

+ Find documentation for every aspect of Emacs, from inside of Emacs.
+ Learn about the function that a key binding executes.
+ Study the source of any function.

*** Extensibility is great

Use Emacs for any kind of text-heavy purpose:

1. email
2. news feeds
3. music playback
4. file management
5. agenda, calendar, to-do (org-mode)…

And several of these can be combined, such as in my case:

- bongo + dired (music management)
- mu4e + org-capture (store direct link to email as TODO)
- elfeed + org-capture (same for feeds)

*** Emacs as a Unix front-end

Emacs can be your interactive, general-purpose OS controller.

You can think of Emacs as a customisable interface for most CLI tools.

These are just some examples drawn from recent videos I did:

| Emacs           | Unix                 |
|-----------------+----------------------|
| dired           | cd,ls,cp,mv,rm,mkdir |
| find-name-dired | find + dired         |
| find-grep-dired | grep + dired         |
| counsel-rg      | rg (ripgrep)         |
| counsel-fzf     | fzf                  |

The key is /interactivity/.

You still use Unix tools.  They offer a nice user experience.

*** Other uses of Emacs

Emacs implements a text editor (surprise!).

In addition, Emacs can multiplex "windows" (splits/panes).

It can also easily switch between open/recent windows/files (buffers).

Combine those CLI goodies with keyboard macros, search+replace, etc.

It is a complete package.  There is even a window manager for it: EXWM.

** Emacs keys are not crazy

They are based on mnemonics and simple conventions.

Once you learn the basics, you can expand with ease.

*** Basic conventions

Take =C-x= and =M-x=:

+ The former invokes the command bound to a key chord.
+ The latter is the extended version: call command by its name.

Here are some more conventions:

| Key   | Scope      |
|-------+------------|
| C-f   | character  |
| M-f   | word       |
| C-M-f | expression |

You see the pattern: small, larger, largest.

*** Strong mnemonics

With a little bit of experience, you can remember a lot of things.

For example, you learn that the prefix for all help commands is =C-h=.

So once you know that, you can recall common extensions:

| Key   | Reference            |
|-------+----------------------|
| C-h f | help about FUNCTIONS |
| C-h k | help about KEYS      |
| C-h m | help about MODES     |
| C-h v | help about VARIABLES |

Once you are in the middle of a key chord, hit =C-h= to get possible
completion candidates (works by default and also with =which-key=).

These, by the way, link to the introspectable nature of Emacs.

*** Mnemonics help with scaling knowledge

Just follow conventions and you can implement your own keys.

Here is a sample of my scalability (some invoke custom functions).

| Key chord | Command            |
|-----------+--------------------|
| M-s g     | counsel-git-grep   |
| M-s n     | dired-narrow       |
| M-s r     | counsel-rg         |
| M-s s     | swiper-multi       |
| M-s z     | counsel-fzf        |
| M-s %     | anzu-query-replace |

Now look at the commands on the table.  All of them are "searches".

The standard search is =C-s=.  A more advanced search must be =M-s=.

But because there are many advanced searches, =M-s= has to be a prefix.

Look at =M-s %=.  It extends the principle of =M-%= (=query-replace=).

*Mnemonics and good conventions help you acquire knowledge at scale.*

Other possible good keys, based on the above:

| Key chord | Possibilities |
|-----------+---------------|
| M-s f     | Files?        |
| M-s d     | Directories?  |
| …         | …             |

*** Custom key bindings

Emacs is meant to be used by YOU.  Configure it as you will.

Keys are the first thing you want to be comfortable with.

Once you grasp the basics, you can adapt Emacs to your liking.

Follow conventions: you can easily scale your custom keys as well.

Some examples of my custom keys.  These use the =Super= modifier:

| Key binding | Alias for default |
|-------------+-------------------|
| s-o         | C-x o             |
| s-b         | C-x b             |
| s-f         | C-x f             |
| s-d         | C-x d             |

There also are some keys that are reserved for users:

+ =C-c= KEY
+ Functions keys F{5-9}

Others are reserved for packages (major modes):

+ =C-c= followed by a control character or a digit

*But you can ultimately customise those as well.*

*** Let M-x be your friend

You do not need to bind every function to a key.  Rely on =M-x=.

Use a good scoring system to let it "guess" what you want.

For example, use =ivy= with =amx= or =prescient= (I switched to the latter).

It will surface the most frequent and recent commands.

*** I don't care!  Just give me a good text editor!

That is because you still think of Emacs as a text editor.

At any rate…

Use =evil-mode=.  It emulates Vim inside of Emacs.

=evil-mode= has lots of users and frameworks built around it.

OR

Maybe you should not switch to Emacs at all.  Let's talk…

** You do not have to switch

There is no pressure to use Emacs.  No-one will judge you for it.

*** People do not care if you use Emacs or not

No employer will double your wage just because you have a "dotemacs".

Nobody will invite you to regale them with some obscure =M-x butterfly=.

You do not win social points by using Emacs.

Emacs will not, in and of itself, make you an elite hacker (though if
you are a hacker at heart, you will appreciate Emacs)

Emacs is just a tool.  A possible option out of many good alternatives.

Emacs is not a substitute for social status or prestige.

*** Is your current setup productive?

If yes, then why would you want to switch to Emacs?

Do you realise that Emacs is a platform and, in some respect, a state of
mind?

Are you sure you want to proceed?

Do not switch to Emacs just so you can re-create your current setup.
Your workflow is already good for your use-case.

There's no point in doing a lateral step towards re-implementing your
working system inside of Emacs.  Doing it just for that is too much
trouble for too little value.

(this applies to other things as well such as why switch from i3wm to
bspwm if what you have works perfectly fine for you?)

*The grass is not always greener on the other side.*

** Emacs is a commitment

You need to put in the effort.

It is not some project you carry out over the weekend.

*** You cannot be an "Emacs tourist"

You distro-hop or switch window managers (in the free software space):

+ you experiment and learn a lot;
+ doable, lots of similarities.

But Emacs is different: it is its own thing; /sui generis/ if you will.
To switch to Emacs you must be prepared for what is to come.

It is like changing your habits: you have a longer-term goal in mind.
You understand the consequences of your choices.

For example, you do not relocate to the mountain and wonder where all
the accoutrements of city life are.

You make a conscious decision.  You know what to expect.

Emacs requires deliberation.

*Think things through.  Do not set yourself up for failure.*

If you come to Emacs expecting a "more powerful" editor out-of-the-box,
/you will be disappointed/.

*** The Emacs mindset

Emacs is your conduit to an integrated computing environment.

You want to switch to Emacs because you are a power user.

You seek ultimate control over your computing interfaces.

You hate inconsistencies.  You like predictability.

Furthermore, you enjoy learning and understand that whatever you do, you
*need to read the docs*.

This is the "Emacs mindset".

Are you already a CLI power user?

Do you have a bespoke desktop session with your own dotfiles?

Do you enjoy tweaking every aspect of it?

If so, you already have the right outlook: give Emacs a fair chance.

Use it for, say, two months full-time.

*Let Emacs have your undivided attention*.

*** There is no shortcut to developing expertise

Whether you go with the default, some framework, or someone else's
configurations, you /still need to read the documentation/.

To become proficient, you must put in the effort.  It is the same with
every field of endeavour.  You have to earn it.

Emacs will be your friend once you know what you are telling it to do.

Learn by example, read the source code, study the help pages.  All of
these can be done inside of Emacs, because it is introspectable.

Remember—Emacs is not for tourists.

This is not some tacit elitism.  It is a matter of fact:

+ Emacs is a powerful tool, not a toy.
+ All such tools have a steeper learning curve.

Emacs requires patience and perseverance until you can master it.

Take your time.

*** Should I go vanilla or choose an Emacs framework/distro?

I can only share my personal experience here.

I switched to Emacs in July (2019).  I started from scratch:

+ no expectations
+ no rush to copy my previous setup
+ keep an open mind
+ judge only after being exposed to the defaults
+ gradually build up the skills

This is how I like it.  It grows organically.

You gradually build your own tool, with care and precision.

I can only recommend this path.  It is the best way to learn the
peculiarities of Emacs.

It is the best way to understand what makes Emacs unique.

(hint: it is not the idiosyncratic key bindings)

I am not against using frameworks.  They offer a polished experience.

Frameworks allow you to be productive in virtually no time.

But it can be difficult to understand how they are pieced together.

They deny you of a unique opportunity: to learn by doing.

(this is also why it is good to build your custom desktop session or
install Arch/Void/Gentoo/whatever the "right way")

*** When the switch to Emacs matters or not

To recapitulate.  The switch to Emacs should not be taken lightly.

Do it if you wish to pursue one or more of the following:

+ Fulfil the potential of the "Emacs mindset" of integrated computing.
+ Learn about Emacs Lisp or work with Lisps in general.
+ Engage with this wonderful subset of the free software community.
+ Satisfy your inquisitive and dubitative nature (knowledge as an end).

Conversely, do not switch to Emacs, if:

+ You are already happy with what you got.
+ You are not willing to unsettle your yourself.
+ You want something that "just works" for everything.
+ You wish to become popular among your peers.
```
