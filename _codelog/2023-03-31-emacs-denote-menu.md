---
title: "Emacs: Denote now provides a menu-bar-mode entry"
excerpt: "My 'denote' package for Emacs registers a submenu that makes its commands easier to discover."
---

As part of the current development target of `denote`, users can
access the commands we provide via a convenient `menu-bar-mode` entry.

```
commit 818c6ae08b32c33893f2bbbc3152e3b64be289c5
Author: Protesilaos Stavrou <info@protesilaos.com>
Date:   Fri Mar 31 08:32:37 2023 +0300

    Define menu with all Denote commands

 denote.el | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
```

Here is the idea:

<a href="{{ '/assets/images/attachments/2023-03-31-denote-menu.png' | absolute_url }}"><img alt="Sample of Denote menu in Emacs" src="{{ '/assets/images/attachments/2023-03-31-denote-menu.png' | absolute_url }}"/></a>

[ The exact style of the menu is controlled by the toolkit, not the
  active theme. ]

Specific entries are available only in the right context, such as to
toggle the `denote-dired-mode` when in Dired buffers or to show
backlinks when in a `text-mode` buffer (or its derivatives, like
`org-mode`).

The menu enhances the accessibility of Denote by making its commands
easier to discover.

Note that this is a development snapshot.  I may still tweak things
and also cover the `context-menu-mode`, though the intent is clear.
