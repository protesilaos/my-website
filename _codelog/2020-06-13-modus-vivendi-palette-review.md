---
title: 'Modus Vivendi theme subtle palette review (Emacs)'
excerpt: "Report on the subtle refinements to some of Modus Vivendi' colours."
---

The following is intended to be read inside of an `org-mode` buffer, so
I provide the text verbatim for you to read locally.

The changes are subtle.  The point is that minor tweaks like these
require a lot of testing.  Read the report below for the technicalities.
These changes will be pushed to `master` later today (2020-06-13).

* * *

```org
#+TITLE: Modus Vivendi minor palette review for 2020-06-13
#+AUTHOR: Protesilaos Stavrou

* Scope of these refinements

This review tackles two types of subtle, yet important, inconsistencies
in five values:

1. Imbalanced levels of luminance and inconsistent differences in hue
   between them and their neighbouring colours (e.g. the greens between
   them, and the greens next to the yellows in the context of syntax
   highlighting).  The result was that they would create an undesirable
   emphatic 'pop out' effect when placed close to more moderate colours.

2. Differences in luminance and hue could lead to scenaria where two
   colours could be conflated with each other or otherwise impede fail
   to perform their intended function.

* Affected colours

The following table presents the affected colour values.  To visualise
the hexadecimal RGB values, you need to enable the =rainbow-mode= package
and then type in =M-x rainbow-mode=.

| Colour name       | Old     | New     |
|-------------------+---------+---------|
| green-alt         | #58dd13 | #80d200 |
| green-alt-other   | #90d800 | #00cd68 |
| yellow-alt        | #e5f040 | #cfdf30 |
| blue-alt-other    | #00baf4 | #00bdfa |

Sample configuration for the external package you may want to use:

#+begin_src emacs-lisp
(use-package rainbow-mode
  :ensure
  :commands rainbow-mode
  :config
  (setq rainbow-ansi-colors nil)
  (setq rainbow-x-colors nil))
#+end_src

* New contrast ratios against relevant background values

These tables show the differences in contrast between the main accent
values and all backgrounds that are meant to be combined with them.  The
backgrounds are, in order: =bg-main=, =bg-dim=, =bg-alt=, =bg-hl-line=.

** WCAG formula

This is the piece of Elisp used to perform these calculations, which
implements the WCAG formula (courtesy of [[https://github.com/oantolin/live-completions/issues/2][Omar Antolín Camarena]]):

#+begin_src emacs-lisp
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

** Table with changed colours

Old and new colour values, with their respective contrast ratios.

| Colour name     |         | #000000 | #110b11 | #181a20 | #151823 |
|-----------------+---------+---------+---------+---------+---------|
| green-alt       | #58dd13 |   11.77 |   10.90 |    9.75 |    9.91 |
| green-alt-other | #90d800 |   12.01 |   11.12 |    9.95 |   10.12 |
| yellow-alt      | #e5f040 |   16.87 |   15.62 |   13.97 |   14.21 |
| blue            | #33beff |    9.95 |    9.21 |    8.24 |    8.38 |
| blue-alt-other  | #00baf4 |    9.33 |    8.64 |    7.73 |    7.86 |
|-----------------+---------+---------+---------+---------+---------|
| green-alt       | #80d200 |   11.14 |   10.31 |    9.22 |    9.38 |
| green-alt-other | #00cd68 |    9.93 |    9.20 |    8.23 |    8.37 |
| yellow-alt      | #cfdf30 |   14.25 |   13.20 |   11.80 |   12.01 |
| blue            | #29aeff |    8.59 |    7.96 |    7.12 |    7.24 |
| blue-alt-other  | #00bdfa |    9.66 |    8.95 |    8.00 |    8.14 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f::$4='(clr $2 @1$4);%0.2f::$5='(clr $2 @1$5);%0.2f::$6='(clr $2 @1$6);%0.2f


** Old palette with main accent values

Complete picture of the original palette for the main accent values.

| Colour name       |         | #000000 | #110b11 | #181a20 | #151823 |
|-------------------+---------+---------+---------+---------+---------|
| red               | #ff8059 |    8.48 |    7.86 |    7.03 |    7.15 |
| red-alt           | #f4923b |    9.02 |    8.35 |    7.47 |    7.60 |
| red-alt-other     | #ff9977 |   10.07 |    9.33 |    8.34 |    8.49 |
| green             | #44bc44 |    8.52 |    7.89 |    7.06 |    7.18 |
| green-alt         | #58dd13 |   11.77 |   10.90 |    9.75 |    9.91 |
| green-alt-other   | #90d800 |   12.01 |   11.12 |    9.95 |   10.12 |
| yellow            | #eecc00 |   13.27 |   12.29 |   10.99 |   11.18 |
| yellow-alt        | #e5f040 |   16.87 |   15.62 |   13.97 |   14.21 |
| yellow-alt-other  | #f0ce43 |   13.61 |   12.61 |   11.28 |   11.47 |
| blue              | #33beff |    9.95 |    9.21 |    8.24 |    8.38 |
| blue-alt          | #72a4ff |    8.47 |    7.84 |    7.01 |    7.14 |
| blue-alt-other    | #00baf4 |    9.33 |    8.64 |    7.73 |    7.86 |
| magenta           | #feacd0 |   12.03 |   11.14 |    9.96 |   10.13 |
| magenta-alt       | #f78fe7 |   10.04 |    9.30 |    8.31 |    8.46 |
| magenta-alt-other | #b6a0ff |    9.46 |    8.76 |    7.84 |    7.97 |
| cyan              | #00d3d0 |   11.23 |   10.40 |    9.30 |    9.46 |
| cyan-alt          | #4ae8fc |   14.24 |   13.19 |   11.79 |   12.00 |
| cyan-alt-other    | #6ae4b9 |   13.41 |   12.42 |   11.11 |   11.30 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f::$4='(clr $2 @1$4);%0.2f::$5='(clr $2 @1$5);%0.2f::$6='(clr $2 @1$6);%0.2f

** New palette with main accent values

Complete picture of the revised palette for the main accent values.

| Colour name       |         | #000000 | #110b11 | #181a20 | #151823 |
|-------------------+---------+---------+---------+---------+---------|
| red               | #ff8059 |    8.48 |    7.86 |    7.03 |    7.15 |
| red-alt           | #f4923b |    9.02 |    8.35 |    7.47 |    7.60 |
| red-alt-other     | #ff9977 |   10.07 |    9.33 |    8.34 |    8.49 |
| green             | #44bc44 |    8.52 |    7.89 |    7.06 |    7.18 |
| green-alt         | #80d200 |   11.14 |   10.31 |    9.22 |    9.38 |
| green-alt-other   | #00cd68 |    9.93 |    9.20 |    8.23 |    8.37 |
| yellow            | #eecc00 |   13.27 |   12.29 |   10.99 |   11.18 |
| yellow-alt        | #cfdf30 |   14.25 |   13.20 |   11.80 |   12.01 |
| yellow-alt-other  | #f0ce43 |   13.61 |   12.61 |   11.28 |   11.47 |
| blue              | #29aeff |    8.59 |    7.96 |    7.12 |    7.24 |
| blue-alt          | #72a4ff |    8.47 |    7.84 |    7.01 |    7.14 |
| blue-alt-other    | #00bdfa |    9.66 |    8.95 |    8.00 |    8.14 |
| magenta           | #feacd0 |   12.03 |   11.14 |    9.96 |   10.13 |
| magenta-alt       | #f78fe7 |   10.04 |    9.30 |    8.31 |    8.46 |
| magenta-alt-other | #b6a0ff |    9.46 |    8.76 |    7.84 |    7.97 |
| cyan              | #00d3d0 |   11.23 |   10.40 |    9.30 |    9.46 |
| cyan-alt          | #4ae8fc |   14.24 |   13.19 |   11.79 |   12.00 |
| cyan-alt-other    | #6ae4b9 |   13.41 |   12.42 |   11.11 |   11.30 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f::$4='(clr $2 @1$4);%0.2f::$5='(clr $2 @1$5);%0.2f::$6='(clr $2 @1$6);%0.2f
```
