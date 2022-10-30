---
title: "Emacs: use custom file type with Denote"
excerpt: "How to configure Denote so that it can write notes in an arbitrary file type."
---

The current development version of `denote` provides a fully fledged
mechanism to control how all file-type-aware operations are carried
out.  The point of entry is the `denote-file-types` variable.  This is
an advanced feature intended for experienced users who need a bespoke
setup.  **Nothing changes for other users.**

A "file-type-aware operation" is one that relates to tasks like (i)
inserting front matter for new notes, (ii) formatting `denote:` links
using the appropriate syntax, (iii) concatenating keywords in the
front matter, (iv) determining the style of the date, (v) specifying
the file type extension, and others.  In short, we can write notes
with Denote in **any file type** we want.  By default Denote supports
Org, Markdown+YAML, Markdown+TOML, and plain text files.

In this tutorial, I show how to define a `shell` file type.  A more
realistic scenario would be something like LaTeX or AsciiDoc, though I
do not know enough about them.

[ Denote is a simple note-taking tool.  It is based on the idea that
  notes should follow a predictable and descriptive file-naming
  scheme.  The file name must offer a clear indication of what the
  note is about, without reference to any other metadata.  Denote
  basically streamlines the creation of such files while providing
  facilities to link between them. ]

## Anatomy of a file type

The `denote-file-types` is an alist.  Each element is of the form
`(SYMBOL PROPERTY-LIST)`.  The `SYMBOL` is one of those specified in
`denote-file-type` or an arbitrary symbol that defines a new file
type.  Using the `org` entry as an example:

```elisp
(org
 :extension ".org"
 :date-function denote-date-org-timestamp
 :front-matter denote-org-front-matter
 :title-key-regexp "^#\\+title\\s-*:"
 :title-value-function identity
 :title-value-reverse-function denote-trim-whitespace
 :keywords-key-regexp "^#\\+filetags\\s-*:"
 :keywords-value-function denote-format-keywords-for-org-front-matter
 :keywords-value-reverse-function denote-extract-keywords-from-front-matter
 :link denote-org-link-format
 :link-in-context-regexp denote-org-link-in-context-regexp)
```

The doc string of `denote-file-types` explains what each of those
properties pertains to.  In simple terms, we have the flexibility to
make notes look exactly how we want.

The one I explain below is this:

```elisp
(shell
 :extension ".sh"
 :date-function denote-date-iso-8601
 :front-matter my-denote-shell-front-matter
 :title-key-regexp "^# title\\s-*:"
 :title-value-function identity
 :title-value-reverse-function denote-trim-whitespace
 :keywords-key-regexp "^# tags\\s-*:"
 :keywords-value-function denote-format-keywords-for-text-front-matter
 :keywords-value-reverse-function denote-extract-keywords-from-front-matter
 :link my-denote-shell-link-format
 :link-in-context-regexp my-denote-shell-link-in-context-regexp)
```

## Details of the 'shell' file type

When defining a new file type, we probably want to specify how the
front matter should look (although we can always reuse the existing
formats like `denote-org-front-matter`).  Here I am creating a new
variable, called `my-denote-shell-front-matter`:

```elisp
;; Demo to add shell script file type.  Why shell?  For demo purposes!
(defvar my-denote-shell-front-matter
  "#!/bin/sh

# title:      %s
# date:       %s
# tags:       %s
# identifier: %s
\n"
  "Demo shell script front matter.
It is passed to `format' with arguments TITLE, DATE, KEYWORDS,
ID.  Advanced users are advised to consult Info node `(denote)
Change the front matter format'.")
```

Since the front matter is custom, I need to tell Denote what regexp to
use to find the "title" and "keywords" lines.  Check again the value
of `my-denote-shell-front-matter`.  It is a line that starts with `#`,
has a space, and then the relevant word:

```elisp
;; Focus on these two:
:title-key-regexp "^# title\\s-*:"
:keywords-key-regexp "^# tags\\s-*:"

;; The complete list
(shell
 :extension ".sh"
 :date-function denote-date-iso-8601
 :front-matter my-denote-shell-front-matter
 :title-key-regexp "^# title\\s-*:"
 :title-value-function identity
 :title-value-reverse-function denote-trim-whitespace
 :keywords-key-regexp "^# tags\\s-*:"
 :keywords-value-function denote-format-keywords-for-text-front-matter
 :keywords-value-reverse-function denote-extract-keywords-from-front-matter
 :link my-denote-shell-link-format
 :link-in-context-regexp my-denote-shell-link-in-context-regexp)
```

We may then want to specify how `denote:` links should look like.  For
this example, I am picking a syntax that will produce output of this
sort:

```
<Title of note here><denote:20220614T130812>
```

Here is the `my-denote-shell-link-format` variable that declares the
desired style (I just picked the style with the angled brackets on a
whimsy):

```elisp
(defvar my-denote-shell-link-format "<%2$s><denote:%1$s>"
  "Demo format of shell link to note.
The %N$s notation is for `format', as the supplied arguments are
IDENTIFIER and TITLE, in this order.

Also see `my-denote-shell-link-in-context-regexp'.")
```

Then we want to make Denote aware of how those links are rendered in
their context, in order to extract the identifier from them (to create
backlinks and the like):

