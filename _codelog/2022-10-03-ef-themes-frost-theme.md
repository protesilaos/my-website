---
title: "Emacs: introduction to the ef-themes “frost” theme"
excerpt: "I added a dark theme to my 'ef-themes' collection.  It is a legible dark theme with green, teal, blue, purple colors."
---

I just added `ef-frost` to my `ef-themes` collection.  It is a legible
light theme with cool colours ranging from blue to teal with touches
of purple.

[ The `ef-themes` are a collection of light and dark themes for GNU
  Emacs whose goal is to provide colourful ("pretty") yet legible
  options for users who want something with a bit more flair than the
  `modus-themes` (also designed by me). ]

Some screen shots are provided below, though you can find pictures of
all the items in the collection here: <https://protesilaos.com/emacs/ef-themes-pictures>.

Note that some themes in the collection are designed as pairs.  Those
have `-light` or `-dark` in their name.  The others are standalone.
Regardless, the user can specify any two themes in the value of the
user option `ef-themes-to-toggle` and then switch between them with
the command `ef-themes-toggle`.  Or just use the other available
commands: `ef-themes-select` for minibuffer completion and the
`ef-themes-load-random` to load one from the collection (with `C-u`
limit the effect to light or dark themes).  The official manual
explains more.

## ef-frost

<a href="{{'/assets/images/ef/ef-frost.png' | absolute_url }}"><img alt="ef-frost theme sample" src="{{'/assets/images/ef/ef-frost.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/ef/ef-frost-code.png' | absolute_url }}"><img alt="ef-frost theme code sample" src="{{'/assets/images/ef/ef-frost-code.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/ef/ef-frost-listing.png' | absolute_url }}"><img alt="ef-frost theme listing sample" src="{{'/assets/images/ef/ef-frost-listing.png' | absolute_url }}"/></a>

## Comparison between ef-light and ef-frost

There is no other light theme quite like `ef-frost`.  The closest is
`ef-light`, which is more colourful as those pictures demonstrate
(each theme in the collection has a unique colour mapping and its own
colour palette).

<a href="{{'/assets/images/ef/ef-light.png' | absolute_url }}"><img alt="ef-light theme sample" src="{{'/assets/images/ef/ef-light.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/ef/ef-frost.png' | absolute_url }}"><img alt="ef-frost theme sample" src="{{'/assets/images/ef/ef-frost.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/ef/ef-light-code.png' | absolute_url }}"><img alt="ef-light theme code sample" src="{{'/assets/images/ef/ef-light-code.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/ef/ef-frost-code.png' | absolute_url }}"><img alt="ef-frost theme code sample" src="{{'/assets/images/ef/ef-frost-code.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/ef/ef-light-listing.png' | absolute_url }}"><img alt="ef-light theme listing sample" src="{{'/assets/images/ef/ef-light-listing.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/ef/ef-frost-listing.png' | absolute_url }}"><img alt="ef-frost theme listing sample" src="{{'/assets/images/ef/ef-frost-listing.png' | absolute_url }}"/></a>

## Coming in version 0.7.0 (next stable release)

The `ef-frost` theme is in development.  I think its design is final,
though I might tweak it further.  Expect this and other updates to be
widely available via GNU ELPA some time in mid October.

+ Package name (GNU ELPA): `ef-themes`
+ Official manual: <https://protesilaos.com/emacs/ef-themes>
+ Change log: <https://protesilaos.com/emacs/ef-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/ef-themes-pictures>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/ef-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/ef-themes>
    + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/ef-themes>
