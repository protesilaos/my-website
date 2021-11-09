---
title: 'Make the Emacs Diary work as an Outline (outline-minor-mode)'
excerpt: 'A simple setup to make the Emacs Diary use foldable headings with outline-minor-mode.'
---

If you are new to the topic of the Emacs Diary and the Calendar, please
refer to yesterday's video introduction:
<https://protesilaos.com/codelog/2021-04-14-emacs-diary-calendar/>.

One of the major upsides of the Emacs Diary is that it is a regular file
that you can navigate using whatever tools you like: Isearch and `M-x
occur`, Swiper or `consult-line`, and the like.  It also is possible to
extend it so that it uses the foldable headings that are familiar to
users of Org mode; a feature that comes from `outline-mode`.  We can add
that to any major mode by means of `outline-minor-mode`.

To make the outline work, we need to specify a pattern of what
constitutes a heading within the file.  This is controlled by the
buffer-local variable `outline-regexp`.  The best candidate for headings
is the Diary's own comments.  It feels natural for users of Elisp to set
those to `;;`, so we have this:

```elisp
(setq diary-comment-start ";;")
(setq diary-comment-end "")
```

Then we need to write the pattern for the headings.  I prefer that
heading levels start with at least three semicolons and a space, which
lets us still use comments for their intended purpose (the same way it
is in `elisp-mode`):

```elisp
;; The pattern evaluates to ";;+\\{2,\\} [^ \t\n]"
(setq outline-regexp (format "%s+\\{2,\\} [^ \t\n]" diary-comment-start))
```

We can test our pattern in a new buffer with `M-x re-builder` and some
text samples:

```
;; A regular comment.  This should not be matched.

;;; A heading level 1
;;;; A heading level 2
;;;;; A heading level 3
```

Now that we got everything in order, we just need to integrate with with
`diary-mode`:

```elisp
(defun my-diary-extras-setup ()
  "Additional setup for Diary mode buffers."
  (when (derived-mode-p 'diary-mode)
    (setq outline-regexp (format "%s+\\{2,\\} [^ \t\n]" diary-comment-start))))

(add-hook 'diary-mode-hook #'my-diary-extras-setup)
```

Next time we access the `diary-file` and `diary-mode` gets enabled, we
will get headings function the way we want.  It then is up to you to
specify the key bindings you want to make navigating the outline easier.
For example:

```elisp
(with-eval-after-load 'outline
  (let ((map outline-minor-mode-map))
    (define-key map (kbd "C-c C-n") 'outline-next-visible-heading)
    (define-key map (kbd "C-c C-p") 'outline-previous-visible-heading)
    (define-key map (kbd "C-c C-f") 'outline-forward-same-level)
    (define-key map (kbd "C-c C-b") 'outline-backward-same-level)
    (define-key map (kbd "C-c C-u") 'outline-up-heading)
    (define-key map (kbd "C-c C-a") 'outline-show-all)
    (define-key map (kbd "C-c C-v") 'outline-move-subtree-down)
    (define-key map (kbd "C-c M-v") 'outline-move-subtree-up)
    (define-key map (kbd "<C-tab>") 'outline-cycle))) ; This is from Emacs28
```

Finally we need to enable `outline-minor-mode`:

```elisp
(add-hook 'diary-mode-hook #'outline-minor-mode)
```

Or `M-x outline-minor-mode`.

With those in place, we have set the foundations to make the Diary
buffer very easy to navigate, all while retaining its overall
simplicity.  I am using Daniel Mendler's `consult` library, which
includes the `consult-outline` command (among many others): it lets you
jump to a heading using minibuffer completion and requires no extra
setup the way the built-in `imenu` does (though Imenu is also great in
its own right).

Personally, I also change the fontification of the Diary buffer, but
will not bother you with the technicalities.  Please refer to my
dotemacs instead: <https://protesilaos.com/emacs/dotemacs> (specifically the
section [Calendar and Diary (and
prot-diary.el)](https://protesilaos.com/emacs/dotemacs/#h:b4040bc0-7a2a-4f17-824d-42de621bd1b9)).
