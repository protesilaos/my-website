---
title: 'Modus themes: packaging changes for GNU ELPA and MELPA'
excerpt: "Announcement about the update of the 'modus-themes' on GNU ELPA and their impending removal from MELPA."
---

**Update 2021-03-28:** We got feedback from MELPA: the `modus-themes`
will stay there after all!  The newer parts of the discussion start from
here: <https://github.com/melpa/melpa/issues/7245#issuecomment-808810507>.  
{:.info}

As you may know, the Modus themes are part of Emacs28 for a few months
now.  Their latest version was synced upstream recently (read the
[release notes of version
1.2.0](https://protesilaos.com/codelog/2021-03-04-modus-themes-1-2-0/)).
The upgrade took longer than usual because there was a major refactoring
between versions `0.13.0` and `1.0.0`: in short, the themes are no
longer standalone files but are instead derived from a common source,
share customisation options and functions/commands, and are easier to
maintain.

This update sets in motion a series of events that I wish to be
transparent about.  Users updating from older versions to >= `1.0.0`,
are advised to read the [announcement on the emacs-devel mailing
list](https://lists.gnu.org/archive/html/emacs-devel/2021-03/msg00300.html).
The [web page of the change
log](https://protesilaos.com/emacs/modus-themes-changelog/) is also available.

## Changes for GNU ELPA

+ GNU ELPA, the official package archive that comes preconfigured with
  Emacs, is instructed to build the new `modus-themes` package directly
  from upstream Emacs.  It is considered a `:core` package, meaning that
  whenever we update the themes in emacs.git we will automatically get a
  new version on GNU ELPA.  This is meant as a convenience for users who
  are running a stable version of Emacs, such as Emacs27.
  
+ GNU ELPA also serves as a point of reference and credible source
  provider for other package archives such as Guix (see [issue
  111](https://gitlab.com/protesilaos/modus-themes/-/issues/111) on the
  Modus themes' issue tracker).

+ The old GNU ELPA packages `modus-operandi-theme`,
  `modus-vivendi-theme` (at version `0.12.0`) will soon be replaced with
  code that automatically pulls in the new `modus-themes` package.
  Then, after a grace period of, say, 6 months, the old packages will be
  deleted and only `modus-themes` will remain.  This has been discussed
  in Emacs [bug#46964](https://debbugs.gnu.org/cgi/bugreport.cgi?bug=46964).
  I still have not had the time to study how those in-place substitutes
  will be implemented, but rest assured that it will be done.
  
+ The `modus-themes` in emacs.git and, by extension, in elpa.git are
  updated whenever I tag a new release.  This happens every month or so.
  The next version is `1.3.0`, which will be published some time in
  mid-April.

## Removal from MELPA

**Update 2021-03-28:** We got feedback from MELPA: the `modus-themes`
will stay there after all!  The newer parts of the discussion start from
here: <https://github.com/melpa/melpa/issues/7245#issuecomment-808810507>.  
{:.info}

+ MELPA maintainers, who have become aware of the status of the themes
  as described above, have asked me to delete the `modus-themes` package
  from their archive (see issues
  [#7245](https://github.com/melpa/melpa/issues/7245) and
  [#7246](https://github.com/melpa/melpa/issues/7246)).  The idea is
  that too many package variants can be confusing to users.

+ I will comply with the MELPA maintainers' request to delete the
  `modus-themes` package from their archive.  This will be done with a
  pull request against melpa.git either before the end of this week or
  the beginning of the next.

+ Existing users should be able to switch to the package provided by GNU
  ELPA.  I honestly do not know whether the transition will be seamless
  (e.g. if you have `(use-package modus-themes ...`) or whether it will
  require manual intervention.  My apologies for whatever inconvenience.

* * *

All of the above combined mean that there will no longer be a package
archive that contains a version of the themes corresponding to the
latest commit on modus-themes.git.  To run the bleeding edge, you must
either use something like `quelpa` or `straight.el`, or manually clone
and maintain a local copy of
[modus-themes.git](https://gitlab.com/protesilaos/modus-themes).

This is all for now.  Please [contact
me](https://protesilaos.com/contact/) if you have any questions.  I am
also posting this announcement on the Modus themes' issue tracker, in
case you want to comment there: <https://gitlab.com/protesilaos/modus-themes/-/issues/167>.
