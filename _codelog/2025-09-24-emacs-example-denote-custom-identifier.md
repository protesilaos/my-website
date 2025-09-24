---
title: "Emacs: example of a custom Denote identifier to include day of week data"
excerpt: "I explain how Denote can use custom identifiers and discuss the technicalities of the code."
---

As I wrote in a recent entry, the forthcoming version `4.1.0` of
[Denote will provide the option to define custom identifier schemes](https://protesilaos.com/codelog/2025-09-20-emacs-denote-custom-identifiers/).
Here I explain one of the examples I have included in the manual,
specifically, the idea of recording the day of the week as part of the
date+time stamp. Monday is `A`, Tuesday is `B`, and so on.

The default Denote identifier is a compact representation of the date
and time, with the letter `T` in between. For example:

```
20250924T190920
```

The letter `T` does not have any special meaning. It simply delimits
the two constituents of the identifier. Users who want to record the
day of the week can ultimately derive identifiers that look like these:

```
20250922A082941
20250923B140652
20250924C191038
```

And with some spaces for didactic purposes:

```
2025 09 22   A   08 29 41
2025 09 23   B   14 06 52
2025 09 24   C   19 10 38
```

[ Actually, users can produce identifiers with such spaces, but I will
  leave this as an exercise for interested parties. ]

## Get the day of the week as a capital letter

To get the day of the week as a string that holds a number, we use the
`%u` format specifier of the function `format-time-string`. Today is
Wednesday, thus:

```elisp
(format-time-string "%u")
;; => "3"
```

Based on this, we know that we need a function that takes such a
string and returns the corresponding capital letter. Here is one way
of achieving as much:

```elisp
(defun my-denote-get-day-of-week-as-alpha (day)
  "Return the corresponding capital letter for DAY.
DAY is a string holding a number, as the return value of the %u
specifier in `format-time-string'.

If DAY is a number, convert it to a string and then return its
corresponding letter."
  (pcase (if (numberp day) (number-to-string day) day)
    ("1" "A")
    ("2" "B")
    ("3" "C")
    ("4" "D")
    ("5" "E")
    ("6" "F")
    ("7" "G")
    (_ (error "The day `%S' is not among 1-7" day))))
```

The `pcase` macro does the heavy lifting here. We basically test for
string equality and return a new string or throw an error. Testing the
code, I get these results:

```elisp
(my-denote-get-day-of-week-as-alpha "3")
;; => "C"

(my-denote-get-day-of-week-as-alpha 3)
;; => "C"

(my-denote-get-day-of-week-as-alpha "10")
;; => ERROR

(my-denote-get-day-of-week-as-alpha 10)
;; => ERROR
```

## Tweak the Denote identifier format to pass the `%u` specifier

Denote stores the `format-time-string` specifiers for its default
identifier in the variable `denote-date-identifier-format`. The value
is `"%Y%m%dT%H%M%S"`, which is what derives the aforementioned
standard identifier.

We already noted that we do not want that literal `T` over there. So
let us make our format the same as the original one except that we
include `%u` in place of `T`. A function call that would yield the
desired result is this:

```elisp
(replace-regexp-in-string "T" " %u " denote-date-identifier-format t)
;; => "%Y%m%d %u %H%M%S"
```

Notice that I add a space before and after the `%u`. These are
delimiters that we will use to split the string more easily into its
`DATE`, `DAY`, `TIME` components. But one step at a time. We first
need to define this as a variable:

[ Technically, this is not a normal variable because of `defconst`
  instead of the more common `defvar`, but we do not need to consider
  such details. ]

```elisp
(defconst my-denote-date-identifier-format
  (replace-regexp-in-string "T" " %u " denote-date-identifier-format t))
```

## Format a date using the new identifier scheme

Our next task is to write a small function that takes a date argument
and returns a string whose pattern follows what we did in the previous
section. For example, if the current date is `2025-09-24`, the day is
Wednesday, and the time is `19:30:00`, we expect an identifier like
`20250924C193000`.

To keep things simple, we will not go into how Emacs represents dates
internally. It does not matter, anyway, because Denote handles that
part internally. All we need to test our function is to use the return
value of the function `current-time`. Actually, even that is optional
because `format-time-string` defaults to that if it is not given an
explicit date as an argument.

As such, here is how we get the string `"DATE DAY TIME"`, based on
what we have:

```elisp
(format-time-string my-denote-date-identifier-format)
;; => "20250924 3 193347"
```

Remember those spaces from earlier? We need them now to split this
string into a list of three strings, so that we can isolate the day in
the middle. Once we have just the day, we can pass it to the function
we wrote earlier that gives us the corresponding capital letter.

To split a string at the spaces, we do this (read the `split-string`
doc string for further details):

```elisp
(split-string STRING)
```

Which means:

```elisp
(split-string (format-time-string my-denote-date-identifier-format))
;; => ("20250924" "3" "193626")
```

We get back a list of strings, so the day is retrieved thus:

```elisp
(nth 1 '("20250924" "3" "193626"))
;; => "3"
```

Use `(nth 0 ...)` for the date and `(nth 2 ...)` for the time.

Now that we know all this, we can piece it together into a single
function. Here is what we will do, which I shall explain in further
detail below:

```elisp
(defun my-denote-format-date (date)
  "Format DATE using `my-denote-date-identifier-format'.
Represent the day of the week with `my-denote-get-day-of-week-as-alpha'."
  (pcase-let* ((identifier-string (format-time-string my-denote-date-identifier-format date))
               (`(,date ,day ,time) (split-string identifier-string))
               (day-as-letter (my-denote-get-day-of-week-as-alpha day)))
    (concat date day-as-letter time)))
