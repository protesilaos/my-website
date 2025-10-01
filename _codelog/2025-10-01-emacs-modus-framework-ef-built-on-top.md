---
title: "Emacs: 'modus-themes' as a basis for other themes; 'ef-themes' is first"
excerpt: "Update on changes I making to allow the modus-themes to be used as a basis for other other projects. My ef-themes is the first of that kind."
---

[ This is a development note. Things might change before the release
  of `modus-themes` version `5.0.0` and `ef-themes` version `2.0.0`. ]

In previous entries, I outlined how my `ef-themes` will be built on
top of my `modus-themes` and then how the `modus-themes` are partly
redesigned to enable such an arrangement:

- [Emacs: the next 'ef-themes' will build on top of the 'modus-themes'](https://protesilaos.com/codelog/2025-09-27-emacs-next-ef-themes-built-on-modus/) (offers just the big picture view)
- [Emacs: building on top of the Modus themes](https://protesilaos.com/codelog/2025-09-30-emacs-building-on-top-modus-themes/) (describes some technicalities)

I have now finalised the details and merged the changes in the
respective `main` branch of each Git repository. If you are building
the packages from their latest commit, you might need to delete and
then re-install the package. Otherwise, I expect things to work as
expected. The `modus-themes`, in particular, should have no obvious
change to its users.

The `ef-themes` have undergone substantial changes. All of their user
options are deprecated and will no longer have any effect. User
options from the Modus themes now take their place. Furthermore, all
the Ef commands to load a theme are discontinued. The plan is to
re-use the infrastructure of the Modus themes throughout. Concretely,
users must change their configuration to at least this minimal setup:

```elisp
(use-package ef-themes
  :init
  ;; This is essential to let the Ef themes take over the Modus themes commands.
  (ef-themes-take-over-modus-themes-mode 1))
```

Or this sort, if they want some key bindings and customisations:

```elisp
(use-package ef-themes
  :init
  (ef-themes-take-over-modus-themes-mode 1)
  :bind
  (("<f5>" . modus-themes-rotate)
   ("C-<f5>" . modus-themes-select)
   ("M-<f5>" . modus-themes-load-random))
  :config
  ;; All customisations here.
  (setq modus-themes-mixed-fonts t))
```

## Load a theme

The commands `modus-themes-rotate`, `modus-themes-select`,
`modus-themes-toggle`, and `modus-themes-load-random` will also load a
theme interactively.

Loading a specific theme from Lisp works as expected:

```elisp
(load-theme 'ef-cyprus :no-confirm)
```

To do the same while also triggering the
`modus-themes-after-load-theme-hook` as well as the
`modus-themes-disable-other-themes`:

```elisp
(modus-themes-load-theme 'ef-summer)
```

To load a theme at random, do this:

```elisp
(modus-themes-load-random)
(modus-themes-load-random 'dark) ; dark only (alternative `modus-themes-load-dark')
(modus-themes-load-random 'light) ; light only (alternative `modus-themes-load-light')
```

## Use both Ef and Modus themes

To not take over the Modus themes completely and to instead allow the
Modus commands to act on both Modus and Ef themes, enable this minor
mode instead:

```elisp
(modus-themes-include-derivatives-mode 1)
```

And **make sure you disable** `ef-themes-take-over-modus-themes-mode`
in this case.

## More customisation for the Ef themes

All the user options of the Modus themes are now available. For
example, there was no option in the past to disable bold and italic
styles from the Ef themes. They are now disabled by default, unless
the user sets `modus-themes-bold-constructs` and `modus-themes-italic-constructs`
to non-nil values.

Additionally, the Ef themes now enjoy wider face/package support.

## Everything else should be as expected

Advanced users who were relying on the `ef-themes-with-colors` or any
other Ef functionality will have to do the same with the Modus
framework. Everything is possible, plus I am happy to help with the
transition if you have any questions.

The Modus themes benefit from this redesign because their code is made
to be more generic and to not hardcode certain assumptions. It also
makes sense for them to be useful as a dependency for other themes, as
they are part of core Emacs, which is convenient.

Remember that everything is still in development. I will expand the
manuals and make sure everything is in order for the next major
version of each of these two projects.

If everything goes well, expect my `standard-themes` to be redone on
top of the `modus-themes`. But not for the `doric-themes`: those are
quite different in style and overall design.
