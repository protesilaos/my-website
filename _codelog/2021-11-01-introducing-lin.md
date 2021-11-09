---
title: "Introducing lin.el for Emacs"
subtitle: "Buffer-local remapping of the hl-line face"
excerpt: "LIN Is Noticeable (lin.el) applies buffer-local remapping of Emacs' hl-line face."
---

I published a new package which I intend to submit to GNU ELPA sometime
before the 10th of November (together with `mct.el`---see my [Emacs
packages](https://protesilaos.com/emacs/)).

_LIN Is Noticeable_ (aka LIN, lin, `lin.el`, etc.) remaps `hl-line` face
buffer-locally to a style that is optimal for major modes where line
selection is the primary mode of interaction.

Quote from [the manual](https://protesilaos.com/emacs/lin) on the
rationale for this package:

> The idea is that `hl-line` cannot work equally well for contexts with
> competing priorities: (i) line selection, or (ii) simple line
> highlight.  In the former case, the current line needs to be made
> prominent because it carries a specific meaning of some significance
> in the given context.  Whereas in the latter case, the primary mode of
> interaction does not revolve around the line highlight itself: it may
> be because the focus is on editing text or reading through the
> buffer's contents, so the current line highlight is more of a gentle
> reminder of the point's location on the vertical axis.

LIN provides the end-user with the flexibility of optimising for the
specifics of each type of interaction.  The user must set up the major
modes where that is to take effect.

By means of illustration, the default style of the `hl-line` face in [my
Modus themes](https://protesilaos.com/emacs/modus-themes) (built into
Emacs 28 or higher) is a subtle gray background.  While there is the
`modus-themes-hl-line` option to make it more intense, add an accented
background, and the like, the fact remains that you still cannot apply a
case-by-case approach for different types of line highlighting.

Whereas with LIN, we can keep one style for regular text editing and use
`lin-mode` in contexts where `hl-line-mode` is meant to be all about
line selection, such as in Elfeed and Notmuch buffers.

Here is a sample with the `modus-operandi` theme, with the top buffer
showing the regular `hl-line` face and the bottom buffer displaying a
Notmuch listing with `lin-mode` enabled (click to enlarge):

<a href="{{'/assets/images/attachments/2021-11-01-lin-modus-operandi-demo.png' | absolute_url }}"><img alt="Modus Operandi with LIN active" src="{{ '/assets/images/attachments/2021-11-01-lin-modus-operandi-demo.png' | absolute_url }}"/></a>

LIN's source code is available on Gitlab:
<https://gitlab.com/protesilaos/lin>.  There also exists a Github
mirror: <https://github.com/protesilaos/lin>.
