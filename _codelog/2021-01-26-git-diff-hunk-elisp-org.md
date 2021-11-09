---
title: 'Informative diff hunks for Emacs Lisp and Org'
excerpt: 'How to tweak Git to display Emacs Lisp function names or Org headings in Git diff hunk headings.'
---

**Update 2021-01-26 20:30 +0200:** Fixed link to dotfiles.  
**Update 2021-01-27 13:55 +0200:** Tweaked Org regexp to avoid bold text at
the beginning of the line.  
**Update 2021-01-27 16:39 +0200:** Added Annex.
{:.info}

Today I learnt how to instruct `git` to read the syntactically relevant
beginning of the given context when producing diff hunk headings.  My
intent is to improve the output for Emacs Lisp and Org mode files.

The diff hunk heading is the text that is appended to the lines of a
given change.  You must have noticed those:

```
@@ -210,7 +210,7 @@ TEXT OF THE HEADING
```

By default, the text for Elisp buffers is not particularly informative.
For example:

```diff
 emacs/.emacs.d/straight/repos/prot-lisp/prot-simple.el | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/emacs/.emacs.d/straight/repos/prot-lisp/prot-simple.el b/emacs/.emacs.d/straight/repos/prot-lisp/prot-simple.el
index 318bb63e..3ea711f9 100644
--- a/emacs/.emacs.d/straight/repos/prot-lisp/prot-simple.el
+++ b/emacs/.emacs.d/straight/repos/prot-lisp/prot-simple.el
@@ -210,7 +210,7 @@ with the specified date."
   (interactive "P")
   (let* ((date prot-simple-date-specifier)
          (time prot-simple-time-specifier)
-         (format (if arg (format "%s %s" date time) date)))
+         (format (if arg (format "%s %s" date time) date))) ; This is a test
     (when (use-region-p)
       (delete-region (region-beginning) (region-end)))
     (insert (format-time-string format))))
```

The heading `with the specified date."` does not really enlighten us as
to what function is touched by this change.  Whereas with my newfound
knowledge I get this:

```diff
 emacs/.emacs.d/straight/repos/prot-lisp/prot-simple.el | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/emacs/.emacs.d/straight/repos/prot-lisp/prot-simple.el b/emacs/.emacs.d/straight/repos/prot-lisp/prot-simple.el
index 318bb63e..3ea711f9 100644
--- a/emacs/.emacs.d/straight/repos/prot-lisp/prot-simple.el
+++ b/emacs/.emacs.d/straight/repos/prot-lisp/prot-simple.el
@@ -210,7 +210,7 @@ (defun prot-simple-inset-date (&optional arg)
   (interactive "P")
   (let* ((date prot-simple-date-specifier)
          (time prot-simple-time-specifier)
-         (format (if arg (format "%s %s" date time) date)))
+         (format (if arg (format "%s %s" date time) date))) ; This is a test
     (when (use-region-p)
       (delete-region (region-beginning) (region-end)))
     (insert (format-time-string format))))
```

The `(defun prot-simple-inset-date (&optional arg)` is insightful as it
lets us understand in more precise terms the context of the relevant
change.

Same principle for Org, where it will read the heading under which the
diff occurs:

```diff
 emacs/.emacs.d/emacs-init.org | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/emacs/.emacs.d/emacs-init.org b/emacs/.emacs.d/emacs-init.org
index efe0d8a7..d71f8f8d 100644
--- a/emacs/.emacs.d/emacs-init.org
+++ b/emacs/.emacs.d/emacs-init.org
@@ -3359,6 +3359,8 @@ *** Version control framework (vc.el and prot-vc.el)
 all basic versioning needs.  It however never stands as Magit's peer
 when it comes to the sheer coverage of Git features.
 
+This is a test.
+
 To my mind, VC and Magit can be used as part of the same setup.  Employ
 the former for common tasks such as viewing diffs and logs, committing
 changes in bulk, pushing and pulling from a remote.  And let Magit
```

Got the correct heading: `*** Version control framework (vc.el and
prot-vc.el)`.  Much better!

## Git config and attributes files

To get things to work we need to create `~/.config/git/attributes` and
add at least the following:

```
*.lisp  diff=lisp
*.el    diff=lisp
*.org   diff=org
```

Then, in `~/.config/git/config` append:

```
[diff "lisp"]
  xfuncname = "^(\\(.*)$"
[diff "org"]
  xfuncname = "^(\\*+ +.*)$"
```

And you should be good to go.

This is based on information I got from the manpages.  The first version
of the regular expressions comes from this page:
<https://gist.github.com/ruediger/5647207>.

My Git config:

```
[user]
  name = Protesilaos Stavrou
  email = info@protesilaos.com
  signingkey = 99BD6459CD5CA3EA
[core]
  excludesfile = ~/.config/git/ignore
  attributesfile = ~/.config/git/attributes
[commit]
  gpgsign = true
[merge]
  conflictstyle = diff3
[pull]
  rebase = false
[format]
  thread = true
[diff "lisp"]
  xfuncname = "^(\\(.*)$"
[diff "org"]
  xfuncname = "^(\\*+ +.*)$"
```

## Quality-of-life improvements

I am very happy with this otherwise minor tweak and am looking forward
to learn more about optimising my computing environment.  Git, in
particular, is a powerful and comprehensive suite of tools that has a
lot to offer.  I have been reading through its manpages now that I am
not a total novice (with either `M-x man` or `M-x woman`) and am
discovering new information that can, among others, benefit my Emacs
setup.

My git-related configurations are part of my dotfiles.  That is where I
also keep all my Emacs files: <https://gitlab.com/protesilaos/dotfiles>.

If some Emacs power user knows how to improve upon this setup, please do
contact me: <https://protesilaos.com/contact>.

## Annex

Gustavo Barros contacted me to share another take on the Elisp regexp.
I am sharing it with permission.  This matches `outline-minor-mode`
comment headings, any top-level form at beginning of line, and some
selected forms even when indented:

```
[diff "lisp"]
  xfuncname = "^(((;;;+ )|\\(|([ \t]+\\(((cl-|el-patch-)?def(un|var|macro|method|custom)|gb/))).*)$"
```

I like the idea and am excited to see what else we can do with this and
other "hidden gems" of Git.
