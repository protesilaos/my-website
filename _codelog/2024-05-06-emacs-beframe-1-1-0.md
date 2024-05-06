---
title: "Emacs: beframe version 1.1.0"
excerpt: 'Information about the latest version of my beframe package for GNU Emacs.'
---

`beframe` enables a frame-oriented Emacs workflow where each frame has
access only to the list of buffers visited therein.  In the interest of
brevity, we call buffers that belong to frames "beframed".

+ Package name (GNU ELPA): `beframe`
+ Official manual: <https://protesilaos.com/emacs/beframe>
+ Change log: <https://protesilaos.com/emacs/beframe-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/beframe>
  + GitLab: <https://gitlab.com/protesilaos/beframe>
+ Video demo: <https://protesilaos.com/codelog/2023-02-28-emacs-beframe-demo/>
+ Backronym: Buffers Encapsulated in Frames Realise Advanced
  Management of Emacs.

Below are the release notes

* * *

This is a small release that adds some quality-of-life refinements to
a stable package.


## The `beframe-global-buffers` is more flexible

This is a user option to specify which buffers should appear in all
frames. These "global" buffers are thus not associated only with the
frame in which they where displayed in.

Before, the value of this user option was a list of strings that were
matching buffer names literally. Now it is a list of strings which are
understood as regular expressions as well as a list of symbols
representing major modes.

Consider this example:

```elisp
(setq beframe-global-buffers '("\\*scratch\\*" ".*notmuch.*" emacs-lisp-mode))
```

It matches a buffer with the literal name `*scratch*`, all buffers
that include `notmuch` in their name, and all buffers whose major mode
is `emacs-lisp-mode` or derived therefrom.

You can now more easily put all buffers in the global list, such as
for email or IRC.


## The `beframe-prefix-map` is now a command

Before, this symbol was defined as a variable, which held the value of
the key bindings. Users where expected to bind this variable to a
key, such as:

```elisp
(define-key global-map (kbd "C-c b") beframe-prefix-map)
```

This would set up `C-c b` as a prefix for all the key bindings inside
of `beframe-prefix-map`. However, any changes to that map would not be
automatically included in the prefix. The above binding had to be
evaluated again (because we were binding a fixed value directly,
instead of having the indirection of a symbol that points to a value).

Now the `beframe-prefix-map` is implemented as a variable and a
command. The variable holds the value of the key bindings, while the
command is meant to be assigned to a key. For users, the change is
trivial:

```elisp
(define-key global-map (kbd "C-c b") 'beframe-prefix-map)
```

Notice the added single quote before `beframe-prefix-map`. While only
an extra character in the user's configuration, this is a major change
because any changes made to the key map will now be automatically
available under the defined prefix. No need to evaluate the key
binding again.
