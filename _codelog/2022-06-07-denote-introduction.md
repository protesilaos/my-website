---
title: "Emacs: introduction to Denote (simple note-taking)"
excerpt: "Denote is a simple note-taking tool, based on the idea that notes should follow a predictable and descriptive file-naming scheme."
---

**UPDATE 2022-06-13 08:16 +0300:** Rewrote the record to reflect the
current state of the project.  We are getting closer to version `0.1.0`.
Though better read the comprehensive manual, as I will not be updating
this entry any more: <https://protesilaos.com/emacs/denote>.

* * *

On 2020-10-08 I wrote about [My simple note-taking system for Emacs
(without Org)](https://protesilaos.com/codelog/2020-10-08-intro-usls-emacs-notes/).
Most of that entry described the methodology I have been using to
organise my notes; a methodology that is Emacs-agnostic.

At the time, I wrote a toy package called "Unassuming Sidenotes of
Little Significance" (USLS---also pronounced as "useless") which helped
me experiment with the workflow without having to rely on awkward shell
scripts.  Bringing everything into Emacs allowed me to standardise
things and offered an opportunity to tinker with Elisp.

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

NOTE THAT WE ARE ACTIVELY WORKING TOWARDS VERSION `0.1.0` AND MIGHT
STILL INTRODUCE BREAKING, BACKWARD-INCOMPATIBLE CHANGES.  This is
particularly true for the linking facility.  Everything else is in a
stable state.

Denote aims to be a simple-to-use, focused-in-scope, and effective
note-taking tool for Emacs.  It is based on the following core design
principles:

-   **Predictability:** File names must follow a consistent and
    descriptive naming convention (read "The file-naming scheme").  The
    file name alone should offer a clear indication of what the contents
    are, without reference to any other metadatum.  This convention is
    not specific to note-taking, as it is pertinent to any form of file
    that is part of the user&rsquo;s long-term storage (read "Renaming
    files").

-   **Composability:** Be a good Emacs citizen, by integrating with
    other packages or built-in functionality instead of re-inventing
    functions such as for filtering or greping.  Do not introduce
    dependencies on specific libraries.  While Org is a killer app for
    Emacs and the default file type for new notes, Denote does not
    depend on org.el nor its extensions and does allow notes to be
    created in a variety of formats (read "Notes in multiple file
    types").  The author of Denote (Protesilaos, aka &ldquo;Prot&rdquo;)
    writes ordinary notes in plain text (`.txt`), switching to an Org
    file only when its expanded set of functionality is required for the
    task at hand (read "Points of entry").

-   **Portability:** Notes are plain text and should remain portable.
    The way Denote writes file names, the front matter it include in the
    note&rsquo;s header, and the links it establishes must all be
    adequately usable with standard Unix tools.  No need for a databse
    or some specialised software.  As Denote develops and this manual is
    fully fleshed out, there will be concrete examples on how to do the
    Denote-equivalent on the command-line.

-   **Flexibility:** Do not assume the user&rsquo;s preference for a
    note-taking methodology.  Denote is conceptually similar to the
    Zettelkasten Method, which you can learn more about in this detailed
    introduction: <https://zettelkasten.de/introduction/>.  Notes are
    atomic (one file per note) and have a unique identifier.  However,
    Denote does not enforce a particular methodology for knowledge
    management, such as a restricted vocabulary or mutually exclusive
    sets of keywords.  It is up to the user to apply the requisite rigor
    in pursuit of their preferred workflow.

Now the important part&#x2026; &ldquo;Denote&rdquo; is the familiar
word, though it also is a play on the &ldquo;note&rdquo; concept.  Plus,
we can come up with acronyms, recursive or otherwise, of increasingly
dubious utility like:

-   Don&rsquo;t Ever Note Only The Epiphenomenal
-   Denote Everything Neatly; Omit The Excesses

But we&rsquo;ll let you get back to work.  Don&rsquo;t Eschew or Neglect
your Obligations, Tasks, and Engagements.


<a id="h:4e9c7512-84dc-4dfb-9fa9-e15d51178e5d"></a>

## The file-naming scheme

Notes are stored as a flat list in the `denote-directory` (i.e. no
subdirectories).  The default path is `~/Documents/notes`.

Every note produced by Denote follows this pattern (read "Points of
entry"):

    DATE--TITLE__KEYWORDS.EXTENSION

The `DATE` field represents the date in year-month-day format followed
by the capital letter `T` (for &ldquo;time&rdquo;) and the current time
in hour-minute-second notation.  The presentation is compact:
`20220531T091625`.  The `DATE` serves as the unique identifier of each
note.

The `TITLE` field is the title of the note, as provided by the user.  It
automatically gets downcased and hyphenated.  An entry about
&ldquo;Economics in the Euro Area&rdquo; produces an
`economics-in-the-euro-area` string for the `TITLE` of the file name.

The `KEYWORDS` field consists of one or more entries demarcated by an
underscore (the separator is inserted automatically).  Each keyword is a
string provided by the user at the relevant prompt which broadly
describes the contents of the entry.  Keywords that need to be more than
one-word-long must be written with hyphens: any other character, such as
spaces or the plus sign is automatically converted into a hyphen.  So
when `emacs_library` appears in a file name, it is interpreted as two
distinct keywords, whereas `emacs-library` is one keyword.  This is
reflected in how the keywords are recorded in the note (read "Front
matter").  While Denote supports multi-word keywords by default, the
user option `denote-allow-multi-word-keywords` can be set to nil to
forcibly join all words into one, meaning that an input of `word1 word2`
will be written as `word1word2`.

The `EXTENSION` is the file type.  By default, it is `.org` (`org-mode`)
though the user option `denote-file-type` provides support for Markdown
with YAML or TOML variants (`.md` which runs `markdown-mode`) and plain
text (`.txt` via `text-mode`).  Consult its doc string for the minutia.
While files end in the `.org` extension by default, the Denote code base
does not actually depend on org.el and/or its accoutrements.

Examples:

    20220610T043241--initial-thoughts-on-the-zettelkasten-method__notetaking.org
    20220610T062201--define-custom-org-hyperlink-type__denote_emacs_package.md
    20220610T162327--on-hierarchy-and-taxis__notetaking_philosophy.txt

The different field separators, namely `--` and `__` introduce an
efficient way to anchor searches (such as with Emacs commands like
`isearch` or from the command-line with `find` and related).  A query
for `_word` always matches a keyword, while a regexp in the form of,
say, `"\\([0-9T]+?\\)--\\(.*?\\)_"` captures the date in group `\1` and
the title in `\2` (test any regular expression in the current buffer by
invoking `M-x re-builder`).

Read "Extending Denote".

While Denote is an Emacs package, notes should work long-term and not
depend on the functionality of a specific program.  The file-naming
scheme we apply guarantees that a listing is readable in a variety of
contexts.


<a id="h:ae8b19a1-7f67-4258-96b3-370a72c43f4e"></a>

### Sluggified title and keywords

Denote has to be highly opinionated about which characters can be used
in file names and the file&rsquo;s front matter in order to enforce its
file-naming scheme.  The private variable `denote--punctuation-regexp`
holds the relevant value.  In simple terms:

-   What we count as &ldquo;illegal characters&rdquo; are converted into
    hyphens.

-   Input for a file title is hyphenated and downcased.  The original
    value is preserved only in the note&rsquo;s contents (read "Front
    matter").

-   Keywords should not have spaces or other delimiters.  If they do,
    they are converted into hyphens.  Keywords are always downcased.


<a id="h:17896c8c-d97a-4faa-abf6-31df99746ca6"></a>

## Points of entry

There are two ways to write a note with Denote: invoke the `denote`
command or leverage the `org-capture-templates` by setting up a template
which calls the function `denote-org-capture`.

In the first case, all that is needed is to run `denote`.  It will first
prompt for a title.  Once it is supplied, the command will ask for
keywords.  The resulting note will have a file name as already explained
(read "The file naming scheme").

The keyword prompt supports minibuffer completion.  Available candidates
are those defined in the user option `denote-known-keywords`.  More
candidates can be inferred from the names of existing notes, by setting
`denote-infer-keywords` to non-nil (which is the case by default).

Multiple keywords can be inserted by separating them with a comma (or
whatever the value of the `crm-indicator` is&#x2014;which should be a
comma).  When the user option `denote-sort-keywords` is non-nil (the
default), keywords are sorted alphabetically (technically, the sorting
is done with `string-lessp`).

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

[ In the future, we might develop Denote in ways which do not require
  such manual intervation. ]

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

Note that `denote-org-capture` ignores the `denote-file-type`: it always
sets the Org file extension for the created note to ensure that the
capture process works as intended, especially for the desired output of
the `denote-org-capture-specifiers`.


<a id="h:532e8e2a-9b7d-41c0-8f4b-3c5cbb7d4dca"></a>

## Renaming files

Denote&rsquo;s file-naming scheme is not specific to notes or text
files: it is useful for all sorts of files, such as multimedia and PDFs
that form part of the user&rsquo;s longer-term storage (read "The
file-naming scheme").  While Denote does not manage such files, it
already has all the mechanisms to facilitate the task of renaming them.

To this end, we provide the `denote-dired-rename-file` command.  It has
a two-fold purpose: (i) to change the name of an existing file while
retaining its identifier and (ii) to write a Denote-compliant file name
for an item that was not created by `denote` or related commands (such
as an image or PDF).

The `denote-dired-rename-file` command will target the file at point if
it finds one in the current Dired buffer.  Otherwise it prompts with
minibuffer completion for a file name.  It then uses the familiar
prompts for a `TITLE` and `KEYWORDS` the same way the `denote` command
does (read "Points of entry").  As a final step, it asks for
confirmation before renaming the file at point, showing a message like:

    Rename sample.pdf to 20220612T052900--my-sample-title__testing.pdf? (y or n)

However, if the user option `denote-dired-rename-expert` is non-nil,
conduct the renaming operation outright&#x2014;no questions asked.

When operating on a file that has no identifier, such as `sample.pdf`,
Denote reads the file properties to retrieve its last modification time.
If the file was from a past date like 2000-11-31 it will get an
identifier starting with `20001131` followed by the time component (per
our file-naming scheme).

The file type extension (e.g. `.pdf`) is read from the underlying file
and is preserved through the renaming process.  Files that have no
extension are simply left without one.

Renaming only occurs relative to the current directory.  Files are not
moved between directories.


<a id="h:13218826-56a5-482a-9b91-5b6de4f14261"></a>

## Front matter

Notes have their own &ldquo;front matter&rdquo;.  This is a block of
data at the top of the file, which is automatically generated at the
creation of a new note. The front matter includes the title and keywords
(aka &ldquo;tags&rdquo; or &ldquo;filetags&rdquo;, depending on the file
type) which the user specified at the relevant prompt, as well as the
date and unique identifier which are derived automatically.

This is how it looks for Org mode (`denote-file-type` is nil):

    #+title:      This is a sample note
    #+date:       2022-06-10
    #+filetags:   denote  testing
    #+identifier: 20220610T202537

For Markdown with YAML, it looks like this (`denote-file-type` has the
`markdown-yaml` value):

    ---
    title:      "This is a sample note"
    date:       2022-06-10
    tags:       denote  testing
    identifier: "20220610T202021"
    ---

For Markdown with TOML, it looks like this (`denote-file-type` has the
`markdown-toml` value):

    +++
    title      = "This is a sample note"
    date       = 2022-06-10
    tags       = ["denote", "testing"]
    identifier = "20220610T201510"
    +++

And for plain text, we have the following (`denote-file-type` has the
`text` value):

    title:      This is a sample note
    date:       2022-06-10
    tags:       denote  testing
    identifier: 20220610T202232
    ---------------------------

The format of the date in the front matter is controlled by the user
option `denote-front-matter-date-format`:

-   When the value is nil (the default), the date uses a plain
    `YEAR-MONTH-DAY` notation, like `2022-06-08` (the ISO 8601
    standard).

-   When the value is the `org-timestamp` symbol, the date is recorded
    as an inactive Org timestamp, such as `[2022-06-08 Wed 06:19]`.

-   An arbitrary string value is interpreted as the argument for the
    function `format-time-string`.  This gives the user maximum control
    over how time is represented in the front matter.

When `denote-file-type` specifies one of the Markdown flavors, we ignore
this user option in order to enforce the RFC3339 specification (Markdown
is typically employed in static site generators as source code for Web
pages).  However, when `denote-front-matter-date-format` has a string
value, this rule is suspended: we use whatever the user wants.


<a id="h:f69371d5-1843-493d-9ff5-c1ab3b43024e"></a>

### Tweaking the front matter

What follows is for advanced users.  When in doubt, only configure
variables we describe as a &ldquo;user option&rdquo;: they are declared
in the source code with the `defcustom` keyword.

Denote&rsquo;s code base is designed in a composable way, which lets the
user make precise interventions to affect the output of the relevant
commands.  One such case is to configure the front matter, such as by
changing the order the keys appear in, renaming them, or adding new
elements.

Some examples are in order, starting with the Org file type.  This is
what we have in `denote.el`:

    (defvar denote-org-front-matter
      "#+title:      %s
    #+date:       %s
    #+filetags:   %s
    #+identifier: %s
    \n"
      "Org front matter value for `format'.
    The order of the arguments is TITLE, DATE, KEYWORDS, ID.  If you
    are an avdanced user who wants to edit this variable to affect
    how front matter is produced, consider using something like %2$s
    to control where Nth argument is placed.")

The default front matter is:

    #+title:      This is a sample note
    #+date:       2022-06-10
    #+filetags:   denote  testing
    #+identifier: 20220610T202537

We can add a `PROPERTIES` drawer to it, with something like this:

    (setq denote-org-front-matter
          ":PROPERTIES:
    :ID: %4$s
    :END:
    #+title:      %1$s
    #+date:       %2$s
    #+filetags:   %3$s
    #+identifier: %4$s
    \n")

The output is now formatted thus:

    :PROPERTIES:
    :ID: 20220611T092444
    :END:
    #+title:      This is a sample note
    #+date:       2022-06-11
    #+filetags:   denote  testing
    #+identifier: 20220611T092444

Notice how we can pass a number to the `%s` specifier.  This is what
allows us to change the placement of the provided arguments.

For another example, we will use the plain text variant, as it differs a
bit from the above.  By default it is formatted this way:

    title:      This is a sample note
    date:       2022-06-10
    tags:       denote  testing
    identifier: 20220610T202232
    ---------------------------

The line with the hyphens is the product of the fifth format specifier,
as documented in `denote-text-front-matter`.  Its value is stored in
`denote-text-front-matter-delimiter`.  Say we want to have a delimiter
both at the top and bottom:

    (setq denote-text-front-matter
          "%5$s
    title:      %1$s
    date:       %2$s
    tags:       %3$s
    identifier: %4$s
    %5$s\n\n")

Which gives us:

    ---------------------------
    title:      This is a sample note
    date:       2022-06-11
    tags:       denote  testing
    identifier: 20220611T093252
    ---------------------------

Or we would rather use another character instead of hyphens, such as the
equals sign:

    (setq denote-text-front-matter-delimiter (make-string 27 ?=))

Remember that this is for advanced users.  If you want to see changes
done on this front, you are welcome to share your thoughts and/or
participate in the development of Denote.


<a id="h:fc913d54-26c8-4c41-be86-999839e8ad31"></a>

## Linking notes

Denote has a basic linking facility to quickly establish connections
between notes.  The command `denote-link` prompts for a file name in the
`denote-directory` (only regular files are considered, not directories).
It then retrieves the path of the given note, inserts it at point using
the appropriate link notation, and creates a backlink entry in the
target file (again using the appropriate notation).

What constitutes &ldquo;appropriate link notation&rdquo; depends on the
file type of the given entry per `denote-file-type` (read "The file
naming scheme").  For example when linking from an Org file to a
Markdown file, the link in the former will follow Org syntax while the
backlink in the latter will use that of Markdown.  Org links use
`[[file:TARGET][DESCRIPTION]]`, those of Markdown are
`[DESCRIPTION](file:TARGET)`, while for plain text we implement our own
scheme of `<TYPE: TARGET> [DESCRIPTION]`, where `TYPE` is either `LINK`
or `BACKLINK` (capitalization in the latter two is literal, because
plain text lacks other means of emphasis).

Plain text links can benefit from Emacs&rsquo; notion of &ldquo;future
history&rdquo;, else its ability to read the thing at point for relevant
commands.  With point over the `TARGET`, `M-x find-file` followed by
`M-n` will fill the path to that file (this also works with point over
just the identifier of a note).

Backlinks are optionally recorded at the end of a note under the heading
with the title `Denote backlinks`.  This is an opt-in feature that has
to be set up by adding `denote-link-backlinks` to the special hook
`denote-link-insert-functions`.

The reason backlinks are off by default is because we might still make
breaking changes on how they are implemented.  For the time being,
Denote expects that users do not edit the section with the backlinks: it
is controlled by Denote, such as to delete duplicate links (in the
future it might also handle stuff like alphabetic sorting).  Suggestions
to improve backlinking are most welcome!

The section with the backlinks is formatted according to the
note&rsquo;s file type.

Backlinks that no longer point to available notes can be removed from
the current buffer with the command `denote-link-clear-stale-backlinks`.


<a id="h:337f9cf0-9f66-45af-b73f-f6370472fb51"></a>

## Fontification in Dired

One of the upsides of Denote&rsquo;s file-naming scheme is the
predictable pattern it establishes, which appears as a near-tabular
presentation in a listing of notes (i.e. in Dired).  The
`denote-dired-mode` can help enhance this impression, by fontifying the
components of the file name to make the date (identifier) and keywords
stand out.

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

The faces we define are:

-   `denote-dired-field-date`
-   `denote-dired-field-delimiter`
-   `denote-dired-field-extension`
-   `denote-dired-field-keywords`
-   `denote-dired-field-time`
-   `denote-dired-field-title`

For the time being, the `diredfl` package is not compatible with this
facility.

The `denote-dired-mode` does not only fontify note files that were
created by Denote: it covers every file name that follows our naming
conventions (read "The file-naming scheme").  This is particularly
useful for scenaria where, say, one wants to organise their collection
of PDFs and multimedia in a systematic way (and, perhaps, use them as
attachments for the notes Denote produces).


<a id="h:82dc1203-d689-44b2-9a6c-b37776209651"></a>

## Minibuffer histories

Denote has a dedicated minibuffer history for each one of its prompts.
This practically means that using `M-p` (`previous-history-element`) and
`M-n` (`next-history-element`) will only cycle through the relevant
record of inputs, such as your latest titles in the `TITLE` prompt, and
keywords in the `KEYWORDS` prompt.

The built-in `savehist` library saves minibuffer histories.  Sample
configuration:

    (require 'savehist)
    (setq savehist-file (locate-user-emacs-file "savehist"))
    (setq history-length 10000)
    (setq history-delete-duplicates t)
    (setq savehist-save-minibuffer-history t)
    (add-hook 'after-init-hook #'savehist-mode)


<a id="h:f34b172b-3440-446c-aec1-bf818d0aabfe"></a>

## Notes in multiple file types

As noted before, Denote does not have a particular preference on the
workflow the user wishes to follow nor does it expect a specific file
type.  It is entirely possible to store notes in a variety of formats
across multiple directories and Denote will still be able to work with
them, provided they follow the file-naming scheme and have an identifier
in their front matter (where relevant).  Here we show how to create new
notes that deviate from the default value of `denote-file-type` and
specify their own `denote-directory`.

Suppose you want to conform with the default of creating notes with the
`.org` extension but, for whatever reason, wish to have a way to quickly
produce a file with the `.md` extension and TOML-compliant front matter.

    (setq denote-file-type nil)
    
    (defun my-denote-markdown-toml ()
      (interactive)
      (let ((denote-file-type 'markdown-toml))
        (call-interactively #'denote)))

With the above, `M-x my-denote-markdown-toml` produces Markdown+TOML
notes while `M-x denote` uses Org.

This principle can be taken a step further by `let` binding a second
directory for those alternative notes.  Maybe your standard notes are
located in `~/Documents/notes/` but you plan to store the other ones in
`~/blog/` (read "Fontification in Dired").

    (setq denote-file-type nil)
    (setq denote-directory (expand-file-name "~/Documents/notes/"))
    
    (defun my-denote-markdown-toml ()
      (interactive)
      (let ((denote-file-type 'markdown-toml)
            (denote-directory "~/blog/"))
        (call-interactively #'denote)))

Given Denote&rsquo;s composable code, you can tweak the output however
you like, including the contents of the file (read "Tweaking the front
matter").

If you do place different types of notes in their own directories,
consider introducing directory-local variables to keep things working
seamlessly.  An obvious candidate for such a local variable is the
`denote-directory`: you want notes in `~/blog/` to treat their directory
as the canonical one; while those in `~/Documents/notes/` to do the same
for that path.  Write a `.dir-locals.el` file with the following
contents and place it in each of those directories:

    ;;; Directory Local Variables
    ;;; For more information see (info "(emacs) Directory Variables")
    
    ((nil . ((denote-directory . (expand-file-name default-directory)))))

This will allow things to work smoothly (e.g. `denote-infer-keywords`).

Have more ideas?  Something does not work quite right?  Areas you wish
were more abstract in the code?  Please participate in the development
process.


<a id="h:8ed2bb6f-b5be-4711-82e9-8bee5bb06ece"></a>

## Extending Denote

Denote is a tool with a narrow scope: create notes and link between
them, based on the aforementioned file-naming scheme.  For other common
operations the user is advised to rely on standard Emacs facilities or
specialised third-party packages.

-   To search through notes, use `M-x grep`, `M-x find-name-dired`, `M-x
      consult-find`, `M-x consult-grep`, and so on (the latter two are
      provided by the `consult` package).

-   To quickly jump to the `denote-directory`, visit it with `M-x
      find-file` and then make a bookmark with `M-x bookmark-set`.
      Access bookmarks with `M-x bookmark-jump`, `M-x consult-buffer`
      (from `consult`), and the like.

-   Control the versioning of notes by turning the `denote-directory`
    into a Git project.  Consider the built-in project.el or the
    `projectile` package, as well as the built-in VC framework and/or
    the `magit` package.

-   It is possible to narrow the list of notes in Dired using a regular
    expression or literal string.  Do `M-x dired-mark-files-regexp RET
    type-regexp-here RET t k`.  The `t` will toggle the match so that it
    marks all files that do not match the regexp and `k` will remove
    them from the buffer (restore them by reverting the buffer).

-   A narrowed list of files can also be produced through the
    minibuffer, with the help of the `embark` package.  For example,
    `M-x find-file RET path/to/denote-directory RET regexp embark-act
    embark-export`.  The final two commands, `embark-act` and
    `embark-export`, are normally bound to keys.  The whole sequence
    will thus look like `C-x C-f path RET regexp C-. E`.
