---
title: "'Emacs Lisp Elements' book version 2"
excerpt: "Information about the latest version of my 'Emacs Lisp Elements' book."
---

I just published a new version of my _Emacs Lisp Elements_. Below are
the release notes.

+ Official page: <https://protesilaos.com/emacs/emacs-lisp-elements>
+ Git repository: <https://github.com/protesilaos/emacs-lisp-elements>

* * *

## Emacs Lisp Elements version 2.0.0

This is a major rewrite of the book. It has almost doubled in word
count. I explain more concepts and do it from the ground up. Every
single one of the original chapters is redone. They now contain
insights into functionality they would previously hint at, such as how
'apply' works in practice, what a non-local exit is, and how recursive
editing is done.

I have also added several new chapters. As before, chapters have
cross references, so you will benefit from revisiting relevant topics.

If you read the Info version of the book, note that all functions,
variables, and concepts have their own indices. Use those as another
means of navigating the book's contents. To read the Info version,
clone the Git repository, use 'M-x dired' to open its directory,
move the cursor over the file 'elispelem.info' and do 'M-x dired-info'.

What follows is a brief description of the new chapters.

- Basics of how Lisp works: A step-by-step guide to how Lisp code is
  written and how Emacs can tell apart a function call from a variable
  even when those have the same symbol.

- Introspecting Emacs: Explores some of the ways we can learn about
  the present state of Emacs. The idea is to develop the habit of
  asking Emacs about itself before we do an online search. This way we
  can also expose ourselves to Elisp code, which helps us become
  better programmers.

- Add metadata to symbols: An explanation of how we can associate
  symbols with data that can then be used for further computations.

- What are major and minor modes: Presents the basics of modes in
  Emacs. It explains what major and minor modes have in common and how
  they differ, while also discussing relevant concepts of precedence.

- Hooks and the advice mechanism: Explains what are hooks and how
  they work. It also covers the powerful advice mechanism, as some
  uses of it as similar to what hooks are supposed to do.

- Autoloading symbols: Shows how Emacs manages to "lazy load" code
  when it needs to. This is especially helpful for package developers.

- Emacs as a computing environment: A more general view of Emacs
  that helps us appreciate the value of Emacs Lisp. The more time we
  put into learning this programming language, the better we will get
  at controlling large parts of our computing life through Emacs.
