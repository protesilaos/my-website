---
title: "Emacs: introduction to 'substitute' (my new package?)"
excerpt: "My new 'substitute' package for Emacs helps quickly replace a target in various ways."
---

I just set up the Git repositories of `substitute` for Emacs.
Substitute is a set of commands that perform text replacement (i)
throughout the buffer, (ii) limited to the current definition (per
`narrow-to-defun`), (iii) from point to the end of the buffer, and
(iv) from point to the beginning of the buffer.

These substitutions are meant to be as quick as possible and, as such,
differ from the standard `query-replace` (which I still use).  The
provided commands prompt for substitute text and perform the
substitution outright.

The substitution prompt mentions the target-to-be-substituted.  It is
possible to use the "future history" at this prompt (by typing `M-n`
with the default key bindings for the `next-history-element` command).
This populates the prompt with the text of the target.  As such, if we
want to operate on `FOO` to make it `FOO-BAR`, we use `M-n` and then
append `-BAR`.

By default, the design is visually austere: the substitution prompt
informs the user about the target but otherwise does not highlight
anything.  The post-substitution stage is also silent, with no report
on how many occurences were replaced.  This can be changed so that the
substitution prompt highlights occurences (like `isearch`) and the
post-substitution stage prints an informative message on what changed
and where.

The substitution commands behave the same way except for their scope
of application.  What they have in common is the way they identify the
target of the substitution: it is either the symbol at point or the
text within the boundaries of the active region.  The differences in
scope are as follows:

1. `substitute-target-in-buffer`: Substitute the target across the
   entire buffer.
2. `substitute-target-in-defun`: Substitute the target only in the
   current definition (per `narrow-to-defun`).
3. `substitute-target-below-point`: Substitute the target from point
   to the end of the buffer (alias
   `substitute-target-to-end-of-buffer`).
4. `substitute-target-above-point`: Substitute the target from point
   to the beginning of the buffer (alias
   `substitute-target-to-beginning-of-buffer`).

## Should this be on GNU ELPA?

I find these convenient, but I am not sure if I should formalise
`substitute` as a package by adding it to GNU ELPA.  What do others
use for this case?  I am aware of `multiple-cursors` and `iedit` but
they are not what I am looking for.  I also am still using
`query-replace` for its interactivity (yes, I know about its `!`
operation) and for its ability to limit the effect to the region.  I
also know about combining `embark` with `query-replace`, which I also
do.  Still, I think there is a niche for `substitute`.  Does anyone
have the same feeling or am I deluding myself?  In the latter case,
there is no point in adding this to GNU ELPA.

You can [contact me privately](https://protesilaos.com/contact) about
this topic or, if you want a public discussion, use my "general
issues" mailing list by sending an email to:
<a href="mailto:~protesilaos/general-issues@lists.sr.ht">~protesilaos/general-issues@lists.sr.ht</a>.
