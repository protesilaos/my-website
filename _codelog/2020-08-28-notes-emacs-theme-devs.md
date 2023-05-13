---
title: 'Notes for aspiring Emacs theme developers'
excerpt: 'Comprehensive guide to Emacs themes. It helps you start developing your own theme.'
---

In Emacs a "theme" is a set of configurations that can be enabled or
disabled as a block.  Each of those controls a construct of the
rendering engine known as a "face".  Faces store the properties that are
associated with each element on display.  These properties encompass
background and/or foreground colours as well as typographic attributes,
such as the font weight or slant.

## Finding faces

Themes are programs written in Emacs Lisp (Elisp), whose intended role
is to control faces.  We can learn about all the faces that are loaded
in the current session with `M-x list-faces-display`.  The command will
produce a buffer with the _symbol_ (i.e. unique name) of the face and a
preview of how it looks.

You can always consult the help page of a given symbol with `C-h o`
(`M-x describe-symbol`).  Place the point over a face's symbol, type
`C-h o` to have the thing at point as the default option.  Select that
(such as with `M-n`) to get a description of what it is supposed to do.

If we do this over the `cursor` face, we get the following:

>Basic face for the cursor color under X.  Currently, only the
>‘:background’ attribute is meaningful; all other attributes are
>ignored.  The cursor foreground color is taken from the background
>color of the underlying text.
>
>Note: Other faces cannot inherit from the cursor face.

As with all `*Help*` buffers, the ones for individual faces contain a
link to the library that defines them.  We are informed, for instance,
that the `cursor` is defined in `faces.el`.  So we can always visit the
source code from there whenever we need to understand more about the
item of our inquiry.

Note that `list-faces-display` will only cover the libraries that are
currently loaded, but not necessarily the faces that your active theme
defines.  If you have installed some package that you have not used yet,
then any faces it may be defining will not be immediately available in
the `*Faces*` buffer.  To actually include those in the list, you need
to either use their package or explicitly load the relevant file with
`M-x load-library`.  You can always regenerate the `*Faces*` buffer by
typing `g` while inside of it.

## Configuring an individual face

Before we proceed to write a fully fledged theme, let us first examine
how to control faces one by one.  The function dedicated to that task is
`set-face-attribute`.  Read its documentation string with `C-h f`
followed by its symbol.  **This is important** because it provides
valuable information about the properties that a face may be associated
with.  You will need it when configuring your own theme.

_Assuming you read the documentation_ of `set-face-attribute`, let us
consider this example:

```elisp
(set-face-attribute 'cursor nil :background "red")
```

We have learnt that the `cursor` only recognises a `:background`
property and will ignore any other.  What we do here is instruct it to
use the generic red colour.

To confirm that this works, place the point to the right of the closing
parenthesis and type `C-x C-e` (which calls `eval-last-sexp`).  Your
cursor show now be coloured red.  If you were to put this in your
initialisation file, or any other library that gets loaded when you open
Emacs, your cursor would always get the colour you specified (unless
something else overrides it later on, but you get the point).

A good use-case for this is to define your font families for the three
main constructs of `default`, `variable-pitch`, and `fixed-pitch`.

