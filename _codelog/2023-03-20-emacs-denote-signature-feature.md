---
title: "Emacs: Denote now optionally supports file name signatures (Folgezettel)"
excerpt: "Announcement about the new feature in denote.el to establish sequential relations between files."
---

First a bried introduction for the uninitiated and then the
announcement of the new feature.

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

[Watch the video demo that was produced before version 0.1.0 of the
package](https://protesilaos.com/codelog/2022-06-18-denote-demo/).

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/denote>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/denote>
    + GitLab: <https://gitlab.com/protesilaos/denote>
+ Mailing list: <https://lists.sr.ht/~protesilaos/denote>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.

* * *

I just pushed the following commit and want to share with you the
commit message further below:

```
commit 62c6853480d62b00e4c838e148730d1fedf6235f
Merge: 94a3ffd d7dc32c
Author: Protesilaos Stavrou <info@protesilaos.com>
Date:   Mon Mar 20 11:23:24 2023 +0200

    MAJOR UPDATE towards version 2.0.0: Merge branch 'signature'

    [...]
    
 README.org | 148 ++++++++++++++++++++++++++++++++++++++++++++++-------------
 denote.el  | 152 +++++++++++++++++++++++++++++++++++++++++++++----------------
 2 files changed, 231 insertions(+), 69 deletions(-)
```

Signatures are an optional extension to Denote's file-naming scheme.
They are arbitrary strings of alphanumerical characters that can be
used to establish sequential relations between files at the level of
their file name (e.g. 1, 1a, 1b, 1b1, 1b2, ...).

Files that have the signature follow this scheme (though read the
documentation of 'denote-prompts' for possible permutations):

```
DATE==SIGNATURE--TITLE__KEYWORDS.EXTENSION
```

As a reminder, Denote's default file-naming scheme is:

```
DATE--TITLE__KEYWORDS.EXTENSION
```

[ Denote can be used to rename any file, not just to create notes.  As
  such, the file-naming scheme is a powerful, yet low-tech invention
  to facilitate searching and filtering. ]

For the time being, signatures are not added to a file's front matter
and are not shown anywhere else beside the file name.  This is done on
purpose to simplify the implementation and make sure we define clear
use-cases for this feature (it is easier to add new functionality than
refactor/break existing one).

Users can create files with signatures either by (i) modifying the
'denote-prompts' user option to affect the standard 'denote' command,
or (ii) by generating such files on demand with the command
'denote-signature' (alias 'denote-create-note-using-signature').

Signatures are treated as quasi-identifiers when renaming files that
include them.  This means that they are not touched by Denote.  The
user must manually update the signature which, in theory, should not
be done if notes already have a predefined sequence.

Signatures are backward-compatible, meaning that existing users are
not impacted by their inclusion.

The signature extension was discussed at length on the GitHub mirror
in issue 115: <https://github.com/protesilaos/denote/issues/115>.
Thanks to Stefan Thesing, Mirko Hernandez, Noboru Ota (nobiot),
Xiaoxing Hu, nbehrnd, Elias Storms, and 101scholar for helping me
reason about this feature, understand its scope, and prototype its
implementation.

The inclusion of the 'signature' branch into 'main' does not mean that
we are done with the development of this feature.  We are simply
making it available to more users while preparing for the release of
version `2.0.0` of Denote.

Watch the video series "Denote as a Zettelkasten" produced by Stefan
Thesing, which makes use of these signatures:
<https://www.thesing-online.de/blog/denote-as-a-zettelkasten>.
