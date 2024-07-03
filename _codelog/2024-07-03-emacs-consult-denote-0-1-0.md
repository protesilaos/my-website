---
title: "Emacs: consult-denote version 0.1.0"
excerpt: "My new package to integrate 'denote' with 'consult'."
---

The `consult-denote` provides glue code to integrate `denote` with
Daniel Mendler's `consult` package. The idea is to enhance minibuffer
interactions, such as by providing a preview of the
file-to-linked/opened and by adding more sources to the
`consult-buffer` command. Interested users can enable the
`consult-denote-mode` to get started.

## Familiar minibuffer prompts

`consult-denote` is designed to enhance all relevant Denote prompts
with whatever extras Consult provides, such as the preview facility.
These Consult-powered minibuffer prompts will still follow the same
patterns of interaction as core Denote: they will never use a
profoundly different presentation.

## Customise what `consult-buffer` shows from Denote

The extra sources added to the `consult-buffer` command are controlled
by the user option `consult-denote-buffer-sources`. Its default value
is the list of sources called `consult-denote-all-buffer-sources`.

## Developed in tandem with Denote

My goal with this package is to keep it as close to Denote as
possible. If the community wants a new feature, we can discuss whether
a variant of it makes sense for `denote` before considering its
inclusion in `consult-denote`.

## Sources

### Consult-Denote

+ Package name (GNU ELPA): `consult-denote`
+ Official manual: not available yet.
+ Change log: not available yet.
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/consult-denote>
+ Backronym: Consult-Orchestrated Navigation and Selection of
  Unambiguous Targets...denote.

### Denote

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
