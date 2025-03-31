---
title: "Emacs: 'denote-journal' integration with 'M-x calendar'"
excerpt: "The new version of my 'denote-journal' package will integrate with the Emacs 'calendar'."
---

I just made it possible for users of my `denote-journal` package to
interact with the `M-x calendar` as part of their journaling workflow.

## Highlight dates with a Denote journal entry

The new minor mode `denote-journal-calendar-mode` highlights dates in
the `M-x calendar` which have a corresponding Denote journal entry.
The applied face is called `denote-journal-calendar`: I made it draw
only a box around the date, thus respecting existing colouration. Here
is a demonstration, which also includes red-coloured dates for holidays:

<a href="{{'/assets/images/attachments/2025-03-31-emacs-denote-journal-calendar.png' | absolute_url }}"><img alt="Generic Emacs calendar" src="{{'/assets/images/attachments/2025-03-31-emacs-denote-journal-calendar.png' | absolute_url }}"/></a>

The `denote-journal-calendar-mode` is buffer-local and meant to be
activated inside the `M-x calendar` buffer, thus:

```elisp
(add-hook 'calendar-mode-hook #'denote-journal-calendar-mode)
```

## View the journal entry for the current date

While navigating the `calendar` buffer, use the command
`denote-journal-calendar-find-file` to visit the Denote journal entry
corresponding to the date at point. If there are multiple journal
entries, the command will prompt you to select one among them.

## Create or view journal entry for the current date

The command `denote-journal-calendar-new-or-existing` creates a new
journal entry for the date at point or visits any existing one. This is
like `denote-journal-new-or-existing-entry` but for the given `M-x
calendar` date.

## Part of development

Remember that I have split `denote` into several packages, one of
which is `denote-journal`. I plan to coordinate the release of new
versions across all Denote-related packages, so expect the
aforementioned to be available at around the same time as `denote`
version `4.0.0` (which is going to be massive, by the way).

### About Denote journal

The `denote-journal` package makes it easier to use Denote for
journaling. While it is possible to use the generic `denote` command
(and related) to maintain a journal, this package defines extra
functionality to streamline the journaling workflow.

The code of `denote-journal` used to be bundled up with the `denote`
package before version `4.0.0` of the latter and was available in the
file `denote-journal-extras.el`. Users of the old code will need to
adapt their setup to use the `denote-journal` package. This can be
done by replacing all instances of `denote-journal-extras` with
`denote-journal` across their configuration.

+ Package name (GNU ELPA): `denote-journal`
+ Official manual: <https://protesilaos.com/emacs/denote-journal>
+ Git repository: <https://github.com/protesilaos/denote-journal>
+ Backronym: Denote... Journaling Obviously Utilises Reasonableness
  Notwithstanding Affectionate Longing.

### About Denote

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

