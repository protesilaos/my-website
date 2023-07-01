---
title: "Emacs: substitute version 0.2.0"
excerpt: "Information about my 'substitute' package for GNU Emacs."
---

Substitute is a set of commands that perform text replacement (i)
throughout the buffer, (ii) limited to the current definition (per
`narrow-to-defun`), (iii) from point to the end of the buffer, and
(iv) from point to the beginning of the buffer.

These substitutions are meant to be as quick as possible and, as such,
differ from the standard `query-replace` (which I still use).  The
provided commands prompt for substitute text and perform the
substitution outright, without moving the point.

+ Package name (GNU ELPA): `substitute`
+ Official manual: <https://protesilaos.com/emacs/substitute>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/substitute>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/substitute>
    + GitLab: <https://gitlab.com/protesilaos/substitute>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Video demo: <https://protesilaos.com/codelog/2023-01-16-emacs-substitute-package-demo/>
+ Backronym: Some Utilities Built to Substitute Targets Independent of
  Their Utterances, Thoroughly and Easily.

Below are the release notes.

* * *

The package has been in a stable state since its inception, to the
point where I thought I had already formalised its latest version as a
release...

The value proposition of `substitute` is shown in the video I did for
it: <https://protesilaos.com/codelog/2023-01-16-emacs-substitute-package-demo/>.

Notable refinements:

* It is now possible to substitute a target with an empty string.  We
  could not do that with `read-string` function that was originally in
  use, as the empty input is automatically interpreted as the value of
  the DEFAULT-VALUE argument that `read-string` gets.  This is
  standard for most Emacs minibuffer interactions, though in our case
  it makes sense to accept an empty string that is distinct from the
  default value, as we may, e.g., want to remove a prefix from a
  target.  Thanks to Kostas Andreadis for discussing this with me in
  issue 2 on the GitHub mirror as well as pull request 3:

  - <https://github.com/protesilaos/substitute/issues/2>
  - <https://github.com/protesilaos/substitute/pull/3>

* Target strings that contain escape sequences do not confuse
  Substitute anymore.  The substitution will be performed as expected.
  Thanks to Kostas Andreadis for the contribution, which was done in
  pull request 3 on the GitHub mirror:
  <https://github.com/protesilaos/substitute/pull/3>.

* Calling `undo` after a substitution no longer moves the point.  This
  is consistent with the behaviour of Substitute when it replaces the
  target text.  Thanks to Ed Tavinor for the patch, which was done via
  a private channel.

* Normally, Substitute will retain the letter casing of the underlying
  target.  This means that if it is replacing "hello" with "hey" and
  there is a "HELLO" instance, it will replace it with "HEY".  This is
  often the desired behaviour.  Though now all Substitute commands
  accept an optional prefix argument (`C-u` with default key
  bindings), which is interpreted as a "fixed case" substitution: the
  user input is applied as-is, regardless of the underlying letter
  casing.  To always have fixed letter casing, set the user option
  `substitute-fixed-letter-case` to a non-nil value.  Doing so is the
  same as always calling the commands with a prefix argument.  Thanks
  to revrari for bringing this matter to my attention in issue 4 on
  the GitHub mirror:
  <https://github.com/protesilaos/substitute/issues/4>.

* Substitute will not even try to perform its task in a read-only
  buffer.  Thanks to ersi-dnd for bringing this matter to my
  attention.  This was done in issue 6 on the GitHub mirror:
  <https://github.com/protesilaos/substitute/issues/6>.

* The built-in `subr-x` library is explicitly required to avoid byte
  compilation warnings.  Thanks to Chunye Wang for the contribution,
  which was done in pull request 1 on the GitHub mirror:
  <https://github.com/protesilaos/substitute/pull/1>.

The code contributions from Ed Tavinor, Kostas Andreadis, and Chunye
Wang are small, meaning that their respective authors do not need to
assign copyright to the Free Software Foundation.
