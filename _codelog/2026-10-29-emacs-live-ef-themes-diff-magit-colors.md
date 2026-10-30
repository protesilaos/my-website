---
title: "Emacs live refining 'ef-themes' Diff/Magit colours at 2026-10-29 18:00 Europe/Athens"
excerpt: "I am doing a live stream where I will revise colours that are used for diff interfaces."
layout: vlog
mediaid: "JnDcXPzFsfA"
---

[ The stream will be recorded. You can watch it later. ]

This is a spontaneous live stream that starts in ~10 minutes. I will
do some work on my `ef-themes` package for Emacs. I want to tweak the
color values of all themes in order to achieve inter-theme consistency
as I noticed some cases that are problematic.

I will keep the chat open, in case there are any questions related to
this or anything else---I always answer everything.

## Code I wrote to update files

```elisp
(defun prot/ef-themes-match-p (file)
  (string-match-p "ef-.*-theme\\.el" file))

(defun prot/ef-themes-get-theme-files ()
  (thread-last
    (directory-files "/home/prot/Git/Projects/ef-themes/" :full)
    (seq-filter #'prot/ef-themes-match-p)))

(defun prot/ef-themes-add-bg-diff-fringe (files)
  "Add bg-DIFF-fringe to each theme."
  (dolist (file files)
    (with-current-buffer (find-file-noselect file)
      (goto-char (point-min))
      (dolist (scope '("added" "changed" "removed"))
        (when (re-search-forward (format "\\(?:(bg-%s-refine[\s\t]+\\)\"\\(#[A-Fa-f0-9]+\\)\"" scope) nil t)
          (let* ((color (match-string-no-properties 1))
                 (percentage (if (modus-themes-color-dark-p color)
                                 10
                               -10))
                 (fringe-value (modus-themes-adjust-value color percentage)))
            (goto-char (line-end-position))
            (insert (format "\n(bg-%s-fringe %S)" scope fringe-value)))))
      (indent-region (point-min) (point-max))
      (save-buffer))))

(prot/ef-themes-add-bg-diff-fringe (prot/ef-themes-get-theme-files))

(defun prot/ef-themes-get-name-from-file (file)
  (thread-last
    (file-name-nondirectory file)
    (replace-regexp-in-string "-theme\\.el" "")))

(defun prot/ef-themes-add-diff-contrast-tables (files)
  (dolist (file files)
    (let ((theme-name (prot/ef-themes-get-name-from-file file)))
      (with-temp-buffer
        (insert-file-contents file)
        (goto-char (point-min))
        (let ((foreground-colour nil)
              (tables nil))
          (dolist (scope '("added" "changed" "removed"))
            (let ((background-colours nil))
              (dolist (specifier '("" "-faint" "-refine"))
                (when (re-search-forward (format "\\(?:(bg-%s%s[\s\t]+\\)\"\\(#[A-Fa-f0-9]+\\)\"" scope specifier) nil t)
                  (push (match-string-no-properties 1) background-colours)))
              (setq background-colours (nreverse background-colours))
              (when (re-search-forward (format "\\(?:(fg-%s[\s\t]+\\)\"\\(#[A-Fa-f0-9]+\\)\"" scope) nil t)
                (setq foreground-colour (match-string-no-properties 1)))
              (push
               (concat (format "| | %s | %s | %s |"
                               (nth 0 background-colours)
                               (nth 1 background-colours)
                               (nth 2 background-colours))
                       "\n"
                       "|-"
                       "\n"
                       (format "| %s |" foreground-colour)
                       "\n"
                       "#+TBLFM: $2='(Λ $1 @1);%.2f :: $3='(Λ $1 @1);%.2f :: $4='(Λ $1 @1);%.2f"
                       "\n")
               tables)))
          (setq table (nreverse tables))
          (with-current-buffer (find-file-noselect "/home/prot/Git/Projects/ef-themes/contrast-ratios.org")
            (goto-char (point-min))
            (when (re-search-forward (format "^\\* %s" theme-name))
              (call-interactively #'org-narrow-to-subtree)
              (goto-char (point-max))
              (insert "** Diff colours")
              (insert "\n\n")
              (dolist (table tables)
                (insert table)
                (insert "\n"))
              (widen))))))))

(prot/ef-themes-add-diff-contrast-tables
 (prot/ef-themes-get-theme-files))
```

## About the `ef-themes`

The `ef-themes` are a collection of light and dark themes for GNU
Emacs that provide colourful ("pretty") yet legible options for users
who want something with a bit more flair than the `modus-themes` (also
designed by me).

Starting with version `2.0.0`, the `ef-themes` are built on top of the
`modus-themes`. This means that all customisation options of the Modus
themes apply to the Ef themes. Same for all Modus commands that load a
theme. Enable `ef-themes-take-over-modus-themes-mode` to set up this
arrangement (or enable `modus-themes-include-derivatives-mode` instead
to blend Ef and Modus into one collection).

+ Package name (GNU ELPA): `ef-themes`
+ Official manual: <https://protesilaos.com/emacs/ef-themes>
+ Change log: <https://protesilaos.com/emacs/ef-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/ef-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/ef-themes>
  + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Backronym: Eclectic Fashion in Themes Hides Exaggerated Markings,
  Embellishments, and Sparkles.
