---
title: "Emacs: custom Oxford University calendar weeks"
excerpt: "Sample code to show the Oxford University teaching terms in the Emacs calendar."
---

Over at Oxford University they use their own calendaring scheme to
label the terms and weeks of their school year. Why? Because they can!
And why would some guy in the mountains of Cyprus care? Because it's
fun to write Emacs Lisp!

The academic year is divided into three periods of teaching and three
of vacation. The latter have no special names, while the former are
called "Michaelmas", "Hilary", and "Trinity". Each teaching term
consists of a few weeks whose numbering starts from `1`.

With some custom code, we can configure the Emacs `M-x calendar` to
tell us (i) which term we are in for the current month of the Oxford
academic year, if any, (ii) which term and week number we are in, if
any, and (iii) which is the standard week number.

## The generic 'M-x calendar' 😴

Here is how it looks without any customisations. Serviceable, but not
conducive to the Oxford culture.

<a href="{{'/assets/images/attachments/2025-01-09-emacs-calendar-generic.png' | absolute_url }}"><img alt="Generic Emacs calendar" src="{{'/assets/images/attachments/2025-01-09-emacs-calendar-generic.png' | absolute_url }}"/></a>

## The Oxford-friendly 'M-x calendar' 🎓

It is busier, for sure, though this is what you get for being at
Oxford. Notice that when there is nothing Oxford-related, we just show
the regular calendar information.

<a href="{{'/assets/images/attachments/2025-01-09-emacs-calendar-oxford.png' | absolute_url }}"><img alt="Oxford Emacs calendar" src="{{'/assets/images/attachments/2025-01-09-emacs-calendar-oxford.png' | absolute_url }}"/></a>

## The code

I wrote this over the course of a few hours. It may be refined here
and there, but I think it is already good enough. The only major
improvement would be to implement the formula that Oxford uses to
derive their dates. As I do not know it, the `prot-oxford-dates` have
to be updated manually each year.

```elisp
;; NOTE 2025-01-09: Perhaps there is some formula to always get the
;; dates, but I am not aware of it.  As such, these dates need to be
;; updated at the start of each school year.
;;
;; Source: <https://www.ox.ac.uk/about/facts-and-figures/dates-of-term>.
(defvar prot-oxford-dates
  '((michaelmas (10 13 2024)  (12 7 2024))
    (hilary     (1  19 2025)  (3 15 2025))
    (trinity    (4  27 2025)  (6 21 2025)))
  "Alist of Oxford calendar terms with start and end date.
Each element is of the form (NAME START END), where NAME is the name of
the term, as a symbol, START is the start date and END is the end date.
START and END each are of the form (month day year), where each element
is a number.")

(defun prot-oxford--get-gregorian-week (date)
  "Get the Gregorian week of DATE.
DATE is a list of the form (month day year)."
  (unless (calendar-date-is-valid-p date)
    (error "The date `%s' does not conform with `calendar-date-is-valid-p'" date))
  (car
   (calendar-iso-from-absolute
    (calendar-absolute-from-gregorian date))))

(defun prot-oxford--get-term-week (term-start-week term-end-week gregorian-week prefix)
  "Return the number of the Oxford term week or nil.
Determine the week given TERM-START-WEEK and TERM-END-WEEK as Gregorian
week numbers.  Compare GREGORIAN-WEEK to them.

When returning the number, concatenate it with PREFIX.  PREFIX is a
single letter string.  A longer PREFIX is trimmed accordingly."
  (when-let* ((number (cond
                       ((> gregorian-week term-end-week)
                        nil)
                       ((= term-start-week gregorian-week)
                        1)
                       ((< term-start-week gregorian-week)
                        (+ (- gregorian-week term-start-week) 1))))
              (pre (if (> (length prefix) 1)
                       (substring prefix 0 1)
                     prefix)))
    (concat pre (number-to-string number))))

