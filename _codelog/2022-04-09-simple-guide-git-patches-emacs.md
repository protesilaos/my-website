---
title: "Primer on formatting Git patches with Emacs (Magit)"
excerpt: "Brief guide on how to use Emacs' Magit package to format Git patches: a nice and easy way to contribute to projects."
---

As noted in a previous publication, I am [moving all my projects to
SourceHut](https://protesilaos.com/codelog/2022-04-07-all-emacs-projects-sourcehut/),
starting with my Emacs packages ([Manuel Uberti is doing the
same](https://manueluberti.eu/real-life/2022/04/08/sourcehut/) and maybe
others will do the same).  I perform this migration because I prefer an
email-centric workflow, which basically is a fancy way of admitting that
I want to consolidate everything inside of Emacs.  Part of this workflow
involves the use of standard Git facilities to make contributions to
projects.  Unlike certain web UIs that have you "fork" a project and
request a pull of your changes, there is the decentralised way of
committing your edits as usual and sharing them with the project as
patch files.  The maintainers then apply those with or without further
tweaks (e.g. emacs.git works this way).  No more faux forks!

What follows is a short guide to help you get started.  My `logos`
package shall serve as an example.  I think Magit is all you will ever
need to handle most (all?) such processes, though I also include the
relevant command-line part for the sake of completeness.  This is
supposed to be for beginners who already know the basics of Git and who
are using Magit.  It is not an exhaustive resource.  Consult the
official documentation for the technicalities.

For the `logos` package, we have these:

* Git repository: <https://git.sr.ht/~protesilaos/logos>.
* Mailing list: <https://lists.sr.ht/~protesilaos/logos>.

## Format patches

1. Clone the git repo as usual: <https://git.sr.ht/~protesilaos/logos>.

2. If you already have a local copy of the repository, make sure it is
   up-to-date.  Use `git pull` if necessary.

3. Commit your changes the way you always do.  You can conduct this
   operation on a separate branch, if you will, though using the main
   one is perfectly fine.  I only ever work on the target branch for
   such cases: if my patch is not accepted or if I change my mind, I
   simply revert the changes.

   - If you plan to make several changes, split your contribution in to
     as many commits, one per conceptual edit.  This makes it easier for
     you to have a clear understanding of your patch set, but also for
     the maintainers to review the code and apply it on a case-by-case
     basis.

4. Now that you have made your commits, it is time to format them as
   patches.  A "patch" typically is a standard file.  The maintainer can
   then directly apply that file ("install the patch", as we say) in
   their copy of the Git repo.

   - If you are using Magit, type `W`, then `c`.  In the transient
     pop-up buffer, you can now press `C-m o` to specify an output
     directory.  Otherwise it uses the one you are in.  When you are
     ready, hit the final `c` which will produce a prompt to "Format
     range or commit".  Your obvious options are the available refs.
     Just select the branch you are on (e.g. `main`) which means to use
     the latest commit on that branch.  It will produce a file with the
     `.patch` extension.  This is what we are looking for.

   - You can follow a similar process to format a range of commits as a
     patchset.  Display the commit log (such as with `l l`), select the
     region that includes the desired changes and type the
     aforementioned sequence of `W c c` (with `C-m o` to change the
     output path, if needed).  You will get a patch per commit.  Voilà!

   - Without Magit, we do this on the command line (I have a
     do-what-I-mean (DWIM) Elisp code for this and for applying patches
     which is part of my dotemacs' `prot-vc.el` file, but I need to
     polish it and share it as a formal package or patchset for
     `vc-git.el`).  The gist is as follows, per the
     `git-format-patch(1)` manpage:

         git format-patch HASH --output-directory PATH

     The `--output-directory` (or `-o`) part is optional.  For a range
     of commits, the commit `HASH` value should be in the form of
     `OLDER-HASH..NEWER-HASH`.  Give it a try.  It will produce files
     for each commit in that range.  Important caveat here is that the
     `OLDER-HASH` is not part of the range.  So if you want it to be
     included, use the one prior to it.

5. With the `.patch` files in place, all that remains is to prepare an
   email and include those files as attachments (there is also a way to
   send patches directly as an email, but I think standalone files are
   easier for the occasional contribution---check this detailed guide:
   <https://git-send-email.io/>).  Compose your regular message and send
   the files to the maintainer's email address or to the mailing list of
   the given project.  In our example, the latter is found here:
   <https://lists.sr.ht/~protesilaos/logos>.  The advantage of the
   mailing list is that it is public, so others have a chance to review
   the discussion and/or store a copy of it.
   
   - Depending on the project, the mailing list will be the only option.
     Though I am okay if I receive patches for my packages in my
     personal email address.

   - The subject line of the email can start with the "[PATCH]" keyword
     to make things simpler.  If your patch is just one file, you can
     copy the subject line it already has, which includes the one-line
     description of the commit, like "[PATCH] Update the doc string of
     some-function".

You did it!  The maintainer will take care of the rest.

## Other tools

The [git-email Emacs package](https://git.sr.ht/~yoctocell/git-email) by
Xinglu Chen is a tool I have used a few times to format and send patches
as email files.  This may be a bit more advanced, but you might want to
check it out.

For those who assume the role of applying patches from email
contributions, Xinglu recommends Kyle Meyer's [piem Emacs
package](https://git.kyleam.com/piem), though I have not used it yet.

Users of `notmuch.el`, such as myself, may also want to check out Sean
Whitton's [mailscripts project](https://git.spwhitton.name/mailscripts/)
which includes a `mailscripts.el` file.  As with `piem`, I have it on my
to-do list, but have yet to find the time to refine my toolkit...

## My projects and copyright assignment to the FSF

All my projects and concomitant mailing lists are here
(work-in-progress, as I am still migrating the repos and making all the
relevant changes):

* <https://git.sr.ht/~protesilaos/>
* <https://lists.sr.ht/~protesilaos/>

Note that I have assigned copyright to the Free Software Foundation, so
all my Emacs-related packages require you to do the same before making
any major contribution.  [Contact me](https://protesilaos.com/contact)
if you need help on that front or ask for a copyright assignment form
from the kind folks over at the emacs-devel mailing list by sending an
email to <emacs-devel@gnu.org>.
