---
title: 'Emacs: Org heading faces now adapt to their context'
excerpt: 'Upstream org-mode now contains a patch that allows faces for keywords, priority cookies, etc. to inherit from the underlying heading.'
---

As of commit `979e82fc3`, upstream Org mode now contains a patch that
allows faces that are combined with headings, such as to-do keywords and
priority cookies, to inherit from the underlying heading's properties.
The code will become widely available in Org version
9.5.[^NoteOrgVersion]

This practically means that if you (or your theme) use a `:background`,
`:overline`, `:height`, or `:weight` for Org's heading levels, those
attributes will also be passed on to elements that do not have them.
Overall, it makes for a visually consistent experience.

The following screenshots on `emacs -Q` show the before and after
states, while also highlighting the inconsistency of some faces actually
adapting to their context even prior to the patch.

<img alt="Org headings before" src="{{ '/assets/images/attachments/org-adaptive-headings-before.png' | absolute_url }}"/>

<img alt="Org headings after" src="{{ '/assets/images/attachments/org-adaptive-headings-after.png' | absolute_url }}"/>

## A collective effort

The author of the patch is Ihor Radchenko, to whom I am most thankful.
Special thanks to Org's maintainer, Bastien Guerry who made this a goal
for Org 9.5.

The fix comes as a response to a thread that I [initiated in late April
2020](https://lists.gnu.org/archive/html/emacs-orgmode/2020-04/msg00406.html),
in which I initially documented the inconsistencies and then, with
advice from Bastien, shared [reproducible recipes for testing
them](https://lists.gnu.org/archive/html/emacs-orgmode/2020-09/msg00240.html).

Ihor's patch ties together feedback from various sources, which I helped
put together.  In particular, I conveyed information and insights
gathered from [issue 37 on my Modus themes' Gitlab
repo](https://gitlab.com/protesilaos/modus-themes/-/issues/37).  Anders
Johansson's contribution was instrumental in identifying the source of
the problem in Org's code base, namely, how font-lock was configured to
work for some faces.

I had experienced the problem while developing the Modus themes, which
have comprehensive customisation options for headings (see [their
manual](https://protesilaos.com/emacs/modus-themes)).

## Being pro-active and working with upstream

On the mailing list I was informed that a partial fix for this issue
already existed in Doom Emacs, specifically the themes packaged for it.
Bastien informed me that it was never communicated to them, which I
consider a missed opportunity.

As such, it is pertinent to remind ourselves that Emacs is a community
that thrives on feedback loops of communication.  These presuppose a
pro-active disposition to report findings to the relevant sources as
soon as they arise.  When we share know-how, we help grow our stock of
knowledge and thus refine the tools derived from it.  When we contribute
a bug fix upstream, we ensure that everyone is better off as a result.
Whereas when we maintain uncoordinated patches we set ourselves up for
longer term trouble, in the form of non-reproducible maintenance burdens
and unnecessary heterogeneity.

Please be reminded that people contribute to Emacs in their free time.
While some notable exceptions do raise an income from their
contributions (which is consistent with free software values), the fact
is that the community at-large operates on a voluntary basis.

You must be prepared to make an effort if you wish to see things move
forward.  Learn who the maintainers are and what is their preferred
medium of communication.  The best way to help is to elucidate your
ideas and share them accordingly.  For bug reports, this often means
that you need to write down the steps necessary to reproduce your issue
in an `emacs -Q` session.  Or you may have to include a visual
representation of your case while using the offending package.  Adapt to
the specifics of the case, while remaining faithful to the spirit of
pro-action and collaboration.

When in doubt, do not hesitate to ask.  Be humble about it, remain
prepared to do some work, and do not expect anyone to spoon-feed you
because of some misplaced sense of entitlement (i.e. don't go on some
forum and complain about how this or that is "garbage"---petulance is
not helpful).  Everyone starts off as a beginner.  We are all in this
together.

[^NoteOrgVersion]: Emacs 28, the development branch which currently is
    just part of `master`, ships Org 9.3, so you must install Org from
    source if you cannot wait for an update.  Same principle for the
    latest stable version of Emacs: 27.1.
