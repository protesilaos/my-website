---
title: "Emacs: contribute to GNU Emacs core"
excerpt: "Video demonstration about how to make contributions to emacs.git (core GNU Emacs project)."
layout: vlog
mediaid: "xvBJv1ea-i4"
---

In this video I show how to make a contribution to emacs.git (core GNU
Emacs project).  There are multiple steps involved and you want to do
things the right way.

**UPDATE 2023-08-04 11:27 +0300:** In the video I did not mention the
commands `vc-prepare-patch` (Emacs 29+) and `submit-emacs-patch`
(Emacs 28+).  They are designed to streamline the process of preparing
and submitting patches.  If you are on Emacs 29 or higher, just call
`vc-prepare-patch` and it will handle the rest.  I also did not
mention the excellent `magit` package, as that would have made the
video much longer (I use both VC and Magit, depending on what I am
doing, with the latter being more featureful).  Magit can format
patches and can also insert the "change log" skeleton needed for
commits to the emacs.git repository.

* * *

All my Emacs packages: <https://protesilaos.com/emacs>.
