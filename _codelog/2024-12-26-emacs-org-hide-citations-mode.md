---
title: "Emacs: tone down Org citations on demand"
excerpt: "A video demonstration of how I tone down Org citations using some custom code I wrote. I share the code and its annotated version."
layout: vlog
mediaid: "X3fEO1_QDHA"
---

This is a short video demonstration of how I tone down Org citations using some custom code I wrote. I share the code and its annotated version. See the following two sections.

## The code without any commentary

The annotated version is in the next section.

```elisp
(defvar prot-org-cite-regexp
  "\\(?1:cite: ?\\)?\\(?2:@\\)\\(?:[a-z]+\\)\\(?3:.*?\\)\\(?:[0-9]\\{4,\\}\\)\\(?:[a-z]\\)?"
  "Regular expression matching an Org citation.
Groups 1, 2, and 3 are meant to be hidden when the minor mode
`prot-org-cite-mode' is enabled.")

(defun prot-org-cite-add-overlays ()
  "Add invisible overlays to `prot-org-cite-regexp' numbered groups."
  (let ((case-fold-search nil))
    (save-restriction
      (widen)
      (goto-char (point-min))
      (while (re-search-forward prot-org-cite-regexp nil t)
        (dotimes (n 4)
          (unless (= n 0)
            (when-let* ((beg (match-beginning n))
                        (end (match-end n))
                        (overlay (make-overlay beg end)))
              (overlay-put overlay 'invisible t)
              ;; NOTE: I am not using the `after-string' in this case,
              ;; but am adding here as it is a useful paradigm in
              ;; general.
              ;;
              ;; (overlay-put overlay 'after-string "")
              (overlay-put overlay 'prot-org-cite-overlay t))))))))

(defun prot-org-cite-remove-overlays ()
  "Remove all `prot-org-cite-overlay' overlays from the current buffer."
  (when-let* ((overlays (save-restriction
                          (widen)
                          (overlays-in (point-min) (point-max))))
              (our-overlays (seq-filter
                             (lambda (overlay)
                               (overlay-get overlay 'prot-org-cite-overlay))
                             overlays)))
    (mapc #'delete-overlay our-overlays)))

(defface prot-org-cite '((t :inherit shadow))
  "Face for Org citations when `prot-org-cite-mode' is enabled.")

(defvar-local prot-org-cite-face-remap-object nil
  "Object of `face-remap-add-relative' for `prot-org-cite'.")

(defun prot-org-cite-remap-face (&optional unmap)
  "Remap the `org-cite-key' face to `prot-org-cite'.
With optional UNMAP, undo the remapping."
  (if unmap
      (progn
        (face-remap-remove-relative prot-org-cite-face-remap-object)
        (setq-local prot-org-cite-face-remap-object nil))
    (setq-local prot-org-cite-face-remap-object
                (face-remap-add-relative 'org-cite-key 'prot-org-cite))))

(define-minor-mode prot-org-cite-mode
  "Partially hide Org citations and style them with `prot-org-cite'.
More specifically, hide groups 1, 2, and 3 of `prot-org-cite-regexp'."
  :global nil
  (if prot-org-cite-mode
      (progn
        (prot-org-cite-add-overlays)
        (prot-org-cite-remap-face))
    (prot-org-cite-remove-overlays)
    (prot-org-cite-remap-face :unmap-the-face)))
```

## Annotated version of `prot-org-cite-mode`

```elisp
;; This defines the `prot-org-cite-regexp' variable.  Its value is a
;; regular expression (Emacs Lisp).  The official manual of Emacs
;; covers the technicalities.  You will notice that we number some the
;; groups.  They are the ones we care about.  The rest are ignored.
;;
;; We can use the command `re-builder' to test our Emacs Lisp regular
;; expression in the current buffer.
(defvar prot-org-cite-regexp
  "\\(?1:cite: ?\\)?\\(?2:@\\)\\(?:[a-z]+\\)\\(?3:.*?\\)\\(?:[0-9]\\{4,\\}\\)\\(?:[a-z]\\)?"
  "Regular expression matching an Org citation.
Groups 1, 2, and 3 are meant to be hidden when the minor mode
`prot-org-cite-mode' is enabled.")

;; Here we define a function that overlays.  An "overlay" is an object
;; that covers a certain region in the buffer.  A "region" is the
;; space between two buffer positions.  Overlays have a number of
;; uses.  The one we are interested in here is to make their regions
;; invisible, thus hiding the affected text.
(defun prot-org-cite-add-overlays ()
  "Add invisible overlays to `prot-org-cite-regexp' numbered groups."
  ;; For the purposes of this operation, we want to make sure that our
  ;; search is case-sensitive.  We thus `let' bind the `case-fold-search'
  ;; variable to a nil value.  Otherwise, our results will depend on the
  ;; user's configuration.
  (let ((case-fold-search nil))
    ;; We want to operate in the entire buffer.  But the user may have
    ;; already narrowed to a portion thereof.  To respect their choice
    ;; while still doing the right thing, we have to wrap our code in
    ;; `save-restriction' and then `widen' the view.  This means that
    ;; our subsequent calls will run in the unnarrowed buffer and the
    ;; narrowing will be restored once we are done.
    (save-restriction
      (widen)
      ;; We start from the minimum visible position in the buffer.
      ;; Since we widened the view in the previous line of code, this
      ;; is the beginning of the buffer.  Otherwise, it would have
      ;; been the beginning of the narrowed portion of the buffer.
      (goto-char (point-min))
      ;; Starting from the top, we perform a search forward for the
      ;; `prot-org-cite-regexp'.  We do this in a loop.  The loop
      ;; works (i.e. is not infinite) because (i) the search has the
      ;; side effect of moving the point to the end of the match so
      ;; the search does not get stuck in one place, and (ii) we pass
      ;; the relevant argument to `re-search-forward' to return nil if
      ;; there is no match, instead of throwing an error.  The loop
      ;; only runs when its condition is non-nil.
      (while (re-search-forward prot-org-cite-regexp nil t)
        ;; Here I had to make a stylistic decision.  We want to add
        ;; overlays for the three numbered groups in our regular
        ;; expression.  I could have arranged to do this with another
        ;; `while', which would have its own local counter, but I
        ;; thought it would make the code a bit harder to read for our
        ;; purposes here.  So I am using `dotimes' instead, whose
        ;; semantics are in line with what we are doing, i.e. run
        ;; something N times.  The part about `dotimes' that I do not
        ;; like is that it starts from 0 and its maximum number is
        ;; exclusive, meaning that we only get up to 3 even though we
        ;; have the 4 there.  Someone who is not familiar with this
        ;; behaviour will thus find the following perplexing.
        (dotimes (n 4)
          ;; The group 0 in a regular expression is a special number
          ;; which refers to the entire match.  We do not want to do
          ;; anything with that.  We only care about numbers 1, 2, 3.
          ;; Thus, the first run of this `dotimes' does nothing other
          ;; than increment 0 to 1 and run again.
          (unless (= n 0)
            ;; Before we start adding our overlays, we need to be sure
            ;; that there is a match for the Nth group in our regular
            ;; expression.  If there is none, we skip it and move on
            ;; with our loop.  If there is a match, then we store its
            ;; beginning and end positions and then make an overlay
            ;; that stretches between those two.
            (when-let* ((beg (match-beginning n))
                        (end (match-end n))
                        (overlay (make-overlay beg end)))
              ;; Now that we have created our overlay, we are ready to
              ;; associated properties with it.  These are symbols
              ;; that may already have an internal meaning, such as
              ;; `invisible' or arbitrary symbols that we can use for
              ;; our own purposes later.  Each time we set a property,
              ;; we specify its value.  In principle, we could have a
              ;; fine-grained system with different values, though all
              ;; we need here is something that returns non-nil.
              (overlay-put overlay 'invisible t)
              ;; I keep the `after-string' overlay property here for
              ;; this demonstration.  We do not need it, though it is
              ;; how we can add an arbitrary string in the stead of
              ;; the text we made invisible (think of how Org folds
              ;; its headings, for example).
              ;;
              ;; (overlay-put overlay 'after-string "")

              ;; Finally, we want to make our overlays have a unique
              ;; property that allows us to identify them later.  I
              ;; have called this `prot-org-cite-overlay', though it
              ;; has no inherent meaning.  What matters is that it is
              ;; unambiguously ours and that it has a non-nil value.
              (overlay-put overlay 'prot-org-cite-overlay t))))))))

;; This is the function which reverts `prot-org-cite-add-overlays'.
;; You will notice the same pattern of `save-restriction' for the
;; aforementioned reasons.
(defun prot-org-cite-remove-overlays ()
  "Remove all `prot-org-cite-overlay' overlays from the current buffer."
  (when-let* ((overlays (save-restriction
                          (widen)
                          (overlays-in (point-min) (point-max))))
              ;; Here we go through the whole list of overlays to
              ;; identify those which are ours.  Without this
              ;; filtering, we could/would cause something to break.
              (our-overlays (seq-filter
                             (lambda (overlay)
                               (overlay-get overlay 'prot-org-cite-overlay))
                             overlays)))
    ;; Now that we have found all our overlays, let us delete them.
    (mapc #'delete-overlay our-overlays)))

;; The default style for Org citations is like that of links.  In
;; general, this is fine though our mode is designed to tone down the
;; citations.  We thus define our custom face, which inherits from the
;; `shadow' face.  We will apply this in the buffer where `prot-org-cite-mode'
;; is enabled.
(defface prot-org-cite '((t :inherit shadow))
  "Face for Org citations when `prot-org-cite-mode' is enabled.")

;; The technicalities of how to apply a face instead of another are
;; covered by the function `face-remap-add-relative'.  Its return
;; value is a special object that we need to store, such that we can
;; remove it afterwards.  You will notice how this declaration of the
;; variable has the "local" specifier, meaning that `setq' is
;; functionally equivalent to `setq-local' (I still write the latter,
;; because I prefer the code to be more explicit about what it is
;; doing).
(defvar-local prot-org-cite-face-remap-object nil
  "Object of `face-remap-add-relative' for `prot-org-cite'.")

;; This function sets up the `face-remap-add-relative' that I
;; mentioned in the previous comment.  We could have defined a
;; separate function for undoing this effect, though I considered it
;; pertinent to demonstrate the use of optional parameters.  Anything
;; after the `&optional' defaults to nil if it is not supplied as an
;; argument.  So we can call the function without it, but we can also
;; furnish the argument if we need to.
;;
;; The UNMAP we define here does not treat its value specially.  Any
;; non-nil value will suffice.
(defun prot-org-cite-remap-face (&optional unmap)
  "Remap the `org-cite-key' face to `prot-org-cite'.
With optional UNMAP, undo the remapping."
  (if unmap
      (progn
        (face-remap-remove-relative prot-org-cite-face-remap-object)
        ;; As I noted before, the `defvar-local' makes it so that we do
        ;; not need to write `setq-local', as `setq' will do the same
        ;; thing.  I still prefer to be unambiguous.
        (setq-local prot-org-cite-face-remap-object nil))
    ;; In this call we see how the value of the variable
    ;; `prot-org-cite-face-remap-object' is set to the return value of
    ;; the `face-remap-add-relative' function call.  So we get the
    ;; side effect of the remap, while we also store the return value.
    (setq-local prot-org-cite-face-remap-object
                (face-remap-add-relative 'org-cite-key 'prot-org-cite))))

;; All we need to do now is put everything together.  Our minor mode
;; is, at its core, a simple toggle to do/undo our stylistic changes.
;; The :global keyword specifies whether our mode has effect across
;; all buffers, but ours is buffer-local because of the nil value we
;; specify.
(define-minor-mode prot-org-cite-mode
  "Partially hide Org citations and style them with `prot-org-cite'.
More specifically, hide groups 1, 2, and 3 of `prot-org-cite-regexp'."
  :global nil
  ;; What the `define-minor-mode' does behind the scenes is to define
  ;; an interactive function (a "command") and a variable that use the
  ;; same symbol, `prot-org-cite-mode' in this case.  There is no
  ;; clash, as Emacs has separate namespaces for functions and
  ;; variables.  Then, when we call the command it sets its
  ;; corresponding variable to a non-nil or nil value, so the rest of
  ;; our logic runs accordingly.
  (if prot-org-cite-mode
      ;; The `progn' is our way of saying "those multiple calls are a
      ;; bundle, so treat them as one".  This is necessary to write an
      ;; `if' statement (among others), because the THEN part has to
      ;; be one argument.  But the ELSE part does not need the `progn'
      ;; because of a special behaviour which automatically treats all
      ;; remaining arguments as a single list.  In Emacs Lisp
      ;; functions, this is achieved by the `&rest' keyword (well, the
      ;; `if' in particular does not use `&rest' because it is written
      ;; in C, though you will see that in plenty of places).
      (progn
        (prot-org-cite-add-overlays)
        (prot-org-cite-remap-face))
    (prot-org-cite-remove-overlays)
    ;; As I wrote in my commentary about the optional parameter of
    ;; `prot-org-cite-remap-face', it does not treat its value in any
    ;; special way.  What matters is for it to be non-nil.  In cases
    ;; like this one, I prefer to use a :KEYWORD, which can be any
    ;; arbitrary text: it always evaluates to itself, i.e. it is
    ;; non-nil (same for symbols, though a keyword in this context is
    ;; generally less ambiguous).
    (prot-org-cite-remap-face :unmap-the-face)))
```
