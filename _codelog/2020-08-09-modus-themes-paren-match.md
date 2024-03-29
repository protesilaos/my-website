---
title: 'Modus themes (Emacs): review "paren-match" colours'
excerpt: "Complete report on the review of the background values used to highlight matching delimiters."
---

The following code block is written in `org-mode` markup.  You can
interact with in your local Emacs setup.

The short version of this report is that the colours for highlighting
matching delimiters (parentheses in Emacs Lisp) have changed to look
more consistent.

* * *

```org
#+TITLE: Modus themes: review "paren-match" colours
#+AUTHOR: Protesilaos Stavrou

* Background information

Version =0.11.0= of Modus Operandi and Modus Vivendi (see CHANGELOG)
introduced customisation options for rendering the faces that pertain to
parenthesis matching in a more intense colour.  The relevant symbols
are:

- =modus-operandi-theme-intense-paren-match=
- =modus-vivendi-theme-intense-paren-match=

Unlike the default configuration that used a dedicated/unique colour for
the relevant faces (referenced by the palette variable =bg-paren-match=),
the "intense" variant was using a shade of blue that was not designed
specifically for this task (=blue-intense-bg=).

The option did achieve its intended effect, but left something to be
desired: /it was inconsistent/.

* Scope of this review

This review is two-fold:

- Normalise the differences between the two themes, so that
  transitioning from the one to the other feels more natural.
- Use a bespoke colour for the "intense" style (=bg-paren-match-intense=),
  to account for the unique requirements of this particular facet of the
  design.

* Relative luminance (old vs new)

The following tables summarise the results in terms of contrast ratios.
They measure the relative luminance between the "bg-paren" variables and
those they are used with.

Columns 3 and 4 refer to the colour values of =bg-paren-match= and
=bg-paren-match-intense= respectively.  These are directly combined with
=fg-main=, so they need to have a minimum contrast ratio of 7:1, per the
design principles of the Modus themes for conforming with the highest
accessibility standard of WCAG AAA.

The other colours are contextual and are only meant to highlight the
changes between the old and new implementations.

** Modus Operandi

#+NAME: Modus Operandi old
| Colour name        |         | #efcabf | #6aaeff |
|--------------------+---------+---------+---------|
| fg-main            | #000000 |   13.87 |    9.11 |
| bg-main            | #ffffff |    1.51 |    2.30 |
| bg-alt             | #f0f0f0 |    1.33 |    2.02 |
| bg-dim             | #f8f8f8 |    1.43 |    2.17 |
| bg-region          | #bcbcbc |    1.25 |    1.21 |
| red-nuanced-bg     | #fff1f0 |    1.38 |    2.10 |
| green-nuanced-bg   | #ecf7ed |    1.38 |    2.10 |
| yellow-nuanced-bg  | #fff3da |    1.38 |    2.09 |
| blue-nuanced-bg    | #f3f3ff |    1.38 |    2.09 |
| magenta-nuanced-bg | #fdf0ff |    1.38 |    2.09 |
| cyan-nuanced-bg    | #ebf6fa |    1.38 |    2.10 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f::$4='(clr $2 @1$4);%0.2f

#+NAME: Modus Operandi new
| Colour name        |         | #e0af82 | #70af9f  |
|--------------------+---------+---------+----------|
| fg-main            | #000000 |   10.62 |     8.32 |
| bg-main            | #ffffff |    1.98 |     2.52 |
| bg-alt             | #f0f0f0 |    1.73 |     2.21 |
| bg-dim             | #f8f8f8 |    1.86 |     2.38 |
| bg-region          | #bcbcbc |    1.04 |     1.33 |
| red-nuanced-bg     | #fff1f0 |    1.80 |     2.29 |
| green-nuanced-bg   | #ecf7ed |    1.80 |     2.29 |
| yellow-nuanced-bg  | #fff3da |    1.80 |     2.29 |
| blue-nuanced-bg    | #f3f3ff |    1.80 |     2.29 |
| magenta-nuanced-bg | #fdf0ff |    1.80 |     2.29 |
| cyan-nuanced-bg    | #ebf6fa |    1.80 |     2.29 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f::$4='(clr $2 @1$4);%0.2f

** Modus Vivendi

#+NAME: Modus Vivendi old
| Colour name        |         | #6e3a50 | #2a40b8 |
|--------------------+---------+---------+---------|
| fg-main            | #ffffff |    8.81 |    8.32 |
| bg-main            | #000000 |    2.38 |    2.52 |
| bg-alt             | #181a20 |    1.97 |    2.09 |
| bg-dim             | #110b11 |    2.21 |    2.34 |
| bg-region          | #3c3c3c |    1.25 |    1.33 |
| red-nuanced-bg     | #2c0614 |    2.09 |    2.21 |
| green-nuanced-bg   | #001904 |    2.09 |    2.21 |
| yellow-nuanced-bg  | #221000 |    2.09 |    2.21 |
| blue-nuanced-bg    | #0f0e39 |    2.09 |    2.21 |
| magenta-nuanced-bg | #230631 |    2.09 |    2.21 |
| cyan-nuanced-bg    | #041529 |    2.08 |    2.21 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f::$4='(clr $2 @1$4);%0.2f

#+NAME: Modus Vivendi new
| Colour name        |         | #5f362f | #255650 |
|--------------------+---------+---------+---------|
| fg-main            | #ffffff |   10.22 |    8.32 |
| bg-main            | #000000 |    2.06 |    2.52 |
| bg-alt             | #181a20 |    1.70 |    2.09 |
| bg-dim             | #110b11 |    1.90 |    2.34 |
| bg-region          | #3c3c3c |    1.08 |    1.33 |
| red-nuanced-bg     | #2c0614 |    1.80 |    2.21 |
| green-nuanced-bg   | #001904 |    1.80 |    2.21 |
| yellow-nuanced-bg  | #221000 |    1.80 |    2.21 |
| blue-nuanced-bg    | #0f0e39 |    1.80 |    2.21 |
| magenta-nuanced-bg | #230631 |    1.80 |    2.21 |
| cyan-nuanced-bg    | #041529 |    1.80 |    2.20 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f::$4='(clr $2 @1$4);%0.2f

* ANNEX: Tools for measuring relative luminance and previewing colours

This is the formula for the calculations whose results are shown in the
tables.

#+begin_src emacs-lisp
;; Code is courtesy of Omar Antolín Camarena:
;; https://github.com/oantolin/emacs-config
(defun wcag (hex)
  (apply #'+
         (cl-mapcar
          (lambda (k x)
            (* k (if (<= x 0.03928)
                     (/ x 12.92)
                   (expt (/ (+ x 0.055) 1.055) 2.4))))
          '(0.2126 0.7152 0.0722)
          (color-name-to-rgb hex))))

(defun clr (c1 c2)
  (let ((ct (/ (+ (wcag c1) 0.05)
               (+ (wcag c2) 0.05))))
    (max ct (/ ct))))
#+end_src

Use =rainbow-mode= to preview the colour values presented below.

#+begin_src emacs-lisp
(use-package rainbow-mode
  :ensure
  :commands rainbow-mode
  :config
  (setq rainbow-ansi-colors nil)
  (setq rainbow-x-colors nil))
#+end_src
```
