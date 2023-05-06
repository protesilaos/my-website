---
title: "Emacs: spontaneous live stream today (2023-05-06) at 11:30 Europe/Athens time"
excerpt: "I am doing a live stream today on various Emacs topics.  The video will be recorded and can be watched later."
layout: vlog
mediaid: "v8NaZV1LdN8"
---

It is raining and I have no coaching work right now...  I am thus
planning to do a live stream on various Emacs topics.  **The video will
be recorded and can be watched later.**

There is nothing specific I want to talk about.  I will just do some
general maintenance of Emacs code and go with the flow.

A non-exhaustive list of items:

- Write a `defalias` of `modus-themes-items` to
  `modus-themes-collection`.

- Write the inverse for the `ef-themes`.

- Document in the Modus manual how to add more spacing in the frame
  and between windows.

- Solve a problem on how to get the cursor colour from the current
  theme (see snippet below).

  ```elisp
  ;; Getting the cursor color
  (car (alist-get 'cursor ef-duo-dark-palette))
  ;; => "#ef6f11"

  ;; Getting the theme and adding the "-palette" string to match the alist
  (intern-soft (format "%s-palette"
                       (car custom-enabled-themes)))
  ;; => ef-duo-dark-palette

  ;; Getting frustrated for not being able to see the error....
  (alist-get 'cursor
             (intern-soft (format "%s-palette"
                                  (car custom-enabled-themes))))
  ```

- Contribute to the Denote mailing list thread about linking to
  non-note files:
  <https://lists.sr.ht/~protesilaos/denote/%3C87fs8b85tq.fsf%40prevos.net%3E>.

Of course, I can also do whatever else may come up during the chat.  I
understand this is a short notice (I am typing this at 2023-05-06
08:01 +0300), so no worries if you can't make it.
