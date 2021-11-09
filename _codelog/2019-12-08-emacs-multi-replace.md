---
title: 'Search+Replace across multiple files in Emacs'
excerpt: 'In this video I demonstrate a few techniques to replace search matches across a number of files or buffers, using a variety of tools.'
layout: vlog
mediaid: 'rLF9oTmVFsc'
---

In this video I demonstrate a few techniques to replace search matches
across a number of files or buffers, using a variety of tools.  The
tools I use involve:

+ `counsel-git-grep`, which is powered by the `ivy` completion
  framework and which can edit its output with `wgrep`.
+ `ivy-switch-buffer`, followed by `ibuffer` and `occur`.
+ `dired`, followed by an interface that looks like that of `occur`.

Other commands where `query-replace` and keyboard macros.

* * *

For my setup check [my dotemacs](https://protesilaos.com/emacs/dotemacs).  The
theme used in this video is "Modus Operandi" (`modus-operandi-theme`)
which is available on MELPA.  For more, check the [Modus themes on
GitLab](https://gitlab.com/protesilaos/modus-themes).
