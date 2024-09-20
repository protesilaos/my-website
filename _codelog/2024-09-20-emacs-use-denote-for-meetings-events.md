---
title: "Emacs: use Denote for meetings or events"
excerpt: "Example of how to use Emacs' Denote package to keep records of meeting notes or similar recurring events."
---

Some users want to know how they should use Denote to handle recurring
events, such as meetings with colleagues. With Denote, we typically
create a new file and write whatever we need there. But these kind of
files start to lose value when they have the same title and keywords
across time. For example, we cannot tell much by looking at a list of
files like this:

```
- 20240915T105532--socratis__meeting.org
- 20240916T161208--platon__meeting.org
- 20240917T133627--aristotelis__meeting.org
- 20240918T091245--socratis__meeting.org
- 20240919T112950--platon__meeting.org
- 20240920T165532--aristotelis__meeting.org
```

Those files all look the same and it is impossible for us to make any
sense of them unless we go through all the contents. So either we will
use more descriptive titles and meaningful keywords, or we need to
write some custom code that does the following:

- Ask for the name of a person among a list of known names.
- Find the file that mentions this name. If our files always have a
  certain keyword, like `_meeting`, we can factor this into our code
  (I include an example below).
- If there are multiple files that correspond to the selected person,
  select one among them.
- Open the file that is about that person.
- Go to the bottom of that file and write a new heading with the
  current date and time (or something else, but I use this for the
  example---contact me if you have different requirements).

This way, we can keep one file per person/event to (i) still have the
benefits of using Denote while (ii) not being forced to write many
files that are virtually indistinguishable in a file listing.

## The complete version of the code we need

Here is the entirety of it. In the next section I explain each bit in
more detail. You want to include this in your configuration, evaluate
it, modify the `my-denote-colleagues` to include the names you care
about, and then use the command `my-denote-colleagues-new-meeting`.

```elisp
(defvar my-denote-colleagues '("socratis" "platon" "aristotelis")
  "List of names I collaborate with.
There is at least one file in the variable `denote-directory' that has
the name of this person.")

(defvar my-denote-colleagues-prompt-history nil
  "Minibuffer history for `my-denote-colleagues-new-meeting'.")

(defun my-denote-colleagues-prompt ()
  "Prompt with completion for a name among `my-denote-colleagues'.
Use the last input as the default value."
  (let ((default-value (car my-denote-colleagues-prompt-history)))
    (completing-read
     (format-prompt "New meeting with COLLEAGUE" default-value)
     my-denote-colleagues
     nil :require-match nil
     'my-denote-colleagues-prompt-history
     default-value)))

