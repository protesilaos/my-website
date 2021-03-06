---
title: 'Modus Operandi theme subtle palette review (Emacs)'
excerpt: "Report on the subtle refinements to some of Modus Operandi's colours."
---

The following is intended to be read inside of an `org-mode` buffer, so
I provide the text verbatim for you to copy-paste.

The gist is that picking colours in accordance with [the design
principles of the Modus
themes](https://protesilaos.com/codelog/2020-03-17-design-modus-themes-emacs/)
is inherently tricky.

Read the report below for the technicalities.  These changes will be
pushed to `master` later today (2020-05-10).

* * *

```
* Modus Operandi theme palette refinements 2020-05-10

This review redefines the value of =bg-alt= from =f3f1f3= to =f0f0f0=, which
then allows =bg-hl-line= to be refashioned from =f1f2f6= to =f2eff3=.  The
latter's contrast vis-à-vis =bg-main= jumps from =1.11= to =1.14= (which is
intended for improved functionality of =hl-line-mode=).  Several
foreground colours have been redefined accordingly to pass the WCAG AAA
accessibility test against the new background values.

Remember that the minimum contrast ratio between background and
foreground values is 7:1.

The following table compares all foreground colours (column 2) with
their intended background values (some colours are designed to be
combined only with specific backgrounds, so they are excluded from this
list).

The variables for the background colours are =bg-main=, =bg-dim=, =bg-alt=,
and =bg-hl-line=, represented in this exact sequence in the table's
columns 3-6.

Use =M-x rainbow-mode= to preview all colour values (see sample package
declaration below).

| Foreground colour name   |         | #ffffff | #f8f8f8 | #f0f0f0 | #f2eff3 |
|--------------------------+---------+---------+---------+---------+---------|
| fg-main                  | #000000 |   21.00 |   19.77 |   18.43 |   18.42 |
| fg-dim                   | #282828 |   14.74 |   13.88 |   12.94 |   12.93 |
| fg-alt                   | #505050 |    8.06 |    7.59 |    7.08 |    7.07 |
| fg-active                | #191919 |   17.58 |   16.56 |   15.43 |   15.42 |
| fg-inactive              | #424242 |   10.05 |    9.46 |    8.82 |    8.81 |
| fg-special-cold          | #093060 |   13.10 |   12.33 |   11.49 |   11.49 |
| fg-special-mild          | #184034 |   11.53 |   10.85 |   10.12 |   10.11 |
| fg-special-warm          | #5d3026 |   10.96 |   10.32 |    9.62 |    9.61 |
| fg-special-calm          | #61284f |   10.91 |   10.27 |    9.57 |    9.57 |
| red                      | #a60000 |    8.01 |    7.54 |    7.03 |    7.03 |
| green                    | #005e00 |    8.07 |    7.60 |    7.08 |    7.08 |
| yellow                   | #813e00 |    8.01 |    7.54 |    7.03 |    7.02 |
| blue                     | #0030a6 |   10.64 |   10.02 |    9.34 |    9.33 |
| magenta                  | #721045 |   11.20 |   10.54 |    9.83 |    9.82 |
| cyan                     | #00538b |    8.05 |    7.58 |    7.06 |    7.06 |
| red-alt                  | #972500 |    8.14 |    7.66 |    7.14 |    7.14 |
| green-alt                | #315b00 |    7.99 |    7.53 |    7.01 |    7.01 |
| yellow-alt               | #70480f |    8.01 |    7.54 |    7.03 |    7.02 |
| blue-alt                 | #223fbf |    8.30 |    7.81 |    7.28 |    7.28 |
| magenta-alt              | #8f0075 |    8.66 |    8.15 |    7.60 |    7.59 |
| cyan-alt                 | #30517f |    8.05 |    7.58 |    7.06 |    7.06 |
| red-alt-other            | #a0132f |    7.99 |    7.52 |    7.01 |    7.01 |
| green-alt-other          | #0f5c33 |    8.08 |    7.61 |    7.09 |    7.09 |
| yellow-alt-other         | #863927 |    7.99 |    7.52 |    7.01 |    7.01 |
| blue-alt-other           | #0000bb |   12.23 |   11.51 |   10.73 |   10.72 |
| magenta-alt-other        | #5317ac |   10.07 |    9.48 |    8.83 |    8.83 |
| cyan-alt-other           | #005a5f |    7.99 |    7.53 |    7.01 |    7.01 |
| red-nuanced              | #4d0006 |   15.93 |   15.00 |   13.98 |   13.97 |
| green-nuanced            | #003000 |   14.76 |   13.90 |   12.95 |   12.94 |
| yellow-nuanced           | #3a2a00 |   13.90 |   13.09 |   12.19 |   12.19 |
| blue-nuanced             | #001170 |   15.98 |   15.05 |   14.02 |   14.01 |
| magenta-nuanced          | #381050 |   15.46 |   14.56 |   13.57 |   13.56 |
| cyan-nuanced             | #003434 |   13.63 |   12.83 |   11.96 |   11.95 |
| red-refine-fg            | #780000 |   11.68 |   10.99 |   10.25 |   10.24 |
| green-refine-fg          | #004c00 |   10.33 |    9.72 |    9.06 |    9.06 |
| yellow-refine-fg         | #604000 |    9.41 |    8.86 |    8.26 |    8.26 |
| blue-refine-fg           | #002288 |   13.25 |   12.48 |   11.63 |   11.62 |
| magenta-refine-fg        | #770077 |   10.24 |    9.64 |    8.99 |    8.98 |
| cyan-refine-fg           | #004850 |   10.28 |    9.68 |    9.02 |    9.02 |
| red-active               | #930000 |    9.37 |    8.83 |    8.22 |    8.22 |
| green-active             | #005300 |    9.39 |    8.84 |    8.24 |    8.23 |
| yellow-active            | #703700 |    9.39 |    8.85 |    8.24 |    8.24 |
| blue-active              | #0033c0 |    9.40 |    8.85 |    8.25 |    8.24 |
| magenta-active           | #6320a0 |    9.36 |    8.81 |    8.21 |    8.20 |
| cyan-active              | #004882 |    9.34 |    8.79 |    8.19 |    8.19 |
| fg-escape-char-construct | #8b1030 |    9.48 |    8.93 |    8.32 |    8.32 |
| fg-escape-char-backslash | #654d0f |    8.01 |    7.54 |    7.03 |    7.02 |
| fg-lang-error            | #9f004f |    8.12 |    7.64 |    7.12 |    7.12 |
| fg-lang-warning          | #604f0f |    8.01 |    7.54 |    7.03 |    7.02 |
| fg-lang-note             | #4040ae |    8.19 |    7.72 |    7.19 |    7.19 |
#+TBLFM: $3='(clr $2 @1$3);%0.2f
#+TBLFM: $4='(clr $2 @1$4);%0.2f
#+TBLFM: $5='(clr $2 @1$5);%0.2f
#+TBLFM: $6='(clr $2 @1$6);%0.2f

The Elisp to perform these calculations, which implements the WCAG AAA
formula (the code is courtesy of [[https://github.com/oantolin/live-completions/issues/2][Omar Antolín Camarena]]):

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

The diff for =modus-operandi-theme.el=:

#+begin_src diff
 emacs/.emacs.d/modus-operandi-theme.el | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/emacs/.emacs.d/modus-operandi-theme.el b/emacs/.emacs.d/modus-operandi-theme.el
index 10b39cd..674eaab 100644
--- a/emacs/.emacs.d/modus-operandi-theme.el
+++ b/emacs/.emacs.d/modus-operandi-theme.el
@@ -555,7 +555,7 @@ AMOUNT is a customisation option."
 (defvar modus-operandi-theme-default-colors-alist
   '(;; base values
     ("bg-main" . "#ffffff") ("fg-main" . "#000000")
-    ("bg-alt" . "#f3f1f3") ("fg-alt" . "#505050")
+    ("bg-alt" . "#f0f0f0") ("fg-alt" . "#505050")
     ("bg-dim" . "#f8f8f8") ("fg-dim" . "#282828")
     ;; specifically for on/off states (e.g. `mode-line')
     ;;
@@ -572,21 +572,21 @@ AMOUNT is a customisation option."
     ;; styles for the main constructs
     ;;
     ;; must be combined with: `bg-main', `bg-alt', `bg-dim'
-    ("red" . "#a80000") ("green" . "#005f00")
-    ("yellow" . "#8b3800") ("blue" . "#0030a6")
-    ("magenta" . "#721045") ("cyan" . "#005589")
+    ("red" . "#a60000") ("green" . "#005e00")
+    ("yellow" . "#813e00") ("blue" . "#0030a6")
+    ("magenta" . "#721045") ("cyan" . "#00538b")
     ;; styles for common, but still specialised constructs
     ;;
     ;; must be combined with: `bg-main', `bg-alt', `bg-dim'
-    ("red-alt" . "#972500") ("green-alt" . "#305c00")
-    ("yellow-alt" . "#714900") ("blue-alt" . "#223fbf")
-    ("magenta-alt" . "#8f0075") ("cyan-alt" . "#185870")
+    ("red-alt" . "#972500") ("green-alt" . "#315b00")
+    ("yellow-alt" . "#70480f") ("blue-alt" . "#223fbf")
+    ("magenta-alt" . "#8f0075") ("cyan-alt" . "#30517f")
     ;; same purpose as above, just slight differences
     ;;
     ;; must be combined with: `bg-main', `bg-alt', `bg-dim'
-    ("red-alt-other" . "#a0132f") ("green-alt-other" . "#095f1c")
-    ("yellow-alt-other" . "#804000") ("blue-alt-other" . "#0000bb")
-    ("magenta-alt-other" . "#5317ac") ("cyan-alt-other" . "#005a68")
+    ("red-alt-other" . "#a0132f") ("green-alt-other" . "#145c33")
+    ("yellow-alt-other" . "#863927") ("blue-alt-other" . "#0000bb")
+    ("magenta-alt-other" . "#5317ac") ("cyan-alt-other" . "#005a5f")
     ;; styles for elements that should be very subtle
     ;;
     ;; must be combined with: `bg-main', `bg-alt', `bg-dim'
@@ -677,7 +677,7 @@ AMOUNT is a customisation option."
     ;; the window divider colours apply to faces with just an fg value
     ;;
     ;; all pairs are combinable with themselves
-    ("bg-hl-line" . "#f1f2f6")
+    ("bg-hl-line" . "#f2eff3")
     ("bg-paren-match" . "#efcabf")
     ("bg-region" . "#bcbcbc")
 
@@ -687,10 +687,10 @@ AMOUNT is a customisation option."
     ("fg-tab-active" . "#30169e")
 
     ("fg-escape-char-construct" . "#8b1030")
-    ("fg-escape-char-backslash" . "#644f00")
+    ("fg-escape-char-backslash" . "#654d0f")
 
     ("fg-lang-error" . "#9f004f")
-    ("fg-lang-warning" . "#605000")
+    ("fg-lang-warning" . "#604f0f")
     ("fg-lang-note" . "#4040ae")
 
     ("fg-window-divider-inner" . "#888888")
#+end_src

The sample package declaration:

#+begin_src emacs-lisp
(use-package rainbow-mode
  :ensure
  :commands rainbow-mode
  :config
  (setq rainbow-ansi-colors nil)
  (setq rainbow-x-colors nil))
#+end_src
```
