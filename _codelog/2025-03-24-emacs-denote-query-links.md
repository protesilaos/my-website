---
title: "Emacs: first look at query links for Denote version 4.0.0"
excerpt: "Report of the in-progress implementation of Denote 'query links'."
---

The next version of Denote is shaping up to be a huge one. One of the
newest features I am working on is the support for "query links".
Those use the same `denote:` link type infrastructure but exhibit a
different behaviour than the direct links we have always had. Instead
of pointing to a file via its unique identifier, they initiate a
search through the contents of all files in the `denote-directory`.
This search uses the built-in Xref mechanism and is the same as what
we have already been doing with backlinks (basically, a `grep`).

In short:

- **Direct links:** Those point to a file via its unique identifier.
  For example, `denote:20250324T074132` resolves to a file path.
  Clicking on the link opens the corresponding file. Org export will
  also take care to turn this into a file path.
- **Query links:** Those do not point to any file per se. They are a
  string of one or more words or regular expression which is matched
  against the contents of files. For example, `denote:this is a test`
  produces a buffer listing all matches for the given query. Clicking
  on the matching line in that buffer opens the file at that point
  (just how our backlinks work when they show context---I am
  generalising this mechanism).

_Direct links_ can point to any file, including PDFs, videos, and
pictures (assuming it is renamed to use the Denote file-naming
scheme). Whereas _query links_ are limited to text files.

## Development discussion and screenshots

This is a work-in-progress that lives on its own branch as of this
writing. I will not elaborate at length right now as the
implementation details may change. I have, nonetheless, created an
issue on the GitHub repository where interested parties can provide
their feedback. It also includes some screenshots I took:
<https://github.com/protesilaos/denote/issues/561>. The code includes
other changes which pertain to how we handle backlinks and constitutes
a simplification of the code base.

The idea is to add the functionality to the `main` branch in the
coming days or weeks. Then I will do a video about it and/or explain
more.

That granted, do not forget that the official manual is the most
up-to-date reference and the single source of truth.

## Denote sources

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

[ Further down on this list I include more of my Denote-related packages. ]

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/denote>
  + GitLab: <https://gitlab.com/protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.

