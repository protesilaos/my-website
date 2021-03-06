---
title: "Status update on the Modus themes for Emacs (2021-05-19)"
excerpt: "Video presentation on the state of my highly accessible themes for Emacs (which are also built into Emacs28)."
layout: vlog
mediaid: "e-ApnxQeeTY"
---

In this video presentation I provide an overview of the current state of
my Modus themes: this is a pair of highly accessible themes that are
also built into Emacs28 (the current development target).  You can find
the text of the presentation below.  It is in `org-mode` notation.  And
here is the themes' manual: <https://protesilaos.com/emacs/modus-themes>.

* * *

```org
#+TITLE: Status update on the Modus themes
#+AUTHOR: Protesilaos Stavrou (https://protesilaos.com)
#+DATE: 2021-05-19

In this presentation I want to update you on the status of the Modus
themes, my highly accessible themes for Emacs.

I will be releasing a new version within the next few days (=1.4.0=), so I
think this is a good opportunity to inform you about what has changed
over the course of the last few months, specifically since August 2020
when I last talked about this subject (version =0.12.0= of the themes).

* Overview of the project

Some quick facts, in case you are not aware of the project:

1. The Modus themes consist of a light and a dark variant:
   ~modus-operandi~ and ~modus-vivendi~.

2. They conform with the WCAG AAA standard for colour contrast (the
   highest legibility standard).  This means that the minimum contrast
   ratio is >= 7:1 between background and foreground.

3. Their overall design is also good for red-green colour deficiency
   (deuteranopia).  It practically means that they avoid cases where it
   is difficult to tell the difference between two constructs because
   those happen to use red and green for colour coding. (more on this
   later)

4. They are built into Emacs since August 2020, which means that they
   are part of Emacs28 (the current development target).  My last video
   about the themes was an announcement of this fact and an opportunity
   to express my gratitude to everyone who had contributed code,
   reported issues, or helped with packaging (the manual has an
   "Acknowledgements" section).

5. There have been over 1700 commits in less than two years since the
   project became public (first commit to the old =master= branch in
   2019-07-09, new commits to the current =main= branch since 2020-11-11).
   I started the Modus themes as soon as I switched to Emacs.

6. Over 300 Emacs packages or face groups are explicitly supported. More
   are covered indirectly, as they inherit styles from some supported
   group.  In practice, the themes should work in virtually every
   scenario and I am always prepared to adapt to changes in the Emacs
   ecosystem.

7. There are 30 customisation variables.  Some are boolean types or
   numbers, though most offer a variety of options.  Every variable's
   doc string provides information on what it does.

8. The project comes with a fully fledged manual.  In source form it is
   available as an =.org= document, though packages get it as an =.info=
   file, which is what Emacs Info reader parses.  The manual covers
   everything that the themes provide and offers guidance on how users
   can enact various reforms on their end.  It is over 23.000 words
   long, without trying to be verbose.

* The switch to =1.0.0=

In December 2020, there was a major refactoring of the project.  The two
themes are now derived from a single source and share customisation
options.  They are also packaged together as =modus-themes=.

Whereas up to version =0.13.0= they were designed as standalone files and
were packaged separately: =modus-operandi-theme=, =modus-vivendi-theme=.
Those old packages have long been removed from MELPA and have already
been deprecated in GNU ELPA, to the effect that they pull in the new
=modus-themes= package when you try to install them.

I will coordinate with Stefan Monnier, the de facto GNU ELPA maintainer,
to decide on the best timing for removing the old packages altogether.
It will probably happen within the next few weeks.

Note that the GNU ELPA package is synced with emacs.git so users of
earlier version can effectively get what is already built into Emacs28.

[ Recall that GNU ELPA is the official package archive of Emacs: users
  do not need to set it up. ]

The refactoring was an ideal opportunity to change the name of the
primary branch from =master= to =main= to be better aligned with the
expectations and sensitivities of users.  So if you were tracking the
git repo, please make sure to update your package accordingly (contact
me if you need help).

* Optimising for red-green colour deficiency (deuteranopia)

As already noted, the themes are good for users with red-green colour
deficiency.  This is because most applied colours in the themes are
situated in the cyan-blue-magenta side of the spectrum or are part of
the gray scale.  That is for technical reasons pertaining to relative
luminance, though it takes aesthetic judgement to determine exact
colours values and combinations in each context.

There are, however, a couple of cases where the themes are not good for
deuteranopia out-of-the-box.  Those are diffs (e.g. Magit) and keywords
that denote success, such as Org's TODO and DONE tags.  Both use a
red-green colour coding system by default.

For those cases, there are customisation options to switch to a red-blue
system instead.  Briefly:

#+begin_src emacs-lisp
(setq modus-themes-diffs 'deuteranopia)
;; OR
(setq modus-themes-diffs 'fg-only-deuteranopia)

(setq modus-themes-success-deuteranopia t)
#+end_src

A sample diff hunk with =(setq modus-themes-diffs 'fg-only-deuteranopia)=:

#+begin_src diff
--- a/emacs/.emacs.d/prot-lisp/prot-notmuch.el
+++ b/emacs/.emacs.d/prot-lisp/prot-notmuch.el
@@ -219,7 +219,8 @@ ;;;; Mode line unread indicator
 ;; does not rely on notmuch as it uses find instead.  The following
 ;; approach is specific to my setup and is what I prefer now.
 
-(defcustom prot-notmuch-mode-line-search-args "tag:unread and tag:inbox"
+(defcustom prot-notmuch-mode-line-search-args
+  "--output:files tag:unread and tag:inbox"
   "Arguments to pass to 'notmuch search' for counting new mail."
   :type 'string
   :group 'prot-notmuch)
#+end_src
* Customisations and the manual

Customisations can help with accessibility.  This is true, for example,
with the red-green colour deficiency I just described.  They can also
make the theme more pleasant for a user, thus indirectly contributing to
their productivity (if something is annoying, it is distracting).

Here are all the user-facing variables, except the ones for overriding
colours:

#+begin_src emacs-lisp
(setq modus-themes-slanted-constructs t
      modus-themes-bold-constructs t
      modus-themes-no-mixed-fonts nil
      modus-themes-subtle-line-numbers t
      modus-themes-success-deuteranopia t
      modus-themes-fringes nil
      modus-themes-lang-checkers nil
      modus-themes-mode-line 'accented-3d
      modus-themes-syntax nil
      modus-themes-hl-line 'underline-accented
      modus-themes-paren-match 'intense
      modus-themes-links 'neutral-underline
      modus-themes-prompts 'subtle-gray
      modus-themes-completions nil
      modus-themes-mail-citations 'desaturated
      modus-themes-region 'bg-only-no-extend
      modus-themes-diffs 'fg-only-deuteranopia
      modus-themes-org-blocks nil
      modus-themes-org-habit nil
      modus-themes-headings '((1 . section)
                              (2 . line-no-bold)
                              (3 . rainbow-section)
                              (t . rainbow-no-bold))
      modus-themes-variable-pitch-ui nil
      modus-themes-variable-pitch-headings nil
      modus-themes-scale-headings nil
      modus-themes-scale-1 1.1
      modus-themes-scale-2 1.15
      modus-themes-scale-3 1.21
      modus-themes-scale-4 1.27
      modus-themes-scale-5 1.33)
#+end_src

Let's switch away from this presentation so I can show you the manual.

* Next version and future plans

I will release version =1.4.0= some time within the next ten days or so.
It depends on whether there is some last minute issue I need to address.
And I also need to find time to write the release notes for the new
version.  Each change log entry is detailed (i.e. several thousand
words) and you can always find them all together in the CHANGELOG.

For the future of the project, I plan to continue with =1.X= releases for
a few more months until I am 100% confident that everything is polished
and works as expected.  I think this is already true, but I prefer to
err on the side of caution.

Once we reach that state I will switch to version =2.0.0= which will mark
the culmination of those two years work into an official super stable
release.  I might have more to share by that time, though don't expect
anything groundbreaking.
```
