---
title: "Emacs Lisp Elements: EPUB and PDF versions now available"
excerpt: "My free book on the Emacs Lisp programming language is now available in EPUB and PDF formats."
---

I just added `.epub` and `.pdf` versions of my free book _Emacs Lisp Elements_. All files are available in the Git repository: <https://github.com/protesilaos/emacs-lisp-elements>.

I produced both of those from the source Org file. Here are the steps for posterity:

- From the `elispelem.org` use the Org export mechanism to generate an Info manual (by default: `C-c C-e i i`).
- This will generate a `.texi` file, which is then used as the source for the `.info` file.
- From the command-line do `texi2any --epub elispelem.texi` to get the EPUB file.
- For the PDF, install the dependencies with something like `sudo apt install texlive`.
- Finally, run `texi2any --pdf elispelem.texi`.
