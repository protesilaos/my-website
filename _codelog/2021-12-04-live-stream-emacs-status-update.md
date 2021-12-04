---
title: "Live stream: Status update on my Emacs work"
excerpt: "A live talk about what I have been up with my Emacs packages, followed by a question-and-answer session."
layout: vlog
mediaid: "YZRfvq4Wh54"
---

**EDIT 2021-12-04 14:59 +0200:** Added the text of the presentation.


On Saturday 2021-12-04 at 15:00 +0300 I will do a live stream where I
will talk about the GNU Emacs packages I maintain and generally what I
have been up to over the past few weeks.  I will also answer any
questions that may appear on the live chat.  They can be related to
anything I cover on my website: <https://protesilaos.com>.

Unlike previous live streams, there will not be a presentation on some
point of intersection between Emacs and philosophy.  We will find
another opportunity to elaborate on such a topic in the near future.

* * *

The text of the presentation:

```org
#+TITLE: Live: Status update on my Emacs work
#+AUTHOR: Protesilaos Stavrou (https://protesilaos.com)
#+DATE: 2021-12-04

Hello everyone!  My name is Protesilaos also known as "Prot".  Today I
will provide a status update on my packages for Emacs and then talk a
bit about EmacsConf 2021.

I posted a notice for this stream only a few hours ago, so I don't
expect anyone to show up.  No worries though.  The video will be
recorded.

If anyone does appear in the chat, feel welcome to send me any questions
you may have and I will answer them right away.

* LIN and upstream patch for hl-line.el

+ Official manual: https://protesilaos.com/emacs/lin
+ Git repo: https://gitlab.com/protesilaos/lin

I recently published a package that lets you remap the styling of the
"line highlight" face (~hl-line-face~) for any buffer you want.  I have
posted about it on my blog, but let me quickly show you what I mean
here. [live demo...]

Basically =lin-mode= lets us use the best design for each context.  No
need to make awkward compromises.  In line-oriented buffers where
selection is the primary mode of interaction, we use a more intense
background.  For all other cases we can afford a more subtle line
highlight.

I tried to submit the package to GNU ELPA but was instead asked to turn
it into a patch for the built-in =hl-line.el=.  I did that but the
documentation I provided is a bit technical so it must be reworded in
the interest of simplicity.  I will try to revisit this issue next week.

Even if we get the patch upstream, I think Lin is still worth having.
That is because the upstream method is supposed to provide only the
relevant points of entry and interested major modes will have to start
using them.  Whereas a package "just works" and gives the user the power
to implement it wherever they want right now.

Anyway, thanks to people who have contributed to Lin:

+ Christian Tietze
+ Damien Cassou
+ Nicolas De Jaeghere

** Patch for line-oriented hl-line in emacs.git

The patch I sent to emacs-devel and which I will revise is coppieed
below.  This is meant to be viewed with Emacs (Org mode).  Place the
point inside the source block and type =C-c '=.

#+begin_src diff
From f90cfd709ccbad13bccc1a262e54220fd79c88ee Mon Sep 17 00:00:00 2001
Message-Id: <f90cfd709ccbad13bccc1a262e54220fd79c88ee.1636562815.git.info@protesilaos.com>
From: Protesilaos Stavrou <info@protesilaos.com>
Date: Wed, 10 Nov 2021 18:46:48 +0200
Subject: [PATCH] Add line-oriented style for hl-line-mode

,* etc/NEWS: Document new user option and how major modes can support it.

,* lisp/hl-line.el (hl-line-line-oriented): New face for highlighting
in line-oriented user interfaces.
(hl-line-use-line-oriented-ui): New user option to toggle
line-oriented highlighting in supporting major modes.
(hl-line-line-oriented-ui): Add local variable intended for use by
major modes.
(hl-line--face): Include helper function to use the appropriate face.
(hl-line-make-overlay): Use the new helper function.
---
 etc/NEWS        | 34 +++++++++++++++++++++++++++++++++
 lisp/hl-line.el | 51 ++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/etc/NEWS b/etc/NEWS
index 97da145bc3..c0920ade71 100644
--- a/etc/NEWS
+++ b/etc/NEWS
@@ -94,6 +94,31 @@ These will take you (respectively) to the next and previous "page".
 ---
 ,*** 'describe-char' now also outputs the name of emoji combinations.
 
+** hl-line-mode
+
+---
+*** Apply semantics of line-oriented line highlighting
+The user option 'hl-line-use-line-oriented-ui' controls the
+application of the new 'hl-line-line-oriented' face.
+
+That face is used in major modes that opt-in to supporting the
+semantics of a line-oriented user interface.  Those are UIs where only
+the current line matters, regardless of the horizontal position of
+point.  For example, when viewing a list of buffers, the default
+action is to visit the one on the current line, no matter where
+exactly the cursor is on that line.  Whereas non-line-oriented UIs,
+such as those where text editing is the main type of interaction, do
+consider the position of the point on the current line.
+
+The distinction between these two types of line highlighting allows
+users/themes to apply different styles to the applicable faces, each
+optimized for its context: the standard 'hl-line' may become more
+subtle, while the 'hl-line-line-oriented' ought to be more prominent.
+
+When this option is set to nil, the 'hl-line-mode' does not
+differentiate between the two types of line highlighting: it always
+applies the 'hl-line-face'.
+
 ,** Outline Minor Mode
 
 +++
@@ -658,6 +683,15 @@ This holds the value of the previous call to 'set-locale-environment'.
 This macro can be used to change the locale temporarily while
 executing code.
 
+** hl-line-mode
+
+---
+*** Major modes can register support for line-oriented hl-line
+Set the buffer-local variable 'hl-line-line-oriented-ui' to non-nil.
+Doing so declares that the interface is line-oriented for the purposes
+of 'hl-line-mode', as explained elsewhere in this document or in the
+user option 'hl-line-use-line-oriented-ui'.
+
 ,** Tabulated List Mode
 
 +++
diff --git a/lisp/hl-line.el b/lisp/hl-line.el
index 26cfcc3f9c..8044ce3ca0 100644
--- a/lisp/hl-line.el
+++ b/lisp/hl-line.el
@@ -79,6 +79,19 @@ (defface hl-line
   :version "22.1"
   :group 'hl-line)
 
+(defface hl-line-line-oriented
+  '((default :extend t)
+    (((class color) (min-colors 88) (background light))
+     :background "#b0d8ff")
+    (((class color) (min-colors 88) (background dark))
+     :background "#103265")
+    (t :inherit hl-line))
+  "Like `hl-line', but intended for line-oriented interfaces.
+Only applies when the user option `hl-line-use-line-oriented-ui'
+is non-nil and the major mode has registered to use this face."
+  :version "29.1"
+  :group 'lin)
+
 (defcustom hl-line-face 'hl-line
   "Face with which to highlight the current line in Hl-Line mode."
   :type 'face
@@ -92,6 +105,32 @@ (defcustom hl-line-face 'hl-line
 	 (when (overlayp global-hl-line-overlay)
 	   (overlay-put global-hl-line-overlay 'face hl-line-face))))
 
+(defcustom hl-line-use-line-oriented-ui t
+  "When non-nil, apply `hl-line-line-oriented' face if applicable.
+
+That face is used in major modes that opt-in to supporting the
+semantics of a line-oriented user interface.  Those are UIs where
+only the current line matters, regardless of the horizontal
+position of point.  For example, when viewing a list of buffers,
+the default action is to visit the one on the current line, no
+matter where exactly the cursor is on that line.  Whereas
+non-line-oriented UIs, such as those where text editing is the
+main type of interaction, do consider the position of the point
+on the current line.
+
+The distinction between these two types of line highlighting
+allows users/themes to apply different styles to the applicable
+faces, each optimized for its context: the standard `hl-line' may
+become more subtle, while the `hl-line-line-oriented' ought to be
+more prominent.
+
+When this option is set to nil, the HL-Line mode does not
+differentiate between the two types of line highlighting: it
+always applies the `hl-line-face'."
+  :type 'boolean
+  :version "29.1"
+  :group 'hl-line)
+
 (defcustom hl-line-sticky-flag t
   "Non-nil means the HL-Line mode highlight appears in all windows.
 Otherwise Hl-Line mode will highlight only in the selected
@@ -128,6 +167,10 @@ (defvar hl-line-overlay-buffer nil
 (defvar hl-line-overlay-priority -50
   "Priority used on the overlay used by hl-line.")
 
+(defvar-local hl-line-line-oriented-ui nil
+  "When non-nil use `hl-line-line-oriented' instead of `hl-line' face.
+The rationale is explained in `hl-line-use-line-oriented-ui'.")
+
 ;;;###autoload
 (define-minor-mode hl-line-mode
   "Toggle highlighting of the current line (Hl-Line mode).
@@ -153,10 +196,16 @@ (define-minor-mode hl-line-mode
     (hl-line-unhighlight)
     (remove-hook 'change-major-mode-hook #'hl-line-unhighlight t)))
 
+(defun hl-line--face ()
+  "Use appropriate face for line highlight."
+  (if (and hl-line-line-oriented-ui hl-line-use-line-oriented-ui)
+      'hl-line-line-oriented
+    hl-line-face))
+
 (defun hl-line-make-overlay ()
   (let ((ol (make-overlay (point) (point))))
     (overlay-put ol 'priority hl-line-overlay-priority) ;(bug#16192)
-    (overlay-put ol 'face hl-line-face)
+    (overlay-put ol 'face (hl-line--face))
     ol))
 
 (defun hl-line-highlight ()
-- 
2.33.1
#+end_src

* Minibuffer and Completions in Tandem (MCT)

+ Package name (GNU ELPA): =mct=
+ Official manual: https://protesilaos.com/emacs/mct
+ Change log: https://protesilaos.com/emacs/mct-changelog
+ Git repo: https://gitlab.com/protesilaos/mct

This is a thin layer of interactivity over the default completion
framework.  It is meant to basically make it easier to use the standard
=*Completions*= buffer.  I announced this package via a video demo on
2021-10-22.  Since then lots of work has gone into making it work with
the two grid views that Emacs provides for the Completions' buffer, in
addition to the one I prefer the most: the =one-column= view of Emacs 28
or higher.  In general, MCT now does the right thing in all scenaria
that involve the minibuffer and the =*Completions*=.  If anything, it
shows that Emacs has a lot of untapped potential for its out-of-the-box
experience.

You have seen me using MCT and my dotemacs-specific predecessor for
almost a year now.  Again, here is a very basic demonstration. [live
demo...]

MCT follows a minimalist design philosophy.  So it combines nicely with
other relevant tools, like Daniel Mendler's =consult= package and Omar
Antolín Camarena's =embark=.  Again, I have covered those and others in
previous videos.

The manual of MCT includes references to more extensions like
=consult-dir= by Karthik Chikmagalur, =consult-notmuch= by José Antonio
Ortega Ruiz, and =all-the-icons-completion= by Itai Y. Efrat.

Right now MCT does not work outside the minibuffer.  So you cannot use
it for tab-completion inside an ordinary buffer, in Eshell, etc., even
though Emacs does use the =*Completions*= buffer for such a task.  This
case is known as ~completion-in-region~ and does not activate the
minibuffer.

There are plans to make MCT optionally work everywhere.  Daniel Mendler,
who is also the author of the excellent =corfu= package, is helping me in
this endeavour (=corfu= does in-buffer completion with a pop-up at where
the cursor is).

A quick joke: a user noted that /Minibuffer and Completions in Tandem/
will have to be renamed if it ever supports in-buffer completion.  I
explained the technical reason why renaming is not an option, but also
observed that MCT stands for /Minibuffer Confines Transcended/.  So there
you have it!

The project is new, but I wish to thank everyone who has contributed
with code and/or ideas: Case Duckworth, Daniel Mendler, James Norman
Vladimir Cash, Jonathan Irving, José Antonio Ortega Ruiz, Kostadin
Ninev, Manuel Uberti, Philip Kaludercic, Theodor Thornhill.

* Modus themes version 2.0.0

+ Package name (GNU ELPA): =modus-themes=
+ Official manual: https://protesilaos.com/emacs/modus-themes
+ Change log: https://protesilaos.com/emacs/modus-themes-changelog
+ Sample pictures: https://protesilaos.com/emacs/modus-themes-pictures
+ Git repo: https://gitlab.com/protesilaos/modus-themes

You are most likely familiar with my =modus-themes=.  They are designed in
conformity with the highest accessibility standard for legibility.  And
they also work well for users with red-green colour deficiency.  The
themes (=modus-operandi= and =modus-vivendi=) are built into Emacs version
28, which will soon be released as the new stable version of Emacs.
They are, of course, in Emacs 29 as well as part of the emacs.git source
code.

I have been making progress towards version 2.0.0.  This is a major
undertaking to review all the packages or face groups that we cover and
also to refine the themes' code.  I have removed support for some
packages that are either obsolete or do not require any further
intervention.  If you think I made a mistake, please let me know and I
will fix it.

There is an issue in my git repo which tracks my progress.  The
underlying data is in Org notation, so I will share the file separately
tgoether with the release notes.  In the meantime you can check more
here: https://gitlab.com/protesilaos/modus-themes/-/issues/259.

There are two changes to user options that are worth noting at this
point:

+ The new ~modus-themes-deuteranopia~ toggle consolidates and supersedes
  all the stylistic choices that existed before for red/blue colour
  coding instead of red/green.  Now users can just set that option to
  non-nil (=t=) and every relevant context will adapt accordingly, like
  diffs, Org TODO and DONE keywords, the Org habit graph in the agenda,
  and so on.

+ The ~modus-themes-diffs~ no longer support a foreground-only style.
  After months of testing, I have concluded that it is not good enough
  for our purposes even though the colours did pass the accessibility
  standard of a minimum contrast ratio in relative luminance of 7:1.
  Put simply, I think the result was not up to the aesthetic standard of
  the rest of the themes.  The manual contains a new section with
  detailed code on how users can implement such a foreground-only style
  in their local setup.

Speaking of aesthetics, this is an aspect of the development that I have
not mentioned enough, so one might not realise some of the more nuanced
insights that go into this project.  There was this case the other day
where Damien Cassou correctly observed a stylistic inconsistency when
using ~hl-line-mode~ in Magit's Git commit buffers.  In that context, the
first line should not exceed 50 characters in length.  Any excess
character would be marked with a yellow background, but hl-line
overrides backgrounds, so the distinction was not clear enough.  I
explained how we could make the excess characters yellow and, to ensure
the best results, colourise the valid text of the summary in blue.  Why
did I make that suggestion?  Because I know that blue and yellow are
complementary colours (for our domain in technology), meaning that they
contrast well when put side-by-side.

At any rate, version 2.0.0 will be released before the end of this year
and, as always, will be synced with emacs.git and all relevant package
archives.

As always, thanks to everyone who has contributed code and/or ideas.
The list of names is too long to include it here.  There is a section in
the manual titled "Acknowledgements" where you can find everyone.

** Task list for Modus themes 2.0.0 (as of 2021-12-04 11:56 +0200)

Meant to be viewed inside Emacs.  Put point on the source block and type
=C-c '=.

#+begin_src org
,#+STARTUP: content indent

,* TODO Modus themes 2.0.0 [8/12]                                      :modus:

Maybe some of those can be done before we formally transition to version
=2.0.0=, though it is better to make them all part of a major change.

,** DONE [#A] Clean up face groups [60/60]
CLOSED: [2021-12-03 Fri 08:43]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 08:43]
:END:

These need to be reviewed on a case-by-case basis.  Some may be removed,
others revised to make sure they are okay.  The list is non-exhaustive.

,*** DONE ag
CLOSED: [2021-12-02 Thu 19:39]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:39] \\
  This package already inherits from basic faces and should work well
  without any further adjustments.
:END:
,*** CANCEL all-the-icons
CLOSED: [2021-12-03 Fri 08:41]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-03 Fri 08:41] \\
  This package is used virtually everywhere.  While we should normally not
  have to colourise icons due to (i) their larger surface area relative to
  text glyphs and (ii) their cosmetic utility, I prefer to err on the side
  of caution and continue supporting it.
:END:

Unlike text, icons occupy a larger surface area and thus have a lower
requirement for colour contrast.  I need to review all the colours they
use in case there is something that we really need to address, but in
general we might be fine with removing at least some of those faces.

,*** DONE apt-sources-list
CLOSED: [2021-12-02 Thu 19:35]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:35] \\
  This package already inherits from basic faces.  There seems to be no
  need to extend support for it at the theme level, also because of its
  niche utility (I mean, how often do you edit your apt sources and how
  difficult is it to just live with the standard font-lock faces for a
  few minutes?).
:END:
,*** DONE buffer-expose
CLOSED: [2021-12-02 Thu 19:35]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:35] \\
  This package already inherits from basic faces.  There seems to be no
  need to extend support for it at the theme level.
:END:
,*** DONE counsel-org-capture-string
CLOSED: [2021-12-02 Thu 21:53]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 21:53] \\
  It inherits from a font-lock face.  There is no need to style it
  explicitly.
:END:
,*** CANCEL cursor-flash
CLOSED: [2021-12-02 Thu 22:10]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 22:10] \\
  We recently added support for it.  Let's keep it until a future review.
:END:
,*** DONE define-word
CLOSED: [2021-12-02 Thu 21:18]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 21:18] \\
  Its faces inherit from basic ones, so we are safe in removing explicit
  support for it.
:END:
,*** DONE diredc
CLOSED: [2021-12-02 Thu 21:26]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 21:26] \\
  This is a massive package that seems like a de facto fork of Dired.  I
  cannot promise support for it in its current stage, so it is better to
  remove it from the themes until someone who uses it in earnest comes
  along and helps cover its use-case.
:END:
,*** CANCEL dired-git
CLOSED: [2021-12-02 Thu 21:55]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:55] \\
  It seems to be in a stable state.  I will keep supporting it until
  further notice.
:END:
,*** DONE disk-usage
CLOSED: [2021-12-02 Thu 19:50]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:50] \\
  This package inherits from base faces and should be okay for the
  occasional usage of its interface.
:END:
,*** CANCEL easy-jekyll
CLOSED: [2021-12-02 Thu 21:27]
:LOGBOOK:
- State "CANCEL"     from "WAIT"       [2021-12-02 Thu 21:27] \\
  It only defines one face.  Let's keep supporting it.
:END:

,#+begin_src emacs-lisp
(defface easy-jekyll-help-face
  `((((class color) (background light))
     ,@(and (>= emacs-major-version 27) '(:extend t))
     :inherit font-lock-function-name-face
     :background "#f0f8ff")
    (((class color) (background dark))
     ,@(and (>= emacs-major-version 27) '(:extend t))
     :inherit font-lock-function-name-face
     :background "#2f4f4f"))
  "Definition of help color."
  :group 'easy-jekyll-faces)
,#+end_src

,*** DONE easy-kill
CLOSED: [2021-12-02 Thu 19:59]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:59] \\
  This package inherits from base faces and should be okay without
  explicit theme support. I am actually not sure we should remove this,
  but I am willing to take the risk.  If someone objects to this change,
  they are free to contact me and I shall reconsider.
:END:
,*** CANCEL el-search
CLOSED: [2021-12-02 Thu 19:56]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 19:56] \\
  I have never seen this package in any user config, but its face
  definitions are not good enough for our purposes.  So we keep supporting
  it for the time being.
