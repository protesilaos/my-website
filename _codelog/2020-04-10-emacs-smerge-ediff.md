---
title: 'Emacs: use SMERGE and EDIFF to resolve file conflicts'
excerpt: 'Video demo of two built-in Emacs tools for handling file differences and dealing with merge conflicts (such as when working with Git).'
layout: vlog
mediaid: '9S2pMZ6U5Tc'
---

In this video I run a real-world scenario of a failed merge in a
Git-controlled project.  The idea is that one branch cannot be merged
cleanly into the other because there are conflicting differences between
a few files.  Git cannot choose on its own, so it is leaving things to
us.

This is where `smerge-mode` and `ediff` can into the picture.  Both
tools are built into Emacs and can be used in tandem with Magit or the
standard Version Control framework (VC).  The workflow is practically
the same.

Check [my dotemacs](https://protesilaos.com/emacs/dotemacs) for more on these.
