---
title: "Emacs: I am in the process of splitting Denote into many packages"
excerpt: "Development note on the future of my 'denote' package for Emacs. The plan is to separate the core from its extensions."
---

I am reorganising the `denote` package to have a clear separation
between "core" and "extensions". The idea is to decouple the two. The
`denote` package shall provide only the core functionality, while all
other features we already have will be available as standalone
packages.

The reason I am doing this is because the project has organically
grown over time to encompass lots of useful-yet-inessential
applications, such as Org dynamic blocks, journaling capabilities, and
sequence schemes, among others.

All those extras are nice to have, though they dilute the message
about what Denote is, making it seem far more complex than it actually
is. They are also held back by the minimalist outlook of the core:
they cannot be developed to their logical end, as any dependency they
incorporate becomes a dependency of the whole project, which makes no
sense (e.g. we can have a `transient.el` to interact with Denote
commands, but this is in no way essential, so why force it upon
everyone who downloads the `denote` package?).

## The core

Denote essentially is a file-naming scheme. We create new files or
rename existing ones to have file names that are easy to retrieve with
even basic tools. This is my use-case and the reason I wrote Denote: I
name my videos, PDFs, pictures, and "notes" with the Denote
file-naming scheme, making it easy for me to find everything.

I think the Denote file-naming scheme is ingenious, though the real
value is in having a scheme---any scheme---to force consistency in how
you name things. Consistency begets predictability, which in turn
increases the likelihood of finding your data.

The other part of retrieving information is through links. Part of the
Denote file-naming scheme is the date+time, which is a unique
identifier. We can thus link to any file in the `denote-directory`
using its identifier. Once we have these "forward links", we can
easily figure out what the "backward links" of a given file are, i.e.
which files link to the current one.

This is the core, plus a few other conveniences that I need not
enumerate herein.

## The extensions

Anything that builds on the aforementioned is an "extension" and will
have its own Git repository as well as user manual. To this end, I
have already removed `denote-sequence.el` from the `denote` core and
made it its own entity:

+ Package name (GNU ELPA): `denote-sequence` (⚠️ Not available yet)
+ Official manual: <https://protesilaos.com/emacs/denote-sequence>
+ Git repository: <https://github.com/protesilaos/denote-sequence>
+ Backronym: Denote... Sequences Efficiently Queue Unsorted Entries
  Notwithstanding Curation Efforts.

The plan is to do the same with the "Org extras", such as with all the
Org dynamic blocks, the "Markdown extras", the "journal extras", and
the "silo extras". Once all the packages are ready for widespread use,
I will add them to GNU ELPA. Until then, everything is a WORK-IN-PROGRESS.

For the time being, the technical discussion is done in issue 543:
<https://github.com/protesilaos/denote/issues/543>. The code which
will eventually be merged into the `main` branch resides in the
`reorganise-denote` branch: <https://github.com/protesilaos/denote/tree/reorganise-denote>.

## For the longer-term benefit of the project

There will be no reduction in the total set of features we provide.
This is only a matter of reorganising what we have, namely, to (i)
make it easier for new users to understand what Denote is, (ii) pick
only the extensions they require, (iii) make it possible to decentralise
the maintenance of the project should I ever need to step down (which
is not happening, but as a matter of principle).

Those granted, keep in mind that Denote is not a "second brain" and
will not make you smarter. It is a flexible and capable tool, truly
Emacs-y in its adaptability, that you can use as part of a workflow
that makes sense to you. Let us then decouple the core from its
extensions and continue to give users the best possible experience
with every piece of code and documentation that we write.
