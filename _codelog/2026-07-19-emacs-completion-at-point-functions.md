---
title: "Emacs: Completion in the buffer with completion-at-point-functions"
excerpt: "In this video I explain how in-buffer completion works and what are the packages for interacting with such completions."
layout: vlog
mediaid: "x3rqjpNm3e0"
---

In this ~22-minute video I explain how Emacs performs completion in a
buffer. I cover what happens behind the scenes with the variable
completion-at-point-functions. Then I also go to the frontends, which
affects the modalities of interaction. I cover t built-in
Completions buffer, the packages Corfu and Company, and the built-in
completion-preview-mode. Finally, I comment at some further length on
how to control the grouping of results in the
completion-at-point-functions. In that context I also mention the Cape
package, as well as some extra functionality that the Company package
provide. I wrote an article which covers all of what is in the video
as well as code samples. Its text is below.

## Table of Contents

1.  [Make `TAB` complete when it can](#org423cf05)
2.  [The in-buffer completion backends (`completion-at-point-functions`)](#org600a610)
    1.  [Common providers of CAPFs](#orgff700e2)
3.  [The completion frontends](#org2bc4069)
    1.  [Corfu for an in-buffer completion popup window](#orgf435e66)
        1.  [My preferred `corfu` setup plus `cape`](#org74094c3)
    2.  [Company for an in-buffer completion popup window](#orgfd63733)
        1.  [My preferred Company setup](#org2338c9d)
    3.  [The built-in `completion-preview-mode` for a minimalist single suggestion at a time](#org8a380be)
        1.  [My preferred setup for `completion-preview-mode`](#org3eeaf41)



<a id="org423cf05"></a>

## Make `TAB` complete when it can

By default, Emacs uses `TAB` to align the current line or selected
region of text. It does so based on the relevant rules provided by the
major mode (e.g. a programming mode may have specific requirements for
how the body of a function definition is indented).

We can tell Emacs to also use `TAB` to perform completion once no
further alignment is possible in the given context.

```elisp
(setq tab-always-indent 'complete)
```

<a id="org600a610"></a>

## The in-buffer completion backends (`completion-at-point-functions`)

The `completion-at-point-functions` is a variable (technically an
abnormal hook) that takes as its value a list of functions. We can
call those "CAPFs", for "completion at point functions". Those are
used to perform completion in the buffer, with the text right before
the cursor as their input.

When we request completion for the text at point, either via `TAB` or
the command `completion-at-point` (`C-M-i` by default), Emacs looks at
the value of the `completion-at-point-functions`, and calls the
functions found there in order from first to last (or left to right).

Normally, once a function returns results, Emacs will display those
and will not move to the remaining functions in the
`completion-at-point-functions`. So if we have many functions, we may
not see of them at once. To do so we need more advanced solutions,
which I comment on further below.

The `completion-at-point-functions` typically has a buffer-local
value. This means that the functions we run in one buffer will likely
be different than what we have in another buffer. For example, in a
programming mode it makes sense to use the Language Server Protocol to
get comprehensive suggestions for the language we are programming in,
whereas in Org mode we may only wish to see the correct spelling of a
word.

When the `completion-at-point-functions` has a buffer-local value, it
will typically include a `t`. This is a reference to its corresponding
global value. So if Emacs tries to complete and reaches the `t`, it
then goes through the list with the global CAPFs.


<a id="orgff700e2"></a>

### Common providers of CAPFs

-   specialised minor modes;
-   the major mode;
-   the Language Server Protocol via its Emacs client (e.g. `eglot` or `lsp-mode`);
-   the `cape` package;
-   the `company` package;
-   other packages that may extend `company` or related.


<a id="org2bc4069"></a>

## The completion frontends

For a few years now Emacs has a unified infrastructure at its core for
how completions are done. Users should not mess around with that. What
they can do instead is choose how the completions are displayed as
well as the relevant modalities for filtering and selecting
candidates.


<a id="orgf435e66"></a>

### Corfu for an in-buffer completion popup window

A package by Daniel Mendler, the developer of `vertico` and `consult`,
among others, which is built on top of the
`completion-at-point-functions`. It is designed to be fast and
effective, with a good out-of-the-box experience and reasonable
extensions.

By default, `corfu` does not automatically pop up its window. Users
must manually invoke completion or opt in to the auto-completing
functionality.

```elisp
;; Read the comprehensive documentation of Corfu for further customisation options.
(use-package corfu
  :ensure t
  :init
  (setq tab-always-indent 'complete)
  :config
  ;; ;; If you want the popup window to appear automatically as you type:
  ;;
  ;; (setq corfu-auto t)
  (global-corfu-mode 1))
```

<a id="org74094c3"></a>

#### My preferred `corfu` setup plus `cape`

This is just for your information. It fits my use-case, but I do not
recommend it as a starting point. The `cape` package is also developed
by Daniel Mendler.

```elisp
(use-package corfu
  :ensure t
  :init
  (setq tab-always-indent 'complete)
  :config
  (setq corfu-preview-current nil)
  (setq corfu-min-width 20)

  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1) ; shows documentation after `corfu-popupinfo-delay'

  (global-corfu-mode 1)

  ;; I also have (setq tab-always-indent 'complete) for TAB to complete
  ;; when it does not need to perform an indentation change.
  (define-key corfu-map (kbd "<tab>") #'corfu-complete)

  ;; Sort by input history (no need to modify `corfu-sort-function').
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)))

(use-package cape
  :ensure t
  :after corfu
  :config
  ;; This is for the global value.
  (setq completion-at-point-functions '(cape-dabbrev cape-file))

  (defun prot/cape-super-set-local (capfs &optional individual-capfs)
    "Set `completion-at-point-functions' to current value plus CAPFS.
Treat CAPFS and the default value as a super CAPF.  Then append the
INDIVIDUAL-CAPFS to the list."
    (let* ((all-for-super (append completion-at-point-functions capfs))
           (all-minus-global (delq t all-for-super))
           (cape-super (apply #'cape-capf-super all-minus-global)))
      (setq-local completion-at-point-functions (append (list cape-super) individual-capfs (list t)))))

  (defun prot/cape-prog-setup ()
    "Set up Cape for programming."
    (prot/cape-super-set-local '(cape-dabbrev) '(cape-file)))

  (add-hook 'prog-mode-hook #'prot/cape-prog-setup)

  (defun prot/cape-text-setup ()
    "Set up Cape for prose."
    (prot/cape-super-set-local '(cape-dict cape-dabbrev cape-emoji) '(cape-file)))

  (add-hook 'text-mode-hook #'prot/cape-text-setup))
```

<a id="orgfd63733"></a>

### Company for an in-buffer completion popup window

This package by Dmitry Gutov is older than `corfu` though remains in
active development and has all the features of Corfu plus some extras.
Fundamentally though, it does the same thing, so if you are already
using one there is no pressing need to switch to the other.

As of this writing (2026-07-19), `company` version `1.1.0` is still in
development. It comes with many nice features, such as native support
for `tab-always-indent`, child frames, and in-buffer completion in the
minibuffer.

By default, and unlike `corfu`, Company automatically pops up its
window. You can opt out if you wish to.

```elisp
;; Remember to read the comprehensive documentation of Company for all
;; the customisation options and extra features.
(use-package company
  :ensure t
  :init
  (setq tab-always-indent 'complete)
  :config
  (global-company-mode 1))
```

<a id="org2338c9d"></a>

#### My preferred Company setup

The `company` includes several CAPFs, unlike `corfu` which spins them
out into the separate `cape` pacakge. Company CAPFs can easily be
grouped to collect the results of many functions into a single popup
window.

This is what I am currently using. Again, I am sharing it for your
information and do not meant to imply that it is useful in general.

```elisp
(use-package company
  :ensure t
  :init
  (setq tab-always-indent 'complete)
  :config
  ;; NOTE 2026-07-19 with the next version of Company, which may be
  ;; 1.1.0, (setq tab-always-indent 'complete) is supported
  ;; out-of-the-box, which means that we disable the automatic popup
  ;; feature and rely on TAB to perform completion in the buffer.
  (setq company-idle-delay nil)

  (setq company-tooltip-limit 6)
  (setq company-tooltip-minimum-width 25)
  (setq company-tooltip-align-annotations t)
  (setq company-dabbrev-code-completion-styles t) ; use the `completion-styles'

  (setq company-transformers '(company-sort-by-occurrence
                               company-sort-by-backend-importance
                               company-sort-prefer-same-case-prefix))

  (setq company-frontends '(company-childframe-unless-just-one-frontend
                            company-preview-if-just-one-frontend
                            company-echo-metadata-frontend))

  ;; Notice the `(company-capf company-dabbrev)', which represents a
  ;; grouping of CAPFs, whereas `company-files' shows results of its own.
  (setq company-backends '((company-capf company-dabbrev) company-files))

  ;; IGNORE THIS AS IT IS RELEVANT ONLY FOR MY CONFIGURATION which
  ;; does a lot with the `display-buffer-alist'.
  (define-advice company-show-doc-buffer (:around (&rest args) prot)
    (let ((help-window-select nil)
          (display-buffer-alist nil)
          (display-buffer-overriding-action
           '((display-buffer-reuse-mode-window display-buffer-below-selected)
             (window-height . 0.3)
             (post-command-select-window . nil))))
      (apply args)))

  (defun prot/company-prog-backends ()
    "Set `company-backends' locally to my preferred value for `prog-mode' and derivatives."
    (setq-local company-backends '((company-capf company-dabbrev-code) company-files)))

  (add-hook 'prog-mode-hook #'prot/company-prog-backends)

  (defun prot/company-text-backends ()
    "Set `company-backends' locally to my preferred value for `text-mode' and derivatives."
    (setq-local company-backends '((company-dabbrev company-ispell company-capf) company-files)))

  (add-hook 'text-mode-hook #'prot/company-text-backends)

  (global-company-mode 1))

(use-package company-statistics
    :ensure t
    :after company
    :config
    (company-statistics-mode 1))
```

<a id="org8a380be"></a>

### The built-in `completion-preview-mode` for a minimalist single suggestion at a time

Since Emacs 30, there is the `completion-preview-mode` by Eshel Yaron.
Unlike the other options, it displays only one suggestion at a time.
It does it inline as you type. You can still cycle through suggestions
or display more of them with either the default `*Completions*` buffer
or one of the aforementioned packages.

Note that Company also has the equivalent of
`completion-preview-mode`. Check the `company-frontends` for more.

`completion-preview-mode` does not provide its own CAPFs directly or
through some companion package. You will have to use one of the
previous options or simply rely on what other providers (major modes,
LSP, &hellip;) give you.

```elisp
;; Do M-x describe-package and then search for completion-preview to
;; read its commentary, or M-x find-library and then
;; completion-preview to go straight to its source code (where you can
;; read the commentary and browse through all the options).
(use-package completion-preview
  :ensure nil
  :config
  (global-completion-preview-mode 1))
```

<a id="org3eeaf41"></a>

#### My preferred setup for `completion-preview-mode`

And here is what I have for this minor mode. Again, it is only for
your information.

```elisp
(use-package completion-preview
  :ensure nil
  :demand t
  :bind
  ( :map completion-preview-active-mode-map
    ("M-n" . completion-preview-next-candidate)
    ("M-p" . completion-preview-prev-candidate)
    ("M-<return>" . completion-preview-insert)
    ;; This way you can combine it with another interface (like the
    ;; generic Completions buffer or `corfu-mode') to display more
    ;; candidates.
    ("<tab>" . completion-preview-complete))
  :config
  (setq completion-preview-exact-match-only nil)
  (setq completion-preview-commands '(self-insert-command
                                      insert-char
                                      analyze-text-conversion
                                      completion-preview-insert-word))
  (setq completion-preview-minimum-symbol-length 2)
  (setq completion-preview-idle-delay 0.3)
  (setq completion-preview-ignore-case t)
  (setq completion-preview-sort-function #'identity)

  (global-completion-preview-mode 1))
```
