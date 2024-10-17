---
title: "Emacs: remap font size in the minibuffer"
excerpt: "How to change the font height of the minibuffer in Emacs and even modify its colours."
---

Over at the `fontaine` repository, [I was asked by
akartha](https://github.com/protesilaos/fontaine/issues/9) if we could
have a font preset for the minibuffer that is smaller than the others.
The minibuffer does not have its own face, so we cannot affect it with
Fontaine. We can, however, use the face remapping mechanism to change
the attributes of the `default` face locally in the minibuffer. Here
is the code for it.

```elisp
(defvar-local my-minibuffer-font-remap-cookie nil
  "The current face remap of `my-minibuffer-set-font'.")

(defface my-minibuffer-default
  '((t :height 0.8))
  "Face for the minibuffer and the Completions.")

(defun my-minibuffer-set-font ()
  (setq-local my-minibuffer-font-remap-cookie
              (face-remap-add-relative 'default 'my-minibuffer-default)))

(add-hook 'minibuffer-mode-hook #'my-minibuffer-set-font)
```

[ Yes, I know `setq-local` is redundant for a `defvar-local`, but I
  prefer to be explicit. ]

In this example, the `my-minibuffer-default` is set to a height that
is 0.8 times the height of the `default` face. As such, if we increase
the height of the latter, the former will adapt gracefully. Only the
`default` needs an absolute `:height` value.

If you are using the generic completion user interface with the
`*Completions*` buffer, then you also need this:

```elisp
(add-hook 'completion-list-mode-hook #'my-minibuffer-set-font)
```

Of course, we are not limited to changing the font height. Here is how
we can apply some different colours:

```elisp
(defface my-minibuffer-default
  '((((class color) (min-colors 88) (background dark))
     :background "#181032" :foreground "#a0d0ff")
    (((class color) (min-colors 88) (background light))
     :background "#f2ede0" :foreground "#6f2000")
    ((t :height 0.8)))
  "Face for the minibuffer and the Completions.")
```

If you are using any of my `modus-themes`, `ef-themes`, or
`standard-themes`, then you can also benefit from the macro that
exposes the palette of the effective theme. With Modus as an example:

```elisp
(defun my-modus-themes-custom-faces (&rest _)
  (modus-themes-with-colors
    (custom-set-faces
     `(my-minibuffer-default ((t :background ,bg-magenta-nuanced :foreground ,magenta-cooler))))))

(add-hook 'enable-theme-functions #'my-modus-themes-custom-faces)
```

[ The palette can be previewed with `M-x modus-themes-preview-colors`.
  Check the manual of each of my packages for further details. ]

I can probably patch `minibuffer.el` to set its own face, but I have
not had the chance to look into the details. This "just works", anyway.
Enjoy!
