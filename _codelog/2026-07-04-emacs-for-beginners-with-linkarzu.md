---
title: "Emacs for beginners with Christian Arzu (@linkarzu on YouTube)"
excerpt: "I will do a live stream with Christian from the @linkarzu YouTube channel. Our focus is on starting out with Emacs."
---

This Sunday I will do a live stream with Christian Arzu. The details
are not finalised yet, so I will make the announcement separately.

Christian is a NeoVim user who is Emacs-curious. He is trying out
Emacs and needs someone to guide him at this early stage, which I am
happy to do.

Last year I had a ~2.5-hour interview with Christian Arzu from the
@linkarzu YouTube channel: <https://protesilaos.com/codelog/2025-08-01-linkarzu-chat-emacs-neovim-philosophy/>.

What follows are some comments on Christian's article [Expectations
from Prot's Emacs Coaching Sessions](https://linkarzu.com/posts/emacs/prot-love-letter/) (2026-07-03).

## Install Emacs and what version to use on the MacOS

The premise of our meeting is that I will do the handholding. You will
thus install the `emacs-plus` package version 30. There are always a
zillion excellent options, though handholding demands that we pick
one.

Emacs 30 is the latest stable version of Emacs. Emacs 31 will be
released in the near future, at which point you can upgrade.

In general, Emacs is a very conservative project (which I think is the
right approach): there are no major breaking changes between versions,
so even an older stable version will most probably be perfectly fine.

## Vanilla Emacs or Doom Emacs?

Vanilla 100%, which is why there is no "Prot Emacs" distro. You have
to try this in earnest for at least one week.

The disruption vanilla Emacs creates is good for you long-term: 

- it forces you to slow down;
- it makes it clear that your old habits do not apply;
- now you have to gradually learn from the ground up.

> I come from a Neovim background, so is Doom Emacs a good choice or
> not and why.

Doom Emacs is fine in its own right: it takes care of everything. With
vanilla Emacs you have to piece together a system that works for you,
so you will better understand what each part does and why it is there.

This will, in turn, empower you to make more informed decisions as you
continue in your Emacs journey. Plus, you will be exposed to more
Emacs Lisp, which is what unlocks the superpower of Emacs' extensibility.

## Tutorial and basic keys

> So should I do the whole thing or should I start with a few basics
> and go from there. Like a cheat-sheet or something?

The tutorial is mandatory. Do it again if you have to.

Other than that, you are on a custom keyboard which has the potential
to make things much easier for you.

- I assume you already have the arrow keys available at some
  convenient spot (mine are `LAYER` + `h`, `j`, `k`, `l` (qwerty
  layout)).
- Bonus points is you also have `Home`, `PgDn`, `PgUp`, `End` bound
  somewhere (mine are `LAYER` + `y`, `u`, `i`, `o`). Those are enough
  for basic motions.

Additionally, make sure you can access the `Ctrl` and `Alt` (`Meta`)
keys. Emacs relies on them for practically everything.

## What do I want Emacs for?

> I still don’t know what I want, but I think that I want to use the
> life organizing abilities that Emacs provides through org.

I think Org is a good reason to start with Emacs.

Writing your tasks and notes in Org will also help you practice
general skills, such as to open a file, create a bookmark, switch to a
buffer, move around to edit text, search/grep for something.

Beside that, you want some core functionality that improves every
aspect of Emacs. This concerns the minibuffer, which is the interface
where you can provide input such as to choose a command to run, open a
new file from anywhere in the filesystem, switch to a specific buffer,
and more.

If you commit to using Emacs for Org, you will find other interesting
uses, such as to have your RSS reader in Emacs. When you read an RSS
entry, you can link to it with Org, so you can create a task/note
about it. Same idea for eventually integrating your email in Emacs:
you use Org to connect messages you receive to appointments, for
example.

And if you have done all that, well, you will be searching for reasons
to bring your programming and virtually everything text-related into
Emacs. You will understand why it makes sense to do things this way.

## You're a fraud, why do you ask for money, isn't YouTube Ads enough?

This is about Christian's premium offerings for which he got backlash:

> I do 100% agree that I owe these interviews to my guests, I can’t
> thank them enough. Prot and many of the other guests have dedicated
> years of their life into researching and figuring stuff out, to then
> share it with all of us in an easy way to understand. That is just
> priceless, all of that work and dedication, that is usually tied to
> paid education and years of experience, just being shared with us.
> So I admire and have so much respect for the guests.

Christian does a lot of decent work with those videos. If you have
watched any of my videos, you know that their production quality is
poor, the audio is awkward, and even my hairstyle is unpredictable! 🙃
Christian's videos are high quality. The guests, where relevant, are
also carefully chosen, making for insightful conversations.

For example, in my interview with Christian I had the opportunity to
cover many topics that I would otherwise not mention the way I did.
This is no mere repackaging of information: Christian helped me share
something new in a format that is fun and approachable.

Even without guests though, these are publications about tools we care
about. It is a nice, casual experience. We have something to discuss
and we share our interests together.

In short, Christian makes a positive contribution to the community.

I am in favour of Christian asking for donations and even paywalling
some of his contributions. Same for everybody else. Nobody is entitled
to content and the free stuff out there is already more than enough.

Emacs is a great piece of software. Though what makes it even better
is the community around it. Through the community we preserve
knowledge and get extensions for Emacs that make our computing life a
bit better.

I personally dislike the snake oil merchant, the one who promises
magical solutions to fix your life. But even then, the real work is to
encourage people to be prudent by applying judgement. Denouncing
someone is not constructive long-term: they do what they can while we
focus on doing the work we care about.

That granted, learn to ignore negative people (which can also be the
naysaying inner voice). They will complain if you are arrogant. They
will complain if you are modest. They will ridicule you if you are
creative. They will ridicule you if you are conventional. They will
call you names if they find you pretty. They will call you names if
they find you ugly. They have nothing better to do, whereas you have
plenty of things to contribute. The best middle finger is consistent,
high quality work---and this is, paradoxically, how the negative
person provides the impetus for something decent to happen.
