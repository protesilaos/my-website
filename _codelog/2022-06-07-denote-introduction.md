---
title: "Emacs: introduction to Denote (simple note-taking)"
excerpt: "Denote is a simple note-taking tool, based on the idea that notes should follow a predictable and descriptive file-naming scheme."
---

**UPDATE 2022-06-08 12:20 +0300:** Things are already progressing.  The
manual is now available:  <https://protesilaos.com/emacs/denote>.

**UPDATE 2022-06-07 21:30 +0300:** Corrected a factual error about the
`denote` command's argument types.

On 2020-10-08 I wrote about [My simple note-taking system for Emacs
(without Org)](https://protesilaos.com/codelog/2020-10-08-intro-usls-emacs-notes/).
Most of that entry described the methodology I have been using to
organise my notes; a methodology that is Emacs-agnostic.

At the time, I wrote a toy package called "Unassuming Sidenotes of
Little Significance" (USLS---also pronounced as "useless") which helped
me experiment with the workflow without having to rely on awkward shell
scripts.  Bringing everything into Emacs allowed me to standarise things
and offered an opportunity to tinker with Elisp.

Fast-forward to present time: I have already written a few packages for
Emacs and am better with Elisp.  USLS was never meant to be anything
other than _useless_ for others, but its core idea remains interesting
and fecund.  I thus spent the last few days writing `denote`: the
successor to USLS which is created with the express purpose of becoming
a package on GNU ELPA.

The following elaborates on the specifics.

+ Official manual: <https://protesilaos.com/emacs/denote>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/denote>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/denote>
    + GitLab: <https://gitlab.com/protesilaos/denote>
+ Mailing list: <https://lists.sr.ht/~protesilaos/denote>

* * *

## Overview

Denote is a simple note-taking tool.  It is based on the idea that notes
should follow a predictable and descriptive file-naming scheme.  The
file name must offer a clear indication of what the note is about,
without reference to any other metadata.  Denote basically streamlines
the creation of such files.

## The file-naming scheme

Every note produced by Denote follows this pattern:

    DATE--KEYWORDS--TITLE.org

The `DATE` field represents the date in year-month-day format followed
by an underscore and the current time in hour-minute-second notation.
The presentation is compact, with an underscore separating the two
components.  Like this: `20220531_091625`.  The `DATE` serves as the
unique identifier of each note.

The `KEYWORDS` field consists of one or more entries demarcated by a
plus sign (the separator is inserted automatically).  Each keyword is a
string provided by the user at the relevant prompt which broadly
describes the contents of the entry.  Keywords that need to be more than
one-word-long must be written with an underscore.  So when
`emacs_library` appears in a file name, it is interpreted as a single
keyword, whereas `emacs+library` are two distinct keywords.

The `TITLE` field is the title of the note, as provided by the user,
that automatically gets downcased and hyphenated.  An entry about
&ldquo;Economics in the Euro Area&rdquo; produces an `economics-in-the-euro-area`
string for the `TITLE` of the file name.

Examples:

    20220107_124941--economics--plentiful-and-predictable-liquidity.org
    20220214_104945--emacs+git--git-patch-formatting.org
    20220420_113805--three_word_keyword--this-is-a-test.org

While files end in the `.org` extension, the Denote code base does not
actually depend on org.el and/or its accoutrements.

Notes are stored as a flat list in the `denote-directory` (i.e. no
subdirectories).  The default path is `~/Documents/notes`.

## Points of entry

There are two ways to write a note with Denote: invoke the `denote`
command or leverage the `org-capture-templates` by setting up a template
which calls the function `denote-org-capture`.

In the first case, all that is needed is to run `denote`.  It will first
prompt for a title.  Once it is supplied, the command will ask for
keywords.  The resulting note will have a file name as already explained
(in "The file naming scheme").

The keyword prompt supports minibuffer completion.  Available candidates
are those defined in the user option `denote-known-keywords`.  More
candidates can be inferred from the names of existing notes, by setting
`denote-infer-keywords` to non-nil (which is the case by default).

Multiple keywords can be inserted by separating them with a comma (or
whatever the value of the `crm-indicator` is&#x2014;which should be a comma).
When the user option `denote-sort-keywords` is non-nil (the default),
keywords are sorted alphabetically (technically, the sorting is done
with `string-lessp`).

The `denote` command can also be called from Lisp, in which case it
expects the `TITLE` and `KEYWORDS` arguments.  The former is a string,
the latter a list of strings.

For integration with `org-capture`, the user must first add the relevant
template.  Such as:

    (with-eval-after-load 'org-capture
      (require 'denote-org-capture)
      (add-to-list 'org-capture-templates
                   '("n" "New note (with Denote)" plain
                     (file denote-last-path)
                     #'denote-org-capture
                     :no-save t
                     :immediate-finish nil
                     :kill-buffer t
                     :jump-to-captured t)))

[ In the future, we might develop Denote in ways which do not require such
  manual intervation. ]

Once the template is added, it is accessed from the specified key.  If,
for instance, `org-capture` is bound to `C-c c`, then the note creation
is initiated with `C-c c n`.  After that, the process is the same as
with invoking `denote` directly, namely: a prompt for a title followed
by a prompt for keywords.

Users may prefer to leverage `org-capture` in order to extend file
creation with the specifiers described in the `org-capture-templates`
documentation (such as to capture the active region and/or create a
hyperlink pointing to the given context).  Due to the particular
file-naming scheme of Denote, such specifiers cannot be written directly
in the template.  Instead, they have to be assigned to the user option
`denote-org-capture-specifiers`, which is interpreted by the function
`denote-org-capture`.  Example with our default value:

    (setq denote-org-capture-specifiers "%l\n%i\n%?")

Notes have their own &ldquo;front matter&rdquo;.  This is a block of data at the top
of the file, which is automatically generated once producing a new
note. The front matter includes the title and keywords which the user
specified at the relevant prompts, as well as the date, the unique
identifier and the file path.  To ensure compatibility with the wider
Org ecosystem, the keywords are recorded as the value of `#+filetags`.

The format of the date in the front matter is controlled by the user
option `denote-front-matter-date-format`:

-   When the value is nil (the default), the date uses a plain
    `YEAR-MONTH-DAY` notation, like `2022-06-08`.
-   When the value is the `org-timestamp` symbol, the date is recorded as
    an inactive Org timestamp, such as `[2022-06-08 Wed 06:19]`.
-   An arbitrary string value is interpreted as the argument for the
    function `format-time-string`.  This gives the user maximum control
    over how time is represented in the front matter.

## Linking notes

Denote has a basic linking facility to quickly establish connections
between notes.  The command `denote-link` prompts for a file name in the
`denote-directory` (only regular files are considered, not directories).
It then retrieves the path of the given note, inserts it at point using
the link notation of Org, and creates a backlink entry in the target
file.

Backlinks are recorded at the end of a note under the heading with the
title `Denote backlinks`.  Users should not edit this part manually: it
is controlled by Denote, such as to delete duplicate links (in the
future it might also handle stuff like alphabetic sorting).

The special hook `denote-link-insert-functions` is called after a link
is created.  It accepts two arguments for the target file and the origin
of the current link.  The function `denote-link-backlink` provides an
example for advanced users.

Backlinks that no longer point to available notes can be removed from
the current buffer with the command `denote-link-clear-stale-backlinks`.

## Fontification in Dired

One of the upsides of Denote&rsquo;s file-naming scheme is the predictable
pattern it establishes, which appears as a near-tabular presentation in
a listing of notes (i.e. in Dired).  The `denote-dired-mode` can help
enhance this impression, by fontifying the components of the file name
to make the date (identifier) and keywords stand out.

There are two ways to set the mode.  Either use it for all directories,
which probably is not needed:

    (require 'denote-dired)
    (add-hook 'dired-mode-hook #'denote-dired-mode)

Or configure the user option `denote-dired-directories` and then set up
the function `denote-dired-mode-in-directories`:

    (require 'denote-dired)

    ;; We use different ways to specify a path for demo purposes.
    (setq denote-dired-directories
          (list denote-directory
                (thread-last denote-directory (expand-file-name "attachments"))
                (expand-file-name "~/Documents/vlog")))

    (add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)

The `denote-dired-mode` does not only fontify note files that were
created by Denote: it covers every file name that follows our naming
conventions ([The file-naming
scheme](#h:4e9c7512-84dc-4dfb-9fa9-e15d51178e5d)).  This is particularly
useful for scenaria where, say, one wants to organise their collection
of PDFs and multimedia in a systematic way (and, perhaps, use them as
attachments for the notes Denote produces).

For the time being, the `diredfl` package is not compatible with this
facility.

## Renaming non-notes

Denote&rsquo;s file-naming scheme is not specific to notes or text
files: it is useful for all sorts of files, such as multimedia and PDFs
that form part of the user&rsquo;s longer-term storage ([The file-naming
scheme](#h:4e9c7512-84dc-4dfb-9fa9-e15d51178e5d)).  While Denote does
not manage such files, it already has all the mechanisms to facilitate
the task of renaming them.

To this end, invoke `denote-dired-rename-file` when point is over a file
in Dired to rename it.  The commaand prompts for a `TITLE` and
`KEYWORDS` the same way the `denote` command does it ([Points of
entry](#h:17896c8c-d97a-4faa-abf6-31df99746ca6)).  It finally asks for
confirmation before renaming the file at point.

The file type extension (e.g. `.pdf`) is read from the underlying file
and is preserved in the renaming process.  Files that have no extension
are simply left without one.

Renaming only occurs relative to the current directory.  Files are not
moved between directories.

## Extending Denote

Denote is a tool with a narrow scope: create notes and link between
them, based on the aforementioned file-naming scheme.  For other common
operations the user is advised to rely on standard Emacs facilities or
specialised third-party packages.

-   To search through notes, use `M-x grep`, `M-x find-name-dired`, `M-x
      consult-find`, `M-x consult-grep`, and so on (the latter two are
    provided by the `consult` package).

-   To quickly jump to the `denote-directory`, visit it with `M-x
      find-file` and then make a bookmark with `M-x bookmark-set`.  Access
    bookmarks with `M-x bookmark-jump`, `M-x consult-buffer` (from
    `consult`), and the like.

-   Control the versioning of notes by turning the `denote-directory` into
    a Git project.  Consider the built-in project.el or the `projectile`
    package, as well as the built-in VC framework and/or the `magit`
    package.

-   It is possible to narrow the list of notes in Dired using a regular
    expression or literal string.  Do `M-x dired-mark-files-regexp RET
      type-regexp-here RET t k`.  The `t` will toggle the match so that it
    marks all files that do not match the regexp and `k` will remove them
    from the buffer (restore them by reverting the buffer).

-   A narrowed list of files can also be produced through the minibuffer,
    with the help of the `embark` package.  For example, `M-x find-file
      RET path/to/denote-directory RET regexp embark-act embark-export`.
    The final two commands, `embark-act` and `embark-export`, are normally
    bound to keys.  The whole sequence will thus look like `C-x C-f path
      RET regexp C-. E`.

## Next steps

Denote will eventually be available for download as a regular package.
I think most of the basics are done.  I still need to substantiate the
manual, ensure all doc strings are in order, set up the manual's
webpage, create a GitLab mirror of the git repo, and, perhaps, write a
few more minor functions.

If you think this is something you might use, but disagree with some of
its decisions, now is the best time to act.  Once the package is made
public, it will be hard to make breaking changes.

## By the way...

I always write informative `Commentary:` sections for all my packages
and this will not be an exception.  In this pre-release stage though,
documentation is sparse on purpose.  `denote.el` merely states the
following:

    ;; "Denote" is the familiar word, though it also is a play on to the
    ;; "note" concept.  Plus, we can come up with acronyms like:
    ;;
    ;; * Don't Ever Note Only The Ephemeral
    ;; * Denote Everything Neatly; Omit The Excesses
    ;;
    ;; But I'll let you get back to work.  Don't Escape or Neglect your
    ;; Obligations, Tasks, Engagements...
