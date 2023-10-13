---
title: "Emacs: new Denote developments (version 2.1.0-dev)"
excerpt: "Overview of the main features coming in the next stable version of the 'denote' package for GNU Emacs."
layout: vlog
mediaid: "RK4P5oIIEnk"
---

These cover version `2.1.0-dev` and remain subject to further changes
ahead of the formal release.

## The `denote-link-with-signature` command (I did it live)

This is what I worked on during a recent live stream about Denote.
The idea is that the user wants to link to a file that has a signature
and so only wants to be prompted for such files.  These links include
the signature in their anchor text in addition to the title.

The recording of the live stream is available:
<https://protesilaos.com/codelog/2023-09-25-emacs-live-mostly-denote/>.

## The `denote-region` command

The command `denote-region` takes the contents of the active region
and then prompts for a title and keywords.  Once a new note is
created, it inserts the contents of the region therein.  This is
useful to quickly elaborate on some snippet of text or capture it for
future reference.  `denote-region` also has a special hook.
Everything is covered in the manual:
<https://protesilaos.com/emacs/denote#h:2f8090f1-50af-4965-9771-d5a91a0a87bd>.

## The `denote-link-after-creating-with-command` command

This command is like `denote-link-after-creating` except it prompts for
a note-creating command.  Use this to, for example, call
`denote-signature` so that the newly created note has a signature as
part of its file name.  Optional `ID-ONLY` has the same meaning as in
the command `denote-link-after-creating`.

There are more "... or create" commands, covered in the manual:

- [Open an existing note or create it if missing](https://protesilaos.com/emacs/denote#h:ad91ca39-cf10-4e16-b224-fdf78f093883)
- [Link to a note or create it if missing](https://protesilaos.com/emacs/denote#h:b6056e6b-93df-4e6b-a778-eebd105bac46)

## New hook after creating a note

The hook is called `denote-after-new-note-hook`.  It is called after
the `denote` command and thus all other file-creating commands that
call `denote` internally.

## Letter casing of file names

Control the letter casing of file names with the new user option
`denote-file-name-letter-casing`.  Also read:
<https://protesilaos.com/codelog/2023-10-11-denote-letter-casing-option/>.

## Handle encrypted note files properly

Quoting from the Git commit log:

```
commit ecb5f8501b81584e886f5879a1ca368524bd14ab
Author: Protesilaos Stavrou <info@protesilaos.com>
Date:   Wed Oct 11 07:52:15 2023 +0300

  Add functions to return file extension reliably (also with encryption)

  We used to retrieve the 'file-name-extension' without checking if it
  was a composite of the file type extension (e.g. ".org") and an
  encryption extension like ".gpg".  Accounting for this scenario allows
  us to properly support encrypted note files, whose extension is
  something like ".org.gpg".

  Check the two new public functions, 'denote-get-file-extension' and
  'denote-get-file-extension-sans-encryption', for the implementation
  details.

  Thanks to Jens Östlund for reporting a bug with 'denote-keywords-add'
  on an encrypted file, which prompted me to investigate this further.
  This was done in issue 172 on the GitHub mirror:
  <https://github.com/protesilaos/denote/issues/172>.

  In short, we had a problem with all operations that needed to retrieve
  the file extension when that included an encryption component.

 README.org           | 27 ++++++++++++++-----
 denote.el            | 74 ++++++++++++++++++++++++++++++++++------------------
 tests/denote-test.el | 32 +++++++++++++++++++++++
 3 files changed, 100 insertions(+), 33 deletions(-)
```

## Improved method of ensuring unique IDs

Not much to show here, just to acknowledge the work done by
Jean-Philippe Gagné Guay, which builds on top of the code I introduced
for this feature ahead of version `2.0.0` of Denote.

## Denote journal extras

Check the manual about what this is about: <https://protesilaos.com/emacs/denote#h:4a6d92dd-19eb-4fcc-a7b5-05ce04da3a92>

## Denote silo extras

Refer to the manual for further details: <https://protesilaos.com/emacs/denote#h:e43baf95-f201-4fec-8620-c0eb5eaa1c85>.

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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/denote>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/denote>
    + GitLab: <https://gitlab.com/protesilaos/denote>
+ Mailing list: <https://lists.sr.ht/~protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.
