---
title: "Emacs: new sequence scheme for the 'denote-sequence' package"
excerpt: "Information about a new feature that I just added to the 'denote-sequence' package."
---

The `denote-sequence` package is an optional extension to `denote`
that empowers users to write "sequence notes", else "folgezettel", in
the style of Niklas Luhmann.

Sequence notes are created in relation to other notes, as parent,
child, or sibling. `denote-sequence` communicates such relationships
by writing a "sequence" to the file name, in accordance with the
Denote file-naming scheme (technically, it uses the optional
`SIGNATURE` component of the file name, which is defined as a
free-form field for users to use as they see fit---so this is just one
application of it).

## The package supported two schemes before

The exact presentation of such sequences is subject to the user option
`denote-sequence-scheme`. The package has hitherto supported two
schemes, the `numeric` and `alphanumeric`.

In the numeric scheme, each level of depth is delimited by the equals
sign. The sequence `1=2=3` thus has three levels of depth. It means
"the third child of the second child of the first parent".

By contrast, the alphanumeric scheme relies on the alternation between
numbers and letters to communicate levels of depth. The above example
is thus expressed as `1b3`.

## The new `alphanumeric-delimited` scheme

Many users have told me that the alphanumeric scheme looks cleaner.
Though I think it is hard to read when sequences get really long, like
`2a13c6d2a`. To this end, the new sequence scheme augments the
alphanumeric style with delimiters that are placed after the first
level of depth and every third level of depth thereafter. Thus:
`2=a13=c6d=2a`.

Users may find this easier to work with.

## Remember the `denote-sequence-convert` command

This command has been part of the package since its inception. It can
convert from one sequence scheme to the others.

`denote-sequence-convert` has a "do what I mean behaviour" with regard
to which file or files it should operate on:

- When called from inside a file with a Denote sequence, it operates
  on the current file.

- When called from a Dired buffer, it operates on all the marked
  files.

- When there are no marked files in the Dired buffer, it operates on
  the file at point.

The target sequence scheme for the conversion is whatever is assigned
to the user option `denote-sequence-scheme`. If, however,
`denote-sequence-convert` is called with a prefix argument (`C-u` by
default), then it will prompt for the target sequence scheme.

## Coming in version 0.3.0

I just merged the code into trunk. Users who are building the package
from source can try the new feature right away. Otherwise, it will be
available in the next stable version of the package. I hope to have
that ready some time in mid-April.

+ Package name (GNU ELPA): `denote-sequence`
+ Official manual: <https://protesilaos.com/emacs/denote-sequence>
+ Git repository: <https://github.com/protesilaos/denote-sequence>
+ Backronym: Denote... Sequences Efficiently Queue Unsorted Entries
  Notwithstanding Curation Efforts.

