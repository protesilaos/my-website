---
title: "Emacs: doric-themes version 1.0.0"
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

## Version 1.0.0 on 2026-02-09

### Two new themes

`doric-jade` is a light theme with a predominantly green feel.

`doric-copper` is a dark theme with orange, magenta, and cyan colours.

I have update all screenshots: <https://protesilaos.com/emacs/doric-themes-pictures>.


### Revised styles for Org TODO and DONE

The relevant faces now use a colour-coding scheme where TODO states
are rendered in red while DONE are green.

This is done to ensure cross-theme consistency. Those faces
communicate a certain state and, therefore, it is better to not have
to relearn which colour means what while switching between the Doric
themes.


### Org `~code~` faces stand out more

This is done to differentiate them from `=verbatim=`. It is especially
important for users who choose to hide the markup with the user option
`org-hide-emphasis-markers` (I used to do that but realised that the
ambiguity was a problem in many cases, because `~code~` and `=verbatim=`
have different semantics in some exported formats).


### Refinements to all Org heading or heading-like faces

This covers the regular Org headings as well as anything that performs
the same function, such as in the Org agenda buffer.

All regular headings use the main foreground value. The document title
and the Org agenda equivalent of that are rendered in an accent colour
for greater effect.

Combined with the aforementioned revision of the TODO and DONE
states, Org buffers are easier to read and work with.


### Tweaks for the Org agenda faces

The faces that communicate the current time and applicable filters are
made more intense. The idea is to spot them more quickly.

Faces that pertain to diary or diary-style events no longer use
italics to avoid exaggerations.

Blocked tasks are easier to spot.

The applicable query in the structure header is made more prominent.

Overall, Org agenda buffers should be easier to scan.


### More obvious style for Org exporting

The active/available keys in the Org export dispatcher use more
intense colours and have greater padding around them. This is what I
also do with the Modus themes (and all derivatives) to improve the
legibility of those keys.


### Magit branch and author faces are redone

The authors in log views and elsewhere have a distinct colour to stand
out a bit more. Branches use consistent typography, while the current
branch stands out more than the others.


### New colours for transient faces with background values

Enabled and disabled keys use a green-red coding scheme.

Active values and arguments have a style that is the same across
themes for the same reason as Org TODO and DONE.

Transient headings use the main foreground colour to not draw more
attention than they need to.


### Git commit faces follow the aforementioned patterns

Those are seen when writing a commit message in Magit.


### VC logs better differentiate the commit author

The relevant face uses a distinct foreground. It no longer applies a
bold weight, as that had the effect of making the buffers much busier
than necessary.


### Colour-coded styles for Dired marks

Items that are marked for selection are rendered in a green style,
while those marked for deletion are red.

This is done for cross-theme consistency, so that users do not have to
think twice before performing the relevant operations.


### The `doric-themes-with-colors` macro for advanced users

This macro is effectively the same as a `let` for binding the colours
of the active Doric theme. Advanced users can rely on this macro to
write functions that, for example, set the theme-specific red colour
value of a given face.

### Miscellaneous

Symlinks in Dired buffers are easier to spot. Same for visited links
in Info buffers.

Org definitions no longer override the foreground of any other face
present in them. Same for the notmuch header in view buffers.
