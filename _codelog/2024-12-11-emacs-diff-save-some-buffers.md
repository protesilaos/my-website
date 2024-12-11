---
title: "Emacs: make 'save-some-buffers' show diff on demand"
excerpt: "A small tweak to make the `save-some-buffers` command show a diff on demand between the buffer and its file."
---

The command `save-some-buffers`, which is bound to `C-x s` by default
is helpful when you need to save lots of buffers efficiently. Instead
of figuring out which ones are modified and visiting each of them to
decide what to do, you invoke `save-some-buffers`. It prompts for an
action, one buffer at a time. Actions include to save or not as well
as a "yes to all" directive. Each action is bound to a key and all of
them can be customised by modifying the variable `save-some-buffers-action-alist`.
When there are no more modified buffers to act on, the command
concludes its operation. Nice and simple.

While the default experience is fine, there are times when I
completely forgot what kind of changes I made to a file. This is
especially true when files have similar names. Do I really need to
save it, or there is more work to be done? As such, I need access to a
diff command, which I access via the `d` key binding.

Emacs has built-in the ability to calculate the difference between the
buffer's contents and that of its underlying file. This is done by the
function `diff-buffer-with-file`.

We may then leverage this function to add a new association between a
key, a function, and a brief explanatory statement. The latter is
available upon typing `C-h` at the `save-some-buffers` prompt.

Here is the idea:

```elisp
(add-to-list 'save-some-buffers-action-alist
             (list "d"
                   (lambda (buffer) (diff-buffer-with-file (buffer-file-name buffer)))
                   "show diff between the buffer and its file"))
```

Now I can type `d` at the prompt whenever I am not sure about what I
need to do with a given buffer and its file. When I am done reviewing
the buffer, I type `q` to dismiss it and get back to the prompt. It works!


