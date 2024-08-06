---
title: "Emacs: copy file to many directories"
excerpt: "Custom Emacs Lisp to copy a single file to many directories."
---

I was asked if I knew of a way to copy a single file to many
destinations in one go. I initially replied that I was not aware of
such a piece of functionality. Then I decided to give it a try. So
after ~20 minutes I came up with this prototype (which I promptly sent
to my correspondent):

```elisp
(defun prot/copy-file-to-destinations--directory-prompt ()
  "Produce the directory/destinations prompt of `prot/copy-file-to-destinations'."
  (let ((skip-initial t)
        destinations)
    (while (or skip-initial (y-or-n-p "Add more destinations? "))
      (when skip-initial
        (setq skip-initial nil))
      (push (read-directory-name "Select destination directory: ") destinations))
    destinations))

(defun prot/copy-file-to-destinations (file destinations)
  "Copy FILE to DESTINATIONS.
FILE is a string pointing to a file system path.  DESTINATIONS is a list
of strings representing directories.

In interactive use, prompt for FILE and then for DESTINATIONS.  For each
selected destination, produce a `y-or-n-p' prompt on whether to add
another destination or perform the operation with the selected ones."
  (interactive
   (list
    (read-file-name "File to copy: ")
    (prot/copy-file-to-destinations--directory-prompt)))
  (dolist (destination destinations)
    (copy-file file destination :overwrite-if-it-exists))
  (message "Copied %s to %s" file (mapconcat #'identity destinations ", ")))
```

I find the pattern of `(while...(read-directory-name ...))`
intriguing. It seems like a decent alternative to `completing-read-multiple`
when we need to use a familiar prompt a number of times.

I do not have a use-case for this, so I will probably not elaborate on
it further. Just sharing it in case you want to edit it. I had a fun
time writing it!
