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

**UPDATE 2023-03-31 19:51 +0300**.  I added support for
`context-menu-mode`.  Also made lots of other tweaks.

```
commit ecccc046beb502efecb9c4f3e3d845b122a8b34c
Author: Protesilaos Stavrou <info@protesilaos.com>
Date:   Fri Mar 31 19:50:31 2023 +0300

    Document integration with context-menu-mode (also see 2a1d5eb)

 README.org | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)


commit 2a1d5eb8f668724e5b37e085e64ff00d44f3eb1a
Author: Protesilaos Stavrou <info@protesilaos.com>
Date:   Fri Mar 31 19:43:24 2023 +0300

    Add code to integrate menu with context-menu-mode

    Enable it with:

            (add-hook 'context-menu-functions #'denote-context-menu)

    Read what I published about the menu:
    <https://protesilaos.com/codelog/2023-03-31-emacs-denote-menu/>.

 denote.el | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)
```

* * *

Denote is a simple note-taking tool for Emacs.  It is based on the idea
that notes should follow a predictable and descriptive file-naming
scheme.  The file name must offer a clear indication of what the note is
about, without reference to any other metadata.  Denote basically
streamlines the creation of such files while providing facilities to
link between them.

Denote's file-naming scheme is not limited to "notes".  It can be used
for all types of file, including those that are not editable in Emacs,
such as videos.  Naming files in a constistent way makes their
filtering and retrieval considerably easier.  Denote provides relevant
facilities to rename files, regardless of file type.

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/denote>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/denote>
    + GitLab: <https://gitlab.com/protesilaos/denote>
+ Mailing list: <https://lists.sr.ht/~protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.
