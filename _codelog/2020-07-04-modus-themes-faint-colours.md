---
title: 'Modus themes (Emacs): new "faint syntax" option'
excerpt: "Report on the new user-facing option for desaturated syntax highlighting."
---

The following is intended to be read inside of an `org-mode` buffer, so
I provide the text verbatim for you to read locally.

The gist is that users of my highly-accessible (and highly-customisable)
themes for Emacs now have the option to reduce the saturation in modes
where syntax highlighting takes place.

* * *

```org
#+TITLE: Initial implementation of the "faint syntax colours" option
#+AUTHOR: Protesilaos Stavrou

* Description of the new user-facing option

Users can now opt in to the customisation option that desaturates the
colours that are used to highlight code syntax.  This is made possible
by a new palette subset that consists of carefully-selected colours.
The idea is to make code less intense, but retain a sense of visual
order.

The new =defcustom= symbols:

+ =modus-operandi-theme-faint-syntax=
+ =modus-vivendi-theme-faint-syntax=

While the current implementation is considered "good enough", there may
still be improvements to be made.  Feedback is always welcome!

* Tools for measuring relative luminance and previewing colours

This is the formula for the subsequent calculations.  A resulting value
that is >= 7 means that the colour combination is highly accessible and
receives a AAA rating in the WCAG standard (what the Modus themes must
always conform with):

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

* Tables with new "faint" colours

The following tables show the contrast ratio of the new "faint" accent
values relative to: =bg-main=, =bg-dim=, =bg-alt=, =bg-hl-line= (in this
order).

#+NAME: Modus Operandi faint accent values
| Colour name             |         | #ffffff | #f8f8f8 | #f0f0f0 | #f2eff3 |
|-------------------------+---------+---------+---------+---------+---------|
| red-faint               | #7f1010 |   10.58 |    9.97 |    9.29 |    9.28 |
| red-alt-faint           | #702f00 |   10.02 |    9.44 |    8.79 |    8.79 |
| red-alt-other-faint     | #7f002f |   10.81 |   10.17 |    9.48 |    9.48 |
| green-faint             | #1f441f |   11.02 |   10.38 |    9.67 |    9.67 |
| green-alt-faint         | #30440f |   10.72 |   10.09 |    9.40 |    9.40 |
| green-alt-other-faint   | #0f443f |   10.94 |   10.30 |    9.60 |    9.60 |
| yellow-faint            | #5f4400 |    9.08 |    8.55 |    7.97 |    7.96 |
| yellow-alt-faint        | #5d5000 |    8.04 |    7.57 |    7.05 |    7.05 |
| yellow-alt-other-faint  | #5e3a20 |    9.99 |    9.41 |    8.77 |    8.76 |
| blue-faint              | #002f88 |   11.92 |   11.22 |   10.46 |   10.45 |
| blue-alt-faint          | #003f78 |   10.59 |    9.98 |    9.30 |    9.29 |
| blue-alt-other-faint    | #1f2f6f |   12.39 |   11.67 |   10.88 |   10.87 |
| magenta-faint           | #752f50 |    9.22 |    8.68 |    8.09 |    8.08 |
| magenta-alt-faint       | #702565 |    9.81 |    9.23 |    8.60 |    8.60 |
| magenta-alt-other-faint | #5f3f7f |    8.39 |    7.90 |    7.36 |    7.35 |
| cyan-faint              | #12506f |    8.74 |    8.23 |    7.67 |    7.66 |
| cyan-alt-faint          | #354f6f |    8.40 |    7.91 |    7.37 |    7.37 |
| cyan-alt-other-faint    | #2e584f |    8.00 |    7.53 |    7.02 |    7.02 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f :: $4='(clr $2 @1$4);%0.2f :: $5='(clr $2 @1$5);%0.2f :: $6='(clr $2 @1$6);%0.2f

#+NAME: Modus Vivendi faint accent values
| Colour name             |         | #000000 | #110b11 | #181a20 | #151823 |
|-------------------------+---------+---------+---------+---------+---------|
| red-faint               | #ffa0a0 |   10.79 |    9.99 |    8.93 |    9.09 |
| red-alt-faint           | #f5aa80 |   10.94 |   10.14 |    9.06 |    9.22 |
| red-alt-other-faint     | #ff9fbf |   10.96 |   10.15 |    9.08 |    9.24 |
| green-faint             | #88cf88 |   11.33 |   10.49 |    9.38 |    9.54 |
| green-alt-faint         | #a8cf88 |   11.95 |   11.06 |    9.89 |   10.07 |
| green-alt-other-faint   | #88cfaf |   11.59 |   10.73 |    9.60 |    9.77 |
| yellow-faint            | #d2b580 |   10.66 |    9.87 |    8.83 |    8.98 |
| yellow-alt-faint        | #cabf77 |   11.23 |   10.40 |    9.30 |    9.46 |
| yellow-alt-other-faint  | #d0ba95 |   11.14 |   10.32 |    9.23 |    9.39 |
| blue-faint              | #92baff |   10.69 |    9.90 |    8.85 |    9.01 |
| blue-alt-faint          | #a4b0ff |   10.23 |    9.48 |    8.47 |    8.62 |
| blue-alt-other-faint    | #8fc5ff |   11.60 |   10.74 |    9.61 |    9.77 |
| magenta-faint           | #e0b2d6 |   11.51 |   10.66 |    9.53 |    9.70 |
| magenta-alt-faint       | #ef9fe4 |   10.75 |    9.96 |    8.90 |    9.06 |
| magenta-alt-other-faint | #d0b4ff |   11.65 |   10.79 |    9.65 |    9.82 |
| cyan-faint              | #a0bfdf |   11.01 |   10.20 |    9.12 |    9.28 |
| cyan-alt-faint          | #90c4ed |   11.30 |   10.47 |    9.36 |    9.53 |
| cyan-alt-other-faint    | #a4d0bb |   12.32 |   11.41 |   10.20 |   10.38 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f :: $4='(clr $2 @1$4);%0.2f :: $5='(clr $2 @1$5);%0.2f :: $6='(clr $2 @1$6);%0.2f

* Tables with all accent values for code syntax

For the sake of completeness, the following tables present all colours
that are meant to be used by =font-lock= and relevant modes.  The method
is the same as above, with the regard to the background values these are
compared against.

#+NAME: Modus Operandi accent values
| Colour name             |         | #ffffff | #f8f8f8 | #f0f0f0 | #f2eff3 |
|-------------------------+---------+---------+---------+---------+---------|
| red                     | #a60000 |    8.01 |    7.54 |    7.03 |    7.03 |
| red-alt                 | #972500 |    8.14 |    7.66 |    7.14 |    7.14 |
| red-alt-other           | #a0132f |    7.99 |    7.52 |    7.01 |    7.01 |
| green                   | #005e00 |    8.07 |    7.60 |    7.08 |    7.08 |
| green-alt               | #315b00 |    7.99 |    7.53 |    7.01 |    7.01 |
| green-alt-other         | #145c33 |    8.05 |    7.58 |    7.06 |    7.06 |
| yellow                  | #813e00 |    8.01 |    7.54 |    7.03 |    7.02 |
| yellow-alt              | #70480f |    8.01 |    7.54 |    7.03 |    7.02 |
| yellow-alt-other        | #863927 |    7.99 |    7.52 |    7.01 |    7.01 |
| blue                    | #0030a6 |   10.64 |   10.02 |    9.34 |    9.33 |
| blue-alt                | #223fbf |    8.30 |    7.81 |    7.28 |    7.28 |
| blue-alt-other          | #0000bb |   12.23 |   11.51 |   10.73 |   10.72 |
| magenta                 | #721045 |   11.20 |   10.54 |    9.83 |    9.82 |
| magenta-alt             | #8f0075 |    8.66 |    8.15 |    7.60 |    7.59 |
| magenta-alt-other       | #5317ac |   10.07 |    9.48 |    8.83 |    8.83 |
| cyan                    | #00538b |    8.05 |    7.58 |    7.06 |    7.06 |
| cyan-alt                | #30517f |    8.05 |    7.58 |    7.06 |    7.06 |
| cyan-alt-other          | #005a5f |    7.99 |    7.53 |    7.01 |    7.01 |
|-------------------------+---------+---------+---------+---------+---------|
| red-faint               | #7f1010 |   10.58 |    9.97 |    9.29 |    9.28 |
| red-alt-faint           | #702f00 |   10.02 |    9.44 |    8.79 |    8.79 |
| red-alt-other-faint     | #7f002f |   10.81 |   10.17 |    9.48 |    9.48 |
| green-faint             | #1f441f |   11.02 |   10.38 |    9.67 |    9.67 |
| green-alt-faint         | #30440f |   10.72 |   10.09 |    9.40 |    9.40 |
| green-alt-other-faint   | #0f443f |   10.94 |   10.30 |    9.60 |    9.60 |
| yellow-faint            | #5f4400 |    9.08 |    8.55 |    7.97 |    7.96 |
| yellow-alt-faint        | #5d5000 |    8.04 |    7.57 |    7.05 |    7.05 |
| yellow-alt-other-faint  | #5e3a20 |    9.99 |    9.41 |    8.77 |    8.76 |
| blue-faint              | #002f88 |   11.92 |   11.22 |   10.46 |   10.45 |
| blue-alt-faint          | #003f78 |   10.59 |    9.98 |    9.30 |    9.29 |
| blue-alt-other-faint    | #1f2f6f |   12.39 |   11.67 |   10.88 |   10.87 |
| magenta-faint           | #752f50 |    9.22 |    8.68 |    8.09 |    8.08 |
| magenta-alt-faint       | #702565 |    9.81 |    9.23 |    8.60 |    8.60 |
| magenta-alt-other-faint | #5f3f7f |    8.39 |    7.90 |    7.36 |    7.35 |
| cyan-faint              | #12506f |    8.74 |    8.23 |    7.67 |    7.66 |
| cyan-alt-faint          | #354f6f |    8.40 |    7.91 |    7.37 |    7.37 |
| cyan-alt-other-faint    | #2e584f |    8.00 |    7.53 |    7.02 |    7.02 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f :: $4='(clr $2 @1$4);%0.2f :: $5='(clr $2 @1$5);%0.2f :: $6='(clr $2 @1$6);%0.2f

#+NAME: Modus Vivendi accent values
| Colour name             |         | #000000 | #110b11 | #181a20 | #151823 |
|-------------------------+---------+---------+---------+---------+---------|
| red                     | #ff8059 |    8.48 |    7.86 |    7.03 |    7.15 |
| red-alt                 | #f4923b |    9.02 |    8.35 |    7.47 |    7.60 |
| red-alt-other           | #ff9977 |   10.07 |    9.33 |    8.34 |    8.49 |
| green                   | #44bc44 |    8.52 |    7.89 |    7.06 |    7.18 |
| green-alt               | #80d200 |   11.14 |   10.31 |    9.22 |    9.38 |
| green-alt-other         | #00cd68 |    9.93 |    9.20 |    8.23 |    8.37 |
| yellow                  | #eecc00 |   13.27 |   12.29 |   10.99 |   11.18 |
| yellow-alt              | #cfdf30 |   14.25 |   13.20 |   11.80 |   12.01 |
| yellow-alt-other        | #f0ce43 |   13.61 |   12.61 |   11.28 |   11.47 |
| blue                    | #29aeff |    8.59 |    7.96 |    7.12 |    7.24 |
| blue-alt                | #72a4ff |    8.47 |    7.84 |    7.01 |    7.14 |
| blue-alt-other          | #00bdfa |    9.66 |    8.95 |    8.00 |    8.14 |
| magenta                 | #feacd0 |   12.03 |   11.14 |    9.96 |   10.13 |
| magenta-alt             | #f78fe7 |   10.04 |    9.30 |    8.31 |    8.46 |
| magenta-alt-other       | #b6a0ff |    9.46 |    8.76 |    7.84 |    7.97 |
| cyan                    | #00d3d0 |   11.23 |   10.40 |    9.30 |    9.46 |
| cyan-alt                | #4ae8fc |   14.24 |   13.19 |   11.79 |   12.00 |
| cyan-alt-other          | #6ae4b9 |   13.41 |   12.42 |   11.11 |   11.30 |
|-------------------------+---------+---------+---------+---------+---------|
| red-faint               | #ffa0a0 |   10.79 |    9.99 |    8.93 |    9.09 |
| red-alt-faint           | #f5aa80 |   10.94 |   10.14 |    9.06 |    9.22 |
| red-alt-other-faint     | #ff9fbf |   10.96 |   10.15 |    9.08 |    9.24 |
| green-faint             | #88cf88 |   11.33 |   10.49 |    9.38 |    9.54 |
| green-alt-faint         | #a8cf88 |   11.95 |   11.06 |    9.89 |   10.07 |
| green-alt-other-faint   | #88cfaf |   11.59 |   10.73 |    9.60 |    9.77 |
| yellow-faint            | #d2b580 |   10.66 |    9.87 |    8.83 |    8.98 |
| yellow-alt-faint        | #cabf77 |   11.23 |   10.40 |    9.30 |    9.46 |
| yellow-alt-other-faint  | #d0ba95 |   11.14 |   10.32 |    9.23 |    9.39 |
| blue-faint              | #92baff |   10.69 |    9.90 |    8.85 |    9.01 |
| blue-alt-faint          | #a4b0ff |   10.23 |    9.48 |    8.47 |    8.62 |
| blue-alt-other-faint    | #8fc5ff |   11.60 |   10.74 |    9.61 |    9.77 |
| magenta-faint           | #e0b2d6 |   11.51 |   10.66 |    9.53 |    9.70 |
| magenta-alt-faint       | #ef9fe4 |   10.75 |    9.96 |    8.90 |    9.06 |
| magenta-alt-other-faint | #d0b4ff |   11.65 |   10.79 |    9.65 |    9.82 |
| cyan-faint              | #a0bfdf |   11.01 |   10.20 |    9.12 |    9.28 |
| cyan-alt-faint          | #90c4ed |   11.30 |   10.47 |    9.36 |    9.53 |
| cyan-alt-other-faint    | #a4d0bb |   12.32 |   11.41 |   10.20 |   10.38 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f :: $4='(clr $2 @1$4);%0.2f :: $5='(clr $2 @1$5);%0.2f :: $6='(clr $2 @1$6);%0.2f
```
