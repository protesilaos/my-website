---
title: 'Emacs: ef-themes version 1.11.0'
excerpt: 'Information about the latest version of my colourful-yet-legible themes for GNU Emacs.'
---

The `ef-themes` are a collection of light and dark themes for GNU
Emacs that provide colourful ("pretty") yet legible options for users
who want something with a bit more flair than the `modus-themes` (also
designed by me).

+ Package name (GNU ELPA): `ef-themes`
+ Official manual: <https://protesilaos.com/emacs/ef-themes>
+ Change log: <https://protesilaos.com/emacs/ef-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/ef-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/ef-themes>
  + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Backronym: Eclectic Fashion in Themes Hides Exaggerated Markings,
  Embellishments, and Sparkles.

Below are the release notes.

* * *


## Version 1.11.0 on 2025-09-25

This version introduces minor refinements to a stable package.


### Support for faces added to Emacs 31

Emacs 31 is the current development target of Emacs. The new faces are
`header-line-inactive`, `package-mark-delete-face`, `package-mark-install-face`,
`minibuffer-nonselected`.


### Mode lines are a bit easier to spot

The active and inactive mode lines now have a subtle box/border around
them on graphical Emacs. In non-graphical sessions, an underline is
applied instead. This makes mode lines easier to stand out even when
the buffer is showing a background that is of a similar colour to
their own background.


### The Custom interface buttons are more refined

These are the buttons that appear in the Custom buffers that we reach
through various means such as `M-x customize`. Like with the mode
lines, they use a box/border around where possible, else fall back to
an underline.


### The current date in the `M-x calendar` always looks the same

Before, it would look different if the Calendar was produced via `M-x
calendar` as opposed to the Org date selection interface. This is
because they apply different faces to the current date. Those are now
reworked to look the same.


### Notmuch message summary headers have clear dividers

In the Notmuch email client, the messages in a thread can be
collapsed/minimised to just a heading. Those used to have only a
subtle background, which would be enough to differentiate them from
the body of the email but not from each other when all were collapsed.
Now the themes add an overline to each heading, if supported by the
underlying display engine (i.e. graphical Emacs), which should make it
easier to spot them.


### Links in the header line of Info buffers do not have an underline

This is because the header line has a distinct background already, so
we want to avoid exaggerations.


### The commands `ef-themes-rotate` and `ef-themes-load-random` can be silent

They now accept an optional `SILENT` parameter that inhibits the
message they otherwise print. Thanks to Sean Devlin for the
contribution in pull request 59: <https://github.com/protesilaos/ef-themes/pull/59>.

Note that any function can be silenced with something like this:

```elisp
(defun my-wrapper-of-some-function ()
  (let ((inhibit-message t))
    (some-function)))
```
