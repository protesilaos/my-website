---
title: "Emacs: prototype of notmuch-indicator"
excerpt: "Brief introduction to a work-in-progress package that adds a notmuch count to the Emacs mode line."
---

**UPDATE 2022-09-19 20:22 +0300:** Update information.

I have just pushed the first commits to the `notmuch-indicator` Git
repository: <https://git.sr.ht/~protesilaos/notmuch-indicator>.  This
provides a global minor mode---`notmuch-indicator-mode`---that puts the
return value of `notmuch count` commands on the Emacs mode line.
Technically, it appends it to the `global-mode-string`, so it also works
with the built-in `tab-bar-mode`.

The exact search terms for `notmuch count` are specified in the user
option `notmuch-indicator-args`.  It is a list of plists.  Each plist
consists of two properties, both of which accept a string value:

1. The `:terms` holds the command-line arguments passed to notmuch
   count.

2. The `:label` is an arbitrary string that is prepended to the return
   value of the above.

Multiple plists represent separate `notmuch count` queries.  These are
run sequentially.  Their return values are joined into a single string.

For instance, a value like the following defines two commands:

```elisp
(setq notmuch-indicator-args
      '((:terms "tag:unread and tag:inbox" :specifier "@")
        (:terms "--output threads from:VIP" :specifier "🤡")))
```

The indicator on the mode line will then look like:

```
@50 🤡10
```

The indicator is updated via a timer, whose duration is in seconds
seconds.  It is set in the user option `notmuch-indicator-refresh-count`.

These are early days and the implementation details may change.  I will
release a formal package in, say, a week from now.  I still need to set
up mirrors for GitHub and GitLab, as well as add the relevant
documentation files, license, etc.  I just wanted to give you an idea of
what this is.

[ I have been using a variant of `notmuch-indicator` for more than a
  year now, as part of my personal Emacs config. ]
