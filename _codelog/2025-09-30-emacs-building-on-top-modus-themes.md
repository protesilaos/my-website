---
title: "Emacs: building on top of the Modus themes"
excerpt: "A big picture view of how the Modus themes can be used by other theme packages."
---

I have been doing a lot of work these days on my themes. The immediate
goal is two-fold: (i) make the `modus-themes` more flexible so they
can be used as a the basis for other theme packages and (ii) make the
`ef-themes` the first project to benefit from this development. Having
the Modus themes as a foundation gives us all of their customisability
and extensive face coverage for little extra work. The themes are well
tested and are also shipped with core Emacs. It all fits together.

In this article, I give you the big picture view of how this is
supposed to work. Remember that the only source of truth for my
packages is their corresponding manual. Any blog post is useful the
time it is written but will eventually go out of date.

## Symbol properties for themes

When we define a theme, we essentially add properties to a symbol. In
its simplest form, this is how:

```elisp
(put 'my-test-symbol 'my-test-proerty "Hello world test value")
```

Evaluate the above and then try the following:

```elisp
(get 'my-test-symbol 'my-test-proerty)
;; => "Hello world test value"
```

The function `custom-declare-theme` does the heavy lifting, while the
`deftheme` macro streamlines most of that work. Still, the point is
that we have symbols whose properties we can access and, thus, we can
filter by any given property. To make things even better, we can add
arbitrary properties to a theme. Here is a real scenario of
**_in-development code that might change**:

```elisp
(get 'modus-operandi 'theme-properties)
;; => (:kind color-scheme :background-mode light :family modus-themes :modus-core-palette modus-themes-operandi-palette :modus-user-palette modus-operandi-palette-user :modus-overrides-palette modus-operandi-palette-overrides)
```

The `theme-properties` has as a plist value. Its Modus-specific
properties are references to variables that we can use to do our work,
such as to put together a theme palette that combines the relevant
overrides with the core entries.

## Getting a list of themes based on their properties

When we declare a theme with `custom-declare-theme`, we make it known
to Emacs by adding it to the `custom-known-themes`. When we eventually
load a theme, its symbol gets stored in the `custom-enabled-themes`.
Knowing that themes have properties, we can filter those lists
accordingly. With my current development code, I can do this, for
example:

