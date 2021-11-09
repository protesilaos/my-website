---
title: "Introducing the variable modus-themes-org-agenda"
excerpt: "Description of the new customisation option for the Modus themes for GNU Emacs."
---

Starting with commit `29b5e57e` to the `main` branch of [the Modus
themes](https://protesilaos.com/emacs/modus-themes), users have the option to
customise the presentation of the Org agenda.  This will become widely
available through upstream Emacs and GNU ELPA in version `1.5.0` of the
themes (tentative release frame in early July).  The new variable is
`modus-themes-org-agenda`, which accepts an alist where each combination
corresponds to specific parts of the agenda buffers.  Those parts are
parameterised to be styled independent of each other.

First an overview of the user-facing code and then some screen shots:

```elisp
(setq modus-themes-org-agenda
      '((header-block . (variable-pitch scale-title))
        (header-date . (grayscale bold-today))
        (scheduled . uniform)
        (habit . traffic-light-deuteranopia)))
```

Those associations correspond in the given order to:

+ The block headers that describe each agenda view.  For example, when
  you do `M-x org-agenda` followed by `n` you get a header at the top
  that describes the days' view and one further below which pertains to
  all pending tasks.

+ The date headers in the day views.

+ Items with a scheduled timestamp assigned to them.  Remember that
  "scheduled" refers to the day/time a task should be started: it is not
  a deadline (read [On using to-do lists
  efficiently](https://bzg.fr/en/on-using-to-do-lists-efficiently/)
  (2021-04-26) by Bastien Guerry, the Org maintainer).

+ The `org-habit` graph for those who use it to track their consistency
  over recurring tasks (e.g. daily exercise).

The `header-block` and `header-date` keys accept lists of values which
combine their effects.  For instance, `header-date` can use a
`workaholic` value to apply uniform colouration to weekdays and weekends
and combine it with `grayscale` so that the colours are black/white
instead of the default shades of cyan.  Those lists can be one item
long, such as `(header-date . (grayscale))`.  For more items, the order
is not significant, so `(header-date . (workaholic grayscale))` and
`(header-date . (grayscale workaholic))` yield the same results.

The `scheduled` and `habit` keys accept a symbol, as shown in the sample
alist above.

## Default looks

This is an agenda buffer without any customisations whatsoever.  We use
colour to differentiate the various constructs, but try not to overdo it
as users' agendas can be rich with entries and too much colour can be a
hindrance to productivity.

<a href="{{'/assets/images/attachments/2021-06-02-modus-operandi-org-agenda-default.png' | absolute_url }}"><img alt="Modus Operandi default" src="{{ '/assets/images/attachments/2021-06-02-modus-operandi-org-agenda-default.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2021-06-02-modus-vivendi-org-agenda-default.png' | absolute_url }}"><img alt="Modus Vivendi default" src="{{ '/assets/images/attachments/2021-06-02-modus-vivendi-org-agenda-default.png' | absolute_url }}"/></a>

## Tweaked looks

Here is the same agenda view with the following styles (remember to read
either the doc string or the manual's entry on the matter):

```elisp
(setq modus-themes-org-agenda
      '((header-block . (variable-pitch scale-title))
        (header-date . (grayscale bold-today))
        (scheduled . uniform)
        (habit . simplified)))
```

<a href="{{'/assets/images/attachments/2021-06-02-modus-operandi-org-agenda-tweaked.png' | absolute_url }}"><img alt="Modus Operandi tweaked" src="{{ '/assets/images/attachments/2021-06-02-modus-operandi-org-agenda-tweaked.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2021-06-02-modus-vivendi-org-agenda-tweaked.png' | absolute_url }}"><img alt="Modus Vivendi tweaked" src="{{ '/assets/images/attachments/2021-06-02-modus-vivendi-org-agenda-tweaked.png' | absolute_url }}"/></a>

## Deuteranopia styles

As I have noted before, such as in [my latest status
report](https://protesilaos.com/codelog/2021-05-19-modus-themes-status-update/)
on the Modus themes' progress, we provide the tools to empower users
with red-green colour deficiency (deuteranopia).  This practically means
to avoid unconditional colour-coding that relies on a distinction
between red and green, by substituting green with blue.  To that end,
the themes provide `modus-themes-success-deuteranopia` (e.g. for Org
"DONE" tasks or Isearch matches) and `modus-themes-diffs` which has
relevant styles with a red-blue design.

For `modus-themes-org-agenda`, the only place where we need to introduce
such an alternative is for the `org-habit` graph.  We do so by tweaking
the `traffic-light` style/workflow as `traffic-light-deuteranopia`: it
uses red, yellow, and blue to present its indicators.

With those configurations we get the following samples:

```elisp
(setq modus-themes-success-deuteranopia t)

(setq modus-themes-org-agenda
      '((header-block . (variable-pitch scale-title))
        (header-date . (grayscale bold-today))
        (scheduled . uniform)
        (habit . traffic-light-deuteranopia)))
```

<a href="{{'/assets/images/attachments/2021-06-02-modus-operandi-org-agenda-deuteranopia.png' | absolute_url }}"><img alt="Modus Operandi deuteranopia" src="{{ '/assets/images/attachments/2021-06-02-modus-operandi-org-agenda-deuteranopia.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2021-06-02-modus-vivendi-org-agenda-deuteranopia.png' | absolute_url }}"><img alt="Modus Vivendi deuteranopia" src="{{ '/assets/images/attachments/2021-06-02-modus-vivendi-org-agenda-deuteranopia.png' | absolute_url }}"/></a>

## Attention to detail

To develop this variable, I benefited from the insights, commentary,
suggestions, and testing of Gustavo Barros [in issue
208](https://gitlab.com/protesilaos/modus-themes/-/issues/208) (the
discussion has over 200 comments as of this writing).  Gustavo put
forward the idea of reviewing the old defaults, which eventually led us
to the realisation that only a new customisation option would suffice;
an option in the form of an alist to offer us maximum flexibility.

Internally, the design of `modus-themes-org-agenda` draws from the
in-progress patch of Philip Kaludercic on the redesign of compound
values for the numerous customisation options the themes provide,
starting with `modus-themes-mode-line` (refer to the discussion in
[merge request
40](https://gitlab.com/protesilaos/modus-themes/-/merge_requests/40)).

Through the discussion with Gustavo, we also identified areas where Org
itself can be improved.  Those will be formalised as patches and sent to
the maintainers.  Their basic idea is to implement faces that are
optimised for their context in the agenda buffers.  I shall work on
those as soon as I am done with this report and will write about them in
those web pages after they are accepted by upstream.

In short, we pay attention to detail and want the best possible result
for all users.  Thanks again to Gustavo for the fruitful collaboration
thus far and thanks in advance to Philip for the forthcoming patches!

* * *

**NOTE:** The `modus-themes-org-agenda` supersedes the now-deprecated
`modus-themes-org-habit`.  Users of the old variable can get the exact
same styles by controlling the `habit` key inside of the new alist, with
possible values still being the same as before, plus the
deuteranopia-optimised addition, namely: `nil` (default), `simplified`,
`traffic-light`, `traffic-light-deuteranopia`.
