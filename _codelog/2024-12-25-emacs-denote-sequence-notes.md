---
title: "Emacs: sequence notes with new 'denote-sequence.el'"
excerpt: "Introduction to the optional 'denote-sequence.el' extension, which is part of the 'denote' Emacs package."
---

Today I wrote the initial version of the new optional extension
`denote-sequence.el`, which is part of the `denote` package (current
development version is `3.2.0-dev`). It provides commands to create
"sequence notes", i.e. notes that have an inherent structure of
parent, child, or sibling. A sequence is expressed numerically, such
as `1` being a parent, `1=1` the first child thereof, `1=2` the
sibling of `1=1` and child of `1`, and so on.

In technical terms, this new extension leverages the optional
`SIGNATURE` file name component, per the Denote file-naming scheme
(read the manual, which is the source of truth---I write it for you).
`denote-sequence.el` streamlines the creation of signatures to conform
with the aforementioned sequencing (in general, the signature file
name component is a free-form field that users can employ in any
workflow they want).

The new code is available on the `sequence-notes-extension` branch:
<https://github.com/protesilaos/denote/tree/sequence-notes-extension>.
Depending on when you read this, the branch may no longer exist as the
code is merged into `main`.

Those of you who use Denote for your zettelkasten, please give
`denote-sequence.el` a try. If it covers your use-case, let me know
what else you want to see as a feature. If it does not conform with
your requirements, please tell me if we can do something to make it
work for you.

The commands we provide as of this writing:

- `denote-sequence`, which creates a new sequence note of type parent,
  sibling, or child.
- `denote-sequence-new-parent`.
- `denote-sequence-new-sibling`.
- `denote-sequence-new-child`.

## What is Denote

Denote implements an efficient file-naming scheme that makes it easy
to retrieve files by their name. This is done by creating new files
("notes"), or by renaming existing ones. For new files, Denote
supports any text format, with Org, Markdown, and plain text being
covered out-of-the-box. For renaming files, any file is supported
(e.g. I use Denote for all my videos).

As such, Denote is open-ended in terms of workflow. It is not just a
note-taking package, let alone one that is limited a specific
methodology, such as zettelkasten. Still, Denote can excel in those
use-cases, among others.

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/denote>
  + GitLab: <https://gitlab.com/protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.