:END:
,*** CANCEL elfeed-score
CLOSED: [2021-12-02 Thu 21:14]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:14] \\
  This package is actively maintained and we should continue support it.
  Ideally, someone should patch its warning/error/info faces so that they
  inherit from the faces warning/error/success.  I might do it, though not
  sure when.
:END:
,*** CANCEL equake
CLOSED: [2021-12-02 Thu 21:28]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:28] \\
  The package is actively maintained and I will continue supporting it.
:END:
,*** CANCEL evil-snipe
CLOSED: [2021-12-02 Thu 21:12]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:12] \\
  This package is actively maintained and someone had asked me to keep
  supporting it.
:END:
,*** CANCEL evil-visual-mark-mode
CLOSED: [2021-12-02 Thu 21:12]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:12] \\
  I am not sure about this.  It is a single face though, so I am willing
  to continue support it until a future review.
:END:
,*** CANCEL flx
CLOSED: [2021-12-02 Thu 21:30]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:30] \\
  For me this package seems to have been superseded by the =orderless=
  package as well as the built-in flex option in =completion-styles=.
  However, it is only a single face and it is being actively maintained,
  so I will continue supporting it.
:END:

Is this still relevant in light of Emacs' own flex completion style?

,*** DONE flyspell-correct
CLOSED: [2021-12-02 Thu 21:09]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 21:09] \\
  We support it indirectly, because it inherits from the isearch face.
