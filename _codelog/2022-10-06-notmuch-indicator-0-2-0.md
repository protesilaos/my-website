---
title: "Emacs: notmuch-indicator version 0.2.0"
excerpt: 'Information about my notmuch email counter for the mode line of GNU Emacs.'
---

This is a simple package that renders an indicator with an email count
of the `notmuch` index on the Emacs mode line.  The underlying mechanism
is that of `notmuch-count(1)`, which is used to find the number of items
that match the given search terms.  In practice, the user can define one
or more searches and display their counters.

+ Package name (GNU ELPA): `notmuch-indicator`
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/notmuch-indicator>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/notmuch-indicator>
    + GitLab: <https://gitlab.com/protesilaos/notmuch-indicator>
+ Mailing list: <https://lists.sr.ht/~protesilaos/notmuch-indicator>
+ Backronym: notmuch-... Increasingly in Need of Displaying
  Inconsequential Counters Alongside Trivia that Obscure Reality.

Below are the release notes.

* * *

* Fixed how the indicator is added to `global-mode-string`.  Before,
  it was inserted as a string.  Whereas we want to pass it as a
  symbol.  This is how other modes do it as well.  The result is the
  same for the user, though this design ensures that we do not get
  false positives when we try to remove our indicator (e.g. if we
  target an empty string, we can delete something else).
  
  Thanks to Yusef Aslam for reporting a bug which revealed this
  problem.  This was done in issue 1 over at the GitHub mirror:
  <https://github.com/protesilaos/notmuch-indicator/issues/1>.

* Made the indicator's counters clickable.  The `mouse-1` will now use
  the terms that yield the individual message counter to run a
  `notmuch-search` with them.  Thanks to Henrik Kjerringvåg for the
  patch.  It is below the ~15 line threshold and thus requires no
  copyright assignment to the Free Software Foundation.

  As a reminder, the search terms are specified in the user option
  `notmuch-indicator-args` and are passed to `notmuch-count(1)` which
  yields the count.  For instance, a value like the following defines
  three counters, which likely result in  `@10 😱9999 💕0`:

  ```elisp
  (setq notmuch-indicator-args
        '((:terms "tag:unread and tag:inbox" :label "@")
          (:terms "from:bank and tag:bills" :label "😱")
          (:terms "--output threads tag:loveletter" :label "💕")))
  ```

* Implemented some minor refinements to the code, based on the
  feedback of Stefan Monnier on the emacs-devel mailing list:
  <https://lists.gnu.org/archive/html/emacs-devel/2022-09/msg01949.html>.

The package is in a stable state and will likely not need much
maintenance going forward.  Consult the package's README or the
Commentary section of `notmuch-indicator.el` for the technicalities.
The latter is displayed in the Help buffer when using `M-x
describe-package` for `notmuch-indicator`.