(defun prot-oxford--get-term-weeks (term)
  "Return Oxford TERM stard and end week numbers as a list."
  (pcase-let* ((`(,beg-date ,end-date) (alist-get term prot-oxford-dates))
               (beg-week (prot-oxford--get-gregorian-week beg-date))
               (end-week (prot-oxford--get-gregorian-week end-date)))
    (list beg-week end-week)))

(defface prot-oxford-term-indicator
  '((((class color) (min-colors 88) (background light))
     :foreground "#224499")
    (((class color) (min-colors 88) (background dark))
     :foreground "#afc9f3")
    (t :inherit shadow))
  "Face to style the Oxford term indicator.")

(defface prot-oxford-regular-week
  '((t :inherit shadow))
  "Face to style the regular week.")

(defun prot-oxford-week (month day year)
  "Use MONTH DAY YEAR to determine current week.
Derive the Oxford term week based on the `prot-oxford-dates'."
  (pcase-let* ((`(,m-w-beg ,m-w-end) (prot-oxford--get-term-weeks 'michaelmas))
               (`(,h-w-beg ,h-w-end) (prot-oxford--get-term-weeks 'hilary))
               (`(,t-w-beg ,t-w-end) (prot-oxford--get-term-weeks 'trinity))
               (gregorian-week (prot-oxford--get-gregorian-week (list month day year)))
               (oxford-week (or (prot-oxford--get-term-week m-w-beg m-w-end gregorian-week "M")
                                (prot-oxford--get-term-week h-w-beg h-w-end gregorian-week "H")
                                (prot-oxford--get-term-week t-w-beg t-w-end gregorian-week "T")
                                "")))
        (format " %2s  %2s  "
                (propertize oxford-week 'face 'prot-oxford-term-indicator)
                (propertize (format "%2s" gregorian-week) 'face 'prot-oxford-regular-week))))

(defun prot-oxford--get-term-month (term-name term-start-month term-end-month month)
  "Return the TERM-NAME of the term month or nil.
Determine the name given TERM-START-MONTH and TERM-END-MONTH as month
numbers.  Compare MONTH to them."
  (when-let* ((number (cond
                       ((> month term-end-month)
                        nil)
                       ((= term-start-month month)
                        1)
                       ((< term-start-month month)
                        (+ (- month term-start-month) 1)))))
    term-name))

(defun prot-oxford--get-months (term)
  "Get start and end months of `prot-oxford-dates' TERM as a list."
  (mapcar #'car (alist-get term prot-oxford-dates)))

(defun prot-oxford-month (year month)
  "Return abbreviated name of MONTH for YEAR.
Append the Oxford term name based on the `prot-oxford-dates'."
  (pcase-let* ((`(,m-beg ,m-end) (prot-oxford--get-months 'michaelmas))
               (`(,h-beg ,h-end) (prot-oxford--get-months 'hilary))
               (`(,t-beg ,t-end) (prot-oxford--get-months 'trinity))
               (oxford-term-name (or (prot-oxford--get-term-month "Michael" m-beg m-end month)
                                     (prot-oxford--get-term-month "Hilary" h-beg h-end month)
                                     (prot-oxford--get-term-month "Trinity" t-beg t-end month)
                                     "")))
    (format "%s %s %s"
            (propertize (calendar-month-name month :abbreviate) 'face 'calendar-month-header)
            (propertize (format "%s" year) 'face 'calendar-month-header)
            (propertize oxford-term-name 'face 'prot-oxford-term-indicator))))

(defun prot-oxford-intermonth-header ()
  "Return string for `calendar-intermonth-header'."
  (format "%s %s"
          (propertize "OX" 'face 'prot-oxford-term-indicator)
          (propertize "Week" 'face 'shadow)))

(setopt calendar-left-margin 10
        calendar-intermonth-spacing 12
        calendar-intermonth-header (prot-oxford-intermonth-header)
        calendar-intermonth-text '(prot-oxford-week month day year)
        calendar-month-header '(prot-oxford-month year month))
```
