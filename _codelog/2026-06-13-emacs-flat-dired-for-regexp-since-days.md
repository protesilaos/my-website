---
title: "Emacs: flat Dired listing for REGEXP, optionally up to DAYS since last modification"
excerpt: "Two custom Dired commands I use to have flat listings of files inside of Emacs."
---

When we call `dired` from Lisp, we can pass it a list of files instead
of a directory. This gives us a fully fledged Dired buffer for those
files. My most common use-case is to produce flat listing, so that I
do not have to go searching in exactly which directory some file is
(e.g. in the Downloads folder there is some zip archive that I
downloaded with a bunch of files in a complex structure).

## A flat Dired listing

For a while now I have been using my own command to create a Dired
buffer from the current directory (which can always be updated on
demand with `M-x cd`). It is `prot-dired-search-flat-list`. Here is
the code:

```elisp
(defvar prot-dired-regexp-history nil
  "Minibuffer history of `prot-dired-regexp-prompt'.")

(defun prot-dired-regexp-prompt ()
  (let ((default (car prot-dired-regexp-history)))
    (read-regexp
     (format-prompt "Files matching REGEXP" default)
     default 'prot-dired-regexp-history)))

(defun prot-dired--get-files (regexp)
  "Return files matching REGEXP, recursively from `default-directory'."
  (directory-files-recursively default-directory regexp nil))

;;;###autoload
(defun prot-dired-search-flat-list (regexp)
  "Return a Dired buffer for files matching REGEXP.
Perform the search recursively from the current directory."
  (interactive (list (prot-dired-regexp-prompt)))
  (if-let* ((files (prot-dired--get-files regexp))
            (relative-paths (mapcar #'file-relative-name files)))
      (dired (cons (format "prot-flat-dired for `%s'" regexp) relative-paths))
    (error "No files matching `%s'" regexp)))
```

I could modify `prot-dired-search-flat-list` to also prompt for a
directory, though I optimise for the common workflow of operating from
where I am (and I generally do not like overloading the `C-u` with
special cases that I will never remember---a new command with a name I
can search for is better).

## Flat listing limited to last modified since DAYS

Yesterday I had the need to browse a massive directory, but only
wanted to get a couple of files out of it. I realised that I had to
filter my last modified, so I extended my above use-case with the new
command `prot-dired-search-flat-list-since-days`. Here is what I came
up with:

```elisp
(defvar prot-dired-days-prompt-history nil
  "Minibuffer history for `prot-dired-days-prompt'.")

(defun prot-dired-days-prompt ()
  "Prompt for days and return them as a number."
  (let* ((first (car prot-dired-days-prompt-history))
         (default (when (stringp first)
                    (string-to-number first))))
    (read-number "Number of days: " default 'prot-dired-days-prompt-history)))

(defun prot-dired--get-last-modified (files days)
  "Return list of FILES last modified since DAYS."
  (seq-filter
   (lambda (file)
     (and-let* ((attributes (file-attributes file))
                (last-modified (nth 5 attributes))
                (last-modified-seconds (time-to-seconds last-modified))
                (current-time (current-time))
                (current-time-seconds (time-to-seconds current-time))
                (delta-seconds (* days 24 60 60))
                (oldest-seconds (- current-time-seconds delta-seconds))
                (_ (>= last-modified-seconds oldest-seconds)))))
   files))

;;;###autoload
(defun prot-dired-search-flat-list-since-days (regexp days)
  "Return Dired buffer with files matching REGEXP up to DAYS since last modification.
Perform the search recursively from the current directory."
  (interactive
   (list
    (prot-dired-regexp-prompt)
    (prot-dired-days-prompt)))
  (if-let* ((files (prot-dired--get-files regexp)))
      (if-let* ((files-filtered (prot-dired--get-last-modified files days))
                (relative-paths (mapcar #'file-relative-name files-filtered)))
          (dired (cons (format "prot-flat-dired since %d days for `%s'" days regexp) relative-paths))
        (error "No files last modified within the last %d days" days))
    (error "No files matching `%s'" regexp)))
```

Note that I always design my minibuffer prompts to have their own
history, because then I only get relevant entries when I press `M-p`
(`previous-history-element`) and `M-n` (`next-history-element`) at the
prompt (and the built-in `savehist-mode` takes care to persist those).

Everything is part of my Emacs configuration: <https://protesilaos.com/emacs/dotemacs>.
I will not be updating this article, so make sure to check for any
further refinements there.
