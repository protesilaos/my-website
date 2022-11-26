---
title: "Emacs: my new 'altcaps' package"
excerpt: "The 'altcaps' package for Emacs helps the user apply alternating letter casing to convey sarcasm or mockery."
---

The `altcaps` package helps you apply alternating letter casing to
convey sarcasm or mockery.  For example, convert this:

```
I respect the authorities
```

To this:

```
i ReSpEcT tHe AuThOrItIeS
```

The `altcaps` package thus makes you more effective at textual
communication.  Plus, you appear sophisticated.  tRuSt Me.

Use any of the following commands to achieve the desired results:

- `altcaps-word` :: Convert word to alternating letter casing.  With
  optional `NUM` as a numeric prefix argument, operate on `NUM` words
  forward, defaulting to 1.  If `NUM` is negative, do so backward.
  When `NUM` is a negative prefix without a number, it is interpreted
  -1.

- `altcaps-region` :: Convert region words between `BEG` and `END` to
  alternating case.  `BEG` and `END` are buffer positions.  When
  called interactively, these are automatically determined as active
  region's boundaries, else the space between `mark` and `point`.

- `altcaps-dwim` :: Convert to alternating letter casing
  Do-What-I-Mean style.  With an active region, call `altcaps-region`.
  Else invoke `altcaps-word` with optional `NUM`, per that command's
  functionality (read its documentation).

* * *

+ Package name (GNU ELPA): `altcaps`
+ Official manual: <https://protesilaos.com/emacs/altcaps>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/altcaps>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/altcaps>
    + GitLab: <https://gitlab.com/protesilaos/altcaps>
+ Mailing list: <https://lists.sr.ht/~protesilaos/altcaps>
+ Backronyms: Alternating Letters Transform Casual Asides to Playful
  Statements.  ALTCAPS Lets Trolls Convert Aphorisms to Proper
  Shitposts.