```

The `pcase-let*` macro uses "destructuring" to pattern match the return
value and bind it to the variables we name (also see my free (gratis and
libre) book: [Emacs Lisp Elements](https://protesilaos.com/emacs/emacs-lisp-elements)).
This is the short way of doing the following:

```elisp
(defun my-denote-format-date (date)
  "Format DATE using `my-denote-date-identifier-format'."
  (let* ((identifier-string (format-time-string my-denote-date-identifier-format date))
         (strings (split-string identifier-string))
         (date (nth 0 strings))
         (day (nth 1 strings))
         (time (nth 2 strings))
         (day-as-letter (my-denote-get-day-of-week-as-alpha day)))
    (concat date day-as-letter time)))
```

Use whichever style you prefer.

The point is that we (i) take the return value of `format-time-string`
with the spaces, as I showed above, (ii) split it at the spaces into
three strings, (iii) assign each of those strings to a variable local
to this function, (iv) convert the day from a number to a capital
letter, and (v) put it all back together without those spaces. The
result is this:

```elisp
(my-denote-format-date (current-time))
;; => "20250924C194219"
```

## Write and then use the custom `denote-get-identifier-function`

The variable `denote-get-identifier-function` has the symbol of a
function as its value. Its documentation describes the technicalities.
Though, again, we do not need to understand the finer points to
achieve our goal. Since our custom identifier is almost the same as
the default, we can copy the original function that Denote relies on
and make a small change to it so that it uses the `my-denote-format-date`
we just wrote. Behold:

```elisp
(defun my-denote-generate-identifier-as-date (initial-identifier date)
  "Generate an identifier based on DATE.

If INITIAL-IDENTIFIER is not already used, return it.  Else, if it is
possible to derive an identifier from it, return this identifier.

Else, use the DATE.  If it is nil, use `current-time'.

Slightly modified version of `denote-generate-identifier-as-date'."
  (let ((denote-used-identifiers (or denote-used-identifiers (denote--get-all-used-ids))))
    (cond ((and initial-identifier
                (not (gethash initial-identifier denote-used-identifiers)))
           initial-identifier)
          ((and initial-identifier
                (string-match-p denote-date-identifier-regexp initial-identifier)
                (date-to-time initial-identifier))
           (denote--find-first-unused-id-as-date initial-identifier))
          (t
           (denote--find-first-unused-id-as-date
            (my-denote-format-date (or date (current-time))))))))
```

The internal workings do not matter right now, though I am happy to
explain them elsewhere. Our priority is to find where `my-denote-format-date`
is used. The only difference between what we have here and the
original is that our final line uses `my-denote-format-date`, while
the original does a `format-time-string` with the `denote-date-identifier-format`
(which we saw further above when we replaced `T` with `%u`).

Finally, bind `denote-get-identifier-function` to the symbol of the
custom function to start using it:

```elisp
(setq denote-get-identifier-function #'my-denote-generate-identifier-as-date)
```

All Denote files will henceforth look like this:

```
@@20250924C190301--this-is-a-test__denote_testing.txt
```

Remember that the `@@` exists for custom identifiers and that all the
components of the file name can be reordered.

This covers it! The manual has more examples and I always am eager to
help anyone who needs to do something a little bit differently.

## About Denote

Denote is a simple note-taking tool for Emacs. It is based on the idea
that notes should follow a predictable and descriptive file-naming
scheme. The file name must offer a clear indication of what the note
is about, without reference to any other metadata. Denote basically
streamlines the creation of such files while providing facilities to
link between them.

Denote's file-naming scheme is not limited to "notes". It can be used
for all types of file, including those that are not editable in Emacs,
such as videos. Naming files in a consistent way makes their filtering
and retrieval considerably easier. Denote provides relevant facilities
to rename files, regardless of file type.

[ I have a page with all my Emacs packages, which includes all the
  Denote extensions I maintain: <https://protesilaos.com/emacs>. ]

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/denote>
  + GitLab: <https://gitlab.com/protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.

