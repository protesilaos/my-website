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

## Version 0.5.0 on 2026-01-05

This is a small release that fixes a bug and adds a relevant user
option.

The bug pertained to the scope of the substitution when buffer
narrowing was in effect. All commands would ignore narrowing and also
fail to properly clear the highlights they apply (highlights are
transiently in effect to show what the target of the substitution is
while the minibuffer is waiting for user input).

Now all commands do the right thing with respect to buffer narrowing.
Though their exact behaviour depends on the value of the new user
option `substitute-ignore-narrowing`:

- When the value of `substitute-ignore-narrowing` is non-`nil`, then
substitutions apply to the actual scope of the given command. For
example, `substitute-target-in-buffer` will cover the whole buffer
from the absolute minimum position to the absolute maximum position
even if narrowing is in effect.

- When the value of `substitute-ignore-narrowing` is `nil`, then
substitutions apply to their scope subject to the boundaries of the
narrowed buffer. For example, `substitute-target-in-buffer` will
understand as "whole buffer" the region between the minimum and
maximum positions of the narrowed buffer.

Users can write small convenience commands that do either of those,
depending on preference. For example:

```elisp
(defun my-substitute-target-in-buffer-with-narrowing ()
  "Call `substitute-target-in-buffer' with `substitute-ignore-narrowing' as `nil'."
  (let ((substitute-ignore-narrowing nil))
    (call-interactively 'substitute-target-in-buffer)))

(defun my-substitute-target-in-buffer-without-narrowing ()
  "Call `substitute-target-in-buffer' with `substitute-ignore-narrowing' as non-`nil'."
  (let ((substitute-ignore-narrowing t))
    (call-interactively 'substitute-target-in-buffer)))
```

Thanks to zauberen for reporting the bug in issue 11:
<https://github.com/protesilaos/substitute/issues/11>.