:END:
,*** CANCEL git-gutter
CLOSED: [2021-12-02 Thu 19:43]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 19:43] \\
  This package continues to be maintained.  It is =git-gutter+= that is de
  facto obsolete.
:END:
,*** DONE git-gutter+
CLOSED: [2021-12-02 Thu 19:43]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:43] \\
  These packages (it and git-gutter-fringe+) are de facto obsolete for
  several years now.  Use git-gutter or git-gutter-fringe instead.
:END:
,*** CANCEL git-fringe
CLOSED: [2021-12-02 Thu 19:46]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 19:46] \\
  This package is actively maintained.  It is =git-gutter-fringe+= that is
  de facto obsolete.
:END:
,*** DONE git-gutter-fringe+
CLOSED: [2021-12-02 Thu 19:46]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:46] \\
  These packages (it and git-gutter+) are de facto obsolete for several
  years now.  Use git-gutter or git-gutter-fringe instead.
:END:
,*** DONE git-lens
CLOSED: [2021-12-02 Thu 20:27]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:27] \\
  This package is de facto obsolete.  I tried to update its broken
  homepage URL one year ago, but never received a reply:
  <https://gitlab.com/pidu/git-lens/-/merge_requests/1>.
:END:
,*** CANCEL git-timemachine
CLOSED: [2021-12-02 Thu 20:28]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 20:28] \\
  I am not sure this package is actively maintained.  Though I have seen
  it in some user init files, so I will keep supporting it for the time
  being.
