---
title: "Emacs: Substitute version 0.4.0"
excerpt: "Information about the latest version of my 'substitute' package for Emacs."
---

Substitute is a set of commands that perform text replacement (i)
throughout the buffer, (ii) limited to the current definition (per
`narrow-to-defun`), (iii) from point to the end of the buffer, and
(iv) from point to the beginning of the buffer. Variations of these
scopes are also available.

These substitutions are meant to be as quick as possible and, as such,
differ from the standard `query-replace` (which I still use when
necessary). The provided commands prompt for substitute text and
perform the substitution outright, without moving the point. The
target is the symbol/word at point or the text corresponding to the
currently marked region. All matches in the given scope are
highlighted by default.

+ Package name (GNU ELPA): `substitute`
+ Official manual: <https://protesilaos.com/emacs/substitute>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/substitute>
  + GitLab: <https://gitlab.com/protesilaos/substitute>
+ Video demo: <https://protesilaos.com/codelog/2023-01-16-emacs-substitute-package-demo/>
+ Backronym: Substitutions Uniformly Beget Standardisation for Text Invariably Transfigured Unto This Entry.

Below are the release notes.

* * *

## Version 0.4.0 on 2025-11-29

This version iterates on an already stable package. It introduces a
few new commands while making minor internal refinements.

The new commands work exactly like those already on offer, except for
their scope of application. Remember that Substitute targets either
the symbol/word at point or any occurrences of the currently marked
characters/text within the given scope and replaces them with the
user's input. The scope is something like "current function
definition", "current paragraph", "from here to the end of the
buffer", et cetera. The substitution does not move the cursor.

The new commands:

- `substitute-target-in-outline`: Substitute the target across the
  current outline level. The outline is determined by the buffer-local
  value of the variable `outline-regexp`. For example, in Org mode the
  current outline level includes the heading and any text below it but
  not any subheadings.

- `substitute-target-in-page`: Like the above for the boundaries of
  the current page. A page is determined by the buffer-local value of
  the variable `page-delimiter`.

- `substitute-target-in-paragraph`: As above for the current
  paragraph. Note that in programming modes a "paragraph" is not
  necessarily the same as with prose (where, in their simplest form,
  paragraphs are delimited by empty lines). Substitute highlights all
  matches by default, so users should notice the difference right
  away.

- `substitute-target-in-defun-and-below`: This works in the scope of
  the current definition (per `narrow-to-defun`) but only from point
  onwards. It is the counterpart to the commands we always had in
  `substitute-target-in-defun`.
