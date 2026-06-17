---
title: "Emacs: testing common colour values with the doric-themes"
excerpt: "Code I use to get a preview of common colours that I need to configure for my Doric themes."
---

The `doric-themes` are the minimalist counterpart of my `modus-themes`
and `ef-themes`. They define few colours and exercise restraint in how
they customise faces. This means that there rarely is a context that
has red, green, yellow, blue, magenta, and cyan. Those are reserved
for cases where colour-coding is needed. Whereas with my other themes
colour is used with the dual intent of establish rhythm and order in
addition to any colour-coding.

Because of this, it is difficult for me to test the relevant values.
Each Doric theme defines entries in its palette like `fg-red` and
`bg-blue`. So I decided to write a small snippet that shows text which
uses those colours in context.

The idea is to create faces that get the appropriate `:foreground` and
`:background` attributes with their proper values. Then write text in
a buffer that displays each face.

```elisp
(defconst test-doric-accents
  '( fg-red fg-green fg-yellow fg-blue fg-magenta fg-cyan
     bg-red bg-green bg-yellow bg-blue bg-magenta bg-cyan))

(dolist (accent test-doric-accents)
  (custom-declare-face
   (intern (format "test-doric-%s" accent))
   nil
   "Test."
   :group 'doric-themes))

(defun test-doric-set-accent-faces ()
  (doric-themes-with-colors
    (let* ((predicate (lambda (symbol) (string-prefix-p "bg" (symbol-name symbol))))
           (foregrounds (seq-remove predicate test-doric-accents))
           (backgrounds (seq-filter predicate test-doric-accents))
           (foreground-faces (mapcar
                              (lambda (accent)
                                `(,(intern (format "test-doric-%s" accent))
                                  ((t :foreground ,(symbol-value accent)))))
                              foregrounds))
           (background-faces (mapcar
                              (lambda (accent)
                                `(,(intern (format "test-doric-%s" accent))
                                  ((t :background ,(symbol-value accent) :foreground ,fg-main))))
                              backgrounds)))
      (apply #'custom-set-faces (append foreground-faces background-faces)))))

(add-hook 'doric-themes-after-load-theme-hook #'test-doric-set-accent-faces)

(defun test-doric-show-accents ()
  (interactive)
  (let ((buffer (get-buffer-create "*test-doric-themes-accents*")))
    (with-current-buffer buffer
      (erase-buffer)
      (dolist (accent test-doric-accents)
        ;; Pangram from my `show-font' package...
        (let* ((text "Protesilaos may find zesty owls and quiet jays vexing the black cat")
               (styled (propertize text 'face (intern (format "test-doric-%s" accent)))))
          (insert (format "%s\n" styled)))))
    (display-buffer buffer)))
```

Reload the theme for changes to take effect.

And, yes, I had the motivation to write this because I am developing
new themes.

## Doric themes sources

+ Package name (GNU ELPA): `doric-themes`
+ Sample pictures: <https://protesilaos.com/emacs/doric-themes-pictures>
+ Git repository: <https://github.com/protesilaos/doric-themes>
+ Backronym: Doric Only Really Intensifies Conservatively ... themes.