:END:
,*** DONE git-walktree
CLOSED: [2021-12-02 Thu 20:30]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:30] \\
  Has not been updated in two years.  Its faces are okay because they
  inherit from font-lock.
:END:
,*** DONE highlight-blocks
CLOSED: [2021-12-02 Thu 20:45]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:45] \\
  This package does not even have a README.  It was last updated almost
  three years ago and there seems to be no activity in its git repo. I
  am thus willing to take the risk of removing it.  If anyone objects to
  this change, they are welcome to inform me about it and I shall
  reconsider.
:END:
,*** DONE highlight-defined
CLOSED: [2021-12-02 Thu 20:36]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:36] \\
  This package is actively maintained.  It inherits from font-lock, so
  there is no need to keep explicit support for it.
:END:
,*** DONE highlight-escape-sequences
CLOSED: [2021-12-02 Thu 21:01]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 21:01] \\
  This package inherits from faces we already support, so there is no
  need to style it explicitly.
:END:
,*** DONE highlight-symbol
CLOSED: [2021-12-02 Thu 21:07]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 21:07] \\
  This package is no longer maintained.  Also, it may be easier to just
  use the built-in highlight-regexp functionality (bound to M-s h r and
  can also be extended from isearch---contact me if you need help).
  Read the manual by evaluating:
  (info "(emacs) Highlight Interactively")
:END:
,*** DONE highlight-tail
CLOSED: [2021-12-02 Thu 20:56]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:56] \\
  This package is hosted on EmacsWiki and I cannot know whether there is
  any activity around its development.  Its history of changes stops at
  2007, while its Commentary section makes references to speed issues.
  While I am not sure about its status, I am thus willing to take the
  risk of removing it.  If anyone objects to this change, they are
  welcome to inform me about it and I shall reconsider.
