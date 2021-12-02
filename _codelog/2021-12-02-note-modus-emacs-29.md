---
title: 'Note for modus-themes users on Emacs 29'
excerpt: 'How to configure new faces while waiting for a new version of the modus-themes.'
---

As you may know, I only sync the `modus-themes` with core Emacs whenever
a new tagged version is available.  So the last such update I made to
emacs.git was in commit `ce33ad8bae` on 2021-11-18 when I published
version 1.7.0 (see [release
notes](https://protesilaos.com/codelog/2021-11-18-modus-themes-1-7-0/)).
The next version will come in a few weeks.  In the meantime, users may
have to apply some changes to their Emacs init file to cope with the
occasional introduction of a new face.

One such example is the new `mode-line-active` face, which makes use of
proportionately spaced fonts (it inherits the `variable-pitch` face).
We already support that face in modus-themes.git but until the new
version is available users must introduce their own tweaks.

A basic setup for those who only use either `modus-operandi` or
`modus-vivendi`:

```elisp
(set-face-attribute 'mode-line-active nil :inherit 'mode-line)
```

And this for those who switch between the two themes (e.g. with `M-x
modus-themes-toggle`):

```elisp
(defun my-modus-themes-custom-faces ()
  (set-face-attribute 'mode-line-active nil :inherit 'mode-line))

;; This is so that the changes persist when switching between the themes
(add-hook 'modus-themes-after-load-theme-hook #'my-modus-themes-custom-faces)
```

If you prefer to use the syntax from the themes' source code or if you
intend to define multiple faces that use colours from the active theme's
palette, implement the following:

```elisp
(defun my-modus-themes-custom-faces ()
  (modus-themes-with-colors
    (custom-set-faces
     `(mode-line-active ((,class :inherit mode-line))))))

;; This is so that the changes persist when switching between the themes
(add-hook 'modus-themes-after-load-theme-hook #'my-modus-themes-custom-faces)
```

[The manual](https://protesilaos.com/emacs/modus-themes), which you can
also access from Emacs (evaluate `(info "(modus-themes) Top")`) provides
more advanced examples for all sorts of do-it-yourself scenaria.

Finally, note that the themes have long supported `variable-pitch` in
the user interface as an option, though the default is the monospaced
font (or, if you want to be technical, the `:font-family` of the
`default` face).  Just set the variable `modus-themes-variable-pitch-ui`
to non-nil and, as always, reload the theme for changes to take effect.
