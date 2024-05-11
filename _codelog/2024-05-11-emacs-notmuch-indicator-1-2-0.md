---
title: "Emacs: notmuch-indicator version 1.2.0"
excerpt: 'Information about my notmuch email counter for the mode line of GNU Emacs.'
---

This is a simple package that renders an indicator with an email count
of the `notmuch` index on the Emacs mode line.  The underlying mechanism
is that of `notmuch-count(1)`, which is used to find the number of items
that match the given search terms.  In practice, the user can define one
or more searches and display their counters.  These form a listing which
realistically is like: `@50 😱1000 💕0` for unread messages, bills, and
love letters, respectively.

+ Package name (GNU ELPA): `notmuch-indicator`
+ Official manual: <https://protesilaos.com/emacs/notmuch-indicator>
+ Change log: <https://protesilaos.com/emacs/notmuch-indicator-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/notmuch-indicator>
  + GitLab: <https://gitlab.com/protesilaos/notmuch-indicator>
+ Backronym: notmuch-... Interested in Notmuch Data Indicators that
  Count Any Terms Ordinarily Requested.

Below are the release notes.

* * *

This version brings quality-of-life refinements to an already stable
package.


## More styles for the indicator

The user option `notmuch-indicator-args` always accepted an optional
face that was applied to the label that accompanies the given counter.
The same can now be done for the counter itself. To be concrete:

    LABEL       COUNTER

    [unread]    10

Or what you will most likely prefer:

    [U] 10

The technicalities of how to set those up are covered in the
documentation string of `notmuch-indicator-args`. Here is a variant of
what I use (I actually have custom faces):

```elisp
(setq notmuch-indicator-args
      '(( :terms "tag:unread and tag:inbox"
          :label "[A] "
          :label-face font-lock-string-face
          :counter-face font-lock-string-face)
        ( :terms "tag:unread and tag:inbox and not tag:package and not tag:coach"
          :label "[U] "
          :label-face font-lock-type-face
          :counter-face font-lock-type-face)
        ( :terms "tag:unread and tag:package"
          :label "[P] "
          :label-face font-lock-function-name-face
          :counter-face font-lock-function-name-face)
        ( :terms "tag:unread and tag:coach"
          :label "[C] "
          :label-face font-lock-preprocessor-face
          :counter-face font-lock-preprocessor-face)))
```

For backward-compatibility, `:face` has the same meaning as `:label-face`.


## Control exactly where the indicator is placed

This is for advanced users, though I am happy to help you set it up if
you are interested.

By default, the indicator (the block with all the email counters) is
appended to the mode line. It thus shows up on the mode line of the
current window but also on that of all inactive windows.

To control exactly where the indicator is placed set the user option
`notmuch-indicator-add-to-mode-line-misc-info` to nil. This will no
longer display the indicator on the mode line. Then do any of the
following:

1.  If you are using the built-in `tab-bar-mode`, add the
    `notmuch-indicator-tab-bar-format` to the list of `tab-bar-format`.
    Like this:

    ```elisp
    (setq tab-bar-format
          '( tab-bar-format-history
             tab-bar-format-tabs
             tab-bar-separator
             tab-bar-format-add-tab
             tab-bar-format-align-right
             notmuch-indicator-tab-bar-format ; here it is
             tab-bar-separator
             tab-bar-format-global))
    ```

2.  Add the `notmuch-indicator-mode-line-construct` to the
    `mode-line-format`. This allows you to put it wherever you want,
    such as before the buffer name.

3.  Create your own mode line construct with the extra logic you need
    and then add it anywhere you want in the `mode-line-format` list.
    This is what I do to display the indicator only on the active mode
    line:

    ```elisp
    ;; Here is my variant of the indicator.
    (defvar-local prot-modeline-notmuch-indicator
        '(notmuch-indicator-mode
          (" "
           (:eval (when (mode-line-window-selected-p)
                    notmuch-indicator--counters))))
      "The equivalent of `notmuch-indicator-mode-line-construct'.
    Display the indicator only on the focused window's mode line.")

    ;; And here I format my modeline to place everything exactly where I want.
    (setq-default mode-line-format
                  '("%e"
                    ;; ... things before
                    prot-modeline-notmuch-indicator
                    ;; ... things after
                    prot-modeline-misc-info))
    ```

## Escape queries to avoid shell errors

We now escape all special shell characters before running the
`notmuch` shell command to get the number of emails. This way, more
complex queries are read without any issue. Thanks to Sébastien
Delafond for the contribution, which was done in pull request 4:
<https://github.com/protesilaos/notmuch-indicator/pull/4>.

The change is small, meaning that Sébastien does not need to assign
copyright to the Free Software Foundation.


## Bind call to the `notmuch` binary to the user's home directory

The reason for this is explained by @shimeike (MikeS):
<https://github.com/protesilaos/notmuch-indicator/issues/2#issuecomment-1819853525>.
In short, we want to make sure we use the correct binary while
visiting files via TRAMP.

Also thanks to Mohamed Suliman for corroborating the findings
discussed therein.
