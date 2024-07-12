---
title: "Emacs: Tell Org which linked files to open externally"
excerpt: "We can use the 'org-file-apps' to control which linked files are opened in an external program or inside of Emacs."
---

When Org resolves the file system path to a link that uses the `file:`
hyperlink type, it has a mechanism to decide whether to open that file
in Emacs or an external program. Here is some sample Org markup:

```org
A link to [[file:/path/to/test.html][an HTML file]] will open outside Emacs.
```

The idea is that some files are best handled by a specialised program,
such as a video with a media player. Generally useful, yes, though
there are cases where we may want to use Emacs. Hence the user option
`org-file-apps`.

This option lets us specify a list of cons cells, each of which
consists of a file matcher and method as `(MATCHER . METHOD)`. The doc
string describes the technicalities. For my case, the `MATCHER` is a
regular expression that targets the file type extension, while the
`METHOD` is the `emacs` symbol. Thus:

```elisp
;; Tell Org to use Emacs when opening files that end in .html
(add-to-list 'org-file-apps '("\\.html\\'" . emacs))
```

The `add-to-list` function is especially useful here, because it
appends the element to the existing value of the list. This is what we
probably want in this case as the default value of `org-file-apps` has
some reasonable associations already.

I learnt about this after troubleshooting a case with `denote:` link
types in Org files (`denote:` links are designed to behave like the
`file:` type). Org would open HTML files in the browser, making it
awkward to get to an Emacs buffer from where to edit the code. With
Denote in particular, it is common to rename files of any file type
(images, videos, PDFs, ...) to have the Denote file-naming scheme and
then link to them from an Org buffer. It is also possible to generate
new files in any writable file type, subject to some configurations.
This was my case, with the use of HTML files.

[ I also wrote a relevant entry about this in the Denote manual. ]

Thankfully, `org-file-apps` is there to (i) let us enjoy the power of
opening some `file:` (or `denote:`) links externally while (ii)
deciding when we want those to be in an Emacs buffer instead.
