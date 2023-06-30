---
title: "Emacs: notmuch-indicator version 1.0.0"
excerpt: 'Information about my notmuch email counter for the mode line of GNU Emacs.'
---

This is a simple package that renders an indicator with email counters
of the `notmuch` index on the Emacs mode line.  The underlying
mechanism is that of `notmuch-count(1)`, which is used to find the
number of items that match the given search terms.  The user can
define the queries and associate them with a character, optionally
assigning a face to it.

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

* Each counter in the entire indicator is now rendered with its own
  mouse hover.  This effect makes it clear that the counters are
  interactive.  Clicking on a counter terms the underlying search
  terms that produced it and produce a notmuch (notmuch.el) search
  buffer with them.

* The fix I did that prevented the display of duplicate counters is now
  formalised in a tagged release.  I observed a bug while starting
  from 0 emails, with 'notmuch-indicator-hide-empty-counters' set to
  non-nil.  The indicator would show multiple counters for the same
  search terms.  Whereas we always want to start from a clean state.

* The 'notmuch-indicator-refresh' is a public function that supersedes
  the now-deprecated private function 'notmuch-indicator--refresh'.
  The difference is one of forward guidance in how we maintain the
  package: this way we tell users that the given symbol is stable and
  will not change without notice.

* Other miscellaneous tweaks are in place.
