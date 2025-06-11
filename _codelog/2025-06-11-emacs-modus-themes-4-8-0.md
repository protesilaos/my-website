---
title: 'Emacs: modus-themes version 4.8.0'
excerpt: 'Information about the latest version of my highly accessible themes for GNU Emacs.'
---

I just published the latest stable release of [the Modus
themes](https://protesilaos.com/emacs/modus-themes). The change log
entry is reproduced further below. For any questions, you are welcome
to [contact me](https://protesilaos.com/contact/). I will now work to
apply these same changes to emacs.git, so please wait a little longer
for the updates to trickle down to you.

+ Package name (GNU ELPA): `modus-themes` (also built into Emacs 28+)
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/modus-themes>
  + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes.

* * *


## 4.8.0 on 2025-06-11

This is a small release that corrects a mistake I made in the previous
version. It also introduces some minor refinements.


### Matching parentheses are easy to spot

In version `4.7.0`, I made the mistake of merging some stylistic
tweaks to `show-paren-mode` that I was experimenting with. The idea
was to get a feel for how the subtle colouration of matching
delimiters affects the usability of the themes. In short, it is not a
good default for our purposes (though users have the option to
override the applicable colours, as explained in the Modus themes
manual).

Thanks to Morgan Willcock for reporting the unwanted change in issue
139: <https://github.com/protesilaos/modus-themes/issues/139>.


### The `bg-paren-match` of `modus-vivendi-tinted` is a bit greener

We go from `#5f789f` to `#4f7f9f`. The latter fits better with the
rest of the theme.


### Refined the "mail" semantic mappings of the tinted themes

This concerns `message.el` and anything building on top of it, like
Gnus, Mu4e, and Notmuch. I made `modus-operandi-tinted` and
`modus-vivendi-tinted` use two colours that are more in line with the
established patterns of their respective theme. The changes are small,
but contribute to a more consistent experience.


### A new `property` semantic mapping is available

By default, it uses the same colour as the `variable`. Users who want
to have more refined colouration in supported modes (typically
involving tree-sitter), can change the relevant "palette overrides"
user option we provide, such as `modus-themes-common-palette-overrides`
or `modus-operandi-palette-overrides` and related.

Thanks to Alexandr Semenov for requesting this in issue 141:
<https://github.com/protesilaos/modus-themes/issues/141>.


### My `tmr` package is now supported

Its faces were already consistent with the Modus themes, though now I
cover them at the theme level to subject them to palette overrides.


### The "ancient" Gnus messages are styled properly

Those are only ever seen if the user configures Gnus in a certain way
and follows a specific workflow. They now get a subtle foreground
value. This is in response to the issue 119 by sivaramn:
<https://github.com/protesilaos/modus-themes/issues/119>.


### The `modus-themes-rotate` command can now go backwards

When called with a prefix argument (`C-u` by default), this command
will rotate the `modus-themes-to-rotate` from right to left.
Otherwise, it goes from left to right.

Thanks to Jacob S. Gordon for the contribution. It was sent as a
patch as part of issue 143:
<https://github.com/protesilaos/modus-themes/issues/143>.
