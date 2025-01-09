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

**UPDATE 2025-01-09 18:36 +0200:** I revised a few lines of code to
(i) work with either Sunday or Monday as the first day of the week,
(ii) not show any Oxford week beyond the years specified in
`prot-oxford-dates`.

* * *

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
  '((michaelmas  (10 13 2024)  (12 7 2024))
    (hilary      (1  19 2025)  (3 15 2025))
    (trinity     (4  27 2025)  (6 21 2025)))
  "Alist of Oxford calendar terms with start and end date.
Each element is of the form (NAME START END), where NAME is the name of
the term, as a symbol, START is the start date and END is the end date.
START and END each are of the form (month day year), where each element
is a number.")

(defun prot-oxford--get-iso-week (date)
  "Get the ISO week of DATE.
DATE is a list of the form (month day year)."
  (unless (calendar-date-is-valid-p date)
    (error "The date `%s' does not conform with `calendar-date-is-valid-p'" date))
  (car
   (calendar-iso-from-absolute
    (calendar-absolute-from-gregorian date))))

(defun prot-oxford--get-term-week (term-start-week term-end-week iso-week prefix)
  "Return the number of the Oxford term week or nil.
Determine the week given TERM-START-WEEK and TERM-END-WEEK as Gregorian
week numbers.  Compare ISO-WEEK to them.

If `calendar-week-start-day' is a Monday, then start counting weeks from
0, because Oxford weeks start from Sunday (otherwise, Week 1 includes 6
days before the first Sunday).

When returning the number, concatenate it with PREFIX.  PREFIX is a
single letter string.  A longer PREFIX is trimmed accordingly."
  (when (and term-start-week term-end-week iso-week)
    (when-let* ((offset (pcase calendar-week-start-day
                          (0 1)
                          (1 0)))
                (number (cond
                         ((> iso-week term-end-week)
                          nil)
                         ((= term-start-week iso-week)
                          offset)
                         ((< term-start-week iso-week)
                          (+ (- iso-week term-start-week) offset))))
                (pre (if (> (length prefix) 1)
                         (substring prefix 0 1)
                       prefix)))
      (concat pre (number-to-string number)))))

(defun prot-oxford--get-term-weeks (term year)
  "Return Oxford TERM start and end week numbers as a list.
Check YEAR to determine if the date is out of bonds of the
`prot-oxford-dates'."
  (pcase-let* ((`(,beg-date ,end-date) (alist-get term prot-oxford-dates))
               (`(,_ ,_ ,term-year) beg-date)
               (beg-week (prot-oxford--get-iso-week beg-date))
               (end-week (prot-oxford--get-iso-week end-date)))
    (when (= term-year year)
      (list beg-week end-week))))

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
  (pcase-let* ((`(,m-w-beg ,m-w-end) (prot-oxford--get-term-weeks 'michaelmas year))
               (`(,h-w-beg ,h-w-end) (prot-oxford--get-term-weeks 'hilary year))
               (`(,t-w-beg ,t-w-end) (prot-oxford--get-term-weeks 'trinity year))
               (gregorian-week (prot-oxford--get-iso-week (list month day year)))
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
        ;; Oxford assumes Sunday starts the week, but we want to work
        ;; with the ISO commercial dates, so Monday (1) is the first
        ;; day of the week.  But Sunday (0) will still work.
        calendar-week-start-day 1
        calendar-intermonth-spacing 12
        calendar-intermonth-header (prot-oxford-intermonth-header)
        calendar-intermonth-text '(prot-oxford-week month day year)
        calendar-month-header '(prot-oxford-month year month))
```
