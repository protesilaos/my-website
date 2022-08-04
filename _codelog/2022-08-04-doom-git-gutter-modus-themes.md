---
title: "The case of git-gutter, the modus-themes, and Doom Emacs"
excerpt: "A note about community-building and individual responsibility in the Emacs space, using a specific example as a case in point."
---

The `git-gutter` package (and its `git-gutter-fringe` extension)
highlights in the margin or fringe of the window the status of affected
version-controlled lines.  By default, `git-gutter` uses a colour-coded
background, such as green for additions, together with the character or
bitmap of an appropriate sign, like the `+` for added lines.

When I test `git-gutter` in my capacity as the maintainer of the
`modus-themes` for the purposes of supporting the faces it defines, I
use what the upstream source provides.  As such, I apply a combination
of background and foreground that works the way the original package
intends to.  I add a colour-coded background and the correct foreground
(black for `modus-operandi`, white for `modus-vivendi`).  As a result,
the `modus-themes` work as intended with `git-gutter` and
`git-gutter-fringe`.

[ Colour-coding is influenced by `modus-themes-deuteranopia` for those
  who need to opt-in to it. ]

Doom Emacs, the popular configuration of our favourite computing
environment, uses `git-gutter` (`git-gutter-fringe`) by default.
However, it is effectively running a soft fork of the package, as it
introduces changes which refashion its appearance; changes which were
not anticipated upstream and, consequently, could not have been foreseen
by theme developers.  Doom Emacs adds its own custom bitmaps, which
replace those signs with contiguous lines.

```elisp
;; Copied from Doom Emacs (commit 55544200b)

;; places the git gutter outside the margins.
(setq-default fringes-outside-margins t)

;; thin fringe bitmaps
(define-fringe-bitmap 'git-gutter-fr:added [224]
  nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:modified [224]
  nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240]
  nil nil 'bottom)
```

Sample of the original bitmap, as seen in `git-gutter-fringe.el`:

```elisp
(fringe-helper-define 'git-gutter-fr:added nil
                      "...XX..."
                      "...XX..."
                      "...XX..."
                      "XXXXXXXX"
                      "XXXXXXXX"
                      "...XX..."
                      "...XX..."
                      "...XX...")
```

Taken in a vacuum, I like the visuals of this change: I prefer to have a
contiguous, colour-coded line that has no symbols or other
embellishments.  It is how the `diff-hl` package that I use looks with
one minor tweak to a relevant user option.  However, Doom's otherwise
innocuous modifications have a negative effect on themes that are not
designed specifically for Doom Emacs.  What once was a plus sign with a
black/white foreground now turns into a straight line that either covers
or is adjacent to the standard colour-coded background.

<a href="{{'/assets/images/attachments/2022-08-04-doom-modus-git-gutter.png' | absolute_url }}"><img alt="2022-08-04-doom-modus-git-gutter.png sample" src="{{ '/assets/images/attachments/2022-08-04-doom-modus-git-gutter.png' | absolute_url }}"/></a>

In other words, Doom breaks the `modus-themes`.  There is nothing we can
do about it because its soft fork of `git-gutter` is not a standalone
package with the appropriate points of entry that we could configure.

This has been known for a while now.  The manual of the `modus-themes`,
informs users of Doom Emacs about the problem and what they can do to
fix it using local tweaks:
<https://protesilaos.com/emacs/modus-themes#h:a195e37c-e58c-4148-b254-8ba1ed8a731a>.
Excerpt with just the code, while the docs explain the details:

```elisp
(defun my-modus-themes-custom-faces ()
  (modus-themes-with-colors
    (custom-set-faces
     ;; Replace green with blue if you use `modus-themes-deuteranopia'.
     `(git-gutter-fr:added ((,class :foreground ,green-fringe-bg)))
     `(git-gutter-fr:deleted ((,class :foreground ,red-fringe-bg)))
     `(git-gutter-fr:modified ((,class :foreground ,yellow-fringe-bg))))))

(add-hook 'modus-themes-after-load-theme-hook #'my-modus-themes-custom-faces)
```

The user evaluates this code and then re-loads the theme for changes to
take effect.  An unpleasant experience for what ought to just work.
What the code does is remove the black/white foreground and replace it
with the same colour as the background.  We cannot have such code in the
themes because it breaks standard `git-gutter` (technically, it is
`git-gutter-fringe` which is specifically for the fringes, but the point
is the same).

Looking at the code of `git-gutter`, we have user options like this one:

```elisp
(defcustom git-gutter:added-sign "+"
  "Added sign."
  :type 'string
  :group 'git-gutter)
```

Instead of dirty hacks, we can have a contiguous colour-coded
presentation by replacing the character with an empty space:

```elisp
(setq git-gutter:added-sign " ")
```

No need to use the fringes.  This works for all users and with all
themes that cover `git-gutter`.  You get the idea.

## Good citizenship and responsibility

I am a proponent of community building.  Emacs is a fairly small space
and we all know each other, more or less.  As package maintainers, we
contribute to the wellness of the community by writing code that does
not have a negative impact on third parties; code which has a clear
scope, conforms with the principle of least surprise, and can be
integrated in wider workflows.  Put simply, when our code breaks stuff
elsewhere, we fix our code.

This is not about the technicalities of the intersection between the
`modus-themes`, `git-gutter`, and Doom Emacs.  Every maintainer has a
responsibility towards the community.

Doom Emacs happens to be a very popular choice, especially for new users
who are not yet familiar with all the minutia of Emacs.  When a soft
fork breaks my package, I get to deal with the problem even though my
package works correctly.  This is not nice and it detracts from my other
projects.

[ I keep calling the `modus-themes` "my package" though note that it is
  built into Emacs.  The soft fork thus breaks standard Emacs. ]

I feel disempowered because even though I want to help users get the
best experience out-of-the-box, I cannot do anything more than write
documentation about the issue and hope for the best.  I do that, yet I
keep getting emails about it...

The manual is not the right place to fix bugs.  It is there to inform
the user about how to set up the package, what the customisation options
are, and, for the more adventurous, provide guidance on possible
do-it-yourself extensions.

Soft forks are quasi-proprietary _in practice_, as they are not
publicly available for me as a third party to interface with them using
standard mechanisms (i.e. not ad-hoc arrangements).  I cannot maintain
dirty hacks to accommodate soft forks: it debases the quality of my
package and makes it harder to maintain it.  Besides, makeshift
solutions of this sort have no place in emacs.git, where I push my
themes after every tagged release (I did so [yesterday for version
2.5.0](https://protesilaos.com/codelog/2022-08-03-modus-themes-2-5-0/)).

I strongly encourage maintainers of soft forks, such as Doom Emacs in
this case, to upstream their changes or, at the very least, subject
their feature to an opt-in toggle so that the user is informed about the
matter.

More broadly, each of us must consider that there exists a wider
community outside our particular milieu which is affected by our
decisions.  It is our duty to keep this place pleasant.  The more
influential and widely-used the code is, the greater the concomitant
responsibility.

Why am I not reporting this in the Doom repo?  Because (1) I am not a
user and (2) this is not about Doom Emacs per se.  It is an opportunity
for me to address a general topic and raise awareness about it.  Keeping
the information limited to an issue tracker does not help in this
regard.

Finally, a note for users who copy snippets without considering the
implications: if something looks broken, consider the possibility that
your custom code is the cause of it.  When reporting issues, make your
customisations explicit, otherwise you are unintentionally spreading
misinformation.
