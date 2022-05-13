---
title: "About the 'elpa-devel' package archive (Emacs)"
excerpt: "Information about Emacs package archives, how to set up elpa-devel, prioritise archives, and pin packages."
---

## Overview of GNU ELPA

The official package archive of Emacs is GNU ELPA.  It is maintained as
part of Emacs: those with write access to emacs.git can commit changes
to elpa.git.

The "ELPA" acronym stands for "Emacs Lisp Package Archive".  GNU ELPA is
enabled by default in recent stable versions of Emacs per the value of
the variable `package-archives`.  This means that the user can install
lots of useful, free/libre packages without setting up another package
archive.

One might read in various fora references to "ELPA" without a qualifier.
These typically mean "GNU ELPA".

## The "devel" version of GNU ELPA

GNU ELPA provides the latest tagged release of a package.  There is,
however, the option to fetch packages that are built periodically from
source using the most recent commit in the main branch.  This is the
"development" version of GNU ELPA, hereinafter referred to as
`elpa-devel`, which can be added to the list of archives thus:

```
(add-to-list 'package-archives '("elpa-devel" . "https://elpa.gnu.org/devel/"))
```

Or declare the entire list outright:

```elisp
(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
        ("elpa-devel" . "https://elpa.gnu.org/devel/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))
```

[ Remember to use `M-x package-refresh-contents` to update the list of
  packages. ]

`elpa-devel` is useful for those who (i) want to live on the bleeding
edge, (ii) understand that packages may break from time-to-time, and
(iii) may want to help the developer test their program.

Setting up `elpa-devel` does not mean opting in to it indiscriminately.
The user can pick which version of a package they prefer, such as by
specifying the one to download in the buffer of `M-x list-packages`.
More on this in the next section.

`M-x describe-package` (`C-h P` by default) shows which versions are
available.  If the package is already installed, the Help buffer will
mention which version is in use.  Example:

```
     Status: Installed in ‘vertico-0.23.0.20220511.61449/’. [Delete]
    Version: 0.23.0.20220511.61449
     Commit: d5d6e312af7c2525c8e6be3397373929a28dd421
    Summary: VERTical Interactive COmpletion
   Requires: emacs-27.1
    Website: https://github.com/minad/vertico
 Maintainer: Daniel Mendler <mail@daniel-mendler.de>
     Author: Daniel Mendler <mail@daniel-mendler.de>
Other versions: 0.23.0.20220511.61449 (elpa-devel), 0.23 (elpa).
```

Notice the difference in notation.  `elpa` will get the value of the
`Version` header specified in the package's metadata: `0.23` in this
case.  Whereas `elpa-devel` follows a more descriptive pattern of
`VERSION.DATE.IDENTIFIER`, as in `0.23.0.20220511.61449`.

## Prioritise archives and pin packages to archives

By default, package archives are not prioritised.  The Emacs package
manager (`package.el`) will fetch the highest version it finds.  Users
can control this behaviour by configuring the user option
`package-archive-priorities`.

```elisp
;; Assuming a `package-archives' like this:
(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
        ("elpa-devel" . "https://elpa.gnu.org/devel/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

;; Highest number gets priority (what is not mentioned gets priority 0)
(setq package-archive-priorities
      '(("elpa" . 2)
        ("nongnu" . 1)))
```

[ Remember `M-x package-refresh-contents` to propagate changes. ]

In this example, the Emacs package manager will prefer the `elpa`
version of a package, even if it is found in other archives.

Notwithstanding such prioritisation, the Emacs package manager has the
power to choose versions of individual packages by associating them with
a particular archive.  The user option is `package-pinned-packages`.  It
is only needed for packages that should deviate from the norm of
`package-archive-priorities`.

```elisp
;; Do it like this:
(setq package-pinned-packages
      '((fontaine . "elpa-devel")
        (logos . "elpa-devel")
        (vertico . "elpa-devel")))

;; Or perhaps:
(defvar my-elpa-devel-packages
  '(fontaine logos vertico)
  "List of packages I want to pin to elpa-devel.")

(dolist (package my-elpa-devel-packages)
  (add-to-list 'package-pinned-packages (cons package "elpa-devel")))
```

## Help test packages

GNU ELPA is "stable" though "stability" here refers to the cadence of
updates, not the inherent features of the respective package's code
base.  A stable package can still have bugs!

From my perspective as a [maintainer of several Emacs
packages](https://protesilaos.com/emacs), the `elpa-devel` option is
very helpful to identify misfeatures or errors and iterate on them in a
timely fashion.  Feedback is valuable.

I often receive emails pertaining to my packages which start with a
statement along the lines of _"sorry to bother you about PACKAGE"_.
Don't worry about it: the duty of a maintainer is to consider
information of this sort and act on it accordingly.

On this note, I encourage you to report actual or even perceived
problems _to package maintainers_, while consulting the official
documentation (asking folks on some forum is okay, but don't expect the
maintainer to keep track of such exchanges).  Emacs is one of those
programs that encourages you to introspect it and, in the process of
learning, blur the line between user and developer.

Do your part to improve packages, however minor you may think your
contribution is.
