---
title: 'Fuzzy search with “Ivy actions” for FZF and RIPGREP (Emacs)'
excerpt: 'In this video I show a couple of my functions to search for file names or file contents recursively, using Ivy/Counsel, FZF and RIPGREP.'
layout: vlog
mediaid: 'IDkx48JwDco'
---

In this video I demonstrate a workflow for searching for files
recursively inside of a directory, using either a partial file name or
through the contents of a file.

My functions leverage two external programs: `fzf` and `rg` (or
`ripgrep`).  These are parsed through the Ivy completion framework and
its general Counsel front-end.  In addition, I show the power of custom
"Ivy actions" to dynamically change the scope of the search from file
names to contents and vice versa, or to just switch the root directory.

For this setup check [my dotemacs](https://protesilaos.com/emacs/dotemacs).