```elisp
(defun my-demo-is-modus-p (theme)
  "Return non-nil if THEME has `modus-themes' :family property."
  (when-let* ((properties (get theme 'theme-properties))
              (family (plist-get properties :family)))
    (eq family 'modus-themes)))

(seq-filter #'my-demo-is-modus-p custom-known-themes)
;; => (modus-vivendi-tritanopia modus-vivendi-tinted modus-vivendi modus-vivendi-deuteranopia modus-operandi-tritanopia modus-operandi-tinted modus-operandi modus-operandi-deuteranopia)
```

The next step from here is to make all the Modus infrastructure rely
on generic functions and methods for working with themes. Then any
package can provides its own method for returning a list of desired
themes.

## Generic function and methods for getting a list of themes

Emacs Lisp has a concept of generic functions, which it borrows from
Common Lisp. The general idea is to have a single symbol, like
`modus-themes-get-themes` whose implementation details are
instantiated via specialised methods. For example, when a minor mode
is active, a given method takes effect, thus changing what
`modus-themes-get-themes` actually does.

The default implementation is this:

```elisp
(cl-defgeneric modus-themes-get-themes ()
  "Return a list of all themes with `modus-themes' :family property."
  (modus-themes-get-all-known-themes 'modus-themes))
```

The function `modus-themes-get-all-known-themes` has a filter like the
one I demonstrated in the code block further above. By default, this
is what I get when I run the aforementioned generic function:

```elisp
(modus-themes-get-themes)
;; => (modus-operandi modus-operandi-tinted modus-operandi-deuteranopia modus-operandi-tritanopia modus-vivendi modus-vivendi-tinted modus-vivendi-deuteranopia modus-vivendi-tritanopia)
```

The beauty of this design is that another package can define a method
to make the same code return something else. This is how I do it in
the current development target of the `ef-themes` (again, the actual
code might change):

```elisp
(cl-defmethod modus-themes-get-themes (&context (ef-themes-take-over-modus-themes-mode (eql t)))
  (modus-themes-get-all-known-themes 'ef-themes))
```

Notice that this method has a `&context`, which is the scenario in
which it is relevant. In this case, we have a minor mode that
activates the method when it is enabled:

```elisp
(define-minor-mode ef-themes-take-over-modus-themes-mode
  "When enabled, all Modus themes commands consider only Ef themes."
  :global t
  :init-value nil)
```

This minor mode does not have anything in its body. It does not need
to, because the `define-minor-mode` macro already instantiates the
parts we care about. Namely, when we call the function defined by the
minor mode (i.e. `ef-themes-take-over-modus-themes-mode`), it toggles
the value of the variable `ef-themes-take-over-modus-themes-mode`
(functions and variables have separate namespaces in Emacs Lisp and
thus the same symbol can be in both places). Our method then becomes
relevant when the user enables the minor mode:

```elisp
(ef-themes-take-over-modus-themes-mode 1)
```

And now the generic function `modus-themes-get-themes` does something
else:

```elisp
(modus-themes-get-themes)
;; => (ef-winter ef-tritanopia-light ef-tritanopia-dark ef-trio-light ef-trio-dark ef-symbiosis ef-summer ef-spring ef-rosa ef-reverie ef-owl ef-night ef-melissa-light ef-melissa-dark ef-maris-light ef-maris-dark ef-light ef-kassio ef-frost ef-elea-light ef-elea-dark ef-eagle ef-duo-light ef-duo-dark ef-dream ef-deuteranopia-light ef-deuteranopia-dark ef-day ef-dark ef-cyprus ef-cherie ef-bio ef-autumn ef-arbutus)
```

Since all the Modus functions are redesigned to work with this generic
function, we can now use commands like `modus-themes-select` or even
`modus-themes-list-colors` for any of those themes.

As a bonus, we can now seamlessly blend Modus themes with their
derivatives. Imagine a user who wants to invoke the command
`modus-themes-load-random` (or its variants for light and dark themes)
and have it consider the likes of `modus-operandi` and `ef-dream`.
Users can opt in to this feature via the minor mode that the Modus
themes provide called `modus-themes-include-derivatives-mode`. It is
the same ideas as the minor mode for the Ef themes, mentioned above:

```elisp
(define-minor-mode modus-themes-include-derivatives-mode
  "When enabled, all Modus themes commands cover derivatives as well.
Otherwise, they only consider the `modus-themes-items'.

Derivative theme projects can implement the equivalent of this minor
mode plus a method for `modus-themes-get-themes' to filter themes
accordingly."
  :global t
  :init-value nil)

(cl-defmethod modus-themes-get-themes (&context (modus-themes-include-derivatives-mode (eql t)))
  (modus-themes-get-all-known-themes nil))
```

This is what happens when I load both the `modus-themes` and the
`ef-themes` and enable this "all good ones fit" minor mode:

```elisp
(modus-themes-include-derivatives-mode 1)

(modus-themes-get-themes)
;; => (modus-operandi modus-operandi-tinted modus-operandi-deuteranopia modus-operandi-tritanopia modus-vivendi modus-vivendi-tinted modus-vivendi-deuteranopia modus-vivendi-tritanopia ef-winter ef-tritanopia-light ef-tritanopia-dark ef-trio-light ef-trio-dark ef-symbiosis ef-summer ef-spring ef-rosa ef-reverie ef-owl ef-night ef-melissa-light ef-melissa-dark ef-maris-light ef-maris-dark ef-light ef-kassio ef-frost ef-elea-light ef-elea-dark ef-eagle ef-duo-light ef-duo-dark ef-dream ef-deuteranopia-light ef-deuteranopia-dark ef-day ef-dark ef-cyprus ef-cherie ef-bio ef-autumn ef-arbutus)
```

And when I no longer want to include everything, I just disable the
minor mode:

```elisp
(modus-themes-include-derivatives-mode -1)

(modus-themes-get-themes)
;; => (modus-operandi modus-operandi-tinted modus-operandi-deuteranopia modus-operandi-tritanopia modus-vivendi modus-vivendi-tinted modus-vivendi-deuteranopia modus-vivendi-tritanopia)
```

It is a thing of beauty!

## Finalising the implementation details

I am still experimenting with some of the technicalities involved. In
principle, derivative themes will (i) depend on the `modus-themes`,
(ii) define each of their themes using the `modus-themes-theme` macro,
and (iii) specify how/when they affect the behaviour of the generic
function `modus-themes-get-themes`.

The code I am working on will soon be available in the respective
`main` branch of `modus-themes.git` and `ef-themes.git`. I think this
gives us the tools to realise the full potential of the Modus themes.

Finally, it is not just package authors that can benefit from this
development. Users may also curate their themes with something as
basic as this:

```elisp
(cl-defmethod modus-themes-get-themes ()
  '(modus-operandi ef-eagle modus-vivendi-tinted ef-melissa-dark))

(modus-themes-get-themes)
;; => (modus-operandi ef-eagle modus-vivendi-tinted ef-melissa-dark)
```

In this method, there is no function involved for returning a list of
themes nor an opt-in clause. It simply hardcodes a list of themes. The
point is that it works! The approach with the minor mode will usually
be better and is easy enough. It is all a matter of empowering
personal preference, which is the Emacs-y outlook, after all. I expect
users to define their own collections, as they see fit.

Have fun!

## About the Modus themes

Highly accessible themes, conforming with the highest standard for
colour contrast between background and foreground values (WCAG AAA).
They also are optimised for users with red-green or blue-yellow colour
deficiency.

The themes are very customisable and provide support for a wide range
of packages.  Their manual is detailed so that new users can get
started, while it also provides custom code for all sorts of more
advanced customisations.

Since August 2020, the original Modus themes (`modus-operandi`,
`modus-vivendi`) are built into Emacs version 28 or higher. Emacs 28
ships with `modus-themes` version `1.6.0`. Emacs 29 includes version
`3.0.0`. Emacs 30 provides version `4.4.0`. Version 4 is a major
refactoring of how the themes are implemented and customised. Such
major versions are not backward-compatible due to the limited
resources at my disposal to support multiple versions of Emacs and of
the themes across the years.

+ Package name (GNU ELPA): `modus-themes`
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/modus-themes>
  + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes.

## About the Ef themes

The `ef-themes` are a collection of light and dark themes for GNU
Emacs that provide colourful ("pretty") yet legible options for users
who want something with a bit more flair than the `modus-themes` (also
designed by me).

+ Package name (GNU ELPA): `ef-themes`
+ Official manual: <https://protesilaos.com/emacs/ef-themes>
+ Change log: <https://protesilaos.com/emacs/ef-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/ef-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/ef-themes>
  + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Backronym: Eclectic Fashion in Themes Hides Exaggerated Markings,
  Embellishments, and Sparkles.
