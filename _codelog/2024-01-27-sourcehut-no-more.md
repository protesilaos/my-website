---
title: "I no longer maintain my Emacs projects on SourceHut"
excerpt: "I am switching away from SourceHut because it no longer fits my workflow."
---

On 2022-04-07 I moved all my Emacs projects from GitLab to SourceHut:
<https://protesilaos.com/codelog/2022-04-07-all-emacs-projects-sourcehut/>.
I am now undoing that decision. My code is on GitLab and GitHub, with
the latter as the de facto primary source.

Why the change:

- The SourceHut web interface does not show any kind of indication
  that a message has an attachment. Last time I tried it, I had to
  download an mbox file and extract the patch from there. This was
  helped by the fact that I knew what I was searching for, but the
  experience was not pleasant anyway.
- Many users are reluctant to subscribe to my project's mailing list
  and instead email me directly. This is fine, as I do get the work
  done eventually, but it beats the point of having a public inbox if
  I am the only one who reads those messages anyway.
- Personal emails for package maintenance make it more difficult for
  me to apply filters. I cannot easily go from "personal" to
  "packages" and thus have trouble prioritising tasks.
- Users replying to mailing list threads frequently do not "reply to
  all", so the filter I have for SourceHut lists does not apply and my
  inbox is noisy again.
- Coordinating work between my "official" SourceHut-based repository
  and the de facto GitHub one is a problem, because a user on one may
  not be aware of what a user on the other is doing.

There are other papercuts as well, but I understand SourceHut is still
in "alpha", so I will not list them here.

## What happens to the Git repositories on SourceHut?

I am no longer updating them and plan to delete them in the near
future.

## What about the mailing lists?

I will continue to reply to messages sent there, but I will eventually
ask people to use other media. If you do not want to use a Git forge
to report an issue or send a patch, then do it via my personal email:
<https://protesilaos.com/contact>.

## Will you host your own Git server?

I want to do this at some point because I am mindful of the issues
with proprietary Git forges. But this is a task that requires
knowledge and resources. So it will not happen soon.
