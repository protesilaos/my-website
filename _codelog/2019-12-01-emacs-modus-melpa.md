---
title: 'My Modus themes are on MELPA!'
excerpt: 'In this video I announce the availability of my highly-accessible Emacs themes on the MELPA repository.'
layout: vlog
mediaid: 'zofd0O12XWE'
---

My highly-accessible themes for GNU Emacs have been admitted to the
MELPA repository.  The project is called "Modus themes" and it consists
of a light and a dark item.  The light theme is called "Modus Operandi",
while the other is "Modus Vivendi".

The Modus themes conform with the WCAG AAA standard for colour contrast.
This is the highest of its kind, which means that all interfaces should
be legible at all times.

Each theme is offered as a standalone package, as explained in the
video.  The easiest way to get them from MELPA is to run:

```
M-x package-install RET modus-operandi-theme RET
```

Or:

```
M-x package-install RET modus-vivendi-theme RET
```

Alternatively, you can install them with `use-package` declarations,
such as:

```
(use-package modus-operandi-theme
  :ensure t)

(use-package modus-vivendi-theme
  :ensure t)
```

As I mention in the video, the themes are under active development, even
though they already provide support for a comprehensive list of
packages.

Please refer to their repository on GitLab for more information, screen
shots, and source code: <https://gitlab.com/protesilaos/modus-themes>.
