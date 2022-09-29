---
title: "Emacs: new 'agitate' package (extras for VC Git and friends)"
excerpt: "Introduction to my new 'agitate' package for GNU Emacs. Extras for diff-mode, vc-git, log-edit, log-view."
---

Before I explain what this is, here is the dictionary entry for
**AGITATE**: Another Git Interface Trying to Agitate Tranquil
Emacsers. 🙃

`agitate` is a work-in-progress collection of commands or potentially
useful functions that expand on the available version control features
of Emacs.  Those are meant to complement a workflow that relies on the
built-in Version Control (VC) framework and its accoutrements:
`diff-mode.el`, `log-view.el`, `log-edit.el`, `vc-git.el`, and
potentially others.

The package is **available only on the GNU-devel ELPA** for the time
being.  I shall release a stable version when the time is right.  I
explain all about it the "devel" archive and relevant topics here:
<https://protesilaos.com/codelog/2022-05-13-emacs-elpa-devel/>.

At this stage, the intent is to iterate on the `agitate` code in order
to surface the best practices and, perhaps, discover the most common
missing requirements of VC users.  The emphasis is on the Git backend,
as that is what I am using, but there is no reason to limit the code
to it.  I do want to learn about other version control systems.

Unlike most of my packages, `agitate` has a _maximalist scope_ by
design.  Instead of, say, adding only to `vc-git.el` it takes a
broader view of the entire workflow of VC, which ties together
processes from different libraries (e.g. on Emacs 29, `C-x v v`
(`vc-next-action`) in a `diff-mode` buffer will produce a
`log-edit-mode` buffer to commit the changes).

+ Package name (GNU ELPA): `agitate`
+ Official manual: <https://protesilaos.com/emacs/agitate>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/agitate>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/agitate>
    + GitLab: <https://gitlab.com/protesilaos/agitate>
+ Mailing list: <https://lists.sr.ht/~protesilaos/agitate>