(defun my-denote-colleagues-get-file (name)
  "Find file in variable `denote-directory' for NAME colleague.
If there are more than one files, prompt with completion for one among
them.

NAME is one among `my-denote-colleagues'."
  (if-let ((files (denote-directory-files name))
           (length-of-files (length files)))
      (cond
       ((= length-of-files 1)
        (car files))
       ((> length-of-files 1)
        (completing-read "Select a file: " files nil :require-match)))
    (user-error "No files for colleague with name `%s'" name)))

(defun my-denote-colleagues-new-meeting ()
  "Prompt for the name of a colleague and insert a timestamped heading therein.
The name of a colleague corresponds to at least one file in the variable
`denote-directory'.  In case there are multiple files, prompt to choose
one among them and operate therein.

Names are defined in `my-denote-colleagues'."
  (declare (interactive-only t))
  (interactive)
  (let* ((name (my-denote-colleagues-prompt))
         (file (my-denote-colleagues-get-file name))
         (time (format-time-string "%F %a %R")))  ; remove %R if you do not want the time
    (with-current-buffer (find-file file)
      (goto-char (point-max))
      ;; Here I am assuming we are in `org-mode', hence the leading
      ;; asterisk for the heading.  Adapt accordingly.
      (insert (format "* [%s]\n\n" time)))))
```

## All the code with accompanying commentary

First we define a list of known names. We do this so that we can
benefit from minibuffer completion. We could do without completion,
but I think this is more convenient. The value of this variable is a
list of strings.

[ Note that when we write actual packages we use `defcustom` for stuff
  that are meant to be customised by the user. Those variables are
  called "user options". The code base of `denote` is a case study of
  good practices for packaging your Elisp code. ]

```elisp
(defvar my-denote-colleagues '("socratis" "platon" "aristotelis")
  "List of names I collaborate with.
There is at least one file in the variable `denote-directory' that has
the name of this person.")
```

Then we have the minibuffer prompt that uses minibuffer completion
with the names we defined above:

```elisp
(defvar my-denote-colleagues-prompt-history nil
  "Minibuffer history for `my-denote-colleagues-new-meeting'.")

(defun my-denote-colleagues-prompt ()
  "Prompt with completion for a name among `my-denote-colleagues'.
Use the last input as the default value."
  (let ((default-value (car my-denote-colleagues-prompt-history)))
    (completing-read
     (format-prompt "New meeting with COLLEAGUE" default-value)
     my-denote-colleagues
     nil :require-match nil
     'my-denote-colleagues-prompt-history
     default-value)))
```

In the Emacs minibuffer, we have a history that we can access with
`M-p` (`previous-history-element`) and `M-n` (`next-history-element`).
If prompts do not have their own history variable, then we cycle
through a shared history of inputs. This is generally not helpful, so
practically all my minibuffer prompts have their own history.

We can persist minibuffer histories across sessions by using the
built-in `savehist-mode`.

Also notice how the prompt has a default value, which is the last
input we provided. The idea is that we can type `RET` to get this
default if the minibuffer is empty. If this does not work with your
completion framework, you will need to check how to input nothing at
the prompt.

The next part is a function that finds the file associated with the
name of the person we selected at the previous prompt.

```elisp
(defun my-denote-colleagues-get-file (name)
  "Find file in variable `denote-directory' for NAME colleague.
If there are more than one files, prompt with completion for one among
them.

NAME is one among `my-denote-colleagues'."
  (if-let ((files (denote-directory-files name))
           (length-of-files (length files)))
      (cond
       ((= length-of-files 1)
        (car files))
       ((> length-of-files 1)
        (completing-read "Select a file: " files nil :require-match)))
    (user-error "No files for colleague with name `%s'" name)))
```

I have made it here so that we search the `denote-directory` for files
that match `name`. So it would be something like this:

```elisp
(denote-directory-files "socratis")
```

If we want to be more precise with what we are matching to, for
example, only include files that have the `_meeting` keyword as well
as the given name, then we can modify the relevant snippet in the
`my-denote-colleagues-get-file`:

```elisp
(denote-directory-files (format "%s.*_meeting" name))
```

[ Of course, we can make the entire query a parameter but I want to
  have a streamlined experience with this. ]

Let's check again this function now:

```elisp
(defun my-denote-colleagues-get-file (name)
  "Find file in variable `denote-directory' for NAME colleague.
If there are more than one files, prompt with completion for one among
them.

NAME is one among `my-denote-colleagues'."
  (if-let ((files (denote-directory-files name)) ; OR (denote-directory-files (format "%s.*_meeting" name))
           (length-of-files (length files)))
      (cond
       ((= length-of-files 1)
        (car files))
       ((> length-of-files 1)
        (completing-read "Select a file: " files nil :require-match)))
    (user-error "No files for colleague with name `%s'" name)))
```

You will notice that it has a `completing-read` inside of it in the
case where the number of files we fin is greater than 1. This
`completing-read` is what we use in the prompt we defined earlier, but
here we do not use a history because the chances that we need one in
such a workflow are few---if you do need a dedicated history, check
how we did it above and adapt accordingly (though I think it makes
sense to consolidate those files and ultimately not have to select
anything at this stage).

Now that we have set up all the helper functions, we can check the
final piece, which is what you will call with `M-x` or a key binding:

```elisp
(defun my-denote-colleagues-new-meeting ()
  "Prompt for the name of a colleague and insert a timestamped heading therein.
The name of a colleague corresponds to at least one file in the variable
`denote-directory'.  In case there are multiple files, prompt to choose
one among them and operate therein.

Names are defined in `my-denote-colleagues'."
  (declare (interactive-only t))
  (interactive)
  (let* ((name (my-denote-colleagues-prompt))
         (file (my-denote-colleagues-get-file name))
         (time (format-time-string "%F %a %R")))  ; remove %R if you do not want the time
    (with-current-buffer (find-file file)
      (goto-char (point-max))
      ;; Here I am assuming we are in `org-mode', hence the leading
      ;; asterisk for the heading.  Adapt accordingly.
      (insert (format "* [%s]\n\n" time)))))
```

[ In the Denote code base we have lots of examples of using the
  `interactive` spec to make the function accept arguments from Lisp
  but also in interactive uses. Here I am keeping it simple to not go
  into too many technicalities. ]

The above command ties together everything we have covered thus far.
It then adds the final element, which is the heading at the bottom
with the current date and time. If you want to modify how that looks,
check the `format-time-string`. And if you want something else
entirely at this point, just let me know and I will help you make it
happen.

I wrote a variant of this in the Denote manual in response to a
question by Kosta Harlan. This was done via a private channel and the
information is shared with permission.

## Denote sources

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
