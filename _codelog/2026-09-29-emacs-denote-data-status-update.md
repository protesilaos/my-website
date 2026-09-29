---
title: "Emacs: status update on the 'denote-data' cache for Denote"
excerpt: "A status update on the project I am working on to have an opt-in, in-memory cache for Denote."
---

[A few days ago I announced](https://protesilaos.com/codelog/2026-09-26-emacs-experiment-denote-cache/)
that I am working on `denote-data`. The goal is to provide an opt-in,
in-memory cache for Denote. It can be used to speed up certain
computationally expensive operations. It must be opt-in because there
are many users, myself included, who do not need such functionality (I
program because the challenge is fun, just how I did with `denote-sequence`, for example).

I have a final update on this that [I posted on denote.git issue 724](https://github.com/protesilaos/denote/issues/724) 
and am copying below. Any future changes will appear in the release
notes of the next version of Denote. In short: it is happening.

## The status update on denote.git

Hello again folks!

I have an update on the `denote-data` project. The code is in this denote.git branch for now: <https://github.com/protesilaos/denote/tree/denote-data>

What I am doing:

- Find the computationaly heavy functions.
- Write `denote-data` variants for them.
- Introduce variables to `funcall VAR` instead of calling the heavy functions directly.
- Make the `denote-data-mode` set those variables.

This way we can have any extension do what `denote-data` does. And this way `denote-data` can be its own package as well.

1. The first big problem I see now is how to make the caching functions async. I will figure this out by studying `list-packages` and related.
2. Then I want to study `filenotify.el`. @mentalisttraceur I have noted that your code is okay for copyright purposes, so I can check it out. Or you can send a PR, if you prefer.

Otherwise, I think this is almost done.

With an opt-in cache we can support other workflows that people have been asking for, such as in-buffer completion.
