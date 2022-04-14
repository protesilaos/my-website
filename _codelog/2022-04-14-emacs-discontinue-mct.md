---
title: "Emacs: discontinuing development of MCT"
excerpt: "Deprecation notice for my 'mct' Emacs package."
---

My `mct` package for Emacs provides a layer of integration between the
default minibuffer and the standard `*Completions*` buffer.  The idea is
to make the two work as part of a singular interface and establish
relevant patterns of interaction.

Recent developments in emacs.git indicate that the next stable version
of Emacs will have MCT-like functionality built-in.  Some regressions in
`mct.el` are already caused by those changes.  More might follow.  I
think it is not sustainable to track a moving target, nor is it
desirable to replicate functionality that core Emacs already offers or
will soon provide.  I thus consider it preferable to recognise that MCT
is becoming surplus to requirements and shift my attention to more
productive endeavours.

Things are in a state of flux right now.  Please check the ongoing
discussions about completion on the emacs-devel mailing list.  If you
are using Emacs 29, I encourage you to try the new features (check the
NEWS with `C-h n` (`M-x view-emacs-news`)) and send your feedback to the
maintainers, else switch to the `vertico` package by Daniel Mendler.

## Will MCT be deleted?

No.  The package still works and will continue to do so for Emacs 28
(the current stable version of Emacs).  If you like what you have, there
is no pressing need to change your setup.

If I ever decide to delete the package, I will publish an announcement
(or series thereof) several months in advance.

## Are you abandoning MCT?

I will continue to support the package.  Though I will no longer try to
make it work with Emacs 29.  We must respect what is happening in
emacs.git and adapt accordingly.
