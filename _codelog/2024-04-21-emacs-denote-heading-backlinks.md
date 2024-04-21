---
title: "Emacs: Denote backlinks for Org headings"
excerpt: "Version 3.0.0 of the 'denote' Emacs package will include support for per-Org-heading backlinks."
---

The current stable version of Denote include optional means to link
directly to an Org heading, using its `CUSTOM_ID` property (creating
it, if necessary). I have already demonstrated this in video form:
<https://protesilaos.com/codelog/2024-01-20-emacs-denote-link-org-headings/>.

As part of the development work towards version `3.0.0`, we now define
a new command that displays a buffer with backlinks to the current Org
heading: `denote-org-extras-backlinks-for-heading`. It is part of the
`denote-org-extras.el` file, which contains optional extensions that
only work with Org mode files.

The name of the backlinks buffer includes the text of the heading it
is about.

<a href="{{'/assets/images/attachments/2024-04-21-emacs-denote-heading-backlinks.png' | absolute_url }}"><img alt="Denote Org file+heading link sample" src="{{'/assets/images/attachments/2024-04-21-emacs-denote-heading-backlinks.png' | absolute_url }}"/></a>

Note that links to headings are also pointing to the underlying file,
using its identifier. They are a composite of `FILE-ID::#HEADING-ID`,
which still leverages the robust Denote file-naming scheme.

## Part of the current development version

Things are in a state of flux as we are fleshing out Denote `3.0.0`.
If you do try this feature, please let me know how it works for you
and if you would like to see something done differently.

Denote is highly flexible and designed to be easy to extend: you do
not have to be an expert. We do everything using small functions and
code that has no obscure macros and/or deeply nested expressions. This
will continue to be the case. So feel welcome to take a look and send
your feedback.

Version `3.0.0` will hopefully be released in June or July 2024.

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
