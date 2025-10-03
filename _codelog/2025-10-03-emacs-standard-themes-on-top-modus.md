---
title: "Emacs: the 'standard-themes' are also built on top of the 'modus-themes'"
excerpt: "My 'standard-themes' for Emacs are refactored to work on top of my 'modus-themes', thus inheriting their extensive face coverage and customisability."
---

In previous entries I explained how I have reworked the `modus-themes`
to optionally work as the basis for other theme packages. The official
documentation is in the manual of the Modus themes (my manuals are the
only source of truth; blog posts---including this one---become outdated):
<https://protesilaos.com/emacs/modus-themes#h:86eb375b-9be4-43ce-879a-0686a524a63b>.

I already mentioned how version `2.0.0` of the `ef-themes` will be
done this way. I am happy to announce that as of this morning the same
is true for my `standard-themes`. Specifically, version `3.0.0` of the
Standard themes will be built on top of the `modus-themes`.

Users are now expected to customise the themes via the user options
provided by Modus and to load the themes with the relevant Modus
commands. Here is a sample configuration:

```elisp
(use-package standard-themes
  :ensure t
  :init
  ;; This makes the Modus commands listed below consider only the
  ;; Standard themes.  For an alternative that includes Modus and all
  ;; derivative themes (like Standard), enable the
  ;; `modus-themes-include-derivatives-mode' instead.
  (standard-themes-take-over-modus-themes-mode 1)
  :bind
  (("<f5>" . modus-themes-rotate)
   ("C-<f5>" . modus-themes-select)
   ("M-<f5>" . modus-themes-load-random))
  :config
  ;; All customisations here.
  (setq modus-themes-mixed-fonts t)
  (setq modus-themes-italic-constructs t)

  ;; Finally, load your theme of choice (or a random one with
  ;; `modus-themes-load-random', `modus-themes-load-random-dark',
  ;; `modus-themes-load-random-light').
  (modus-themes-load-theme 'standard-light-tinted))
```

## The `modus-themes-theme` macro is flexible

This morning, I extended the `modus-themes-theme` macro to optionally
accept custom faces and user options that complement or override those
provided by core Modus (the `modus-themes-theme` macro is documented
at length with concrete examples in the aforementioned link to the
manual). For the `standard-themes`, this means that we can inherit all
the goodies from Modus but still deviate stylistically in important
ways wherever necessary. One case where this is evident is the design
of the active mode line: Modus has a flat appearance, while Standard
uses a 3D effect.

Standard does not need to deviate substantively from Modus, though
there is no technical constraint in this regard. A derivative theme
can implement all the requisite deviations to achieve the exact design
it aims for, all while reusing Modus.

My plan is to release all new theme versions in the coming days,
depending on my availability. Please let me know if you have any
questions or want some things to change.
