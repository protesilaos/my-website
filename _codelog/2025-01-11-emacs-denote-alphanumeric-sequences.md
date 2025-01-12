---
title: "Emacs: denote-sequence.el will also support alphanumeric sequences"
excerpt: "The new optional 'denote-sequence' will also support alphanumeric sequences (Luhmann-style folgezettel)."
---

In a video from 2025-01-03 ([sequence notes with Denote
(denote-sequence.el)](https://protesilaos.com/codelog/2025-01-03-denote-sequence-demo/)),
I introduced the new optional extension for Denote, which streamlines
the creation of file names with an inherent hierarchical relationship.
This is expressed as a numeric sequence, where each level of depth is
delimited by the equals sign. So `1=1=2` refers to the second child of
the first child of the parent note `1`.

A popular sequencing scheme is to combine numbers with letters
(Luhmann-style folgezettel). This alphanumeric expression is more
compact, though it might also be a bit harder to reason about. For
example, `1a2` is the same as `1=1=2`, which looks clean, but it gets
tricky once you reach `1za5zx` which is equivalent to `1=27=5=50`.

Unlike the numeric scheme where there is an explicit depth delimiter
(the `=`), the alphanumeric scheme establishes depth by alternating
between numbers and letters. Thus, `1a2` and `1=1=2` are both three
levels of depth.

I am in the process of giving users the option. They will be able to
pick their sequencing scheme and then produce notes, re-parent them,
and so on, with Denote taking care to use/generate the correct
sequence each time.  In principle, the two schemes are interoperable
and there will be relevant commands to switch between them.

[ **UPDATE 2025-01-12 11:25 +0200:** Now merged into `main` and
  deleted the feature branch. ]

Below is the commit I worked on today. For now it lives in the `alphanumeric-sequence-extension`
branch: <https://github.com/protesilaos/denote/tree/alphanumeric-sequence-extension>.
I will merge it into `main` as soon as I am done with the user-facing
parts, which I will probably do tomorrow or early next week. If you
are interested to try out what is now available, please check the
source code and let me know your thoughts.

```
commit 43bd30e6ebd9e948a390d11bc3ec84cf80e74576
Author: Protesilaos Stavrou <info@protesilaos.com>
Date:   Sat Jan 11 19:37:56 2025 +0200

  Make the groundwork for alphanumeric (Luhmann) sequences in denote-sequence.el

  The idea is to support both numeric and alphanumeric sequencing
  schemes, as documented in the new user option 'denote-sequence-scheme'.

  We now have the tools to correctly split, join, increment, and convert
  input accordingly, such that we can, for example, accurately produce a
  child of sequence "1a2" (we could already do that for numeric
  sequences).

  What is covered herein is just the groundwork. I still need to extend
  the helper functions which directly support the creation of new
  parent, child, or sibling sequences. While this still is a lot of
  work, the hard part is now done.

 denote-sequence.el   | 338 +++++++++++++++++++++++++++++++++++++++------------
 tests/denote-test.el |  34 +++++-
 2 files changed, 291 insertions(+), 81 deletions(-)
```

## About Denote

Denote is a simple note-taking tool for Emacs.  It is based on the idea
that notes should follow a predictable and descriptive file-naming
scheme.  The file name must offer a clear indication of what the note is
about, without reference to any other metadata.  Denote basically
streamlines the creation of such files while providing facilities to
link between them.

Denote's file-naming scheme is not limited to "notes".  It can be used
for all types of file, including those that are not editable in Emacs,
such as videos.  Naming files in a consistent way makes their
filtering and retrieval considerably easier.  Denote provides relevant
facilities to rename files, regardless of file type.

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/denote>
  + GitLab: <https://gitlab.com/protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.
