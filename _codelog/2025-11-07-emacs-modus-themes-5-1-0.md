---
title: 'Emacs: modus-themes version 5.1.0'
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

## 5.1.0 on 2025-11-07

This version fixes a critical bug in the `modus-themes-with-colors`
macro. In short, it was not working as before or was not working at
all. Now it should do the right thing.

Thanks to Alexandr Semenov for reporting a relevant bug in issue 170
and for helping me test the results: <https://github.com/protesilaos/modus-themes/issues/170>.

Thanks to Stéphane Marks for testing some configurations with the
latest stable Emacs version as well as with builds from emacs.git.
This was done via a private channel and I am sharing this information
with permission.

Also thanks to Stefan Monnier for monitoring my commits as I was
trying to refactor the `modus-themes-with-colors` macro. Some comments
were posted on the emacs-devel mailing list, as well as a patch that I
ended up applying and then reverting (check the commit log for the
technicalities): <https://lists.gnu.org/archive/html/emacs-devel/2025-11/msg00114.html>.

Apologies to everyone for the inconvenience! This was a tricky bug.
The good thing is that it compelled me to improve several parts of the
code.

This version also includes a clarification in the manual about
building a theme on top of Modus:

-   **Web page:** Visit <https://protesilaos.com/emacs/modus-themes#h:86eb375b-9be4-43ce-879a-0686a524a63b>.
-   **Info manual:** Evaluate `(info "(modus-themes) Build on top of the Modus themes")`.

In short, it mentions that a theme exists in an appropriately named
file that is part of the `custom-theme-load-path`. Thanks to Ashton
Wiersdorf for asking a related question in issue 171:
<https://github.com/protesilaos/modus-themes/issues/171>.
