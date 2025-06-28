---
title: "Emacs: beframe version 1.3.0"
excerpt: 'Information about the latest version of my beframe package for GNU Emacs.'
---

`beframe` enables a frame-oriented Emacs workflow where each frame has
access only to the list of buffers visited therein. In the interest of
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

## Version 1.3.0 on 2025-01-24


This version contains quality-of-life refinements to an already stable
package.


### Make frame names unique, if needed

We provide the user option `beframe-rename-function`, which will be
called with the new frame when `beframe-mode` is enabled. The idea is
to automatically apply a helpful name to the frame that was created.
The default function we use is `beframe-rename-frame`, which will do
the right thing to get a suitable name. To make this even more robust,
we now disambiguate equal frame names by appending a number to their
name. So instead of having two or more frames all named `hello`, you
get `hello`, `hello<2>`, and so on.

Thanks to Vedang Manerikar for the original contribution in pull
request 12: <https://github.com/protesilaos/beframe/pull/12>. The
change is within the ~15-line limit, meaning that Vedang does not need
to assign copyright to the Free Software Foundation (though I believe
the paperwork is done anyway). I made some further changes on top.

Remember that you can make certain commands automatically generate a
frame and run therein by adding them to the list of `beframe-functions-in-frames`.
A common use-case is to do this for switching to a new project, hence:

```elisp
(setq beframe-functions-in-frames '(project-prompt-project-dir))
```

### Use the optional `beframe-transient` instead of the prefix key map

We provide a regular prefix key map where Beframe commands are bound
to. Users can access all the commands via a prefix key, such as with:

```elisp
(define-key global-map (kbd "C-c b") #'beframe-prefix-map)
```

Users who prefer a more graphical interface can instead rely on the
new `beframe-transient`. It is the same principle as the prefix key
map:

```elisp
(define-key global-map (kbd "C-c b") #'beframe-transient)
```

[ The difference between the two interfaces is small when using the
  `which-key` package. ]


### The buffer prompt clarifies that it is "Beframed"

While using the `beframe-mode`, the standard `read-buffer-function` is
set to a Beframe function that prompts for a buffer. The idea is to
filter the list of buffers to only show those that are specific to the
current/given frame. To make this more clear, the text of the prompt
now has `[Beframed]` prepended to it.

I do not think we need a user option for this, though I am happy to
reconsider if there is a good reason for it.


### Miscellaneous

-   Fixed the function aliases of the "assume" and "unassume" commands
    that take a regular expression as input to perform their operation.
    The old aliases where written in the wrong way, such that they were
    rendering the original function void.

-   Bound a few more commands to the `beframe-prefix-map`. Everything
    should now be there, to improve discoverability (remember that `C-h`
    after an incomplete key sequence will produce a Help buffer that
    lists all the keys+commands which extend the given key sequence).

-   The name of the `beframe-buffer-menu` buffer is more descriptive.
    The command `beframe-buffer-menu` puts the beframed list of buffers
    in a buffer. Its old naming scheme was `*Buffer list for NAME*`,
    where `NAME` is the name of the frame. Whereas now it is `*Buffer
      list for ‘NAME’ frame*`.

-   Same as above for the frame-specific scratch buffers. Those are
    generated for new frames when `beframe-create-frame-scratch-buffer`
    is non-nil (the default) and `beframe-mode` is enabled.
