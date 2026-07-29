---
title: "Emacs: default minibuffer completions overview (Emacs 31)"
excerpt: "Overview of the default interface for minibuffer completions. This has been improved for Emacs version 31."
layout: vlog
mediaid: "yH0Gan6xMTo"
---

In this video I provide an overview of the default interface for minibuffer completions in Emacs. This is an interface that has been improved considerably over the years. In Emacs version 31, this interface gets some nice new features which make it even more appealing to use.

Below is the article I prepared for this video, with all the code samples.


## Table of Contents

1.  [The default settings are usable but inconvenient](#orga3f5b35)
2.  [Tweaks for a more refined default completion interface](#orgbc1d3e6)
3.  [The `completion-category-overrides` for maximum control](#org5532eef)
    1.  [How to find the completion category](#org290e045)
    2.  [Completion categories and all the other `completion-metadata`](#orgb29882c)
4.  [The default completions and related packages](#orgbc5c84f)

The core Emacs infrastructure for completions is quite capable. In a previous entry I covered the technicalities of in-buffer completion, the `completion-at-point-functions`, and related packages/modes like `corfu`, `company`, `completion-preview-mode`: <https://protesilaos.com/codelog/2026-07-19-emacs-completion-at-point-functions/>.

For this article I will focus on the default user interface of completions as it is done through the minibuffer. Minibuffer completion is performed whenever we type, with default keybindings, `M-x` (`execute-extended-command`), `C-x b` (`switch-to-buffer`), `C-x C-f` (`find-file`), among many others.


<a id="orga3f5b35"></a>

## The default settings are usable but inconvenient

They are designed to work like TAB-completion in a standard Bash shell. Insert some text, press `TAB`, and Emacs will interpret your input as a prefix to be completed against available candidates.

The `*Completions*` buffer pops up. At the top, it informs you about the keybindings you can press to select a candidate. The candidates themselves are presented in rows and columns.

If you type some extra characters or otherwise modify your initial input, the `*Completions*` buffer will not reflect the new list of candidates. To calculate that anew you have to press `TAB` again. As such, the `*Completions*` are static by default.


<a id="orgbc1d3e6"></a>

## Tweaks for a more refined default completion interface

Lots of small refinements have been made over the years to expand what we can do with the `*Completions*` buffer (at least some are inspired by an old package of mine called `mct`). Here is the essence of my preferred configuration, with comments:

```elisp
(use-package minibuffer
  :ensure nil
  :config
  ;; Do not inform me about the default keybindings to select a
  ;; candidate.
  (setq completion-show-help nil)

  ;; Do not print messages in the echo area that pertain to
  ;; completion---those are distracting.
  (setq completion-show-inline-help nil)

  ;; Show useful annotations in various minibuffer prompts (though the
  ;; `marginalia' package greatly improves this).
  (setq completions-detailed t)

  ;; Do not use rows and columns for completions: a single vertical
  ;; list is easier to follow.
  (setq completions-format 'one-column)

  ;; Put an upper limit to the Completions window, so that it does not
  ;; disorient me.
  (setq completions-max-height 12)

  ;; Rely on previous inputs to surface candidates towards the top of
  ;; the list (enable the built-in `savehist-mode' to persist
  ;; history).
  (setq completions-sort 'historical)

  ;; Show the Completions buffer if I hit TAB but there is no unique match yet.
  (setq completion-auto-help t)

  ;; Never switch to the Completions buffer when I type TAB, because I
  ;; want to select candidates while the minibuffer is still in focus,
  ;; per `minibuffer-visible-completions'.  This has the advantage of
  ;; auto-updating the completions as I type.
  (setq completion-auto-select nil
        minibuffer-visible-completions t)

  ;; Those two are also relevant for the `completion-category-overrides', which I
  ;; cover elsewhere in this article.
  (setq completion-eager-display t)
  (setq completion-eager-update t))
```

<a id="org5532eef"></a>

## The `completion-category-overrides` for maximum control

The user option `completion-category-overrides` is for those power users who demand complete control of how the completions behave. Concretely, we target the metadata key of the `completion-category` to tell Emacs which `completion-styles` and other settings to use specifically for it. For example, we might want to have something like this:

```elisp
;; Pattern-matching styles to interpret our input in every context.
(setq completion-styles '(basic substring initials flex))

;; An exception to the above for the `file' category, where we
;; specifically want to use the `partial-completion' style:
(setq completion-category-overrides
      '((file . ((styles partial-completion)))))
```

<a id="org290e045"></a>

### How to find the completion category

I am not aware of a built-in way to do this, so I have my own function:

```elisp
(defun prot-common-completion-category ()
  "Return completion category."
  (when-let* ((window (active-minibuffer-window)))
    (with-current-buffer (window-buffer window)
      (completion-metadata-get
       (completion-metadata (buffer-substring-no-properties
                             (minibuffer-prompt-end)
                             (max (minibuffer-prompt-end) (point)))
                            minibuffer-completion-table
                            minibuffer-completion-predicate)
       'category))))
```

To use this, you need to enable recursive minibuffers, which means that you want to be able to bring up a new minibuffer prompt that will affect the one that was already open. Here are the settings I use for that:

```elisp
(use-package minibuffer
  :ensure nil
  :config
  (setq read-minibuffer-restore-windows nil)
  (setq enable-recursive-minibuffers t)
  (minibuffer-depth-indicate-mode 1))
```

With that in place, whenever you want to know the completion category of a prompt, focus the minibuffer and type `M-:` (`eval-expression`). In the new prompt input `(prot-common-completion-category)` and press `RET`. In the echo area you will either get `nil` or the symbol of the category.

[ We can, of course, do this differently such as by defining a command that we bind to a key to ultimately copy the completion category to the `kill-ring`, but I wanted to keep it generic. ]

Now you can write more entries for the `completion-category-overrides`.


<a id="orgb29882c"></a>

### Completion categories and all the other `completion-metadata`

When we modify the `completion-category-overrides` we can set the variable `completion-styles` as well as every single function specified by the documentation of function `completion-metadata`. Here is the anatomy of an override:

```
(CATEGORY . ((styles STYLES)
             (eager-update . BOOLEAN)
             (eager-display . BOOLEAN)
             (group-function . GROUP-FN)
             (annotation-function . ANNOTATION-FN)
             (affixation-function . AFFIXATION-FN)
             (display-sort-function . SORT-FN)))
```

-   `STYLES` is one or more `completion-styles`.
-   `BOOLEAN` is `nil` or `t`.
-   `*-FN` are functions as explained by `completion-metadata`.

A concrete yet basic example, with comments:

```elisp
;; To set `eager-display' and `eager-update' in the overrides, we need
;; to have these variables configured accordingly:
(setq completion-eager-display 'auto
      completion-eager-update 'auto)

(setq completion-category-overrides
      '((file . ((styles partial-completion)
                 ;; Do not automatically pop up the Completions buffer
                 ;; because, for example, we have private files we do
                 ;; not want to show while doing a live stream.
                 (eager-display . nil)
                 ;; But if the Completions buffer is already
                 ;; displayed, do update it as you type.
                 (eager-update . t)))
        ;; For buffers we do not care about showing them, so display
        ;; them outright and automatically update them as you type.
        (buffer . ((eager-display . t)
                   (eager-update . t)))
        ;; For this I want the completion styles to either be
        ;; interpreted as a prefix or a substring, but I do not want,
        ;; for example, the flex style here. And then I want the same
        ;; behaviour as for the buffer category.
        (imenu . ((styles basic substring)
                  (eager-display . t)
                  (eager-update . t)))))
```

And here is an advanced example with all the custom functions:

```elisp
(defun prot-minibuffer-file-group (file transform)
  "Return FILE group name unless TRANSFORM is non-nil."
  (cond
   ;; Here we have the power to completely change how candidates look
   ;; under a group, such as to remove a prefix. But I just want the
   ;; group title and otherwise want to keep the candidates as they
   ;; are by default.
   (transform file)
   ;; Create a group for directories and give it the group title
   ;; "Directories".
   ((string-suffix-p "/" file) "Directories")
   ;; Create a group for dotfiles and give it the group title
   ;; "Hidden files".
   ((string-prefix-p "." file) "Hidden files")
   ;; Then group every other file by its file extension and name the
   ;; corresponding group like ".org", ".txt.", and so on.
   ((when-let* ((extension (file-name-extension file :include-dot))
                (_ (not (string-blank-p extension))))
      extension))
   ;; In every other case, just group the candidates under the "Other"
   ;; heading.
   (t "Other")))

(defun prot-minibuffer-file-sort (files)
  "Sort FILES to have directories first and the rest alphabetically.
Omit the .. directory from FILES."
  ;; Remove the implicit files from the candidates.
  (setq files (delete "../" files))
  ;; Sort them alphabetically.
  (setq files (minibuffer-sort-alphabetically files))
  ;; Now put the directories before the rest.
  (let ((directory-p (lambda (file) (string-suffix-p "/" file))))
    (nconc (seq-filter directory-p files)
           (seq-remove directory-p files))))

;; To set `eager-display' and `eager-update' in the overrides, we need
;; to have these variables configured accordingly:
(setq completion-eager-display 'auto
      completion-eager-update 'auto)

(setq completion-category-overrides
      '((file . ((styles partial-completion)
                 (eager-display . nil)
                 (eager-update . t)
                 ;; I am not including examples for the annotation and
                 ;; affixation functions because those are more
                 ;; involved and you anyway get the point.
                 (group-function . prot-minibuffer-file-group)
                 (display-sort-function . prot-minibuffer-file-sort)))
        (buffer . ((eager-display . t)
                   (eager-update . t)))
        (imenu . ((styles basic substring)
                  (eager-display . t)
                  (eager-update . t)))))
```

<a id="orgbc5c84f"></a>

## The default completions and related packages

The modern stack is `vertico`, `marginalia`, `orderless`, `embark`, and `consult`.

The default completion interface can be used instead of the `vertico` package. Though you can still benefit from `marginalia`, `orderless`, `embark`, and `consult`.

If you really want to customise everything extensively through the `completion-category-overrides`, then you can skip `marginalia` and maybe even get `completion-styles` that are still good enough without `orderless`.

But there still is no built-in alternative for the powerful `embark` and `consult` packages, so plan accordingly. Granted, you can be productive without `embark` and `consult`, but the advantage of those packages is that they make it easier to achieve those same tasks (plus extra features).
