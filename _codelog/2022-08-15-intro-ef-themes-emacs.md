---
title: "Emacs: introduction to the ef-themes"
excerpt: "A quick demonstration and commentary on my new theme-related project for GNU Emacs."
---

The `ef-themes` is an in-development project I launched two days ago.
But first check some screenshots and then you can proceed to the rest of
text.  **Click to enlarge them and zoom in**.

The themes in order:

- `ef-spring`
- `ef-summer`
- `ef-day`
- `ef-night`
- `ef-winter`
- `ef-autumn`

<a href="{{'/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-spring.png' | absolute_url }}"><img alt="ef-themes demo ef-spring" src="{{ '/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-spring.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-summer.png' | absolute_url }}"><img alt="ef-themes demo ef-summer" src="{{ '/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-summer.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-day.png' | absolute_url }}"><img alt="ef-themes demo ef-day" src="{{ '/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-day.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-night.png' | absolute_url }}"><img alt="ef-themes demo ef-night" src="{{ '/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-night.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-winter.png' | absolute_url }}"><img alt="ef-themes demo ef-winter" src="{{ '/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-winter.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-autumn.png' | absolute_url }}"><img alt="ef-themes demo ef-autumn" src="{{ '/assets/images/attachments/2022-08-15-pre-release-ef-themes-demo-autumn.png' | absolute_url }}"/></a>

This set is not complete.  I still have two more themes in mind.  Expect
updates later today or tomorrow.

I plan to finalise the first version of the package during this week.

## Sources

+ Package name (GNU ELPA): `ef-themes` (**not available yet**)
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/ef-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/ef-themes>
    + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/ef-themes>

## What are these?

They are my answer to the following persistent questions surrounding my
`modus-themes`:

* Can you make them a bit more colourful?
* Can we have a variant with less intense colours?

There are technical reasons why the `modus-themes` are designed the way
they are.  In short: accessibility demands as much.

## Principles of the ef-themes

* Minimum contrast ratio of 4.5:1 against the main background (WCAG AA
  standard).  In practical terms, the `ef-themes` will be perfectly
  legible for most users.  Use my `modus-themes` package (also built
  into Emacs 28 or higher) if you need top-class accessibility.

* Curated list of supported packages.  I already support many packages
  though I will only cover what I use and/or know is in a
  well-maintained state.  Package authors must take care to use
  considerate colours.  Themes cannot support every package out there
  (and I won't tell you how many hours go into testing everything).

* No customisation options!  Either you like them or you don't.  We can
  always tweak how things look, though the overarching design objective
  is "good defaults".

## Minimal VS maximal scope

The `ef-themes` are meant to be minimal in scope, as opposed to my
`modus-themes` whose accessibility requirements make them maximalist _by
necessity_.  The `modus-themes` are such because:

1. Accessibility is not a one-size-fits-all.  Customisation options are
   necessary to empower users.
2. Accessibility is as good as its weakest link.  If the user spends all
   day using FOO package, it needs to be perfectly legible, otherwise
   the whole theme fails to deliver on its promise.

The `ef-themes` can afford to be minimal because they do not have such a
lofty accessibility target.

## Will you stop using the modus-themes?

No.  There is a reason I developed them and it is not because of whimsy.
For me accessibility matters greatly.

## What does "Ef" (εὖ) mean?

It is a Greek word, typically used as a prefix.  It means "good",
"well", "nice", and the like.

## Can I use them right now?

Yes, provided you understand what it means to track an in-development
project.  I may break things without prior notice.

Assuming you don't have a specific setup to use packages directly from
source, you need the `git` executable to do the following.

* On the command-line, run:

  ```sh
  git clone https://git.sr.ht/~protesilaos/ef-themes /path/to/ef-themes
  ```

  Replace `/path/to/ef-themes` with the location you want to store those
  files at.

* Now insert this in the `*scratch*` buffer and then evaluate it:

  ```elisp
  (package-install-file "/path/to/ef-themes")
  ```

  Again, replace the path with the one you are using.

  [ You can always evaluate any snippet by typing `M-:` (by default, it
    runs the command `eval-expression`), inserting the code at the
    minibuffer prompt, and following it up with `RET`. ]

Stay tuned for more!
