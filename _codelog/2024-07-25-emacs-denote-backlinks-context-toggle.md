---
title: "Emacs: Denote backlink buffer can now toggle its details"
excerpt: "Information about the in-development command that toggles the context of matches in the backlinks buffer."
---

The level of detail shown in the backlinks buffer can now be toggled
on demand. This is done with the new command
`denote-backlinks-toggle-context`. The feature is available as part of
the current development target of Denote (version `3.1.0-dev`, which I
am actively working on).

Below are a couple of pictures, showing a note that (i) has just
gotten a backlinks buffer with the `denote-backlinks` command and (ii)
the user interacts with the backlinks buffer to show/hide the context
of matching links.

## The compact view

This shows the files that link to the current file, one per line. If a
file has multiple links, it still counts as one on this list.

<a href="{{'/assets/images/attachments/2024-07-25-emacs-denote-backlinks-toggle-compact.png' | absolute_url }}"><img alt="Denote backlinks buffer toggled to compact view" src="{{'/assets/images/attachments/2024-07-25-emacs-denote-backlinks-toggle-compact.png' | absolute_url }}"/></a>

## The detailed view

In this presentation, each match is displayed in its context, with a
reference to the line number it is found at. Multiple links in each
file are shown separately and are grouped per file.

<a href="{{'/assets/images/attachments/2024-07-25-emacs-denote-backlinks-toggle-detailed.png' | absolute_url }}"><img alt="Denote backlinks buffer toggled to detailed view" src="{{'/assets/images/attachments/2024-07-25-emacs-denote-backlinks-toggle-detailed.png' | absolute_url }}"/></a>

## The implementation details may change

Remember that this is part of the current development version. I might
make further changes to it and I am happy to get your feedback.

Users have long now had the `denote-backlinks-show-context` option to
set their default preference. With current developments, they can
still do what they did, plus toggle the view when the need arises.

## When will version 3.1.0 be released?

There are no deadlines. Things are in a good state, but I will not
rush to make this happen. To give you a rough idea, expect it some
time in mid to late August.

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