```elisp
(defvar my-denote-shell-link-in-context-regexp
  (concat "<.*?>" "<denote:"  "\\(?1:" denote-id-regexp "\\)" ">")
  "Regexp to match a Markdown link in its context.
The format of such links is `my-denote-shell-link-format'.")
```

For this demo, I am using the `denote-date-iso-8601` for the
`:date-function`.  Other similar functions already implemented in
`denote.el` are `denote-date-org-timestamp`, `denote-date-rfc3339`.
Use those or inspect them and then write your own variant.

The rest of this new `shell` entry is similar to the one for `text`.

## Register the new 'shell' file type

Below is the `denote-file-types` with the new entry prepended to the
default value.  I am writing it this way for didactic purposes, though
one can always rely on `add-to-list`:

```elisp
(setq denote-file-types
      '((shell
         :extension ".sh"
         :date-function denote-date-iso-8601
         :front-matter my-denote-shell-front-matter
         :title-key-regexp "^# title\\s-*:"
         :title-value-function identity
         :title-value-reverse-function denote-trim-whitespace
         :keywords-key-regexp "^# tags\\s-*:"
         :keywords-value-function denote-format-keywords-for-text-front-matter
         :keywords-value-reverse-function denote-extract-keywords-from-front-matter
         :link my-denote-shell-link-format
         :link-in-context-regexp my-denote-shell-link-in-context-regexp)
        (org
         :extension ".org"
         :date-function denote-date-org-timestamp
         :front-matter denote-org-front-matter
         :title-key-regexp "^#\\+title\\s-*:"
         :title-value-function identity
         :title-value-reverse-function denote-trim-whitespace
         :keywords-key-regexp "^#\\+filetags\\s-*:"
         :keywords-value-function denote-format-keywords-for-org-front-matter
         :keywords-value-reverse-function denote-extract-keywords-from-front-matter
         :link denote-org-link-format
         :link-in-context-regexp denote-org-link-in-context-regexp)
        (markdown-yaml
         :extension ".md"
         :date-function denote-date-rfc3339
         :front-matter denote-yaml-front-matter
         :title-key-regexp "^title\\s-*:"
         :title-value-function denote-surround-with-quotes
         :title-value-reverse-function denote-trim-whitespace-then-quotes
         :keywords-key-regexp "^tags\\s-*:"
         :keywords-value-function denote-format-keywords-for-md-front-matter
         :keywords-value-reverse-function denote-extract-keywords-from-front-matter
         :link denote-md-link-format
         :link-in-context-regexp denote-md-link-in-context-regexp)
        (markdown-toml
         :extension ".md"
         :date-function denote-date-rfc3339
         :front-matter denote-toml-front-matter
         :title-key-regexp "^title\\s-*="
         :title-value-function denote-surround-with-quotes
         :title-value-reverse-function denote-trim-whitespace-then-quotes
         :keywords-key-regexp "^tags\\s-*="
         :keywords-value-function denote-format-keywords-for-md-front-matter
         :keywords-value-reverse-function denote-extract-keywords-from-front-matter
         :link denote-md-link-format
         :link-in-context-regexp denote-md-link-in-context-regexp)
        (text
         :extension ".txt"
         :date-function denote-date-iso-8601
         :front-matter denote-text-front-matter
         :title-key-regexp "^title\\s-*:"
         :title-value-function identity
         :title-value-reverse-function denote-trim-whitespace
         :keywords-key-regexp "^tags\\s-*:"
         :keywords-value-function denote-format-keywords-for-text-front-matter
         :keywords-value-reverse-function denote-extract-keywords-from-front-matter
         :link denote-org-link-format
         :link-in-context-regexp denote-org-link-in-context-regexp)))
```

With this in place, we are ready to use the new file type.  If the
`denote-file-type` user option has a nil value, then `shell` becomes
the default when we invoke the `denote` command.  This is because
Denote uses the first file type in the `denote-file-types`.  We can
always have something like this, if we want another default:

```elisp
(setq denote-file-type 'org)
```

Or simply re-arrange the `denote-file-types`. 🙃

The command `denote-type` prompts for a file type and then creates the
note, using the familiar minibuffer prompts (or check the user option
`denote-prompts`).

## Test the new file type

I invoke `denote-type`, which now includes `shell` in the list of
candidates for available file types.  I pick that one, supply a title
at the relevant prompt and a couple of keywords in the next prompt.
Et voilà!  These are the contents of the new file I get:

```sh
#!/bin/sh

# title:      Testing the new file type
# date:       2022-10-30
# tags:       denote  tutorial
# identifier: 20221030T115549
```

The file name is also what I expect:

```
20221030T115549--testing-the-new-file-type__denote_tutorial.sh
```

Beautiful! 💕

All commands related to links between notes, acting on the front
matter, or renaming a note recognise this file as a "note".  Denote
does not care that this is a shell script: it just works!

## Coming in Denote version 1.2.0

The `denote-file-types` **is not a user option.**  It is a variable
that only advanced users should configure, assuming they have a need
for it.  I repeat, **nothing changes for other users:** Denote will
behave exactly how it did before.

This feature will be widely available in the next stable release,
which I expect to deliver at the end of November 2022 (tentative).

I announced this earlier on the mailing list, in case you wish to
participate there:
<https://lists.sr.ht/~protesilaos/denote/%3C87a65deryt.fsf%40protesilaos.com%3E>.

## Sources

[Watch the video demo that was produced before version 0.1.0 of the
package](https://protesilaos.com/codelog/2022-06-18-denote-demo/).  It
is still relevant, though the implementation details have changed.

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/denote>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/denote>
    + GitLab: <https://gitlab.com/protesilaos/denote>
+ Mailing list: <https://lists.sr.ht/~protesilaos/denote>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.
