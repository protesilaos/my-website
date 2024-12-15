---
title: "Emacs: custom Org clock report for my coaching"
excerpt: "A video demonstration of how I produce my custom Org clock report to measure the time spent on meetings."
layout: vlog
mediaid: "FMutOCOoFSQ"
---

In this video, I demonstrate the custom code I have to generate Org
clock reports for my coaching sessions. The idea is to use the
`DEADLINE` and `CLOSED` timestamps of each task to calculate their
elapsed time. This way, I do not need to manually clock in to the task
and then clock out of it. It is easier to not have that overhead and
not to duplicate the data that is already embedded in the
aforementioned timestamps.

The custom command I use will prompt me for the name of a person and
the date since when to collect meetings. It will then put all the
retrieved data in a new buffer and calcucate the results in a neat
time table. This new buffer is not related to the underlying file I
used to gather the data from: it is strictly used for reporting. My
file stays free from all the extra noise.

I thus use this method to do my billing and accounting.

As I show in the video, my `coach.org` file is simple. Each meeting is
a top-level heading. The text of the heading includes the name of the
person and a description on what the meeting is about. It looks like
this:

```org
#+todo: COACH(k) | DONE(d!) CANCEL(c@)

* DONE Protesilaos Emacs deep dive
CLOSED: [2024-12-10 Tue 14:45] DEADLINE: <2024-12-10 Tue 13:00>

* COACH Protesilaos Org custom clock report
DEADLINE: <2024-12-15 Sun 17:00>
```

My actual file has some more data, such as a link to the email I
received for scheduling the given meeting, as well as relevant quotes,
and the like. All that is irrelevant for the purposes of the clock
reporting though. What I show in the above code block is enough.

## My custom code (part of my dotfiles)

Below is the code I am using as of this writing (2024-12-15 16:38
+0200). It is an excerpt from my Emacs configuration. Note that if I
make any changes to it, I will not put them back here. Check my
dotemacs for the up-to-date setup (it also includes links to the Git
sources): <https://protesilaos.com/emacs/dotemacs>.

```elisp
(defvar prot-org-clock--template-no-effort
  "#+BEGIN: clocktable :formula % :timestamp t :sort (1 . ?a) :link nil :scope nil :hidefiles t :maxlevel 8 :stepskip0 t
#+END:"
  "Clock table to use for custom clock reports.")

;; TODO 2024-12-15: This sort of thing must exist in Org, but I did
;; not find it.
(defun prot-org--timestamp-to-time (string)
  "Return time object of STRING timestamp."
  (org-timestamp-to-time (org-timestamp-from-string string)))

(defun prot-org-coach--get-entries (todo-keyword string since)
  "Get Org entries matching TODO-KEYWORD followed by STRING in the heading.
Limit entries to those whole deadline/scheduled is equal or greater to
SINCE date.

Each entry is a plist of :heading, :contents, :started, :closed."
  (or (delq nil
            (org-map-entries
             (lambda ()
               (when-let* ((case-fold-search t)
                           (started (prot-org--timestamp-to-time (or (org-entry-get nil "DEADLINE") (org-entry-get nil "SCHEDULED"))))
                           (closed (prot-org--timestamp-to-time (org-entry-get nil "CLOSED")))
                           ((re-search-forward (format "\\<%s\\>.*\\<%s\\>" todo-keyword string) (line-end-position) t 1))
                           ((org-time-less-p since started)))
                 (list
                  :heading (org-get-heading :no-tags :no-todo :no-priority :no-comment)
                  :contents (org-get-entry)
                  :started started
                  :closed closed)))))
      (user-error "No entries with heading matching `\\<%s\\>.*\\<%s\\>'" todo-keyword string)))

(defvar prot-org-coach--name-history nil
  "Minibuffer history of `prot-org-coach--name-prompt'.")

(defun prot-org-coach--name-prompt ()
  "Prompt for name of person."
  (let ((default (car prot-org-coach--name-history)))
    (read-string
     (format-prompt "Name of person" default)
     nil 'prot-org-coach--name-history default)))

;;;###autoload
(defun prot-org-coach-report (name since)
  "Produce clock report for coaching with person of NAME.
SINCE is the date (of time 00:00) to count from until now."
  (interactive
   (list
    (prot-org-coach--name-prompt)
    (format "[%s]" (org-read-date))))
  (if-let* ((since-object (prot-org--timestamp-to-time since))
            (entries (prot-org-coach--get-entries "done" name since-object))
            (buffer (get-buffer-create "*prot-org-coach-entries*")))
      (with-current-buffer (pop-to-buffer buffer)
        (erase-buffer)
        (org-mode)
        (dolist (entry entries)
          (insert (format "* %s\n%s\n\n" (plist-get entry :heading) (plist-get entry :contents)))
          (org-clock-in nil (plist-get entry :started))
          (org-clock-out nil t (plist-get entry :closed)))
        (goto-char (point-min))
        (save-excursion
          (insert (format "%s\n\n" prot-org-clock--template-no-effort)))
        (save-excursion
          (goto-char (line-end-position))
          (insert (format " :tstart %S" since)))
        (org-dblock-update))
    (user-error "No entries for name `%s'" name)))
```
