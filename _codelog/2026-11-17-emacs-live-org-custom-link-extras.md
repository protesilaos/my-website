---
title: "Emacs live Org custom link type and more today 2026-11-17 at 16:00 Europe/Athens"
excerpt: "I will develop some new functionality for my init.el. The final code will be on my website."
layout: vlog
mediaid: "Lb1WfF4iRNA"
---

[ The stream will be recorded. You can watch it later. ]

Today I will implement some new features for my Emacs configuration. I
will include the final code on my website, as an update to this publication.

As usual, I will keep the chat open and shall answer all questions.

**UPDATE 2026-11-17 18:52 +0200:** Pasting the code.

**UPDATE 2026-11-17 19:24 +0200:** I forgot the `prot-text` part.

## The code I wrote during the livestream

### Custom Org link types

```elisp
;;;; Custom link types

(defcustom prot-org-grep-directory "/tmp/testing/"
  "Directory where prot-grep links search in with `rgrep'."
  :type 'directory)

(defun prot-org-grep-follow (query &rest _)
  "Use QUERY to `rgrep' the `prot-org-grep-directory'."
  (let* ((current-file (file-name-nondirectory buffer-file-name))
         (grep-find-ignored-files (append (list current-file) grep-find-ignored-files))
         (heading (format "\\*[\s\t]+.*%s" (regexp-quote query))))
    ;; TODO 2026-11-17: Refine the FILES argument.
    (rgrep heading ".*" prot-org-grep-directory nil)))

(defvar prot-org-grep-complete-history nil
  "Minibuffer history for `prot-org-grep-complete'.")

