---
title: "Emacs: doric-themes version 1.2.0"
excerpt: "Minimalist themes for GNU Emacs to complement my ef-themes (maximalist) and modus-themes (moderate)."
---

These are my minimalist themes. They use few colours and will appear
mostly monochromatic in many contexts. Styles involve the careful use
of typography, such as italics and bold italics.

If you want maximalist themes in terms of colour, check my `ef-themes`
package. For something in-between, which I would consider the best
"default theme" for a text editor, opt for my `modus-themes`.

+ Package name (GNU ELPA): `doric-themes`
+ Sample pictures: <https://protesilaos.com/emacs/doric-themes-pictures>
+ Git repository: <https://github.com/protesilaos/doric-themes>
+ Backronym: Doric Only Really Intensifies Conservatively ... themes.

Below are the release notes.

* * *

## Version 1.2.0 on 2026-07-12

### Two new themes

`doric-tiger` is a light theme, while `doric-lion` is dark. Both have
warm colours.

### Org agenda events are easier to spot

Events are entries which have an active timestamp but not a
`SCHEDULED` or `DEADLINE` keyword associated with it. Those are now
rendered in italics in addition to the faint foreground they already
had (the faint foreground is there because an event is not as
important as a

### Support for `vc-dir-key-binding-hint-label` (Emacs 32)

This concerns a new option for VC Dir buffers to display their
available key bindings. The face applies to the additional headings.
They should now look like all the other headings in those buffers in
the interest of stylistic consistency.

### Some `package.el` faces stand out more

Those are present in the buffer that `M-x list-packages` produces.
They concern certain status indicators and fit in better with the rest
of the design.

### The `nobreak-space` face is now underlined

This is one way to make that character visible. It is useful to know
that a space is not the regular space. For example, in French
orthography we are expected to include non-breaking spaces between the
quotes and the words like « Protesilaos ». Whether you actually follow
that guideline is another discussion---I happily ignore it.
