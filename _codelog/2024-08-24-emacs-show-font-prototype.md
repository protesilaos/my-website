---
title: "Emacs: my major mode to show a font (show-font.el)"
excerpt: "This is the prototype of my new show-font.el package for GNU Emacs. It previews the current font in a buffer."
---

I just created a Git repository for my new Emacs package `show-font`.
It is a major mode that renders the current TTF or OTF file in an
Emacs buffer. The text on display consists of a pangram and a block of
carefully selected characters that showcase the font's qualities.
Those snippets of text are configurable, of course.

Here is the idea of what you get when you visit a TTF or OTF file in
Emacs (click to enlarge for optimal results and notice that each
typeface is different):

<a href="{{'/assets/images/attachments/2024-08-24-emacs-show-font.png' | absolute_url }}"><img alt="show-font.el with three different fonts" src="{{'/assets/images/attachments/2024-08-24-emacs-show-font.png' | absolute_url }}"/></a>

What I now have is an early prototype. There still are some issues I
need to figure out for a complete end-user experience.

Previews now work only with locally installed fonts. Eventually, I
want to provide an option to install the current font, else to notify
the user that the rendered preview is inaccurate.

At any rate, my plan is to push `show-font` to GNU ELPA in the coming
days. If you do give it a try, please let me know how it goes.

## About show-font

WORK-IN-PROGRESS.

This package defines a major mode to preview a font in an Emacs
buffer. A pangram and character set are displayed at varying heights
to help the user appreciate the given font's features.

For the time being, this only works with fonts that are already
installed on the system.

+ Package name (GNU ELPA): `show-font` (⚠️ not available yet)
+ Git repository: <https://github.com/protesilaos/show-font>
+ Backronym: Show How Outlines Will Feature Only in Non-TTY.
