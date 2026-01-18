---
title: "Emacs: notmuch-indicator version 1.3.0"
excerpt: 'Information about my notmuch email counter for the mode line of GNU Emacs.'
---

This package renders an indicator with an email count of the `notmuch`
index on the Emacs mode line. The underlying mechanism is that of
`notmuch-count(1)`, which is used to find the number of items that
match the given search terms. In practice, the user can define one or
more searches and display their counters. These form a string which
realistically is like: `@50 😱1000 ♥️0` for unread messages, bills, and
fan letters, respectively.

+ Package name (GNU ELPA): `notmuch-indicator`
+ Official manual: <https://protesilaos.com/emacs/notmuch-indicator>
+ Change log: <https://protesilaos.com/emacs/notmuch-indicator-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/notmuch-indicator>
  + GitLab: <https://gitlab.com/protesilaos/notmuch-indicator>
+ Backronym: notmuch-... Interested in Neatly Displayed Indicators
  that Count Any Terms Ordinarily Requested.

Below are the release notes.

* * *

## 1.3.0 on 2026-01-18

This version adds quality-of-life refinements to a stable package.


### The `notmuch-indicator-mode` sets up the `notmuch-after-tag-hook`

The indicator will be updated whenever a message's tags change. This
way users do not need to rely on the timer-based method that we have
always had.


### The `notmuch-indicator-refresh-count` can be set to `nil`

Doing so has the effect of disabling the timer-based refresh of the
indicator. It will now be updated only when some event happens, such
as with the aforementioned change to tags or after the invocation of
any of the commands listed in the user option `notmuch-indicator-force-refresh-commands`.


### More configuration file paths

When checking for the `notmuch` configuration file, we now also
consider these two filesystem paths:

-   `$HOME/.config/notmuch/$NOTMUCH_PROFILE/config`
-   `$HOME/.config/notmuch/default/config`

Thanks to Yejun Su for the contribution in pull request 6:
<https://github.com/protesilaos/notmuch-indicator/pull/6>.

The change is small, meaning that Yejun Su does not need to assign
copyright to the Free Software Foundation.
