---
title: "Emacs: new option for Denote letter casing"
excerpt: "Denote has a new option that lets users control the letter casing of file names. This opens up interesting possibilities."
---

There are lots of quality-of-life improvements to `denote` ahead of
version `2.1.0` (I might release it this month).  Among them is a new
user option to control the letter casing of individual file name
components.

Before I elaborate, a brief description of Denote is in order.  At its
core, Denote is a file-naming scheme implemented as an Emacs package
that (i) creates new "note" files and links between them, and (ii)
renames existing files.  Denote works with any file type---it is NOT
an Org extension.  Use it to manage your knowledge base and long-term
file storage.  When Denote operates on file names, it enforces its
file-naming scheme.  The idea is to embed valuable (i.e. searchable)
information in file names, including the time stamp, file title,
keywords, and a catch-all string of characters (the "signature").
File names can then be searched easily using standard tools, even if
Emacs is not available.  The details of the file-naming scheme and
everything else are documented at length in the manual.

Back to the new feature: the `denote-file-name-letter-casing` user
option.  The status quo ex ante was to downcase the entire file name,
whereas now we can have, say, keywords be recorded verbatim while the
rest are downcased.  A potentially useful application of this is to
apply camelCase, CAPITALS, aLtCaPs (see my `altcaps` package), etc.,
to keywords and/or the signature.

## The effect of the new option

Using the default value of `denote-file-name-letter-casing`, we get
the following file name for these inputs (e.g. by calling `M-x
denote`, `M-x denote-signature`, and the like).  I am using an
all-inclusive case here, though note that all file name components
apart from timestamps are optional.

| File name component | User input                 |
|---------------------+----------------------------|
| title               | "How do you turn this on?" |
| keywords            | "camelCase" "GNUEmacs"     |
| signature           | "SIG"                      |

```elisp
(setq denote-file-name-letter-casing  ; the defaults
      '((title . downcase)
        (signature . downcase)
        (keywords . downcase)
        (t . downcase)))

;; => 20231011T150058==sig--how-do-you-turn-this-on__camelcase_gnuemacs.org
```

And then with this:

```elisp
(setq denote-file-name-letter-casing
      '((title . downcase)
        (signature . verbatim)
        (keywords . verbatim)
        (t . downcase)))

;; => 20231011T150420==SIG--how-do-you-turn-this-on__camelCase_GNUEmacs.org
```

## Documentation of `denote-file-name-letter-casing`

Specify the method Denote uses to affect the letter casing of file names.

The value is an alist where each element is a cons cell of the
form (COMPONENT . METHOD).

- The COMPONENT is an unquoted symbol among `title`, `signature`,
  `keywords`, which refer to the corresponding component of the
  file name.  The special t COMPONENT is a fallback value in case
  the others are not specified.

- The METHOD is the letter casing scheme, which is an unquoted
  symbol of either `downcase` or `verbatim`.  A nil value has the
  same meaning as `downcase`.  Other non-nil METHOD types are
  reserved for possible future use.

  The `downcase` METHOD converts user input for the given
  COMPONENT into lower case.  The benefit of this approach (which
  is the default behaviour) is that file names remain consistent
  over the long-term.  The user never needs to account for
  varying letter casing while working with them.

  The `verbatim` METHOD means that Denote will not affect the
  letter casing of user input when generating the given file name
  COMPONENT.  As such, conventions like CamelCase or camelCase
  are respected.  The user thus assumes responsibility to keep
  file names in a good state over the long term.
  
## In development

Given the above, I think the `denote-allow-multi-word-keywords` user
option may no longer be useful.  If you cannot avoid multiple words,
it is better to use camel casing as this keeps hyphens limited to the
title component of the file name.

At any rate, this is part of the current development target.  I may
still make changes, subject to user feedback.

## Denote sources

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/denote>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/denote>
    + GitLab: <https://gitlab.com/protesilaos/denote>
+ Mailing list: <https://lists.sr.ht/~protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.
