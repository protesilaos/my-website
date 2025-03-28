---
title: "Emacs: Denote 'query links' (links that trigger a search)"
excerpt: "In this video demonstration, I show the new in-development functionality of Denote for 'query links'."
layout: vlog
mediaid: "zqzAFj50MhE"
---

In this ~16-minute video, I demonstrate the new, in-development "query
links" functionality of Denote. These are links that trigger a search
when you interact with them. There are two types of query links: (i)
search in file contents, or (ii) search in file names. When there are
matches for a given query, those are displayed in a separate buffer,
which uses the appropriate major mode. Query links complement the
"direct links" Denote has always supported. Internally, they use the
same infrastructure that Denote backlinks rely on (and we have had
backlink support since the beginning).

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

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/denote>
  + GitLab: <https://gitlab.com/protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.
