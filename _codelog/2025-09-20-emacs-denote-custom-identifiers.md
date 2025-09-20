---
title: "Emacs: the next version of Denote will support custom identifiers"
excerpt: "Information about the upcoming release of Denote that will allow advanced users or developers to use custom identifiers."
---

There are a lot of developments happening in `denote` and the various
other extensions for it that I maintain. I will share more details in
the release notes, hopefully before the end of this month. Just to
give you a forewarning about a potentially massive boost for advanced
users or developers: the ability to specify a completely custom
identifier scheme for Denote file names.

By default, Denote constructs a file name to have, at minimum, an
identifier as a compact representation of the date and time. It looks
like this: `20250920T120924`. The default file will also have a title
and keywords, based on user input at the relevant minibuffer prompts,
so it will look like this:

```
20250920T120924--denote-custom-identifiers__emacs_programming.txt
```

Instead of hardcoding the scheme of an identifier as a compact
representation of a date and time, we provide the variable
`denote-get-identifier-function`. Its value is the symbol of a
function, which is called to yield an identifier, as a string.

I have written a few examples of this in the Denote manual, grouped
under this section: <https://protesilaos.com/emacs/denote#h:3048f558-7d84-45d6-9ef2-53055483e801>.
Read the documentation of `denote-get-identifier-function` for the
remaining technicalities.

The identifier can be anything from an automatic incremental numbering
scheme to something that always asks for user input to produce a more
information-dense result. To illustrate the potential of the latter
concept, the manual elaborates on the use-case of recording data about
academic publications, such as the editor, authors, and publisher,
through a series of minibuffer prompts. The end result is a unique
identifier with the help of some extra helper functions.

Custom identifiers are prefixed with the `@@` file name component
separator. This way they are unambiguous and can be retrieved with
certainty. More so since the Denote file name components can be
presented in any order, per the user option `denote-file-name-components-order`.

Custom identifiers are the culmination of many changes over the years
to make the Denote file-naming scheme as flexible as possible. It is
super effective out-of-the-box and can then be particularised to
specific workflows with ease. These are not mutually exclusive, as
users can still rely on the regular Denote functionality for most
cases and only deviate from it with bespoke functions where necessary.
For instance, to have a special variant of `denote-rename-file` that
applies a custom identifier scheme instead of the default, users can
write a wrapper command like this:

```elisp
(defun my-denote-rename-file-with-my-custom-identifier ()
  "Like `denote-rename-file' but use `my-denote-get-custom-identifier' instead."
  (interactive)
  (let ((denote-get-identifier-function #'my-denote-get-custom-identifier))
    (call-interactively 'denote-rename-file)))
```

Imagine doing this for files in a specific folder where the standard
identifier provided by Denote does not add much value (beside being a
unique match for the linking mechanism, that is).

The Denote manual is full of examples like the above. These sort of
small and elegant extensions are possible owning to the design of the
code into easily adaptable functions.

We keep going from strength to strength and I am delighted with the
results. I hope you make good use of the tools on offer. Let me know
if there is anything more you need: I am confident we can make it
happen.

Much of the thought and work that went is to this project is thanks to
user mentalisttraceur and long-time contributor Jean-Philippe Gagné
Guay.

## About Denote

Denote is a simple note-taking tool for Emacs. It is based on the idea
that notes should follow a predictable and descriptive file-naming
scheme. The file name must offer a clear indication of what the note
is about, without reference to any other metadata. Denote basically
streamlines the creation of such files while providing facilities to
link between them.

Denote's file-naming scheme is not limited to "notes". It can be used
for all types of file, including those that are not editable in Emacs,
such as videos. Naming files in a consistent way makes their filtering
and retrieval considerably easier. Denote provides relevant facilities
to rename files, regardless of file type.

[ I have a page with all my Emacs packages, which includes all the
  Denote extensions I maintain: <https://protesilaos.com/emacs>. ]

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/denote>
  + GitLab: <https://gitlab.com/protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.