:END:
,*** CANCEL highlight-thing
CLOSED: [2021-12-02 Thu 21:08]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:08] \\
  I am not sure about this case.  It is only one face, so I will keep
  supporting it for the time being.
:END:
,*** CANCEL hl-defined
CLOSED: [2021-12-02 Thu 20:46]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 20:46] \\
  This package is maintained on the Emacs Wiki.  It seems to be actively
  maintained and so we must continue supporting it.
:END:
,*** DONE hyperlist (hyperlist-mode)
CLOSED: [2021-12-02 Thu 20:47]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:47] \\
  This package has not been updated in two years and I have never heard
  of anyone using it.  Maybe Org is enough?
:END:
,*** DONE iflipb
CLOSED: [2021-12-02 Thu 20:52]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:52] \\
  This package is actively supported and we should continue styling it
  directly.
:END:
,*** CANCEL interaction-log
CLOSED: [2021-12-02 Thu 21:56]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:56] \\
  I am not sure about this.  It seems to be stable and I remember seeing
  it in use.  Will continue supporting until a future review.
:END:
,*** DONE isl
CLOSED: [2021-12-02 Thu 22:02]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 22:02] \\
  I remember adding support for this on the premise that a package would
  eventually become available on some ELPA.  This has not happened and I
  am not sure what to expect.  As such, removing it may be a drastic
  measure, though I am willing to take the risk.  If anyone objects to
  this change, they are welcome to inform me about it and I shall
  reconsider.
:END:

<https://github.com/thierryvolpiatto/isearch-light>

,*** CANCEL macrostep
CLOSED: [2021-12-02 Thu 21:51]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:51] \\
  While it has not been updated in a long time, this package likely has a
  broad user-base.  Someone I trust was using it recently.  Let's keep
  supporting its faces.
:END:
,*** CANCEL mentor
CLOSED: [2021-12-02 Thu 21:49]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:49] \\
  This package is actively maintained.  I will continue supporting it.
:END:
,*** DONE minibuffer-line
CLOSED: [2021-12-02 Thu 22:03]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 22:03] \\
  It inherits from mode-line-inactive, which we support.  There is no
  need to support it explicitly.
:END:
,*** CANCEL minimap
CLOSED: [2021-12-02 Thu 21:48]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:48] \\
  I am not sure about this.  I will review it at a later date.
:END:
,*** CANCEL mood-line
CLOSED: [2021-12-02 Thu 22:02]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 22:02] \\
  This package is actively maintained.  I will continue supporting it.
:END:
,*** DONE mu4e-conversation
CLOSED: [2021-12-02 Thu 19:13]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:13] \\
  This package is broken and obsolete for several months now.  Its
  README explains as much.
:END:
,*** DONE no-emoji
CLOSED: [2021-12-02 Thu 21:48]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 21:48] \\
  It inherits from the dired-header face, which could be wrong under
  some circumstances.  At any rate, there is no need to support it
  explicitly.
:END:

It inherits from the ~dired-header~ face, which is wrong.  Maybe we can
just patch it upstream to inherit from, say, ~bold~, ~warning~ or some
font-lock face?

,*** DONE objed
CLOSED: [2021-12-02 Thu 22:09]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 22:09] \\
  This package is subject to a rewrite.  Its three faces inherit from
  basic faces that we support.  While we would have reasons to style
  things differently, I think that we are better off removing it from
  the themes until further notice.
:END:
,*** DONE parrot
CLOSED: [2021-12-02 Thu 21:45]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 21:45] \\
  Its sole face inherits from 'highlight', which we support.  There is
  no need to style it explicitly.
:END:
,*** CANCEL phi-grep
CLOSED: [2021-12-02 Thu 21:43]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:43] \\
  This package is actively maintained and we should continue supporting
  it.
:END:
,*** DONE phi-search
CLOSED: [2021-12-02 Thu 21:41]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 21:41] \\
  Its homepage points to a website that seems to have nothing to do with
  the package.  What is going on?  I am not sure about this decision,
  but am willing to take the risk of removing it.  If anyone objects to
  this change, they are welcome to inform me about it and I shall
  reconsider.
:END:
,*** DONE pkgbuild-mode
CLOSED: [2021-12-02 Thu 20:23]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:23] \\
  This package covers a very narrow niche.  Its sole face uses a red
  underline for errors, which is bearable.
:END:
,*** CANCEL rainbow-blocks
CLOSED: [2021-12-02 Thu 21:39]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:39] \\
  This package is actively maintained and we should continue supporting
  it.
:END:
,*** DONE rainbow-identifiers
CLOSED: [2021-12-02 Thu 20:21]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:21] \\
  This package has not been updated in seven years and has no other
  activity in its git repo.  This may be because it is stable and "just
  works".  Or it has been de facto deprecated.  Though I cannot be
  certain, I am willing to take the risk and remove it from the themes.
  If someone objects to this change, they are welcome to inform me about
  and I shall reconsider.
:END:
,*** DONE sallet
CLOSED: [2021-12-02 Thu 19:33]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:33] \\
  This package seems to be experimental.  I could not find any
  user-facing documentation.  There exists a dev notes file which, as
  its name suggests, is not for regular users:
  <https://github.com/Fuco1/sallet/blob/master/dev-notes.org>.
:END:
,*** DONE spell-fu
CLOSED: [2021-12-02 Thu 21:33]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 21:33] \\
  Its sole face seems to be okay: there is no need to support it
  explicitly.
:END:
,*** DONE spray
CLOSED: [2021-12-02 Thu 21:37]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 21:37] \\
  I can no longer find this package.  Its homepage URL returns a 404
  error.
:END:
,*** CANCEL suggest
CLOSED: [2021-12-02 Thu 21:37]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 21:37] \\
  I am not sure about this.  It is a single face.  Keep it there until a
  future review.
:END:
,*** DONE swoop
CLOSED: [2021-12-02 Thu 20:14]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:14] \\
  This package is deprecated for more than a year now.  It recommends
  using helm-swoop instead.
