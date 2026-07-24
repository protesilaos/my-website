---
title: "Emacs: Substitute version 0.5.0"
excerpt: "Information about the latest version of my 'substitute' package for Emacs."
---

Substitute provides a set of commands that perform text replacement
(i) throughout the buffer, (ii) limited to the current definition (per
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

## Version 0.6.0 on 2026-07-24

This version brings quality-of-life improvements to an already stable
package. The user-facing changes are as follows:

1. When performing a substitution, the minibuffer prompt now reports
   how many matches there are in the given scope.  For example, if I
   call `substitute-target-in-defun`, I get something like this
   prompt:

   ```
   "Substitute `this-symbol' (3 times) in the current DEFUN with:"
   ```

2. `substitute-target-in-line` is a new command that behaves like all
   the others within the boundaries of the current line.

3. The face used at the prompt to highlight the target of the given
   substitution is now defined as `substitute-prompt-target-highlight`.
   Users or theme developers can update as needed, though the default
   value should work in virtually every setup.

4. Aliases of certain commands are also autoloaded. Concretely, this
   means that Emacs is aware of them even before substitute.el is
   loaded, so they can be bound to keys or called with M-x at any
   time. Thanks to Morgan Willcock for the patch. Morgan has assigned
   copyright to the Free Software Foundation.

5. The command `substitute-target-in-page` should correctly target the
   current page. Thanks to Morgan Willcock for the patch.
