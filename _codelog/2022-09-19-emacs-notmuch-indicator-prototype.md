---
title: "Emacs: prototype of notmuch-indicator"
excerpt: "Brief introduction to a work-in-progress package that adds a notmuch count to the Emacs mode line."
---

I have just pushed the first commits to the `notmuch-indicator` Git
repository: <https://git.sr.ht/~protesilaos/notmuch-indicator>.  This
provides a global minor mode---`notmuch-indicator-mode`---that puts the
return value of `notmuch count` commands on the Emacs mode line.
Technically, it appends it to the `global-mode-string`, so it also works
with the built-in `tab-bar-mode`.

The exact search terms for `notmuch count` are specified in the user
option `notmuch-indicator-args`.  It accepts a list of lists whose
elements are of the form `ARGS SPECIFIER`:

* The `ARGS` are notmuch search terms represented as a single string,
  such as `"tag:unread and tag:inbox"`.

* The `SPECIFIER` is an arbitrary string that is prepended to the return
  value of the above.  It helps differentiate different searches, though
  its real purpose is to provide an outlet for the wanton use of emoji.

Concretely, we can have something like this:

```elisp
(setq notmuch-indicator-args
      '(("tag:unread and tag:inbox" "@")
        ("--output threads from:VIP" "🤡")))
```

The indicator on the mode line will then look like:

```
@50 🤡10
```

The indicator is updated via a timer, whose duration in seconds is set
in the user option `notmuch-indicator-refresh-count`.

These are early days.  I will release a formal package in, say, a week
from now.  I still need to set up mirrors for GitHub and GitLab, as well
as add the relevant documentation files, license, etc.  I just wanted to
give you an idea of what this is.

[ I have been using a variant of `notmuch-indicator` for more than a
  year, as part of my personal Emacs config. ]
