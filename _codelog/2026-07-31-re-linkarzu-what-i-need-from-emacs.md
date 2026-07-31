---
title: "Reply to @linkarzu about 'What I Need From Emacs'"
excerpt: "A comment on what Christian Arzu is searching for a better experience with Emacs."
---

Christian Arzu from the @linkarzu channel on YouTube has just
published a ~16-minute video with the title [What I Need From Emacs: A Video for Prot](https://www.youtube.com/watch?v=hWn8xdWP2eo).

I am happy he has done this and am eager to discuss those concepts in
further depth. In this article I will comment on the specific points
Christian raises as well as on the overarching theme of his experiment
with Emacs.

## Emacs has "sessions" out-of-the-box

Christian has experienced friction with using Emacs. Much of it
revolves around the notion of "sessions" that Kitty provides. At least
for the way Christian uses sessions, Emacs has the equivalent concept
of "projects". Each project is a version controlled directory (Git in
this case, though Emacs supports many others as well).

To tell Emacs where your Git repositories are, so that it can record
all of them as known projects, do `M-x project-remember-projects-under`
and select the directory at the follow-up prompt.

To switch between projects, use `M-x project-switch-project`. At this
prompt, you use search to narrow the results and pick one among your
existing projects. There is also an option to open a specific
directory that is not yet a known project, which will thenceforth be
remembered as a project if it is under version control (there are
other options on how projects are identified, but the presence of
version control system is the default check).

Projects also become known if you invoke one of the project-specific
commands from inside the given Git repository. For example, if you
call the command `project-find-file`, it will do what it is supposed
to do (more below) in the current repository and store that repository
as one your projects for future use.

## Quickly find a file anywhere in the project

The `find-file` command (`C-x C-f` by default) is about manually
navigating to a path. Christian finds this cumbersome and indeed it is
if you are thinking in terms of selecting a file related to the
current project.

The command `project-find-file` consolidates all the files into a flat
list from where you can type a few characters to narrow the results
and pick the file you need.

Similarly, `project-find-dir` lets you pick any directory in the
current project, which is especially useful if you need to do
something with many files (e.g. rename a bunch of files or change
their permissions).

This principle extends to all other relevant commands. For example,
`project-shell` opens a shell buffer at the root of the current
project. If you are using something like the `ghostel` package
(<https://github.com/dakra/ghostel>), it provides the
`ghostel-project` command to open a fully fledged terminal emulator
(i.e. not just a "shell") in this project's root directory.

There are many other nice things that can be done on a per-project
basis, such as to run the relevant compile command, switch to the
project's buffers, perform a project-wide grep, and more.

And, generally, many packages will build on top of projects, such as
the popular `consult` package (<https://github.com/minad/consult>)
with some of its commands like `consult-find` and `consult-grep` (or
`consult-ripgrep`).

## The built-in projects can be combined with other features

These Emacs project capabilities can easily be combined with other
features that Emacs also supports out-of-the-box.

For example, you can set things up so that when you switch to a new
project it appears on another tab (displayed at the top of the Emacs
frame) or, indeed, to switch to another frame, within which there can
be tabs.

To augment projects, you can combine them with mechanisms that restore
buffers and/or window/tab/frame arrangements after you restart Emacs.
For example, the `bufferlo` package (<https://github.com/florommel/bufferlo>)
covers this space.

## Piecing together the system

Depending on one's needs, there is a lot that can be done to not only
recreate those sessions that Christian mentions but to do arbitrary
things on top, with the help of packages as well as custom Elisp (and
writing your own Elisp is very much in the spirit of extending Emacs
to do exactly what makes sense to you).

Though here we get into the area of workflow and the overall approach.
I think it is safer to try things one at a time from the ground up, so
that you can understand how the emergent system is pieced together.
This allows you to better reason about what you have and what you
need. Plus, it empowers you to troubleshoot things because you already
have a sense of what is there.

For example, you start with the projects as they are done in the
generic Emacs. When you find something that does not quite work, you
read the documentation to see if there is some user option to
configure things to your liking. Then you can search for packages that
augment the experience, based on your specific requirements and
expectations.

## Remember that Kitty sessions build on top of existing experience

Taking a step back, consider that what Kitty provides is not something
you get up-and-running with as a new user of terminal emulators.

When you are a beginner with terminal emulators, you barely understand
how things work and how you are supposed to interact with the tool.
Over time you learn all the nice things about the shell and eventually
you incorporate custom scripts and extensions that augment your
experience (like fuzzy finding, multiplexing, storing/restoring
configurations).

To remind yourself how austere the default experience is, launch an
unmodified instance of XTerm. It will bring to the foreground the fact
that what Christian is doing with his Kitty setup is many levels above
what a standard terminal-based workflow looks like.

And the key here is that each level corresponds to a corpus of
knowledge that took form through experience. In other words, it was
done over time.

The same is true for Emacs and everything else: you cannot speedrun
experience.

## Capturing thoughts very quickly

Christian demonstrates how he quickly creates a daily note to record a
reminder or fleeting thought. The equivalent built-in facility in
Emacs is `org-capture`: it can do a lot of things, but to cover
specifically what Christian wants, there is an `org-capture-templates`
configuration that records an entry under a specific tree of date
headings. Because there can be many such templates, the user can
define any variations they need to match their specific requirements.

If the user prefers that those fleeting thoughts are always captured
in standalone files, one per day, then the popular `org-roam` package
can do that through what it calls "dailies" (one note per day). There
are other ways to do the same thing, including with core Org, but
`org-roam` streamlines this method.

`org-roam` also covers another need Christian has, which is about
linking files together and finding the backlinks to them (again, there
are many ways to achieve this, but covering all the options is not the
topic here).

## You do not necessarily need Emacs

What I say to others and will write for Christian as well is always
have a good idea "why" you want something before committing to it.
This is how you find the motivation to stick to a project despite the
eventual setbacks. Without the "why" it is practically guaranteed that
you will quit early.

NeoVim, Kitty, and friends can combine to provide practically all the
features that Emacs has. Users may then argue over the relative pros
and cons of each approach, which I personally consider a distraction
because what matters is to have a computing environment that gets the
job done. The gist, however, is that if NeoVim+extras works for you,
then you do not really gain anything from switching to Emacs: it is a
lateral step at best.

More importantly, if your current setup covers all your needs, you do
not have a compelling reason and thus the drive to persistently try
Emacs. It is the same for me: Emacs covers my needs, so I do not feel
any enthusiasm---or, indeed, curiosity---to spend time with other
options. Maybe those other options are excellent and maybe they can be
configured to be superior to my Emacs setup. But what I have fits my
workflow, so I do not have the emotional push to look elsewhere.

Without the "why", it will be practically impossible to stick with any
experiment: it will always make sense to revert to the state you are
familiar with.

## Careful with shortcuts in life

Allow me to elaborate on my claim that you cannot speedrun experience.
I will use an example from football (soccer), as I played it at a high
level and it may be a more relatable story anyway.

You watch the game and are excited to walk on the pitch right away to
score some goals. It looks cool and feels amazing! However, you have
not practised the fundamentals, like controlling the ball while
running and having situational awareness. You believe you can figure
those out while playing the actual match. As such, you overestimate
your abilities and set yourself up for failure.

Then, things get real all of a sudden. Within the first minute of the
match, you come up against someone like me, who makes no discounts and
takes no nonsense. I will not let you ever get near that ball: I will
be first on the challenge because I know how to position myself and,
even if I am not first, I will regain possession of the ball with ease
because I have done it a zillion times.

You will never get anywhere near scoring a goal and you will likely
not get the chance to be involved in the flow of even smaller patterns
of play like an exchange of passes. Whenever you are close to touching
the ball, I will be there breathing down your neck, hounding you
everywhere you go. Such is the gulf in experience that I will make
your life miserable on that pitch.

In short, your initial enthusiasm will quickly turn into frustration
because there will be no gameplay whatsoever for you. And the worst
part is that it will only get harder from there, as I will also be
competitive on top of being annoyingly better, with tough challenges,
crunching tackles, constant shittalking to add insult to injury, and
the overall aggression that shows a clear willingness to escalate
further.

This is not about me: I am using myself as a proxy for the experienced
player who grants you the honour of a true challenge. I am doing it to
make it feel real and thus to emphasise the frustrating parts because
this is exactly how life works when you are not prepared.

The morale of this story is that working on the fundamentals
guarantees a better long-term experience and, above all, is a process
you should not skip.
