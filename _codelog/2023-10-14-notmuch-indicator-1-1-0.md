---
title: "Emacs: notmuch-indicator version 1.1.0"
excerpt: 'Information about my notmuch email counter for the mode line of GNU Emacs.'
---

This is a simple package that renders an indicator with email counters
of the `notmuch` index on the Emacs mode line.  The underlying
mechanism is that of `notmuch-count(1)`, which is used to find the
number of items that match the given search terms.  The user can
define the queries and associate them with a character, optionally
assigning a face to it.

+ Package name (GNU ELPA): `notmuch-indicator`
+ Official manual: <https://protesilaos.com/emacs/notmuch-indicator>
+ Change log: <https://protesilaos.com/emacs/notmuch-indicator-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/notmuch-indicator>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/notmuch-indicator>
    + GitLab: <https://gitlab.com/protesilaos/notmuch-indicator>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Backronym: notmuch-... Interested in Notmuch Data Indicators that
  Count Any Terms Ordinarily Requested.

Below are the release notes.

* * *


## The indicator now works over TRAMP

In previous versions, the counters of the `notmuch-indicator-mode`
would be omitted from the mode line if the refresh would happen while
the user was browsing a remote file system with TRAMP. They would be
restored once the user would switch to a local buffer. This was done
as a precaution, as I had not yet developed a mechanism to retrieve
the data relative to the local user.

Counters are now always on display and are pointing to the local
user's configuration. The package furnishes two new users options,
which make this possible: the `notmuch-indicator-notmuch-config-file`
and `notmuch-indicator-notmuch-binary`.

Their respective value is set at the time the `notmuch-indicator`
feature is loaded (such as with `require` or `use-package`).

Advanced users may wish to display different indicators depending on
the TRAMP environment. In principle, this is done by setting the
aforementioned options to the appropriate values. If anyone has such a
use-case, please contact me as I am eager to make the package more
flexible.


## The mouse hover of counters has a better style

One of the nice features of the `notmuch-indicator-mode` counters on
the mode line is that they are clickable: a mouse click produces a
`notmuch.el` buffer with the same search terms as those that populate
the counter.

Before, the face used to indicate the mouse hover state was the
generic `highlight` which can differ from the `mode-line-highlight`
(depending on the theme).  We now use the latter to make sure that the
styling is consistent.


## Documentation

-   The documentation of `notmuch-indicator` is now available on my
    website as well as an Info manual together with the GNU ELPA
    package.  On my website: <https://protesilaos.com/emacs/notmuch-indicator>.

-   I did not keep a `CHANGELOG.org` for this package, though I am doing
    it from now on. This file's corresponding web page is this one:
    <https://protesilaos.com/emacs/notmuch-indicator-changelog>.

    At any rate, I always publish release notes on my coding-related
     blog. The previous publications from oldest to newest:

    -   <https://protesilaos.com/codelog/2022-09-21-notmuch-indicator-0-1-0/>
    -   <https://protesilaos.com/codelog/2022-10-06-notmuch-indicator-0-2-0/>
    -   <https://protesilaos.com/codelog/2023-06-30-notmuch-indicator-1-0-0/>
