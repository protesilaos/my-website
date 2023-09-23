---
title: "Emacs: restart MCT development"
excerpt: "I am restarting the development of mct.el, but only for keeping it in a usable state."
---

I just pushed this to the Git repository of `mct.el`:

```
commit ea1edfff5e394b2609b11a52ab2fe7659842b310
Merge: 3f15ff6 f52ee53
Author: Protesilaos Stavrou <info@protesilaos.com>
Date:   Sat Mar 25 21:02:43 2023 +0200

    Merge branch 'restart-development'

    [...]

 Makefile   |  24 ---
 README.md  |  19 ++
 README.org | 490 +++++++-------------------------------------------
 mct-avy.el | 100 -----------
 mct-tcm.el | 121 -------------
 mct.el     | 589 +++++++++++++------------------------------------------------
 6 files changed, 202 insertions(+), 1141 deletions(-)
```

Below is the complete commit message.

* * *

Merge branch 'restart-development'

I am restarting the development of MCT with the sole intent to keep it
in good working condition for the handful of users who like it.  I do
not plan to expand the scope of the package.  Instead, I am removing
certain features of dubious value and am cleaning up the code (which
was in a good state, all things considered).

To recap:

- MCT is a layer of interactivity on top of the default Emacs
  minibuffer and the *Completions* buffer.  It treats the two as a
  unified space and provides commands to intuitively move between
  them.

- MCT provides a facility for "live completions" which automatically
  update the *Completions* buffer given certain conditions.  Users
  have access to options for a passlist and blocklist which further
  control what should be live updated.

- On 2022-04-14 I had announced the discontinuation of the project's
  development:
  <https://protesilaos.com/codelog/2022-04-14-emacs-discontinue-mct/>.
  The reason was that Emacs 29 was assuming certain features that MCT
  had.  I thought that Emacs 29 would provide an MCT-equivalent
  experience and was making way for that eventuality.  It turns out
  that I was mistaken: MCT is still more featureful and might show the
  direction for future developments on Emacs 30.

Now the other news:

- I still think `vertico` by Daniel Mendler is the best User Interface
  for the minibuffer.  Where relevant in my Emacs coaching sessions, I
  always recommend Vertico: <https://protesilaos.com/coach>.  It is
  robust and highly configurable.  What MCT does, Vertico does better.
  My plan for my personal config is to have two modules, one for
  Vertico and another for MCT, so that I can use the former by default
  and the latter when needed.  (Again, I want to maintain MCT but will
  not add major new features.)

- I have removed support for Emacs 27.  This was a mistake from day
  one.  Emacs 27 cannot show the *Completions* buffer in one-column
  view and thus lacks the primary user-facing aspect of MCT.

- I have removed everything that has to do with in-buffer completion
  (`completion-in-region`).  While it is nice to have a uniform
  interface for completions in the minibuffer and inside buffers, the
  latter was never good enough.  This is not an MCT problem, but how
  inherently limited the *Completions* are in the scenario where the
  minibuffer is not activated.  I will continue using `corfu` by
  Daniel Mendler.

- For a brief period of time I experimented with various extensions to
  the core MCT functionality (e.g. integrating with `avy.el`.  These
  are all removed.  There now is a single 'mct.el' file.  It works
  fine for what it was originally designed to do: enhance the
  minibuffer UI.

* * *

That was it.  Further information:

+ Package name (GNU ELPA): `mct`
+ Official manual: <https://protesilaos.com/emacs/mct>
+ Change log: <https://protesilaos.com/emacs/mct-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/mct>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/mct>
    + GitLab: <https://gitlab.com/protesilaos/mct>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Video demo: <https://protesilaos.com/codelog/2021-10-22-emacs-mct-demo/>
+ Backronym: Minibuffer Confines Transcended; Minibuffer and
  Completions in Tandem.
