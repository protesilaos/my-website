---
title: "Emacs: my 'oxford-calendar' package"
excerpt: "My new package for Emacs to display Oxford University academic terms in the 'M-x calendar'."
---

The `oxford-calendar` is a small package that is of interest to
students, academics, and staff of the University of Oxford. It
augments the `M-x calendar` buffer with indicators that show the
applicable term (Michaelmas, Hilary, Trinity) and week number.

<a href="{{'/assets/images/attachments/2026-01-09-oxford-calendar.png' | absolute_url }}"><img alt="Oxford calendar for Emacs" src="{{'/assets/images/attachments/2026-01-09-oxford-calendar.png' | absolute_url }}"/></a>

To show the indicators, enable the `oxford-calendar-mode`. By default,
it includes the extra weeks 0 and 9 at the boundaries of each term.
The idea is to make things easier for planning purposes. Remove those
extra weeks by setting `oxford-calendar-include-extra-week-numbers` to
`nil`.

To include a heading above the term indicators, set the user option
`oxford-calendar-include-intermonth-header` to a non-`nil` value.

I will now do the work to include the package on the GNU ELPA archive.

## Sources

+ Package name (GNU ELPA): `oxford-calendar` (!!! COMING SOON)
+ Official manual: <https://protesilaos.com/emacs/oxford-calendar>
+ Git repository: <https://github.com/protesilaos/denote>
+ Backronym: Overtly Xenial Feature Orders Relevant Dates ... Calendar.
