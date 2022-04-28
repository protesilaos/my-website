---
title: "Primer on formatting Git patches with Emacs (Magit)"
excerpt: "Brief guide on how to use Emacs' Magit package to format Git patches: a nice and easy way to contribute to projects."
---

As noted in a previous publication, I am [moving all my projects to
SourceHut](https://protesilaos.com/codelog/2022-04-07-all-emacs-projects-sourcehut/),
starting with my Emacs packages ([Manuel Uberti is doing the
same](https://manueluberti.eu/real-life/2022/04/08/sourcehut/) and maybe
others will follow suit).  I perform this migration because I prefer an
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
* Mailing list: <https://lists.sr.ht/~protesilaos/logos>.  When you
  write an email, it is addressed to
  [~protesilaos/logos@lists.sr.ht](mailto:~protesilaos/logos@lists.sr.ht)
  as noted in the list's description.

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

     **UPDATE 2022-04-11 07:46 +0300:** As Sean Whitton points out in an
     email, it probably is easier to use the `-N` flag instead of
     specifying a range of commits, where `N` is the number of commits
     counting from the `HEAD` (this information from the email exchange
     is shared with permission):
     
         git format-patch -3

5. With the `.patch` files in place, all that remains is to prepare an
   email and include those files as attachments (there is also a way to
   send patches directly as an email, but I think standalone files are
   easier for the occasional contribution---check this detailed guide:
   <https://git-send-email.io/>).  Compose your regular message and send
   the files to the maintainer's email address or to the mailing list of
   the given project.  In our example, the latter is found here:
   <https://lists.sr.ht/~protesilaos/logos> (the link includes the exact
   email address of the list).  The advantage of the mailing list is
   that it is public, so others have a chance to review the discussion
   and/or store a copy of it.
   
   - Depending on the project, the mailing list will be the only option.
     Though I am okay if I receive patches for my packages in my
     personal email address.

   - The subject line of the email can start with the "[PATCH]" keyword
     to make things simpler.  If your patch is just one file, you can
     copy the subject line it already has, which includes the one-line
     description of the commit, like "[PATCH] Update the doc string of
     some-function".

You did it!  The maintainer will take care of the rest.

**UPDATE 2022-04-28 15:31 +0300:** SourceHut's web UI for mailing lists
does not display indicators for attached files.  The information is
still available in the mbox version of the discussion.  I consider this
unfortunate and too advanced of a use-case.  I have started a
[discussion on this
topic](https://lists.sr.ht/~sircmpwn/sr.ht-discuss/<871qy1796r.fsf@protesilaos.com>#<87bkx4jnzo.fsf@protesilaos.com>),
as I think a simple indicator would be helpful for those who are not
subscribed to the given list.

## Other tools

The [git-email Emacs package](https://git.sr.ht/~yoctocell/git-email) by
Xinglu Chen is a tool I have used a few times to format and send patches
as email files.  This may be a bit more advanced, but you might want to
check it out.

**UPDATE 2022-04-28 15:32 +0300:** Note my pending changes for
`git-email`.  [Original
patchset](https://lists.sr.ht/~yoctocell/git-email-devel/patches/31106)
and [revised patch for project.el integration on Emacs
29](https://lists.sr.ht/~yoctocell/git-email-devel/%3C875yn8h9i4.fsf%40posteo.net%3E).

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

* <https://protesilaos.com/emacs>
* <https://git.sr.ht/~protesilaos/>
* <https://lists.sr.ht/~protesilaos/>

Note that I have assigned copyright to the Free Software Foundation and
all my Emacs-related packages require you to do the same before making
any major contribution.  [Contact me](https://protesilaos.com/contact)
if you need help on that front or ask for a copyright assignment form
from the kind folks over at the emacs-devel mailing list by sending an
email to <emacs-devel@gnu.org>.  It looks like this (again, using the
`logos` package as a demo):

```
Please email the following information to assign@gnu.org, and we
will send you the assignment form for your past and future changes.

Please use your full legal name (in ASCII characters) as the subject
line of the message.

REQUEST: SEND FORM FOR PAST AND FUTURE CHANGES

[What is the name of the program or package you're contributing to?]

GNU Emacs

[Did you copy any files or text written by someone else in these changes?
Even if that material is free software, we need to know about it.]


[Do you have an employer who might have a basis to claim to own
your changes?  Do you attend a school which might make such a claim?]


[For the copyright registration, what country are you a citizen of?]


[What year were you born?]


[Please write your email address here.]


[Please write your postal address here.]




[Which files have you changed so far, and which new files have you written
so far?]

logos.el (GNU ELPA)
```


