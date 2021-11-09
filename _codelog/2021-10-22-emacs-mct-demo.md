---
title: "Demo of my Minibuffer and Completions in Tandem (mct.el) for Emacs"
subtitle: "Enhancements for the default completion UI"
excerpt: "Minibuffer and Completions in Tandem (mct.el) is a new package of mine which provides enhancements for the default completion UI."
layout: vlog
mediaid: "roSD50L2z-A"
---

In this video I showcase my new package, `mct.el`.  It makes the default
completion experience feel closer to what you get with vertically
aligned third-party completion interfaces, by only re-using built-in
functionality and its own glue code.

Quoting [from its documentation](https://protesilaos.com/emacs/mct):

> Minibuffer and Completions in Tandem, also known as “MCT”, “Mct”, mct,
> or mct.el, is a package that enhances the default minibuffer and
> `*Completions*` buffer of Emacs 28 (or higher) so that they work
> together as part of a unified framework.  The idea is to make the
> presentation and overall functionality be consistent with other
> popular, vertically aligned completion UIs while leveraging built-in
> functionality.
>
> The main feature set that unifies the minibuffer and the
> `*Completions*` buffer consists of commands that cycle between the
> two, making it seem like they are part of a contiguous space.
> 
> MCT tries to find a middle ground between the frugal defaults and the
> more opinionated completion UIs.  This is most evident in its approach
> on how to present completion candidates.  Instead of showing them
> outright or only displaying them on demand, MCT implements a minimum
> input threshold as well as a slight delay before it pops up the
> `*Completions*` buffer and starts updating it to respond to user
> input.
>
> Customisation options control the input threshold
> (`mct-minimum-input`) and the delay between live updates
> (`mct-live-update-delay`).  Similarly, a blocklist and a passlist for
> commands are on offer.

MCT is not available in any package archive for the time being, though I
do plan to submit it to GNU ELPA.  In the meantime, you will have to
install it manually or with the help of `straight.el`, `quelpa`, or
similar.  Its source code: <https://gitlab.com/protesilaos/mct> (a
Github mirror exists as well).

* * *

Those familiar with [my dotemacs](https://protesilaos.com/emacs/dotemacs) may
notice that `mct.el` is derived from my now-deprecated
`prot-minibuffer.el` library.  The longer-term plan is to turn every
piece of my custom code into its own package or submit it as a patch for
emacs.git (as we did with the [auto-renaming feature of EWW
buffers](https://protesilaos.com/codelog/2021-10-15-emacs-29-eww-rename-buffers/)).
