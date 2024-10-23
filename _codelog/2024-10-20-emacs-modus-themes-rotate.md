---
title: "Emacs: the Modus themes have a new 'rotate' command"
excerpt: "Information about the new 'modus-themes-rotate' command and the user option 'modus-themes-to-rotate'."
---

I just added a new command to rotate across a list of Modus themes:
`modus-themes-rotate`. In interactive use, it uses the value of the
new user option `modus-themes-to-rotate`. When called from Lisp, it
accepts any list that consists of Modus themes.

The way I implemented this feature, we get the following behaviour:

- Check which is the current Modus theme and find its position in the
  list of the themes that are in rotation.
- Move to the next item on the list, reading from left to right.
- If the next item is the current theme, move to the one after.

This is a nice little command that complements the existing
`modus-themes-toggle` (switch between two themes, per
`modus-themes-to-toggle`) and `modus-themes-select` (choose a theme
from the entire family using minibuffer completion).

The new functionality will be available to all users as part of Modus
themes `4.6.0`. If you do try it before then, let me know if something
is amiss.
