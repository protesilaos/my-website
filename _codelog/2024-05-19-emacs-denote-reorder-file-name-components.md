---
title: "Emacs: Denote file name components can be reordered"
excerpt: "A preview of the in-development feature to change the order of the components of a Denote file name."
---

As part of the development work towards Denote version 3 (technically
`3.0.0`), we now provide a user option to change the order of the file
name components. This feature empowers users to create file listings
that make more sense to them. Want to have the identifier (date+time)
at the end? No problem; no stress! Wish to place the signature after
the title? Done!

The author of this new feature is long-time contributor Jean-Philippe
Gagné Guay, to whom I am most thankful. Others contributed to the
discussion that helped flesh out some of the technical details. As
usual, I will record everything in the change log for the new version.
Until then, here is a preview of what to expect.

## The default order

By default, the Denote file-naming scheme stipulates this order,
assuming all the components are present (the signature is an opt-in
component):

```
IDENTIFIER==SIGNATURE--TITLE__KEYWORDS.EXTENSION
```

This arrangement is efficient and well-tested. If it works for you,
there is no need to change anything.

## Some alternative schemes

The new user option that sets the order of file name components is
`denote-file-name-components-order`. Below are some permutations of
it. First the code and right below it the corresponding file name:

```elisp
(setq denote-file-name-components-order '(identifier signature title keywords))
;; => 20240519T07345==hello--this-is-the-title__denote_testing.org

(setq denote-file-name-components-order '(signature identifier title keywords))
;; => ==hello@@20240519T07345--this-is-the-title__denote_testing.org

(setq denote-file-name-components-order '(title signature identifier keywords))
;; => --this-is-the-title==hello@@20240519T07345__denote_testing.org

(setq denote-file-name-components-order '(keywords title signature identifier))
;; => __denote_testing--this-is-the-title==hello@@20240519T07345.org
```

Note that the identifier gets its own delimiter (`@@`). This only
happens when the identifier is not the first item on the list.

All other field delimiters are preserved to keep things unambiguous.

## Emergent possibilities

Remember that Denote can already be configured to not "sluggify" the
file name components or to process them with user-defined functions.
The details are covered at length in the manual. As such, it is
possible to have file names like this:

```
20240519T07345==hElLo--This is the Title__denote_testing.org
```

## A word of caution

Just because we provide the flexibility for those who need it, this
does not mean that you have to change anything. If you do want to
experiment, do it with files that are not critical long-term. Once you
find what you like, stick with it and never modify it. The reason is
that inconsistencies in file names make it harder for your future self
to quickly retrieve the data they need.

## Still in development; coming soon

From the outset Denote is designed to be an Emacs-y package par
excellence, meaning that it is highly customisable and easily
extensible. This new option opens up more possibilities for users to
set up their own workflows with the tools we provide.

There is a lot more that will be available as part of version `3.0.0`.
I hope to have it ready by the end of June, to coincide with the 2nd
anniversary of Denote.

Plus, I am also preparing the new `consult-denote` to provide an
optional power-up to all relevant minibuffer interactions.

Stay tuned!

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
