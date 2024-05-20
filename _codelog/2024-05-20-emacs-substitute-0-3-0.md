---
title: "Emacs: Substitute version 0.3.0"
excerpt: "Information about the latest version of my 'substitute' package for Emacs."
---

Substitute is a set of commands that perform text replacement (i)
throughout the buffer, (ii) limited to the current definition (per
`narrow-to-defun`), (iii) from point to the end of the buffer, and
(iv) from point to the beginning of the buffer.

These substitutions are meant to be as quick as possible and, as such,
differ from the standard `query-replace` (which I still use when
necessary). The provided commands prompt for substitute text and
perform the substitution outright, without moving the point.

+ Package name (GNU ELPA): `substitute`
+ Official manual: <https://protesilaos.com/emacs/substitute>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/substitute>
  + GitLab: <https://gitlab.com/protesilaos/substitute>
+ Video demo: <https://protesilaos.com/codelog/2023-01-16-emacs-substitute-package-demo/>
+ Backronym: Some Utilities Built to Substitute Targets Independent of
  Their Utterances, Thoroughly and Easily.

Below are the release notes.

* * *

This is a small release that adds a quality-of-life refinement to an
already stable package.

## Access all commands via a prefix key

The command `substitute-prefix-map` can be assigned to a key to make
it work as a prefix. This way, all Substitute commands are readily
available. For example:

```elisp
(define-key global-map (kbd "C-c s") #'substitute-prefix-map)
```

After evaluating that, type `C-c s C-h` to learn about all the key
bindings. To change those, use something like this:

```elisp
(define-key substitute-prefix-map (kbd "b") #'substitute-target-in-buffer)
(define-key substitute-prefix-map (kbd "d") #'substitute-target-in-defun)
(define-key substitute-prefix-map (kbd "r") #'substitute-target-above-point)
(define-key substitute-prefix-map (kbd "s") #'substitute-target-below-point)
```

Those commands can, of course, be used without the prefix key. In that
case, bind them directly to the `global-map` instead of the `substitute-prefix-map`.
