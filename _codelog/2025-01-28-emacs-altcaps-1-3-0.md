---
title: 'Emacs: aLtCaPs version 1.3.0'
excerpt: 'Information about the latest version of my text-transformation package for GNU Emacs.  It helps convey sarcasm or mockery.'
---

This version does not include any user-facing changes. I made some
internal refinements and ensured everything works as expected. Just
use the sample configuration to get started:

```elisp
(use-package altcaps
  :ensure t
  :bind
  ("C-x C-a" . altcaps-dwim)
  :config
  ;; Optionally force letter casing for certain characters (for legibility).
  (setq altcaps-force-character-casing
      '(("i" . downcase)
        ("l" . upcase))))
```

## About `altcaps`

The `altcaps` package is a small, focused-in-scope tool that helps
users communicate mockery or sarcasm effectively.  It does this by
alternating the letter casing of characters in the words it affects.

+ Package name (GNU ELPA): `altcaps`
+ Official manual: <https://protesilaos.com/emacs/altcaps>
+ Change log: <https://protesilaos.com/emacs/altcaps-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/altcaps>
  + GitLab: <https://gitlab.com/protesilaos/altcaps>
+ Backronyms: Alternating Letters Transform Casual Asides to Playful
  Statements.  ALTCAPS Lets Trolls Convert Aphorisms to Proper
  Shitposts.