(defun prot-org-grep-complete (&rest _)
  "Complete prot-grep link types using `prot-org-grep-complete-history'."
  (let* ((default (car prot-org-grep-complete-history))
         (input (completing-read
                 (format-prompt "Text to search in `prot-org-grep-directory'" default)
                 prot-org-grep-complete-history nil nil nil
                 'prot-org-grep-complete-history default)))
    (format "prot-grep:%s" input)))

(defun prot-org-grep-export (query &rest _)
  "Export prot-grep link types."
  (format "[ Prot Grep for: %s ]" (or query "")))

(defface prot-org-grep-link
  '((t :inherit success :underline t))
  "Face for prot-grep link type links.")

(org-link-set-parameters
 "prot-grep"
 :follow #'prot-org-grep-follow
 :complete #'prot-org-grep-complete
 :export #'prot-org-grep-export
 :face 'prot-org-grep-link)

;;;###autoload
(defun prot-org-grep-insert (query)
  "Insert prot-grep link for QUERY.
When called interactively, prompt for QUERY.  Else QUERY is a string."
  (interactive (list (prot-org-grep-complete)))
  (when (or (null query)
            (string-blank-p query))
    (error "The QUERY cannot be nil or an empty string"))
  (insert (format "[[prot-grep:%s]]" query)))

;; TODO 2026-11-17: I want to add an "until" logic.
(defvar prot-org-meetings-link-regexp
  "\\`\\([A-Za-z]+\\) since \\([0-9]\\{,4\\}-[0-9]\\{,2\\}-[0-9]\\{,2\\}\\)"
  "Regular expression for the contents of prot-meetings links.")

(defun prot-org-meetings-sort (entries)
  "Sort the ENTRIES from oldest to newest.
ENTRIES is a list of plists of the following form:

    (list
     :heading HEADING
     :text TEXT
     :time HEADING-TIME-OBJECT)"
  (sort
   entries
   (lambda (entry1 entry2)
     (< (plist-get entry1 :time)
        (plist-get entry2 :time)))))

(defun prot-org-meetings-display-buffer (entries title)
  "Display ENTRIES of `prot-org-meetings-follow'.
ENTRIES is a list of plists of the following form:

    (list
     :heading HEADING
     :text TEXT
     :time HEADING-TIME-OBJECT)

Sort ENTRIES with `prot-org-meetings-sort'."
  (let ((buffer (get-buffer-create "*prot-org-meetings*")))
    (with-current-buffer buffer
      (save-excursion
        (erase-buffer)
        (unless (eq major-mode 'org-mode)
          (org-mode))
        (insert (format "#+title: %s" title))
        (insert "\n\n")
        (setq entries (prot-org-meetings-sort entries))
        (dolist (entry entries)
          (insert (format "* %s\n%s"
                          (plist-get entry :heading)
                          (plist-get entry :text)))
          (insert "\n\n"))))
    (display-buffer buffer)))

(defcustom prot-org-meetings-file "/tmp/testing/meetings.org"
  "The path to the file where prot-meetings links search in."
  :type 'file)

(defun prot-org-meetings-follow (query &rest _)
  "Find headings with meetings that match QUERY.
QUERY matches `prot-org-meetings-link-regexp'."
  (if (string-match prot-org-meetings-link-regexp query)
      ;; TODO 2026-11-17: I want an "until" logic which will also go
      ;; into the `prot-org-meetings-link-regexp'.
      (let* ((name (match-string 1 query))
             (since (match-string 2 query))
             (since-timestamp (format "[%s]" since))
             (since-time-object (prot-org--timestamp-to-time since-timestamp))
             (title (format "Meetings with %s" query))
             (entries nil))
        (with-temp-buffer
          (unless (file-exists-p prot-org-meetings-file)
            (error "The file `%s' does not exist" prot-org-meetings-file))
          (insert-file-contents prot-org-meetings-file)
          (org-mode)
          ;; TODO 2026-11-17: I want to match only DONE headings.
          ;; TODO 2026-11-17: I want to get the CLOSED timestamp as well.
          (org-map-entries
           (lambda ()
             (when-let* ((heading (org-get-heading :no-tags :no-todo :no-priority :no-comment))
                         (_ (string-match-p name heading))
                         (heading-timestamp (or (org-entry-get nil "DEADLINE")
                                                (org-entry-get nil "SCHEDULED")))
                         (heading-time-object (prot-org--timestamp-to-time heading-timestamp))
                         (_ (>= heading-time-object since-time-object))
                         (text (org-get-entry))
                         (entry (list
                                 :heading heading
                                 :text text
                                 :time heading-time-object)))
               (push entry entries))))
          (if entries
              (prot-org-meetings-display-buffer entries title)
            (user-error "There are no matching entries"))))
    (error "The query `%s' does not match `prot-org-meetings-link-regexp'" query)))

(defface prot-org-meetings-link
  '((t :inherit warning :underline t))
  "Face for prot-meetings link type links.")

;; TODO 2026-11-17: I want to implement a `:complete' and an `:export' parameter.
(org-link-set-parameters
 "prot-meetings"
 :follow #'prot-org-meetings-follow
 :face 'prot-org-meetings-link)

(defvar prot-org-meetings-person-prompt-history nil
  "Minibuffer history for `prot-org-meetings-person-prompt'.")

(defun prot-org-meetings-person-prompt ()
  "Prompt for a person for prot-meetings link type."
  (let ((default (car prot-org-meetings-person-prompt-history)))
    (completing-read
     (format-prompt "Meetings with PERSON" default)
     prot-org-meetings-person-prompt-history nil nil nil
     'prot-org-meetings-person-prompt-history default)))

;;;###autoload
(defun prot-org-meetings-insert (person date)
  "Insert prot-meetings link for PERSON since DATE."
  (interactive
   (list
    (prot-org-meetings-person-prompt)
    (org-read-date)))
  (when (or (null person)
            (string-blank-p person))
    (error "The PERSON cannot be nil or an empty string"))
  (when (or (null date)
            (string-blank-p date))
    (error "The DATE cannot be nil or an empty string"))
  (insert (format "[[prot-meetings:%s since %s]]" person date)))
```

### Indent `text-mode` region

```elisp
(defun prot-text-insert-prefix (prefix string)
  "Prepend PREFIX to every line of STRING."
  (with-temp-buffer
    (insert string)
    (goto-char (point-min))
    (insert prefix)
    (while (and (forward-line 1)
                (not (eobp)))
      (goto-char (line-beginning-position))
      (insert prefix))
    (buffer-string)))

(defmacro prot-text-define-prefix-command (scope prefix)
  "Define command with SCOPE to insert PREFIX to string.
SCOPE is a string that describes what the command will do.  PREFIX is
the prefix as a string.

The command will target the text between `region-beginning' and
`region-end'.  It will produce and error if the region is not active."
  `(defun ,(intern (format "prot-text-prefix-%s" scope)) (beginning end)
     ,(format
       "Add prefix `%s' to text between BEGINNING and END positions.
Report an error if the region is not active."
       prefix)
     (interactive
      (if (use-region-p)
          (list (region-beginning) (region-end))
        (error "The region is not active")))
     (when (= beginning end)
       (error "The BEGINNING and END cannot be equal"))
     (let* ((text (buffer-substring beginning end))
            (replacement (prot-text-insert-prefix ,prefix text)))
       (replace-region-contents beginning end replacement))))

;;;###autoload (autoload 'prot-text-prefix-blockquote "prot-text" nil t)
;;;###autoload (autoload 'prot-text-prefix-indent "prot-text" nil t)
(prot-text-define-prefix-command blockquote "> ")
(prot-text-define-prefix-command indent "    ")

(defvar-keymap prot-text-prefix-leader-map
  :doc "Commands to insert prefix to the active region text."
  :prefix 'prot-text-prefix-leader
  "b" #'prot-text-prefix-blockquote
  "i" #'prot-text-prefix-indent)
```
