---
title: "Emacs: make Org export work with Denote silos"
excerpt: "How to work around a design limitation of Org's export mechanism for use with Denote silos."
---

In the `denote` package, the user creates a single directory for their
notes or long-term storage files: the `denote-directory`. This
directory can have subdirectories or can be a flat file listing.
Denote works the same regardless. All `denote:` links to files inside
the `denote-directory` work as expected, even if the files are renamed
or moved from one subdirectory to another. This is because the links
point to the identifier, which is internally read and expanded into
the appropriate file system path.

While a singular `denote-directory` can be sufficient, there are cases
where strictly separate directories are needed (e.g. a "home" versus
"work" kind of scenario, or "public" and "private"). We call those
"silos" and make them work with Emacs' facility of directory-local
variables. Any directory in the file system can be turned into a silo
by setting the value of `denote-directory` to its path. Do this in a
file called `.dir-locals.el`. Its contents can be something like the
following:

```elisp
;;; Directory Local Variables.  For more information evaluate:
;;;
;;;     (info "(emacs) Directory Variables")

((nil . ((denote-directory . "/path/to/silo/"))))
```

All Denote commands, such as to create notes or link to files, read
the silo's path when they are called from inside there. Otherwise,
they read the global value of `denote-directory`. This is a nice
arrangement to keep a separation of concerns and to purposefully
operate with contextuality in mind.

## Use `#+bind` to set local values for Org export

While Denote works perfectly fine with the aforementioned, we do have
a major constraint when dealing with Org's export mechanism. Users may
want to maintain a silo where they write Org entries that are
eventually collected into a set of HTML files that form a blog. This
does not work because the Org export mechanism is designed to ignore
directory-local variables. So all `denote:` links inside the silo will
be broken, because their path is not resolved correctly at export
time.

We can work around this constraint by leveraging Org's `#+bind`
keyword. Before we do that, we need to enable support for such
bindings. Add the following to your Emacs configuration:

```elisp
(setq org-export-allow-bind-keywords t)
```

Then we may insert the `#+bind` in each affected file. Write the
following somewhere towards the top of the file:

```elisp
#+bind: denote-directory "/path/to/silo/"
```

As you can tell, the syntax is `#+bind: variable value`.

## Use `.dir-locals.el` to automatically insert the `#+bind`

One of the principles of Denote's development, is to keep the code
hackable. The front matter that Denote inserts to newly created Org
notes is stored as a string in the variable `denote-org-front-matter`.
Since our silo already uses the `.dir-locals.el`, we can add another
entry to it, to make the front matter include the desired `#+bind`
directive. No need to write the whole thing each time.

Building on the previous example, we have this for our `.dir-locals.el`:

```elisp
   ;;; Directory Local Variables.  For more information evaluate:
   ;;;
   ;;;     (info "(emacs) Directory Variables")

   ((nil . ((denote-directory . "/path/to/silo/")
            (denote-org-front-matter . 
             "#+title:      %s
#+date:       %s
#+filetags:   %s
#+identifier: %s
#+bind:       denote-directory \"/path/to/silo/\"
\n"))))
```

Note that the value of the `denote-directory` has to be a string, so
we need to keep the double quotes there around the `/path/to/silo/`,
hence the `\"/path/to/silo/\"`.

Now all new Org files created with Denote will include that extra line
in the front matter.

## Small changes for a big improvement

I wish Org export would support directory-local variables, though I
understand there are technical constraints for that. By making those
minor tweaks, we get the expected results.

If you had problems with Org files in Denote silos, please try this
solution.

## About Denote

Denote is a simple note-taking tool for Emacs.  It is based on the idea
that notes should follow a predictable and descriptive file-naming
scheme.  The file name must offer a clear indication of what the note is
about, without reference to any other metadata.  Denote basically
streamlines the creation of such files while providing facilities to
link between them.

Denote's file-naming scheme is not limited to "notes".  It can be used
for all types of file, including those that are not editable in Emacs,
such as videos.  Naming files in a consistent way makes their
filtering and retrieval considerably easier.  Denote provides relevant
facilities to rename files, regardless of file type.

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/denote>
  + GitLab: <https://gitlab.com/protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.

