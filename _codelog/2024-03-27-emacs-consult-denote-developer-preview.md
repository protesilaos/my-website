---
title: "Emacs: consult-denote developer preview"
excerpt: "consult-denote is a work-in-progress package to integrate the Denote and Consult Emacs packages."
---

I just published the prototype of `consult-denote`: <https://github.com/protesilaos/consult-denote>.

The idea is to use Consult across the various prompts of Denote to get
the helpful features of previewing and narrowing. In addition, we can
leverage Consult to perform searches in the `denote-directory`.

At this stage, I want to get a better sense of what we can do with
Consult to help users of Denote. If this is something people are
interested in, then we can check how to extend it further and
eventually produce a formal package for inclusion in GNU ELPA.

What `consult-denote` does as of this writing:

- Provides a drop-in replacement for the `denote-file-prompt`. This is
  used in a variety of commands, such as those that link between
  Denote files.
- Defines a source for `consult-buffer` which lists buffers that visit
  Denote files. We call these "Denote buffers".
- Introduces thin wrappers to search by files contents or name in the
  `denote-directory`. The commands are `consult-denote-grep` and
  `consult-denote-find`. The user options `consult-denote-grep-command`
  and `consult-denote-find-command` control which Consult function is
  called.
- Adds the `consult-denote-mode` to set up Consult-powered prompts in
  place of the generic ones that Denote offers. Currently, this is not
  done in the way I intend to do it: it uses the advice mechanism,
  though my plan is to modify `denote.el` (or others) to run the
  function prompts via a variable, thus giving packages like this one
  the option to cleanly define their own replacements.

I repeat, this is a prototype. I am not distributing a user manual at
this stage, nor am I doing any video demonstration. Let us first have
a fully fledged package. Then we go with the flow.
