---
title: "Re: opinion on good Git commit messages?"
excerpt: "My reply to a question about how I write Git commit messages for my dotfiles, Emacs projects, and others."
---

What follows is my reply to a question about how I write Git commit
messages for my dotfiles and other projects such as my packages for
Emacs.  I am sharing this with the express permission of my
correspondent, without disclosing their identity.

* * *

> What is your opinion on how to write good commit messages for
> dotfiles? I also have a dotfiles repo of my own and look at yours
> with inspiration, but I find that when it comes to my commit
> messages, I often over complicate the commit message even if the
> change is simple, I have taken inspiration from the way you write
> your commit messages.  Before, I would write the full path to a file
> for example in the commit message, now I just write the name of the
> single file that was changed, and it is much simpler.
>
> Also, before I didn't know that there should be a short summary and
> then a blank line and a more detailed decription, I would write the
> entire message and description in one line which is a bit stupid
> lol.
>
> I guess what I'm asking is, how to keep commit messages as simple as
> possible and not overcomplicate them.

[ Can I publish this on my website?  I want to include the above quote
  from you followed by my reply.  I will not mention your personal
  details.  Publishing this makes it easier for me to reference it in
  the future in case I get the same question again.  What do you
  think? ]

I follow these guidelines:

* Write a commit summary that is maximum 50 characters long.  This is
  not a hard requirement, but it's good to have a target in mind.

* Go beyond 50 characters if it makes sense.  Guidelines are helpful
  when they put us in a certain frame of mind.  They inhibit us when
  we take them as inviolable articles of faith.  Don't allow yourself
  to be held hostage by your own rules.

* Leave an empty line between the commit summary and its description.
  I am not sure if this is an actual requirement of Git, though it
  really helps read commit logs as it establishes a clear separation
  between the summary and its description.

* Make the summary informative.  For example "Require the 'compat'
  library" tells you exactly what the change is about.  Whereas
  something like "Fixes old versions" is ambiguous.  Precision helps
  you figure out what you need to focus on.  Be economical with your
  resources.

* Use imperative language in the commit summary, such as "Do stuff"
  NOT "This change does stuff".  (The same is true for Emacs Lisp doc
  strings, by the way.)  Think of your messages as instructions.
  Clear instructions have a higher chance of communicating intent and
  purpose.

* Make commits thematically consistent.  Only commit what is relevant
  to the change you are making.  For example, don't mix changes to
  typos in doc strings with critical bug fixes because that adds noise
  to the diff, making it harder to reason about the actual coding
  modifications.  Keeping commits thematically consistent has the
  practical advantage of making conflict resolution easier (rebasing,
  merging another branch, ...).

* Write a description for the commit when you need to provide some
  background information.  Don't do it if the change speaks for
  itself.  When in doubt, err on the side of verbosity: describe what
  you did as others (or future you) cannot read your mind.  In terms
  of the context of the commit, I often link to a discussion or
  explain some other input that is relevant to the change yet not
  pertinent to the edited document, such as "Thanks to `PERSON` for
  telling me about `ISSUE` on the mailing list: `LINK`."  Those commit
  messages are useful when preparing release notes.  I guess you have
  seen how detailed my documentation is on that front.  The task of
  writing a change log is not relevant for private projects, but it
  still is a good habit to operate as if you are doing public work:
  you embed through continuous practice the aforementioned clarity and
  precision.

* My opinion is that automated change logs deny you the unique
  opportunity to reflect on your latest changes.  Use the release date
  as an impetus of a much-needed review.  Doing so deepens your
  understanding of your project and its historical trajectory.  Plus
  all the benefits of continuously practising your ability to
  elucidate thoughts with intent.

* I prefix the file name to denote the scope of the change when that
  is helpful.  Sometimes I use a generic description instead.  For
  example "prot-emacs-git: add key bindings for project-dired" tells
  me exactly what I need to know when looking at a heterogeneous set.
  This only happens in my dotfiles though there are other scenaria
  where a scope prefix is useful.  Other projects of mine do not have
  diverse file sets, so the scoping is redundant.  Again, don't be
  dogmatic: interpret your rules in accordance with practical reason.

Don't be lazy.  Consistency is key.  Keep a high standard for your
commit history: (i) it helps you with your retrospection or
troubleshooting, (ii) it allows others to understand your project
better, and (iii) it puts you in the mindset of being clear and
deliberate on a daily/regular basis.
