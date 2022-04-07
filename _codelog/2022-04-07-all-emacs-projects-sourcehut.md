---
title: "Moving all my Emacs projects to SourceHut"
excerpt: "My plan is to move away from GitLab and use SourceHut instead. GitLab and GitHub mirrors will be available."
---

I just completed the migration of the main Git repository of the
`modus-themes` from GitLab to SourceHut:

```
  commit 6bdc035ea1d5559ec6220521d5926780539f04b9
  Author: Protesilaos Stavrou <info@protesilaos.com>
  Date:   Thu Apr 7 12:59:23 2022 +0300

      Move official Git repository to SourceHut

      The new source is <https://git.sr.ht/~protesilaos/modus-themes>.

      The GitLab URL which once was the main source of this project will
      function as a mirror from now on.  This is in addition to the GitHub
      equivalent:

      * <https://gitlab.com/protesilaos/modus-themes/>
      * <https://github.com/protesilaos/modus-themes/>

      The canonical mailing list for user feedback and/or patches is
      <https://lists.sr.ht/~protesilaos/modus-themes>.  Everyone is encouraged
      to use it: it is ordinary email and one can attach files (e.g. pictures)
      if needed.
```

The plan is to do the same with all my projects, starting from those
pertinent to my Emacs contributions: <https://protesilaos.com/emacs>.
Expect such changes in the coming hours and days.  Note that I must also
update GNU ELPA, MELPA, and related, so this might take a while.

## Why SourceHut?

I like SourceHut because it is aligned with my preference of using email
as my primary mode of communication.  In practical terms, I appreciate
the fact that I can perform all Git-related tasks from inside of Emacs
(i.e. produce and install patches, track email threads, ...), without
being forced to use some web UI.

Furthermore, I have been following [Drew
DeVault](https://drewdevault.com/), the founder of SourceHut, for
several years now and consider them a force for good in the libre
software space.

In principle, SourceHut is a paid service (which is consistent with
software freedom), though they accept registrations free of charge for
the time being.  One needs to register an account only if they host a
project there.  **An account is not required to participate on the
mailing lists.**

I purchased a one-year subscription for EUR 20.  This is the lowest tier
and the one I can afford right now.  The longer-term hope is to switch
to the EUR 100 per annum tier in order to support this worthy project.

## How to report an issue?

Check the mailing list: <https://lists.sr.ht/~protesilaos/modus-themes>
(replace the `modus-themes` with the name of the given repo, once
available).  The mailing list's URL provides an archive with all
relevant threads.  It also includes a way to subscribe to it, as well as
a convenient `mailto:` link to directly post a new message by composing
an email.

## What about the mirrors?

You can still use them to report issues.  Though I encourage you to at
least try the email-centric workflow of SourceHut.
