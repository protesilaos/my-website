---
title: "Emacs: sort Luhmann-style signatures with 'denote-sort-dired'"
excerpt: "Sample code on how to sort Denote file names by using their signature component when that includes Luhmann-style sequences."
---

As part of the current development version of Denote (`3.1.0-dev`),
users can define their own sorting algorithm for each individual file
name component. This is relevant when (i) using the command
`denote-sort-dired`, which produces a fully fledged Dired buffer with
only the files that match the search terms, but also (ii) for the Org
dynamic blocks we provide, which accept optional sorting parameters.

By default, all file name components are sorted with the same
function: `string-collate-lessp`. New user options give us the
flexibility to define the function to use on a per-file-name-component
basis. The user options are:

- `denote-sort-title-comparison-function`
- `denote-sort-keywords-comparison-function`
- `denote-sort-signature-comparison-function`

In the next section, I show how to have an intuitive sorting scheme
for Luhmann-style signatures. Remember that the signature file name
component is an optional free-form field for users to employ as they
see fit and is not, in any way, enforcing a specific workflow---for
example, I do not use it (well, except for development purposes).

## Luhmann's sequence notes and the code we need

Niklas Luhmann would edit notes to form sequences of thoughts with
branching paths, such as `1.1`, `1.1a`, `1.2`, `1.2a`, `1.2b`, etc.
With the Denote file-naming scheme, we make the word separator in each
file name component use the same character as the entire field, so
words in a title have a dash between them and signatures have the
equals sign. This makes searches unambiguous. Thus, our Luhmann-style
signatures will be slightly different in their appearance: `1=1`,
`1=1a`, `1=2`, `1=2a`, `1=2b`.

When using the `denote-sort-dired` command (or any of our Org dynamic
blocks) with default settings, those Luhmann-style signatures will not
sort in an intuitive way. This is because they combine numbers and
letters, which require a different approach than what the default
sorting function is using. The following will get the job done:

```elisp
(defun my-denote--split-luhman-sig (signature)
  "Split numbers and letters in Luhmann-style SIGNATURE string."
  (replace-regexp-in-string
   "\\([a-zA-Z]+?\\)\\([0-9]\\)" "\\1=\\2"
   (replace-regexp-in-string
    "\\([0-9]+?\\)\\([a-zA-Z]\\)" "\\1=\\2"
    signature)))

(defun my-denote--pad-sig (signature)
  "Create a new signature with padded spaces for all components"
  (combine-and-quote-strings
   (mapcar
    (lambda (x)
      (string-pad x 5 32 t))
    (split-string (my-denote--split-luhman-sig signature) "=" t))
   "="))

(defun my-denote-sort-for-signatures (sig1 sig2)
  "Return non-nil if SIG1 is smaller that SIG2.
Perform the comparison with `string<'."
  (string< (my-denote--pad-sig sig1) (my-denote--pad-sig sig2)))

;; Change the sorting function only when we sort by signature.
(setq denote-sort-signature-comparison-function #'my-denote-sort-for-signatures)
```

Then continue using `denote-sort-dired` or Org dynamic blocks to get
the expected results.

## Sample of an unsorted Dired listing

<a href="{{'/assets/images/attachments/2024-08-01-denote-luhmann-signatures-unsorted.png' | absolute_url }}"><img alt="Unsorted Dired listing showing notes with Luhmann-style signatures" src="{{'/assets/images/attachments/2024-08-01-denote-luhmann-signatures-unsorted.png' | absolute_url }}"/></a>

## A sorted and filtered Dired listing (per `denote-sort-dired`)

<a href="{{'/assets/images/attachments/2024-08-01-denote-luhmann-signatures-sorted.png' | absolute_url }}"><img alt="The 'denote-sort-dired' with nicely-sorted Luhmann-style signatures" src="{{'/assets/images/attachments/2024-08-01-denote-luhmann-signatures-sorted.png' | absolute_url }}"/></a>

## When will version 3.1.0 be released?

I expect to release it in mid or late August. There still are some
quality-of-life refinements I am working on. If you have any thoughts on the ongoing developments, please let me know.

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
