---
title: "Emacs: cursory version 1.1.0"
excerpt: 'Information about the latest version of my Cursory package for GNU Emacs.'
---

Cursory provides a thin wrapper around built-in variables that affect
the style of the Emacs cursor on graphical terminals. The intent is to
allow the user to define preset configurations such as "block with
slow blinking" or "bar with fast blinking" and set them on demand. The
use-case for such presets is to adapt to evolving interface
requirements and concomitant levels of expected comfort, such as in
the difference between writing and reading.

+ Package name (GNU ELPA): `cursory`
+ Official manual: <https://protesilaos.com/emacs/cursory>
+ Change log: <https://protesilaos.com/emacs/cursory-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/cursory>
  + GitLab: <https://gitlab.com/protesilaos/cursory>
+ Backronym: Cursor Usability Requires Styles Objectively Rated Yearlong.

Below are the release notes.

* * *

## Version 1.1.0 on 2024-09-14

Cursory is in a stable state. This version includes quality-of-life
refinements.


### The `cursory-mode` simplifies how the state is stored

Cursory has functions to store and restore its state. In previous
versions, we would document how to use those by adding them to the
relevant hooks. This approach still works, though we now provide an
easier way to achieve the same result: just enable the `cursory-mode`.

Technically, all this does is to set the hooks if enabled, and unsets
them if disabled.

The &ldquo;restore&rdquo; phase is the same as before. For example:

```elisp
;; Set last preset, if available, or fall back to the `bar' preset
;; from the `cursory-presets'.
(cursory-set-preset (or (cursory-restore-latest-preset) 'bar))
```

### Use the `cursory-set-preset-hook`

The `cursory-set-preset-hook` is a normal hook (where functions are
invoked without any arguments), which is called after the command
`cursory-set-preset`. Here are some ideas on how to use it:

```elisp
;; Imagine you have a preset where you want minimal cursor styles.
;; You call this `focus' and want when you switch to it to change the
;; cursor color.
(defun my-cursory-change-color ()
"Change to a subtle color when the `focus' Cursory preset is selected."
  (if (eq cursory-last-selected-preset 'focus)
      (set-face-background 'cursor "#999999")
    (face-spec-recalc 'cursor nil)))

;; Here we just show how to disable a given mode.  Of course, we can
;; have something more sophisticated, which stores the last value and
;; restores it if the condition we are testing for here is not met.
;; Keeping it simple for now.
(defun my-cursory-change-color-disable-line-numbers ()
  "Disable line numbers if the Cursory preset is `presentation' or `focus'."
  (when (member cursory-last-selected-preset '(presentation focus))
    (display-line-numbers-mode -1)))
```

I am happy to include more examples here, if users have any questions.


### Miscellaneous

-   Fixed a dependency for older Emacs versions. The `subr-x`, which is
    built into Emacs, needs to be explicitly loaded at compile time.
    This makes some parts of the code work as expected. Thanks to Mehdi
    Khawari for reporting the problem and Nicholas Vollmer for
    suggesting this change. The exchange took place in issue 1:
    <https://github.com/protesilaos/cursory/issues/1>. Users should
    already have this change, as I published a minor release for it
    (version `1.0.1`).

-   Added some missing metadata to the manual. This is useful for the
    indices and COPYING section.

-   Updated the relevant links to the package sources. The main
    repository is now on GitHub.
