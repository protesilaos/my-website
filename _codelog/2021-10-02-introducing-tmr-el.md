---
title: "Introducing tmr.el for Emacs"
excerpt: "TMR, else TMR Must Recur, is a simple Emacs package for setting a timer."
---

Just created a standalone Git repository for my `tmr.el` library:
<https://gitlab.com/protesilaos/tmr.el>.

This has been part of [my dotemacs](https://protesilaos.com/emacs/dotemacs)
for several months now and I thought it was right to turn it into its
own package.  No ELPA package is planned for the foreseeable future.

Excerpt from its documentation:

> This package provides a single command for setting a timer: `tmr`.
> 
> The command prompts for a unit of time, which is represented as a string
> that consists of a number and, optionally, a single character suffix
> which specifies the unit of time.
> 
> Valid formats:
> 
> | Input | Meaning   |
> |-------+-----------|
> | 5     | 5 minutes |
> | 5m    | 5 minutes |
> | 5s    | 5 seconds |
> | 5h    | 5 hours   |
> 
> If `tmr` is called with an optional prefix argument (`C-u`), it also asks
> for a description which accompanies the given timer.  Preconfigured
> candidates are specified in the user option `tmr-descriptions-list`,
> though any arbitrary input is acceptable at the minibuffer prompt.
> 
> When the timer is set, a message is sent to the echo area recording the
> current time and the point in the future when the timer elapses.  Echo
> area messages can be reviewed with the `view-echo-area-messages` which is
> bound to `C-h e` by default.
> 
> Once the timer runs its course, it produces a desktop notification and
> plays an alarm sound.  The notification's message is practically the
> same as that which is sent to the echo area.  The sound file for the
> alarm is defined in `tmr-sound-file`, while the urgency of the
> notification can be set through the `tmr-notification-urgency` option.
> 
> The `tmr-cancel` command cancels the last `tmr`.  Note that for the time
> being it has no notion of multiple timers---just the last one.

* * *

As with every piece of Elisp I produce for my private needs, this is all
done for recreational and/or educational purposes.  Though I believe
`tmr.el` can be used by others as well, provided they are willing to
install it manually.

The initial release notwithstanding, there are a couple of user-facing
improvements to be made:

1. Make the `tmr-cancel` command prompt with completion for a timer
   object when more than one is present.
2. Create a `tmr-list` command which lists all `tmr` objects (yes, I
   know about `list-timers`, but I want something more specific).
