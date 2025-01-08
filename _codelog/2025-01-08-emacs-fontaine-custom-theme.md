---
title: "Emacs: the next Fontaine version will use a custom theme"
excerpt: "Announcement about the current developments in my 'fontaine' package for GNU Emacs."
---

As part of the current development target of my `fontaine` package,
the way I implement changes to fonts is done via a custom theme.

```
commit 69e80d4a93b28804f3b9d8a0b4328952c2f0d568
Author: Protesilaos Stavrou <info@protesilaos.com>
Date:   Wed Jan 8 10:42:35 2025 +0200

  BREAKING use a custom theme instead of 'set-face-attribute' internals

 fontaine.el | 179 +++++++++++++++++++++---------------------------------------
 1 file changed, 63 insertions(+), 116 deletions(-)
```

Before, I was relying on the internals of `set-face-attribute` which
worked decently for the most part but required manual intervention to
persist the face attributes between theme changes. Whereas the custom
theme shall remain in effect no matter what, thus reducing complexity.

Furthermore, the custom theme allows me to declare the display
specification in which the given face attributes (i.e. the font
styles) apply. I can thus specify that these are for a graphical Emacs
frame only.

A potential advantage is the ability to modify any face, even if it is
not initialised, whereas `set-face-attribute` requires the face be
defined, else it produces an error. This potential is not realised for
the time being because there is no face of the sort that Fontaine
affects. All the faces it modifies are loaded eagerly by Emacs. If I
need to cover more faces though, it will be straightforward.

For users, the only obvious effect of this transition is the
discontinuation of the option to set a Fontaine preset per frame. All
face attributes are now always applied to all frames. I am doing this
because the old design did not work reliably in all cases and was a
niche feature anyway.

I am not aware of any regressions, though I continue to test the
package. If you do try it before the new version is out, please let me
know of any possible bugs or other improvements we can make.

## About Fontaine

Fontaine allows the user to define detailed font configurations and set
them on demand.  For example, one can have a `regular-editing` preset
and another for `presentation-mode` (these are arbitrary, user-defined
symbols): the former uses small fonts which are optimised for writing,
while the latter applies typefaces that are pleasant to read at
comfortable point sizes.

+ Package name (GNU ELPA): `fontaine`
+ Official manual: <https://protesilaos.com/emacs/fontaine>
+ Change log: <https://protesilaos.com/emacs/fontaine-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/fontaine>
  + GitLab: <https://gitlab.com/protesilaos/fontaine>
+ Backronym: Fonts, Ornaments, and Neat Typography Are Irrelevant in Non-graphical Emacs.
