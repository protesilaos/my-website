---
title: "Emacs coaching with Amin Bandali about ffs, display-buffer-alist, Org, and more"
excerpt: "I had a meeting with Amin Bandali in which we talked about his ffs.el package, display-buffer-alist, and a couple of Org-related topics."
---

Yesterday I met with Amin Bandali to talk about Emacs. Amin asked me
if he could record the session, which I agreed to. The video is
available on Amin's website: <https://kelar.org/~bandali/gnu/emacs/ffs-emacs-ext-prot.html>.

We started with a review of the latest changes to the `ffs` package
that Amin has been developing. We had looked into it before and wanted
to check on its current state.

Amin then asked me about the `display-buffer-alist`, which I had
mentioned before. To me, this is the single most important variable
for making Emacs feel more like your own. The reason is that it allows
you to control the placement of buffers to match your expectations. I
demonstrated some of the main ideas.

Another nice little feature is the built-in `isearch`. I explained how
it is especially helpful while recording keyboard macros. Though it is
nice to use in general. One tweak for it is to display a counter with
its matches. Another is to change how it treats spaces, so that it can
match any character in-between. This is not as flexible as, say,
`consult-line` (from the `consult` package) when combined with
`vertico` and `orderless`. Though it still has its uses.

[ I have lots of little extras for `isearch`, but those should be
  good for most users. ]

Amin told me about rediscovering the value of Org in the context of
statically generating his website. He showed me the custom Org HTML
export backend he has been working on. Org has so many nice features
which can be used independent of each other. In this light, we also
discussed the `diary` compared to the Org agenda.

Find all of Amin's publications on his website: <https://kelar.org/~bandali/>.
