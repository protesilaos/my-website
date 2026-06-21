---
title: 'Emacs: ef-themes version 2.2.0'
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


## Version 2.2.0 on 2026-06-21

This version contains two new themes and several stylistic refinements
to existing items in the collection.


### Enjoy `ef-arcadia` and `ef-atlantis` themes

`ef-arcadia` is a light theme with a green, humid feel. `ef-atlantis`
is a dark theme with aquatic colours.


### Improved style for `company` and `corfu` popups

I have revised the colour that each theme applies to the popup
background. It should now be more consistent with all other elements
on display.

Thanks to aikrahguzar for suggesting a review in issue 70:
<https://github.com/protesilaos/ef-themes/issues/70>.


### The current line highlight for completions is easier to spot

This is the background of the selected candidate in the minibuffer
while using the `vertico` package (among other similar interfaces).
The colours I am now using are more consistent with their context and
also work better as part of a popup completion interface, as noted
above.


### Palette refinements for several themes

I have made subtle changes to a few colour values. These are fine
details. The overarching goal is to be consistent throughout.