This is the gist of what is included in the manual of the Modus themes
on the topic of [font configurations for Org (and
others)](https://protesilaos.com/emacs/modus-themes/#h:defcf4fc-8fa8-4c29-b12e-7119582cc929)

```elisp
;; my custom build of Iosevka
;; https://gitlab.com/protesilaos/iosevka-comfy
(set-face-attribute 'default nil :font "Iosevka Comfy-15")

(set-face-attribute 'variable-pitch nil :family "Source Sans Pro" :height 1.0)

(set-face-attribute 'fixed-pitch nil :family "Iosevka Comfy" :height 1.0)
```

Depending on what you want to do, you can use Elisp to further control
things.  Here we can be a bit more succinct by using `dolist` (remember
that `C-h f`, `C-h v`, or just `C-h o` are among your most valuable
tools in your Emacs journey).

```elisp
(dolist (face '(default fixed-pitch))
  (set-face-attribute face nil :family "Iosevka Comfy"))
```

## Using colours

We can find the names of all generic colours with `list-colors-display`.
Notice how earlier we specified the `:background` of the `cursor` face
to a `"red"` value.  Alternatively, one could use a hexadecimal RGB
code, such as `"#ff0000"` for pure red.  I prefer the latter because it
is more precise and flexible.

How you specify colours is ultimately up to you.  Picking the right
values is not an easy task.  It is a field of endeavour that stands at
the intersection or art and science, as I explained in my essay about
the [design of the Modus themes](https://protesilaos.com/codelog/2020-03-17-design-modus-themes-emacs/).

## Deconstructing an Emacs face

While `set-face-attribute` is perfectly fine for a few items, it becomes
inefficient at scale.  This is why Emacs provides the
`custom-theme-set-faces` function.  Before we start using that, _we must
first understand what the specifications of a face are_.

Consider this excerpt from `M-x find-library RET faces` (here "RET"
means to type the command, then confirm your choice with the
Return/Enter key, and follow it up with the "faces" library).

```elisp
(defface tab-bar
  '((((class color) (min-colors 88))
     :inherit variable-pitch
     :background "grey85"
     :foreground "black")
    (((class mono))
     :background "grey")
    (t
     :inverse-video t))
  "Tab bar face."
  :version "27.1"
  :group 'basic-faces)
```

We can read all about these specs with `C-h o defface`.  Again, read the
docs to save yourself from trouble and frustration.  While you start
making a habit of that, let me simplify this `defface` for you (extra
space for didactic purposes):

```elisp
(defface tab-bar
  '(

    (
     ((class color) (min-colors 88))
     :inherit variable-pitch
     :background "grey85"
     :foreground "black")

    (
     ((class mono))
     :background "grey")

    (t
     :inverse-video t)
     
     )
     
  "Tab bar face.")
```

Here we have the general structure of an expression that evaluates
multiple conditions.  It looks like `cond`:

```elisp
(cond
 ((FIRST TEST)
  FIRST RESULT)
 ((SECOND TEST)
  SECOND RESULT)
 (t                                     ; if none of the above
  FALLBACK RESULT))
```

With these in mind, we can read each test more easily.  Focus on this:

```elisp
(
 ((class color) (min-colors 88))
 :inherit variable-pitch
 :background "grey85"
 :foreground "black")
```

It checks whether the display terminal can support a minimum of 88
colours.  If you are using Emacs with a graphical toolkit, this is most
likely the case.  If the condition is satisfied, this face will use
`grey85` for its background and `black` for its foreground.  Whereas in
more limited display terminals, it uses something simpler:

```elisp
(
 ((class mono))
 :background "grey")
```

Same principle for the fallback condition, which merely inverts the
colours with the assumption that those are some variant of black and
white for the foreground/background:

```elisp
(t
 :inverse-video t)
```

While you could define all your faces to adapt to every possible display
terminal out there, I find that what one typically needs is to optimise
for `((class color) (min-colors 89))`.

With these in mind, we can start writing our first theme.

## Skeleton of a custom theme

As noted in the previous section, Emacs offers `custom-theme-set-faces`
for the express purpose of streamlining the process of controlling faces
in bulk.  As always, read the documentation of that function to learn
more about the finer points.

Here we will be working with a minimal, yet perfectly usable base.
Every theme must be placed in a file whose name follows the pattern of
`SYMBOL-theme.el`.  We declare the symbol of our theme with the
following:

```elisp
(deftheme prot-base
  "The basis for a custom theme.")
```

The above means that the file name must be `prot-base-theme.el` (we have
some more code at the end of the file, but we take things one step at a
time).

Now we want to configure a set of faces that are optimised for the
display spec of `((class color) (min-colors 89))`.  Instead of writing
this expression each time, we will dynamically bind it to a variable,
using `let`.

```elisp
(let ((class '((class color) (min-colors 89)))
      ...other variables)
    ...body)
```

Since we are defining local variables, it is a good idea to also write
our colours here, so that we economise on typing, but also to avoid
discrepencies.  Each colour is defined as `(name value)`.

```elisp
(let ((class '((class color) (min-colors 89)))
      (main-bg "#ffffff") (main-fg "#000000")
      (red "#a00000") (green "#005000") (blue "#000077"))
    ...body)
```

Everything is in place to start defining face attributes.  The body of
our dynamically bound variables contains `custom-theme-set-faces`,
followed by the name of the `deftheme` we declared and then each face's
symbol, display spec and attributes:

```elisp
(deftheme prot-base
  "The basis for a custom theme.")

(let ((class '((class color) (min-colors 89)))
      (main-bg "#ffffff") (main-fg "#000000")
      (red "#a00000") (green "#005000") (blue "#000077"))
  (custom-theme-set-faces
   'prot-base
   `(default ((,class :background ,main-bg :foreground ,main-fg)))
   `(cursor ((,class :background ,red)))
   `(font-lock-builtin-face ((,class :foreground ,blue)))
   `(font-lock-string-face ((,class :foreground ,green)))))

(provide-theme 'prot-base)

(provide 'prot-base-theme)
```

This is a valid theme.  To actually use it, you must write it to a file,
which in this case is `prot-base-theme.el`.  This file must be in a
directory read by Emacs.  Say you put it in `~/.emacs.d/themes/`.  To
inform Emacs about it, evaluate this:

```elisp
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
```

With the theme written at `~/.emacs.d/themes/prot-base-theme.el`, you
can now `M-x load-theme RET prot-base`.  And there you have it!

Note though that you may also need to `M-x disable-theme` and specify
the one currently in use to make sure you do not get mixed results
(unless you want to overlay one theme on top of another, but I will let
you run such experiments).

Remember to rely on `list-faces-display` to find all the symbols you
wish to cover.  Furthermore, you can always identify the properties of
the character at point with `M-x describe-char` (or type it directly
with `C-u C-x =`).  If it uses a face, you will see it mentioned in the
resulting `*Help*` buffer.

To understand the syntax for backquotes and commas, type `M-:` and then
insert `(info "(elisp) Backquote")`.  This will take you to the relevant
node in the Emacs Lisp Reference Manual.

## More tools for theme developers

These are excerpts from my dotemacs.  They are meant to further assist
you in the task of developing a custom theme.  Check the doc string of
each variable and adapt things to your liking.

### Rainbow mode for colour previews

While experience may help estimate with decent accuracy a hexadecimal
RGB colour, it is always better to have a live preview available.  Once
the following package is loaded, you can get it with `M-x rainbow-mode`.

```elisp
(use-package rainbow-mode
  :ensure
  :diminish
  :commands rainbow-mode
  :config
  (setq rainbow-ansi-colors nil)
  (setq rainbow-x-colors nil))
``` 

### Use a linter front-end to improve your code

You can either rely on the built-in `flymake` or the third party
`flycheck`.  Both work great with Elisp files.  You activate them with
`flymake-mode` or `flycheck-mode` respectively.

```elisp
(use-package flymake
  :commands flymake-mode
  :config
  (setq flymake-fringe-indicator-position 'left-fringe)
  (setq flymake-suppress-zero-counters t)
  (setq flymake-start-on-flymake-mode t)
  (setq flymake-no-changes-timeout nil)
  (setq flymake-start-on-save-buffer t)
  (setq flymake-proc-compilation-prevents-syntax-check t)
  (setq flymake-wrap-around nil))

(use-package flycheck
  :ensure
  :commands flycheck-mode
  :config
  (setq flycheck-check-syntax-automatically
        '(save mode-enabled))
  :hook (flycheck-error-list-mode-hook . visual-line-mode))
```

If you go with Flycheck, you may also want a modeline indicator, unless
you use a custom modeline that already defines one:

```elisp
(use-package flycheck-indicator
  :ensure
  :after flycheck
  :config
  (setq flycheck-indicator-icon-error (string-to-char "!"))
  (setq flycheck-indicator-icon-info (string-to-char "·"))
  (setq flycheck-indicator-icon-warning (string-to-char "*"))
  (setq flycheck-indicator-status-icons
        '((not-checked "%")
          (no-checker "-")
          (running "&")
          (errored "!")
          (finished "=")
          (interrupted "#")
          (suspicious "?")))
  :hook (flycheck-mode-hook . flycheck-indicator-mode))
```

And here is how to ensure that you are following best practices for
packaging Elisp libraries (you only need one of the two, depending on
the front-end you choose):

```elisp
(use-package flycheck-package
  :ensure
  :after flycheck
  :config
  (flycheck-package-setup))

(use-package package-lint-flymake
  :ensure
  :after flymake
  :config
  (package-lint-flymake-setup))
```

## Remember that Emacs themes are Elisp programs

It should be clear by now that a theme can rely on advanced programming
techniques to do its work.  Here we used `let`.  While you can always go
with something simple, you retain the option to define more elaborate
criteria that, say, come into effect once a certain variable is enabled.

My Modus themes, which were [recently added to upstream
Emacs](https://protesilaos.com/codelog/2020-08-27-emacs-modus-themes-core/),
contain lots of Elisp logic, making them highly customisable.  Study
their [source code](https://gitlab.com/protesilaos/modus-themes) if you
want.  It can help you learn more about defining and then evaluating
customisation options.

Use the information in this document to write your own theme or to just
gain insight into how the theme of your choice is designed.

Good luck!
