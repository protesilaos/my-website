---
title: "Emacs: consult-denote version 0.2.0"
excerpt: 'Information about the latest version of my consult-denote package for GNU Emacs.'
---

Glue code to integrate my `denote` package with Daniel Mendler's
`consult`. The idea is to enhance minibuffer interactions, such as by
providing a preview of the file-to-linked/opened and by adding more
sources to the `consult-buffer` command.

+ Package name (GNU ELPA): `consult-denote`
+ Official manual: <https://protesilaos.com/emacs/consult-denote>
+ Change log: <https://protesilaos.com/emacs/consult-denote-changelog>
+ Git repository: <https://github.com/protesilaos/consult-denote>
+ Backronym: Consult-Orchestrated Navigation and Selection of
  Unambiguous Targets...denote.

Below are the release notes

## Version 0.2.0 on 2024-09-15


### The command `consult-denote-find` always previews files

This command will search for matching file names through the
`denote-directory`. It now previews the selected file in the
minibuffer, whereas before the preview had to be triggered manually.

Remember that you can customise what command is actually called, per
`consult-denote-find-command` (default is `consult-find`, with
`consult-fd` as another likely choice).


### The commands `denote-find-link` and `denote-find-backlink` have previews

This is relevant when `consult-denote-mode` is enabled. This mode
makes changes in the background to make all file-related Denote
minibuffer prompts have the preview functionality. The idea is that
users keep the same workflow and overall style, while benefiting from
the added features.

Thanks to hapst3r for suggesting something similar which made me
realise those commands were not actually covered by `consult-denote-mode`.

[ If there are more Denote commands that you think could benefit from
  `consult-denote-mode` but are not covered yet, please let me know. ]


### The package now has a manual and change log

You can find the relevant source files in consult-denote.git and their
web pages on my website.

-   Official manual: <https://protesilaos.com/emacs/consult-denote>
-   Change log: <https://protesilaos.com/emacs/consult-denote-changelog>
