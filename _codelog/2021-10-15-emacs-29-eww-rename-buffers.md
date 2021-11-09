---
title: "EWW buffers can now be auto-renamed in Emacs 29"
excerpt: "Details of a new future that landed on the 'master' branch of emacs.git."
---

Starting with commit `171de3eee4` to the Emacs `master` branch, users
can now opt-in to a feature that automatically renames EWW buffers to
something more usable than the default `*eww*`.

The point of entry is the customisation option `eww-auto-rename-buffer`.
When given a `title` value, it will use the web page's title as the name
of the buffer.  When the value is `url`, the page's URL shall be used
instead.  Otherwise it is possible to give it the symbol of a function
that runs without parameters and returns a string.  So users can
configure this however they like.

Detail of the commit:

```
  commit 171de3eee459ed64388a8ced7d07fa031ea025a6
  Author: Protesilaos Stavrou <info@protesilaos.com>
  Date:   Fri Oct 15 14:12:32 2021 +0200

      Add new option to rename eww buffers

      * etc/NEWS: Document the new user options.

      * lisp/net/eww.el (eww-auto-rename-buffer, eww-buffer-name-length):
      Add new user options.
      (eww--rename-buffer): Introduce new function that performs the
      renaming of buffers.
      (eww--after-page-change): Add new wrapper function which calls
      'eww-update-header-line-format' and 'eww--rename-buffer'.
      (eww, eww-render, eww-tag-title, eww-readable, eww-restore-history):
      Include eww--after-page-change.

      Fix bug#51176.

      Co-authored-by: Abhiseck Paira <abhiseckpaira@disroot.org>
      Co-authored-by: Protesilaos Stavrou <info@protesilaos.com>

   doc/misc/eww.texi |  8 +++++++
   etc/NEWS          | 10 +++++++++
   lisp/net/eww.el   | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++-----
   3 files changed, 78 insertions(+), 5 deletions(-)
```

Thanks to everyone who participated in [the discussion around
bug#51176](https://lists.gnu.org/archive/html/bug-gnu-emacs/2021-10/msg01314.html).
Thanks to the Emacs co-maintainer, Lars Ingebrigtsen, for the feedback
and for merging the patch.  And special thanks to Abhiseck Paira, my
co-author for this patch, for all the work in making this happen.

I am very happy to see this merged into core.  I have been using a
variant of it for several months now.  It had been one of the most
useful additions of mine in making EWW my main web browser.

[ Watch: [EWW and my extras (text-based Emacs web
browser)](https://protesilaos.com/codelog/2021-03-25-emacs-eww/)
(2021-03-25) ]

Going forward, the plan is to extract more out of my `prot-eww.el`,
refine it, and push it to emacs.git.  Same principle for everything else
that goes into [my dotemacs](https://protesilaos.com/emacs/dotemacs).
