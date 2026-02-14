---
title: "Emacs: add custom entity (Austrian school) to my 'institution-calendar'"
excerpt: "This is a guide on how to expand my institution-calendar package to work with your institution."
---

My `institution-calendar` package for Emacs displays term+week
indicators in the `*Calendar*` buffer (which, by default, is produced
by the `calendar` command). This is useful, for example, for schools
who organise their work by terms, such as winter, spring, and summer,
with each having a set number of weeks. This is how the University of
Oxford will look like:

<a href="{{'/assets/images/attachments/2026-01-09-oxford-calendar.png' | absolute_url }}"><img alt="Oxford calendar for Emacs" src="{{'/assets/images/attachments/2026-01-09-oxford-calendar.png' | absolute_url }}"/></a>

The package supports the universities of Oxford and Cambridge
out-of-the-box, though users can define their own institutions. I have
two institutions there to provide concrete examples. I am happy to add
more, but the idea is for users to maintain their own data.

Below I show a complete example using data for a school in Austria.

## Write the calendar data

To make this work, you first need to specify the data. This has the
same structure as `institution-calendar-oxford-university-dates` and
thus passes the test of `institution-calendar-valid-data-p`. Look at
the code for Oxford to get an idea. Here is a sample:

```elisp
(defvar my-austrian-school-dates
  '((2025 (wintersemester ( 9  8 2025) ( 2  6 2026))
          (sommersemester ( 2 16 2026) ( 7 10 2026)))))
```

This is an Austrian school that has two terms for the academic year
starting in 2025: `wintersemester` and `sommersemester`. The symbols
for those terms can be anything. Internally, the package uses the
first letter to form the week indicator, followed by the number of the
week within the given term.

Each term defines a start date and an end date as a list of integers
of the form `(MONTH DAY YEAR)`. I picked a form that is consistent
with the way `calendar.el` represents the date, otherwise I would have
used a different standard.

## Register your institution

The variable `institution-calendar-user-entities` contains all
user-defined institutions and their corresponding calendar data. Each
entry is a cons cell of the form `(ENTITY . CALENDAR-DATA)`, where
`ENTITY` is an arbitrary symbol and `CALENDAR-DATA` is the symbol of a
variable that holds the data, as shown in the previous section.

Here is how we can add to this list:

```elisp
(add-to-list 'institution-calendar-user-entities (cons 'austrian-school 'my-austrian-school-dates))
```

In this example, I am calling the newly registered institution
`austrian-school`, which is how I can refer to it elsewhere. I am
associating this `austrian-school` with the calendar data of the
variable `my-austrian-school-dates`.

## Make the `institution-calendar-mode` work for your institution

With the aforementioned in place, the user option `institution-calendar-entity`
can be set to the value of `austrian-school`:

```elisp
(setopt institution-calendar-entity 'austrian-school)
```

If the `institution-calendar-mode` is enabled, then the regular
`calendar` command will display week indicators for this school. This
is good if you only need one calendar. But if you work with many
institutions and thus need to switch between their calendars, then
ignore this step and move to the next one. Or ignore it anyway if you
prefer to keep the `M-x calendar` intact.

## Define a custom command for your institution

The macro `institution-calendar-define-convenience-command` makes it
trivial to define a command that produces a calendar buffer for the
given institution. This is like `M-x calendar` with the minor mode
`institution-calendar-mode` enabled, except it does not alter the
output of the `calendar`---so you can use them both (or, anyhow, use
as many as the institutions you care about).

```elisp
;; This defines the command `institution-calendar-austrian-school'.
;; Call `institution-calendar-austrian-school' with M-x or bind it to a key.
(institution-calendar-define-convenience-command austrian-school)
```

Once you evaluate this macro call, you will get the command
`institution-calendar-austrian-school`. Use that to produce a calendar
that works with the `austrian-school` in particular. If you are
curious, `M-x institution-calendar-oxford-university` will still do
the right thing for the University of Oxford. Same for the command
`institution-calendar-cambridge-university`.

## Use an intermonth header

The user option `institution-calendar-include-intermonth-header` adds
a header above the week numbers. By default, this only works with the
universities of Oxford and Cambridge. Though you can extend the
package to support your institution by adding to the value of the
variable `institution-calendar-intermonth-headers`. Thus:

```elisp
(add-to-list 'institution-calendar-intermonth-headers (cons 'austrian-school "AU"))
```

You can skip this step if you do not plan to display the intermonth
header. Those are not shown by default.

## Putting it all together

This is how your configuration of the `institution-calendar` may look like:

```elisp
(use-package institution-calendar
  :ensure nil ; not in a package archive
  :init
  ;; Install it from source.
  ;; Then upgrade it with the command `package-vc-upgrade' or `package-vc-upgrade-all'.
  (unless (package-installed-p 'institution-calendar)
    (package-vc-install "https://github.com/protesilaos/institution-calendar.git"))
  :config
  (defvar my-austrian-school-dates
    '((2025 (wintersemester ( 9  8 2025) ( 2  6 2026))
            (sommersemester ( 2 16 2026) ( 7 10 2026)))))

  (add-to-list 'institution-calendar-user-entities (cons 'austrian-school 'my-austrian-school-dates))

  ;; This defines the command `institution-calendar-austrian-school'.
  ;; Call `institution-calendar-austrian-school' with M-x or bind it to a key.
  (institution-calendar-define-convenience-command austrian-school)

  (setopt institution-calendar-include-extra-week-numbers t)
  (setopt institution-calendar-include-intermonth-header nil)

  ;; These are optional, if you want `M-x calendar' to work for your institution.
  (setopt institution-calendar-entity 'austrian-school)

  (institution-calendar-mode 1))
```

## Sources

+ Git repository: <https://github.com/protesilaos/institution-calendar>
+ Screenshot: <https://protesilaos.com/codelog/2026-02-11-emacs-institution-calendar/>
+ Backronyms: Interestingly Nothing Serving Teachers Implement Term
  Utilities Took Inspiration from Oxford Novices... calendar;
  Institution ... Cambridge Added Lent Entry Notwithstanding Dates
  Already Recorded.
