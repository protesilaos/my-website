---
title: "Emacs: confirm package bugs with --init-directory"
excerpt: "Information on how to use the Emacs --init-directory flag to identify bugs with packages you rely on."
---

Much of the maintenance work I do for my packages involves
correspondence with users about potential bugs. Sometimes, a user will
encounter a problem that I cannot reproduce on my end. I thus try to
recreate the bug in a pristine environment and ask my correspondent to
do the same.

This has become easier since Emacs 29, which introduced a command-line
flag called `--init-directory`. It is responsible for loading the
`init.el` that is present in the given directory. For example:

```sh
# From a terminal or shell, run something like this:
emacs --init-directory=/tmp/test-emacs/
```

In other words, you can keep your regular configuration intact while
launching Emacs with another set of options.

## Create the test init.el file

Have a directory that is unrelated to your regular Emacs
configuration. Then write the `init.el` inside of it.

Because I do this frequently, I prefer to use the standard Linux path
`/tmp/`. Its files get deleted as soon as I switch off the computer,
which is exactly what I want in this case.

As such, if there is a bug with, say, the `modus-themes`, I will work
with this file path `/tmp/modus-themes/init.el`.

But the exact location of the directory does not matter, so choose
what makes sense to you.

## Write the minimum necessary code

In that init file, include only the code that is needed to reproduce
the bug.

Since you want to have the package installed, it makes sense to write
a `use-package` declaration for it. Include the `:ensure t` directive
as it instructs the built-in package manager to install the package if
it is not already available.

```elisp
;; Contents of the init.el...
(use-package modus-themes
  :ensure t
  :config
  (setq modus-themes-common-palette-overrides
        '((fringe unspecified)
          (border-mode-line-active unspecified)
          (border-mode-line-inactive unspecified)))
  (setq modus-vivendi-palette-overrides
        '((bg-main "#1e1f22")
          (fg-main "#bcbec4")))
  (load-theme 'modus-vivendi t))
```

## Install from source, if necessary

If you are using an alternative to `package.el` like `straight` or
`elpaca`, then the aforementioned `:ensure t` will likely not suffice:
you need to build the package from source. To this end, Emacs has the
function `package-vc-install`. Some of my recent packages have sample
code that relies on this approach. For instance:

```elisp
(use-package gnome-accent-theme-switcher
  :demand t
  :init
  ;; Then upgrade it with the command `package-vc-upgrade' or `package-vc-upgrade-all'.
  (unless (package-installed-p 'gnome-accent-theme-switcher)
    (package-vc-install "https://github.com/protesilaos/gnome-accent-theme-switcher.git"))
  :bind
  (("<f5>" . gnome-accent-theme-switcher-toggle-mode)
   ("C-<f5>" . gnome-accent-theme-switcher-change-accent))
  :config
  (gnome-accent-theme-switcher-mode 1))
```

In the above snippet `package-vc-install` will pull the latest commit
from the main branch, though it can even get a specific commit. Read
its documentation with `M-x describe-function`.

What matters is that you fetch the version which you are running in
your personaly configuration.

## Launch Emacs with this configuration

From the command-line, run something like the following:

```sh
emacs --init-directory=/tmp/test-emacs/
```

This will launch a new instance of Emacs. The `use-package` you placed
there will do the work to install the package. After that you are
ready to reproduce the bug in this clean setup.

## Write down all the steps

To help the maintainer identify the source of the trouble, keep a
record of all the steps you followed. Some bugs show up when the
package is loaded, but others are triggered only after a specific
action is performed.

Normally, Emacs will pop up a `*Backtrace*` buffer when it encounters
an error. Copy its contents and send them to the maintainer, together
with the `init.el` you used, and the list of the steps you followed.

## Sometimes you just need to re-install the package

It sometimes happens that you install a package and it is completely
broken. Although this looks bad, it may not even be a bug, but an
issue with the old bytecode you had on your system from the previous
version of the package.

Do `M-x package-delete`, select the package, restart Emacs, and then
`M-x package-install` to install the package anew. If everything
works, then the problem is gone and you do not need to tell the
maintainer about it.

## Make it easier for maintainers to help you

With this knowledge, you can provide high quality bug reports for the
packages you rely on. Good luck!