:END:
,*** CANCEL sx
CLOSED: [2021-12-02 Thu 20:09]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 20:09] \\
  This package seems to be in a stable state and has a broad user-base.
  As such, I am willing to continue supporting it even though I am not a
  user of the Stack Exchange service.
:END:
,*** CANCEL telega
CLOSED: [2021-12-02 Thu 20:06]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-12-02 Thu 20:06] \\
  This seems to be a very popular package and was even featured at
  EmacsConf 2021.  Though I am not a user of Telegram, I am willing to
  keep the support for this package: if something does not look right, I
  hope people will tell me about it.
:END:
,*** DONE vdiff
CLOSED: [2021-12-02 Thu 20:18]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:18] \\
  This package already inherits from the built-in diff-mode faces, so
  seems to be no need to keep supporting it explicitly.
:END:
,*** DONE volatile-highlights
CLOSED: [2021-12-02 Thu 20:04]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 20:04] \\
  There is a better alternative in Daniel Mendler's goggles package:
  <https://github.com/minad/goggles>.
:END:
,** DONE [#A] Review all "translation layer for legacy values" [12/12]
CLOSED: [2021-12-03 Fri 19:54]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 19:54]
:END:

I will keep the translation layer everywhere for a few more months (or
even longer).  There is no reason to break people's configurations, even
though the breakage would be small, all things considered.

As such, we use this as an opportunity to review the functions for
stylistic consistency and edit them accordingly.

,*** DONE modus-themes--prompt
CLOSED: [2021-12-03 Fri 18:22]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 18:22] \\
  Change the symbol of a local variable for greater clarity.
:END:
,*** DONE modus-themes--paren
CLOSED: [2021-12-03 Fri 19:34]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 19:34] \\
  Change the symbol of a local variable for greater clarity.
:END:
,*** DONE modus-themes--syntax-foreground
CLOSED: [2021-12-03 Fri 19:35]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 19:35] \\
  Change the symbol of a local variable for greater clarity.
:END:
,*** DONE modus-themes--syntax-extra
CLOSED: [2021-12-03 Fri 19:36]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 19:36] \\
  Change the symbol of a local variable for greater clarity.
:END:
,*** DONE modus-themes--syntax-string
CLOSED: [2021-12-03 Fri 19:36]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 19:36] \\
  Change the symbol of a local variable for greater clarity.
:END:
,*** DONE modus-themes--syntax-comment
CLOSED: [2021-12-03 Fri 19:36]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 19:36] \\
  Change the symbol of a local variable for greater clarity.
:END:
,*** DONE modus-themes--heading
CLOSED: [2021-12-03 Fri 19:37]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 19:37] \\
  Change the symbol of a local variable for greater clarity.
:END:
,*** DONE modus-themes--mode-line-attrs
CLOSED: [2021-12-03 Fri 18:11]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 18:11] \\
  Moved the conditionality of the box attribute outside the ~let~
  binding and also renamed a locally bound variable for greater clarity.
:END:
,*** DONE modus-themes--link
CLOSED: [2021-12-03 Fri 19:40]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 19:40] \\
  Change the symbol of a local variable for greater clarity.
:END:
,*** DONE modus-themes--link-color
CLOSED: [2021-12-03 Fri 19:40]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 19:40] \\
  Change the symbol of a local variable for greater clarity.
:END:
,*** DONE modus-themes--region
CLOSED: [2021-12-03 Fri 19:41]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 19:41] \\
  Change the symbol of a local variable for greater clarity.
:END:
,*** DONE modus-themes--hl-line
CLOSED: [2021-12-03 Fri 19:42]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 19:42] \\
  Change the symbol of a local variable for greater clarity.
:END:
,** DONE [#A] Review inline functions [4/4]
CLOSED: [2021-12-03 Fri 21:32]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 21:32]
:END:
,*** DONE Streamline use of modus-themes--variable-pitch-ui
CLOSED: [2021-12-03 Fri 21:31]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 21:31] \\
  We use a new bespoke face, which is then inherited by all relevant
  constructs.  This minimises the use of the internal function.
:END:
,*** DONE Analyse use of modus-themes--link-color [2/2]
CLOSED: [2021-12-03 Fri 20:38]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 20:40]
:END:

Maybe we don't need all of those and can instead consolidate around 2-3
styles.

,**** DONE Simplify apropos faces
CLOSED: [2021-12-03 Fri 20:13]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 20:13] \\
  They do not need to look like buttons because of how "busy" the buffer
  of 'M-x apropos' ends up looking.
:END:

,**** DONE Comment out discontinued org-roam faces
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 20:38] \\
  It seems that all the faces we support to date no longer exist upstream.
  Instead there are all sorts of new faces that we urgently need to cover.
  Hopefully some org-roam user can help me make sense of the context.
:END:

,*** DONE Consolidate the modus-themes--tab styles
CLOSED: [2021-12-03 Fri 21:18]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 21:18] \\
  Applied bespoke faces and had all relevant interfaces inherit from them.
:END:

,*** DONE Make more considerate use of modus-themes--syntax-comment
CLOSED: [2021-12-03 Fri 21:04]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-03 Fri 21:04] \\
  There was no need to style the Git (Magit) commit/rebase faces for
  special keywords in comments.
:END:

There are a few places that we could do without it.  Perhaps we can
apply a single colour or just use a bold weight.  Will need to test.

