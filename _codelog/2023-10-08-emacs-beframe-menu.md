---
title: "Emacs: Beframe has its own menu-bar-mode entry"
excerpt: "My 'beframe' package for Emacs registers a submenu that makes its commands easier to discover."
---

I just implemented a `menu-bar-mode` submenu for my `beframe` package.
What Beframe does, in short, is to limit buffers to the frame in which
they were displayed.  Multiple frames thus have their own buffer list,
even though the complete buffer list is still available for
programs/commands to retrieve.  Beframe lets the user assume buffers
from other frames or unassume them from the current frame.  This is a
powerful way of using Emacs in tandem with your desktop environment or
window manager of choice (I am using `herbstluftwm` in the following
screenshots---check my dotfiles: <https://git.sr.ht/~protesilaos/dotfiles>).

Back to the matter at hand, the menu is available somewhere after the
"Tools" entry.  The relevant Beframe commands are activated when more
than one frame is available.  Otherwise they are greyed out.

Here is the idea, first with a single and then with multiple frames:

<a href="{{'/assets/images/attachments/2023-10-08-beframe-menu-single-frame.png' | absolute_url }}"><img alt="Sample of Beframe menu in a single Emacs frame" src="{{ '/assets/images/attachments/2023-10-08-beframe-menu-single-frame.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2023-10-08-beframe-menu-multiple-frames.png' | absolute_url }}"><img alt="Sample of Beframe menu with multiple Emacs frames" src="{{ '/assets/images/attachments/2023-10-08-beframe-menu-multiple-frames.png' | absolute_url }}"/></a>

[ The exact style of the menu is controlled by the toolkit, not the
  active theme. ]

The menu enhances the accessibility of Beframe, by making its commands
easier to discover.

Note that this is a development snapshot.  I may still tweak things
ahead of the next stable release.

## Sources

+ Package name (GNU ELPA): `beframe`
+ Official manual: <https://protesilaos.com/emacs/beframe>
+ Change log: <https://protesilaos.com/emacs/beframe-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/beframe>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/beframe>
    + GitLab: <https://gitlab.com/protesilaos/beframe>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Video demo: <https://protesilaos.com/codelog/2023-02-28-emacs-beframe-demo/>
+ Backronym: Buffers Encapsulated in Frames Realise Advanced
  Management of Emacs.

