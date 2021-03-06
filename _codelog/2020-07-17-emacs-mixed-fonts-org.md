---
title: 'Emacs: configuring mixed fonts in Org mode'
excerpt: 'Video presentation of the basics for configuring font families in Emacs, in order to mix different typefaces for Org.'
layout: vlog
mediaid: 'Oiu3LFK_rX8'
---

In this presentation I talk about the workflow of mixing different font
families inside of the same buffer.  The idea is to use this for
`org-mode` so that you can have some text use a monospaced font to keep
its alignment properties in tact, while the rest of the buffer switched
to a proportionately-spaced font that is more natural to read for large
portions of text.

The information shared here is complementary to what I talked about
yesterday on the topic of [“Focused editing” tools for
Emacs](https://protesilaos.com/codelog/2020-07-16-emacs-focused-editing/)

Note that mixed font settings for `org-mode`, `markdown-mode`, and
others will depend on the theme that you use.  My [Modus
themes](https://gitlab.com/protesilaos/modus-themes) are designed to
cope well with such demands.

Check [my dotemacs](https://protesilaos.com/emacs/dotemacs) for more code and
relevant documentation.

## Text of the presentation

The following is a standard Org buffer.

```org
#+TITLE: Emacs: mixed font faces for Org mode
#+AUTHOR: Protesilaos Stavrou · https://protesilaos.com

** Basic concepts

The idea here is to show you how to configure your fonts so that you can
optimise for mixed-typeface scenaria.  You can use these for focused
writing (see my previous video) or to do presentations such as this one!

You can already tell that paragraph text is allowed to use a typeface
that is proportionately-spaced.  This is because it reads from the
=default= face (more on that later).  Whereas inline code is configured to
always use the more specialised =fixed-pitch= face that applies a
monospaced font.  /Notice the difference?/

This principle applies to all spacing-sensitive constructs, such as
tables and special lines.  Otherwise you would be seeing misalignments.

#+NAME: Sample of contrast ratios
| Colour name   |         | #fff1f0 | #ecf7ed |
|---------------+---------+---------+---------|
| red           | #a60000 |    7.28 |    7.28 |
| red-alt       | #972500 |    7.40 |    7.40 |
| red-alt-other | #a0132f |    7.26 |    7.26 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f::$4='(clr $2 @1$4);%0.2f

** Configuring “face” attributes for fonts

There are multiple ways to set your font in Emacs.  I find that doing so
at the “face” level is effective and yields consistent results.

I will show you how to do it, but we must briefly cover the basics
before we deal with the actual code.

In Emacs parlance a “face” is a display construct that contains data
such as an associated foreground and background colour, as well as all
typographic properties (height, weight, font family, slant, etc.).

Couched in those terms, an Emacs theme is, in essence, a program that
controls such faces.  You can already spot several faces on display here
(the current theme is my Modus Vivendi---in some of my other videos I
use its light counterpart: Modus Operandi).

*** The three faces we need to take care of

To make things work, we will be using the =set-face-attribute= function.
And we need to configure three faces:

1. =default= :: This one is the standard font family that all other faces
   refer to when they have no font specification of their own.  In
   general, faces *should not* have a typeface spec, unless they need to.

2. =fixed-pitch= :: This should be given a monospaced typeface and is
   meant to be inherited by faces that must always be presented with
   fixed-spacing.

3. =variable-pitch= :: Whereas this should be a proportionately-spaced
   font.  Again, it is meant to be inhereted by faces that are supposed
   to be presented with such a typeface (though you do not need to
   specify those faces, as =M-x variable-pitch-mode= does it
   automatically).

For me a monospaced font should be the standard, so in practice I
configure =default= and =fixed-pitch= to use the same typeface.

*** Using ~set-face-attribute~

Let us do this together.

#+begin_src emacs-lisp
(set-face-attribute 'default nil :font "Hack-16")
(set-face-attribute 'fixed-pitch nil :font "Hack-16")
(set-face-attribute 'variable-pitch nil :font "FiraGO-18")

(dolist (face '(default fixed-pitch))
  (set-face-attribute `,face nil :font "Hack-16"))
#+end_src

When you are on your own, you can start by consulting Emacs /itself/ on
how to use this function.  Do it with =C-h f set-face-attribute=.  Or
place the point over that symbol (the unique name of the function), type
=C-h f= and then =M-n= to select it.

Make a habit of using these help functions (and checking the source code
they provide via a link): I would argue this is the difference between
understanding Emacs and merely using it.

** Themes will affect your results

Note that your theme must have configured everything properly for this
to work.  More specifically, you must make sure that all indentation or
spacing-sensitive faces are designed to always inherit from =fixed-pitch=.
Petition your theme's developer to account for this workflow of mixing
fonts.

Or use my Modus themes which are designed to meet the highest
accessibility standard for colour contrast.  Basically this is about
readability, while the technical spec is called “WCAG AAA”: it
corresponds to a *minimum contrast ratio* between background and
foreground values of 7:1.

The themes are /highly customisable/ and have wide package coverage.

See  https://gitlab.com/protesilaos/modus-themes for details.

*** Notes for theme devs and DIY users

These are the faces for =org-mode= that your theme needs to configure with
the =:inherit fixed-pitch= attribute.  Special thanks to Gitlab user “Ben”
for bringing these to my attention a while ago!

+ org-block
+ org-block-begin-line
+ org-block-end-line
+ org-code
+ org-document-info-keyword
+ org-meta-line
+ org-table
+ org-verbatim

Optionally also consider these for =markdown-mode=:

+ markdown-code-face
+ markdown-html-attr-name-face
+ markdown-html-attr-value-face
+ markdown-html-entity-face
+ markdown-html-tag-delimiter-face
+ markdown-html-tag-name-face
+ markdown-inline-code-face
+ markdown-language-info-face
+ markdown-language-keyword-face
+ markdown-pre-face
+ markdown-table-face
```
