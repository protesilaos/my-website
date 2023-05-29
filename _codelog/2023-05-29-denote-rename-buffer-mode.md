---
title: "Emacs: Denote can now automatically rename its buffers"
excerpt: "My 'denote' package for Emacs has a new minor mode that renames the buffer upon visiting a Denote file."
---

I am working towards the next major release of `denote`.  There
already are lots of goodies in the works.  A new one among them is the
global minor mode `denote-rename-buffer-mode`.  It automatically
renames the buffer of a Denote file upon visiting the file.  A buffer
is renamed only when visiting the underlying file.  This means that
existing buffers are not renamed until they are visited again in a new
buffer (files are visited with the command `find-file` or related).

For example, I enable the mode and then visit a file whose name is
`20230507T084817--software-freedom-and-accessibility__linux_politics.txt`.
Normally, that would also be the name of the buffer.  Whereas now the
buffer is called `Software freedom and accessibility`.

[ If you are unfamiliar with Denote, consult the comprehensive manual
  or at least watch the video demo I did of its original version.
  Links below. ]

Customize the user option `denote-rename-buffer-function` to affect
how buffers are renamed.  Its value must be the symbol of a function.
The default is the `denote-rename-buffer-with-title`, with an
alternative of `denote-rename-buffer-with-identifier`.

The user option also accepts an arbitrary function.  Refer to the
implementation details of `denote-rename-buffer-with-title` or
`denote-rename-buffer-with-identifier` for guidance on how to write a
custom function.

Note that renaming a _buffer_ is not the same as renaming a _file_
(Denote can do both).  The former is just for ease-of-use inside of
Emacs.  Whereas the latter is for writing changes to disk, making them
available to all programs.

I don't know when I will be able to release version `2.0.0`.
Hopefully soon.

* * *

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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/denote>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/denote>
    + GitLab: <https://gitlab.com/protesilaos/denote>
+ Mailing list: <https://lists.sr.ht/~protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.
