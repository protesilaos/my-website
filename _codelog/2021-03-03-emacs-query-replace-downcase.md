---
title: "Use 'M-x query-replace-regexp' to downcase matches"
excerpt: 'Pro tip on evaluating Emacs Lisp forms during a query-replace session.'
---

Earlier today I wanted to convert a bunch of Org meta data keywords to
lower case notation, with the help of `isearch-forward-regexp` and
`query-replace-regexp`.  This included everything from special comments,
like `#+TITLE:` to property drawers in the form of `:PROPERTIES:`.
There were 340 such cases in my file and I was reluctant to do so
manually.  Thankfully, Emacs makes such a task fairly simple once you
get past the essentials, because it lets you evaluate arbitrary Elisp
forms for the replacement text.  This includes the possibility of
running some function on a matched regexp group.  In this case that
function was `(downcase OBJECT)`.

First I needed a regular expression that would capture all targets.
`isearch-forward-regexp` and its `query-replace-regexp` counterpart
expect a single backslash for the escape character, so I ended up with
this pattern:

```
^\(#\|:\)[^ ].*?:
```

If I were to test this in the buffer, I could use `M-x re-builder`,
which however requires double backslashes (same for when you write Elisp
code):

```
^\\(#\\|:\\)[^ ].*?:
```

- Once I was sure of the regular expression I had to use, I went to the
  top of the buffer and invoked `isearch-forward-regexp` (bound to
  `C-M-s` by default).

- Entered the pattern `^\(#\|:\)[^ ].*?:`, got live feedback of the
  matching items, and switched to `query-replace` with `C-%`
  (`isearch-query-replace`).  When the Isearch is regexp-aware so is the
  corresponding `query-replace`.

- For the replacement text I instructed the command to evaluate the
  `downcase` function.  This is done by escaping the comma operator
  (`,`) and then supplying the function with a regexp group.  Because I
  wished to match everything, the group should be `\0`.  Which means
  that the replacement should be expressed thus: `\,(downcase \0)`.

Try this with any string in a buffer, say, `Hello`:

- `M-x query-replace-regexp`
- `Hello`
- `\,(upcase \0)`

Confirm the operation and you should get `HELLO`.  This works with
multiple groups and can read a series of Elisp forms.  An example with
`Hello world`:

- `M-x query-replace-regexp`
- `\(Hello\) \(world\)`
- `\,(downcase \1) \,(capitalize \2)`

Which should give you `hello World`.

The elegant minimalism of the `query-replace` interface grants you the
power to either replace each match one at a time or hit the exclamation
mark (`!`) to answer "yes to all".  This is what I did to downcase all
340 matches.  Voila!  All of my Org file's meta data were converted to
lower case in one go.

Finally, I discovered `query-replace-regexp-eval` which saves you from
adding the escaped comma operator for the replacement's Elisp form.
However its doc string reads thus:

```
Interactive use of this function is deprecated in favor of the
‘\,’ feature of ‘query-replace-regexp’.  For non-interactive use, a loop
using ‘search-forward-regexp’ and ‘replace-match’ is preferred.
```
