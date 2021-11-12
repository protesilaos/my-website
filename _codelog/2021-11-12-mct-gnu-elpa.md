---
title: "Emacs: mct is on GNU ELPA"
subtitle: "Simple package for default minibuffer completion"
excerpt: 'My "Minibuffer and Completions in Tandem (mct)" is now available on GNU ELPA for Emacs 28 or higher.'
---

My Minibuffer and Completions in Tandem (`mct`) package is now available
on GNU ELPA for Emacs version 28 or higher.  You can install it with
these commands:

```
M-x package-refresh-contents
M-x package-install RET mct
```

As I have [demonstrated in a recent
video](https://protesilaos.com/codelog/2021-10-22-emacs-mct-demo/), MCT
is a very thin layer of interactivity on top of the default minibuffer
and the standard `*Completions*` buffer.  It basically adds commands to
cycle between the minibuffer and the Completions, making the two work as
parts of a unified space.

The package comes with a fully fledged Info manual.  It provides a
detailed overview of the functionality on offer, the customisation
options, a sample configuration which also covers other useful built-in
utilities (like `file-name-shadow-mode`), and more.  Read the manual
after you have installed the package by evaluating the following:

```
(info "(mct) Top")
```

Note that I just pushed a new tagged release: version `0.2.0`.  It
improves a few things in the code base and expands the manual.
Depending on when you install the package, expect an update to be
available soon.