,** TODO [#A] Support current org-roam faces
,** TODO [#B] Decide on the modus-themes-scale-* [0/3]

I am caught between two minds here: on the one hand, it is easier for
new users to tweak standalone user options, yet on the other we are
using a more restricted setup than we could.  Perhaps it would be better
for ~modus-themes-headings~ to accept a number value as part of the
heading's properties.

,*** TODO Remove modus-themes-scale-small

It is not useful in general.  It is only used in the Org agenda and it
breaks the otherwise neat alignment (because it is contingent on the
size of the font, rather than being done pixelwise)...  The idea of
smaller text in the agenda is appealing, but not if it break things.

,*** TODO Decide on modus-themes-scale-title

If we remove/refactor the ~modus-themes-scale-N~ then what must become of
this?  It is used for titles in Org documents as well as the Org agenda
structure.

,*** TODO Check modus-themes--scale [0/3]

Regardless of whether we review the aforementioned, we need to be more
considerate with how we apply the =,@(modus-themes--scale ...)=.

,**** TODO Review markup-faces (adoc-mode) headings
,**** TODO org-tree-slide-header-overlay-face inherit from org-document-title
,**** TODO Miscellaneous headings [0/6]

Review them on a case-by-case basis.

,***** TODO font-latex-slide-title-face

This should probably just inherit from ~modus-themes-headings-1~.

,***** TODO cfw:face-title

Maybe use a =:height= directly?

,***** TODO helm-source-header

Just use a =:height=?  This needs more thought and extensive testing.

,***** TODO ioccur-title-face

Same as for the helm-source-header.

,***** TODO phi-grep-heading-face

I do not remember how its interface looks like.  Needs to be tested
thoroughly, but maybe a =:height= attribute will be enough.

,***** TODO EMMS headings [0/4]

Using a =:height= might suffice.

,****** TODO emms-browser-album-face
,****** TODO emms-browser-artist-face
,****** TODO emms-browser-composer-face
,****** TODO emms-browser-year/genre-face

,** TODO [#C] Formalise guidelines for package support

Going forward, I want us to be more opinionated about which packages we
support.  Otherwise the scope of the themes is practically infinite.

This is a /tentative/ list of scenaria, with the understanding that we are
never going to subject ourselves to a mechanistic process and shall
always exercise judgement:

+ The package has an established user base and/or clear niche and/or is
  actively maintained.  If a package re-invents an existing feature in a
  way that is not clearly better, then we exercise a "wait-and-see"
  approach (we do not need to support a new package from day one).

+ The package is generally useful and is not tied to someone's personal
  setup.  Example of packages that are disqualified: =prot-diff.el= from
  [[https://gitlab.com/protesilaos/dotfiles][my dotfiles]].

+ The package can be used without registering for some external service.
  For example, I cannot maintain =sx= because I do not use the
  stackexchange service.  In such cases, users must actively help with
  the design.

+ The colours that the package uses are not consistent with the
  technical objectives of the themes (accessibility, deuteranopia
  support where relevant) OR in case where it inherits from font-lock
  faces, the result does not look good in context and/or consistent with
  the rest of the theme.  For example, a package that inherits the
  ~region~ face when what it really wanted was ~match~ or ~highlight~.

+ If the package hardcodes colour values like red or green instead of
  inheriting from the ~error~ or ~success~ faces, we first try to contact
  the maintainer to provide a patch that works with all themes.  Same
  principle for when it inherits from base faces but does it in a
  sub-optimal way (like the above example with ~region~ and ~match~ or
  ~highlight~).  A small patch upstream is for cases where we would have
  done exactly that at the theme level.  Contributing to packages is
  better for the ecosystem.

+ There are several packages/faces that hardcode colour values which are
  taken from the Modus themes or are consistent with our objectives.  We
  normally do not need to explicitly style those.  If, however, there is
  something we should do, such as to make the faces conditional on a
  customisation option, then we must style them (provided the package is
  useful, has a user-base, etc.).  Doing so while informing the package
  maintainer is also a good idea.

,** TODO [#C] Document nobreak-char-display in the manual
,** DONE [#A] Remove long-obsoleted user options [2/2]
CLOSED: [2021-12-02 Thu 19:08]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:08]
:END:
,*** DONE Remove modus-themes-org-habit
CLOSED: [2021-12-02 Thu 19:08]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:08]
:END:
,*** DONE Remove make-obsolete of modus-themes-intense-hl-line
CLOSED: [2021-12-02 Thu 19:08]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 19:08]
:END:

This form:

,#+begin_src emacs-lisp
(make-obsolete 'modus-themes-intense-hl-line 'modus-themes-hl-line "1.3.0")
,#+end_src

,** DONE [#A] Implement universal deuteranopia toggle
CLOSED: [2021-12-02 Thu 16:50]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 16:50] \\
  Everything should now be subject to a single toggle:
  modus-themes-deuteranopia.  The modus-themes-success-deuteranopia is
  thus superseded, while the individual deuteranopia-friendly styles for
  diffs and the Org agenda's habit graph are altogether removed (there
  is no clean way to notify the user of their deprecation---apologies
  for the inconvenience!).
:END:

Note [[https://gitlab.com/protesilaos/modus-themes/-/issues/258][issue 258]] about the potential of using colour space adjustments to
cover all types of colour deficiency.  I think the consolidation into a
single boolean does not contradict that notion, but we will see.

,** DONE [#B] Simplify diff-related helper functions
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 18:50] \\
  Basically we just had to simplify the conditionality for deuteranopia
  and remove the relevant arguments.
:END:

,** DONE [#A] Remove "foreground only" diffs
CLOSED: [2021-12-02 Thu 13:30]
:LOGBOOK:
- State "DONE"       from "TODO"       [2021-12-02 Thu 13:30] \\
  There is a new section in the manual for those who want to restore
  that style.  I have been meaning to remove it for a long time, because
  it is not up to the established standard of the themes, but there was
  no good opportunity to do so.  Now that we are approaching version
  2.0.0 of the themes, it is right to make such backward-incompatible
  changes.
:END:

,#+begin_src emacs-lisp
;; Short version of what is in the manual:

(defun my-modus-themes-custom-faces ()
  (modus-themes-with-colors
    (custom-set-faces
     `(modus-themes-diff-added ((,class :background unspecified :foreground ,green))) ; OR ,blue for deuteranopia
     `(modus-themes-diff-changed ((,class :background unspecified :foreground ,yellow)))
     `(modus-themes-diff-removed ((,class :background unspecified :foreground ,red)))
     
     `(modus-themes-diff-refine-added ((,class :background ,bg-diff-added :foreground ,fg-diff-added)))
     ;; `(modus-themes-diff-refine-added ((,class :background ,bg-diff-added-deuteran :foreground ,fg-diff-added-deuteran)))
     `(modus-themes-diff-refine-changed ((,class :background ,bg-diff-changed :foreground ,fg-diff-changed)))
     `(modus-themes-diff-refine-removed ((,class :background ,bg-diff-removed :foreground ,fg-diff-removed)))
     
     `(modus-themes-diff-focus-added ((,class :background ,bg-dim :foreground ,green))) ; OR ,blue for deuteranopia
     `(modus-themes-diff-focus-changed ((,class :background ,bg-dim :foreground ,yellow)))
     `(modus-themes-diff-focus-removed ((,class :background ,bg-dim :foreground ,red)))
     
     `(modus-themes-diff-heading ((,class :background ,bg-alt :foreground ,fg-main)))
     
     `(diff-indicator-added ((,class :foreground ,green))) ; OR ,blue for deuteranopia
     `(diff-indicator-changed ((,class :foreground ,yellow)))
     `(diff-indicator-removed ((,class :foreground ,red)))
     
     `(magit-diff-added ((,class :background unspecified :foreground ,green-faint)))
     `(magit-diff-changed ((,class :background unspecified :foreground ,yellow-faint)))
     `(magit-diff-removed ((,class :background unspecified :foreground ,red-faint)))
     `(magit-diff-context-highlight ((,class :background ,bg-dim :foreground ,fg-dim))))))

;; This is so that the changes persist when switching between
;; modus-operandi and modus-vivendi
(add-hook 'modus-themes-after-load-theme-hook #'my-modus-themes-custom-faces)
,#+end_src

,** CANCEL [#C] Experiment with markup tweaks
CLOSED: [2021-11-27 Sat 07:56]
:LOGBOOK:
- State "CANCEL"     from "TODO"       [2021-11-27 Sat 07:56] \\
  There is no pressing need for this.  It would also make the code more
  complex.  Maybe we can come up with something else after the release
  of version 2.0.0.
:END:

,#+begin_src emacs-lisp
(defcustom modus-themes-text-markup nil
  "Control the style of markup in text-related modes (e.g. Org)."
  :group 'modus-themes
  :package-version '(modus-themes . "1.7.0")
  :version "28.1"
  :type '(set
          (cons :tag "Inline code"
                (const inline-code)
                (set :tag "Presentation of inline code" :greedy t
                     (const :tag "Subtle background and foreground (default)" nil)
                     (const :tag "No background" no-background)
                     (const :tag "Intense foreground color" intense)))
          (cons :tag "Metadata and comments"
                (const metadata)
                (set :tag "Style of metadata and comments" :greedy t
                     (const :tag "Subtle foreground (default)" nil)
                     (const :tag "Added background" background)
                     (const :tag "Intense foreground" intense)
                     (const :tag "Apply color accent" accented))))
  :set #'modus-themes--set-option
  :initialize #'custom-initialize-default
  :link '(info-link "(modus-themes) Plain text markup"))
,#+end_src

#+end_src

* EmacsConf 2021

Last week was the annual Emacs conference.  There were lots of
interesting talks: https://emacsconf.org/2021/schedule/.  You can follow
that link to review the schedule and to download any material you want.

I also made a presentation about how Emacs made me appreciate software
freedom.  Again, check the link for a download.  Or wait until I post
the video on my website and this channel.

Right now I just want to answer some questions from the event that I
only noticed today---it was not my intention to ignore them:

#+begin_quote
Q1: (Unrelated, feel free not to answer): Is there an Emacs or GNU/FSF
group in Cyprus? I know it's a politically motivated country, with a
strong student-base, so I'm interested whether the Emacs circles and
political circles have any overlap.
#+end_quote

A1: I don't know of such a group.  Maybe it exists but I live far away
from the city centres so I am not aware of anyone interested in those
issues.  When I was a university student here, there was no overlap
between politics and software freedom.  I was involved in
extracurricular activities but never heard anything related to
GNU/Linux, let alone Emacs.  Though to be fair, I was not tech-savvy
during those years.  I only got into computers at around 2012 and into
free software from mid-2016.

#+begin_quote
Q2: What do you think is the most effecitve way to demonstrate the value
of software freedom to non-techincal people? For a person who can't
program (or doesn't want to learn) the freedom seems less immediate.
#+end_quote

A2: I think the most effective way is to let people use the software.
Yes, the freedom is less obvious because you are not making things
happen from scratch.  But you do not have to.  The whole point of
software freedom, the reason we have a movement and communities, is to
understand and experience liberty in its full intersubjective scope.
Simply put, everyone experiences freedom by virtue of using free
software: they do not fear that some mega-corporation will terminate
their subscription, violate their privacy, and so on.  In the future I
will elaborate on intersubjectivity as pertains to this issue, but
hopefully this gives you an idea.

#+begin_quote
Q3: your quote "emacs makes emergent workflow's possible" reminds me
very much of the previous talk (Emacs as Design Pattern Learning). Can
you share/reflect how you go about making/designing your personal
workflows?
#+end_quote

A3: Just to clarify for others that you refer to the talk of Greta Goetz
(do watch it, by the way---there are many others, but if I mention some
I might unintentionally forget someone).  To your point: I like to use
packages that have a clear scope and follow good coding standards.
Simply put, this means that I prefer minimalist implementations that
lend themselves to composability.  I have explained before, both at
length and in depth, why I think Emacs is consistent with the Unix
philosophy; a philosophy that I consider interesting and fecund when
treated as a philosophy instead of a dogma or a mere historical
artefact.  When you have such sharp tools, you can easily combine them
when the need arises.  And because of their clean implementation, you
can make interventions where necessary to provide whatever missing glue
code.  Plus everything I covered in my EmacsConf 2021 presentation about
the introspecticability of Emacs and its other virtues.

* Joint video with David Wilson (System Crafters)

This is an issue that was brought up during EmacsConf and I also noticed
it in David's latest stream.  In short: yes, I am happy to do such a
video.  We now are on the same time zone now, which makes things
considerably easier.  In the meantime, there is no need to spam David
about it.
```

* * *

The video thumbnail is a tweak of the Levitating, Meditating,
Flute-playing Gnu under the terms of the GNU General Public License:
https://www.gnu.org/graphics/meditate.html
