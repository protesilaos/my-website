---
title: "Colour palette of the Modus themes"
excerpt: "The colour palette of the modus-themes (modus-operandi and modus-vivendi)."
permalink: /emacs/modus-themes-colors
---

The `modus-themes` is a project of mine that includes two themes for GNU
Emacs: `modus-operandi` and `modus-vivendi`.  They are part of core
Emacs since its version 28 (summer 2020).  The `modus-themes` project is
released under the terms of the GNU General Public License version 3 (or
later)---same as Emacs.  In other words, it has a strong commitment to
_copyleft_.

I understand that colours cannot be copyrighted in themselves, but if
they can, the themes' palette is hereby licensed under the terms of the
[Creative Commons Zero (CC0)](https://creativecommons.org/publicdomain/zero/1.0/legalcode),
meaning that it is in the public domain to the extent possible by law.
**You do not have to provide attribution for the colour palette**, but
doing so, such as by linking to this page, can help others discover the
original material.

You will find the colours further below.

[ If you are using Emacs, you can always preview them with `M-x
modus-themes-list-colors` or `M-x modus-themes-list-colors-current`. ]

Sources:

+ Package name (GNU ELPA): `modus-themes`
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/modus-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/modus-themes>
    + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/modus-themes>

## Colour palette of modus-operandi

Extracted from `modus-themes-operandi-colors` in the `modus-themes.el`
file on 2022-05-10 05:24 +0300  (this file is found in the git repo on
SourceHut (or its mirrors) and in the Emacs source code).

```
| Name                          | Hex value |
|-------------------------------|-----------|
| bg-main                       | #000000   |
| fg-main                       | #ffffff   |
| bg-dim                        | #100f10   |
| fg-dim                        | #e0e6f0   |
| bg-alt                        | #191a1b   |
| fg-alt                        | #a8a8a8   |
| bg-active                     | #323232   |
| fg-active                     | #f4f4f4   |
| bg-inactive                   | #1e1e1e   |
| fg-inactive                   | #bfc0c4   |
| bg-active-accent              | #2a2a66   |
| bg-special-cold               | #203448   |
| bg-special-faint-cold         | #0e183a   |
| fg-special-cold               | #c6eaff   |
| bg-special-mild               | #00322e   |
| bg-special-faint-mild         | #001f1a   |
| fg-special-mild               | #bfebe0   |
| bg-special-warm               | #382f27   |
| bg-special-faint-warm         | #241613   |
| fg-special-warm               | #f8dec0   |
| bg-special-calm               | #392a48   |
| bg-special-faint-calm         | #251232   |
| fg-special-calm               | #fbd6f4   |
| red                           | #ff8059   |
| red-alt                       | #ef8b50   |
| red-alt-other                 | #ff9077   |
| red-faint                     | #ffa0a0   |
| red-alt-faint                 | #f5aa80   |
| red-alt-other-faint           | #ff9fbf   |
| green                         | #44bc44   |
| green-alt                     | #70b900   |
| green-alt-other               | #00c06f   |
| green-faint                   | #78bf78   |
| green-alt-faint               | #99b56f   |
| green-alt-other-faint         | #88bf99   |
| yellow                        | #d0bc00   |
| yellow-alt                    | #c0c530   |
| yellow-alt-other              | #d3b55f   |
| yellow-faint                  | #d2b580   |
| yellow-alt-faint              | #cabf77   |
| yellow-alt-other-faint        | #d0ba95   |
| blue                          | #2fafff   |
| blue-alt                      | #79a8ff   |
| blue-alt-other                | #00bcff   |
| blue-faint                    | #82b0ec   |
| blue-alt-faint                | #a0acef   |
| blue-alt-other-faint          | #80b2f0   |
| magenta                       | #feacd0   |
| magenta-alt                   | #f78fe7   |
| magenta-alt-other             | #b6a0ff   |
| magenta-faint                 | #e0b2d6   |
| magenta-alt-faint             | #ef9fe4   |
| magenta-alt-other-faint       | #cfa6ff   |
| cyan                          | #00d3d0   |
| cyan-alt                      | #4ae2f0   |
| cyan-alt-other                | #6ae4b9   |
| cyan-faint                    | #90c4ed   |
| cyan-alt-faint                | #a0bfdf   |
| cyan-alt-other-faint          | #a4d0bb   |
| red-intense                   | #fe6060   |
| orange-intense                | #fba849   |
| green-intense                 | #4fe42f   |
| yellow-intense                | #f0dd60   |
| blue-intense                  | #4fafff   |
| magenta-intense               | #ff62d4   |
| purple-intense                | #9f80ff   |
| cyan-intense                  | #3fdfd0   |
| red-active                    | #ffa7ba   |
| green-active                  | #70d73f   |
| yellow-active                 | #dbbe5f   |
| blue-active                   | #34cfff   |
| magenta-active                | #d5b1ff   |
| cyan-active                   | #00d8b4   |
| red-subtle-bg                 | #762422   |
| red-intense-bg                | #a4202a   |
| green-subtle-bg               | #2f4a00   |
| green-intense-bg              | #006800   |
| yellow-subtle-bg              | #604200   |
| yellow-intense-bg             | #874900   |
| blue-subtle-bg                | #10387c   |
| blue-intense-bg               | #2a40b8   |
| magenta-subtle-bg             | #49366e   |
| magenta-intense-bg            | #7042a2   |
| cyan-subtle-bg                | #00415e   |
| cyan-intense-bg               | #005f88   |
| red-fringe-bg                 | #8f1f4b   |
| green-fringe-bg               | #006700   |
| yellow-fringe-bg              | #6f4f00   |
| blue-fringe-bg                | #3f33af   |
| magenta-fringe-bg             | #6f2f89   |
| cyan-fringe-bg                | #004f8f   |
| red-graph-0-bg                | #b52c2c   |
| red-graph-1-bg                | #702020   |
| green-graph-0-bg              | #4fd100   |
| green-graph-1-bg              | #007800   |
| yellow-graph-0-bg             | #f1e00a   |
| yellow-graph-1-bg             | #b08600   |
| blue-graph-0-bg               | #2fafef   |
| blue-graph-1-bg               | #1f2f8f   |
| magenta-graph-0-bg            | #bf94fe   |
| magenta-graph-1-bg            | #5f509f   |
| cyan-graph-0-bg               | #47dfea   |
| cyan-graph-1-bg               | #00808f   |
| red-refine-bg                 | #77002a   |
| red-refine-fg                 | #ffb9ab   |
| green-refine-bg               | #00422a   |
| green-refine-fg               | #9ff0cf   |
| yellow-refine-bg              | #693200   |
| yellow-refine-fg              | #e2d980   |
| blue-refine-bg                | #242679   |
| blue-refine-fg                | #8ecfff   |
| magenta-refine-bg             | #71206a   |
| magenta-refine-fg             | #ffcaf0   |
| cyan-refine-bg                | #004065   |
| cyan-refine-fg                | #8ae4f2   |
| red-nuanced-bg                | #2c0614   |
| red-nuanced-fg                | #ffcccc   |
| green-nuanced-bg              | #001904   |
| green-nuanced-fg              | #b8e2b8   |
| yellow-nuanced-bg             | #221000   |
| yellow-nuanced-fg             | #dfdfb0   |
| blue-nuanced-bg               | #0f0e39   |
| blue-nuanced-fg               | #bfd9ff   |
| magenta-nuanced-bg            | #230631   |
| magenta-nuanced-fg            | #e5cfef   |
| cyan-nuanced-bg               | #041529   |
| cyan-nuanced-fg               | #a8e5e5   |
| bg-hl-line                    | #151823   |
| bg-hl-line-intense            | #292929   |
| bg-hl-line-intense-accent     | #002a4f   |
| bg-hl-alt                     | #181732   |
| bg-hl-alt-intense             | #282e46   |
| bg-paren-match                | #6f3355   |
| bg-paren-match-intense        | #7416b5   |
| bg-paren-expression           | #221044   |
| bg-region                     | #3c3c3c   |
| bg-region-accent              | #4f3d88   |
| bg-region-accent-subtle       | #240f55   |
| bg-completion                 | #142f69   |
| bg-completion-subtle          | #0e194b   |
| bg-char-0                     | #0050af   |
| bg-char-1                     | #7f1f7f   |
| bg-char-2                     | #625a00   |
| bg-tab-active                 | #0e0e0e   |
| bg-tab-inactive               | #424242   |
| bg-tab-inactive-accent        | #35398f   |
| bg-tab-inactive-alt           | #595959   |
| bg-tab-inactive-alt-accent    | #505588   |
| red-tab                       | #ffc0bf   |
| green-tab                     | #88ef88   |
| yellow-tab                    | #d2e580   |
| orange-tab                    | #f5ca80   |
| blue-tab                      | #92d9ff   |
| cyan-tab                      | #60e7e0   |
| magenta-tab                   | #ffb8ff   |
| purple-tab                    | #cfcaff   |
| fg-escape-char-construct      | #e7a59a   |
| fg-escape-char-backslash      | #abab00   |
| fg-lang-error                 | #ef8690   |
| fg-lang-warning               | #b0aa00   |
| fg-lang-note                  | #9d9def   |
| fg-lang-underline-error       | #ff4a6f   |
| fg-lang-underline-warning     | #d0de00   |
| fg-lang-underline-note        | #5f6fff   |
| fg-window-divider-inner       | #646464   |
| fg-window-divider-outer       | #969696   |
| fg-unfocused                  | #93959b   |
| fg-docstring                  | #b0d6f5   |
| fg-comment-yellow             | #d0a070   |
| bg-header                     | #212121   |
| fg-header                     | #dddddd   |
| bg-whitespace                 | #101424   |
| fg-whitespace                 | #aa9e9f   |
| bg-diff-heading               | #304466   |
| fg-diff-heading               | #dae7ff   |
| bg-diff-added                 | #0a280a   |
| fg-diff-added                 | #94ba94   |
| bg-diff-added-deuteran        | #001a3f   |
| fg-diff-added-deuteran        | #c4cdf2   |
| bg-diff-changed               | #2a2000   |
| fg-diff-changed               | #b0ba9f   |
| bg-diff-removed               | #40160f   |
| fg-diff-removed               | #c6adaa   |
| bg-diff-refine-added          | #005a36   |
| fg-diff-refine-added          | #e0f6e0   |
| bg-diff-refine-added-deuteran | #234f8f   |
| fg-diff-refine-added-deuteran | #dde4ff   |
| bg-diff-refine-changed        | #585800   |
| fg-diff-refine-changed        | #ffffcc   |
| bg-diff-refine-removed        | #852828   |
| fg-diff-refine-removed        | #ffd9eb   |
| bg-diff-focus-added           | #1d3c25   |
| fg-diff-focus-added           | #b4ddb4   |
| bg-diff-focus-added-deuteran  | #003959   |
| fg-diff-focus-added-deuteran  | #bfe4ff   |
| bg-diff-focus-changed         | #424200   |
| fg-diff-focus-changed         | #d0daaf   |
| bg-diff-focus-removed         | #500f29   |
| fg-diff-focus-removed         | #eebdba   |
| bg-mark-sel                   | #002f2f   |
| fg-mark-sel                   | #60cfa2   |
| bg-mark-del                   | #5a0000   |
| fg-mark-del                   | #ff99aa   |
| bg-mark-alt                   | #3f2210   |
| fg-mark-alt                   | #f0aa20   |
```

## Colour palette of modus-vivendi

Extracted from `modus-themes-vivendi-colors` in the `modus-themes.el`
file on 2022-10-01 10:37 +0300 (this file is found in the git repo on
SourceHut (or its mirrors) and in the Emacs source code).

| Name                      | Hex value |
|---------------------------+-----------|
| bg-main                   | #000000   |
| fg-main                   | #ffffff   |
| bg-dim                    | #100f10   |
| fg-dim                    | #e0e6f0   |
| bg-alt                    | #191a1b   |
| fg-alt                    | #a8a8a8   |
| bg-active                 | #323232   |
| fg-active                 | #f4f4f4   |
| bg-inactive               | #1e1e1e   |
| fg-inactive               | #bfc0c4   |
| bg-active-accent          | #2a2a66   |
| bg-special-cold           | #203448   |
| bg-special-faint-cold     | #0e183a   |
| fg-special-cold           | #c6eaff   |
| bg-special-mild           | #00322e   |
| bg-special-faint-mild     | #001f1a   |
| fg-special-mild           | #bfebe0   |
| bg-special-warm           | #382f27   |
| bg-special-faint-warm     | #241613   |
| fg-special-warm           | #f8dec0   |
| bg-special-calm           | #392a48   |
| bg-special-faint-calm     | #251232   |
| fg-special-calm           | #fbd6f4   |
| red                       | #ff8059   |
| red-alt                   | #ef8b50   |
| red-alt-other             | #ff9077   |
| red-faint                 | #ffa0a0   |
| red-alt-faint             | #f5aa80   |
| red-alt-other-faint       | #ff9fbf   |
| green                     | #44bc44   |
| green-alt                 | #70b900   |
| green-alt-other           | #00c06f   |
| green-faint               | #78bf78   |
| green-alt-faint           | #99b56f   |
| green-alt-other-faint     | #88bf99   |
| yellow                    | #d0bc00   |
| yellow-alt                | #c0c530   |
| yellow-alt-other          | #d3b55f   |
| yellow-faint              | #d2b580   |
| yellow-alt-faint          | #cabf77   |
| yellow-alt-other-faint    | #d0ba95   |
| blue                      | #2fafff   |
| blue-alt                  | #79a8ff   |
| blue-alt-other            | #00bcff   |
| blue-faint                | #82b0ec   |
| blue-alt-faint            | #a0acef   |
| blue-alt-other-faint      | #80b2f0   |
| magenta                   | #feacd0   |
| magenta-alt               | #f78fe7   |
| magenta-alt-other         | #b6a0ff   |
| magenta-faint             | #e0b2d6   |
| magenta-alt-faint         | #ef9fe4   |
| magenta-alt-other-faint   | #cfa6ff   |
| cyan                      | #00d3d0   |
| cyan-alt                  | #4ae2f0   |
| cyan-alt-other            | #6ae4b9   |
| cyan-faint                | #90c4ed   |
| cyan-alt-faint            | #a0bfdf   |
| cyan-alt-other-faint      | #a4d0bb   |
| red-intense               | #fe6060   |
| orange-intense            | #fba849   |
| green-intense             | #4fe42f   |
| yellow-intense            | #f0dd60   |
| blue-intense              | #4fafff   |
| magenta-intense           | #ff62d4   |
| purple-intense            | #9f80ff   |
| cyan-intense              | #3fdfd0   |
| red-active                | #ffa7ba   |
| green-active              | #70d73f   |
| yellow-active             | #dbbe5f   |
| blue-active               | #34cfff   |
| magenta-active            | #d5b1ff   |
| cyan-active               | #00d8b4   |
| red-subtle-bg             | #762422   |
| red-intense-bg            | #a4202a   |
| green-subtle-bg           | #2f4a00   |
| green-intense-bg          | #006800   |
| yellow-subtle-bg          | #604200   |
| yellow-intense-bg         | #874900   |
| blue-subtle-bg            | #10387c   |
| blue-intense-bg           | #2a40b8   |
| magenta-subtle-bg         | #49366e   |
| magenta-intense-bg        | #7042a2   |
| cyan-subtle-bg            | #00415e   |
| cyan-intense-bg           | #005f88   |
| red-fringe-bg             | #8f1f4b   |
| green-fringe-bg           | #006700   |
| yellow-fringe-bg          | #6f4f00   |
| blue-fringe-bg            | #3f33af   |
| magenta-fringe-bg         | #6f2f89   |
| cyan-fringe-bg            | #004f8f   |
| red-graph-0-bg            | #b52c2c   |
| red-graph-1-bg            | #702020   |
| green-graph-0-bg          | #4fd100   |
| green-graph-1-bg          | #007800   |
| yellow-graph-0-bg         | #f1e00a   |
| yellow-graph-1-bg         | #b08600   |
| blue-graph-0-bg           | #2fafef   |
| blue-graph-1-bg           | #1f2f8f   |
| magenta-graph-0-bg        | #bf94fe   |
| magenta-graph-1-bg        | #5f509f   |
| cyan-graph-0-bg           | #47dfea   |
| cyan-graph-1-bg           | #00808f   |
| red-refine-bg             | #77002a   |
| red-refine-fg             | #ffb9ab   |
| green-refine-bg           | #00422a   |
| green-refine-fg           | #9ff0cf   |
| yellow-refine-bg          | #693200   |
| yellow-refine-fg          | #e2d980   |
| blue-refine-bg            | #242679   |
| blue-refine-fg            | #8ecfff   |
| magenta-refine-bg         | #71206a   |
| magenta-refine-fg         | #ffcaf0   |
| cyan-refine-bg            | #004065   |
| cyan-refine-fg            | #8ae4f2   |
| red-nuanced-bg            | #2c0614   |
| red-nuanced-fg            | #ffcccc   |
| green-nuanced-bg          | #001904   |
| green-nuanced-fg          | #b8e2b8   |
| yellow-nuanced-bg         | #221000   |
| yellow-nuanced-fg         | #dfdfb0   |
| blue-nuanced-bg           | #0f0e39   |
| blue-nuanced-fg           | #bfd9ff   |
| magenta-nuanced-bg        | #230631   |
| magenta-nuanced-fg        | #e5cfef   |
| cyan-nuanced-bg           | #041529   |
| cyan-nuanced-fg           | #a8e5e5   |
| bg-hl-line                | #151823   |
| bg-hl-line-intense        | #292929   |
| bg-hl-line-intense-accent | #002a4f   |
| bg-hl-alt                 | #181732   |
| bg-hl-alt-intense         | #282e46   |
| bg-paren-match            | #6f3355   |
| bg-paren-match-intense    | #7416b5   |
| bg-paren-expression       | #221044   |
| bg-region                 | #3c3c3c   |
| bg-region-accent          | #4f3d88   |
| bg-region-accent-subtle   | #240f55   |
| bg-completion             | #142f69   |
| bg-completion-subtle      | #0e194b   |
| bg-char-0                 | #0050af   |
| bg-char-1                 | #7f1f7f   |
| bg-char-2                 | #625a00   |
| bg-tab-active             | #0e0e0e   |
| bg-tab-inactive           | #424242   |
| bg-tab-inactive-accent    | #35398f   |
| bg-tab-inactive-alt       | #595959   |
| bg-tab-inactive-alt-accen | #505588   |
| red-tab                   | #ffc0bf   |
| green-tab                 | #88ef88   |
| yellow-tab                | #d2e580   |
| orange-tab                | #f5ca80   |
| blue-tab                  | #92d9ff   |
| cyan-tab                  | #60e7e0   |
| magenta-tab               | #ffb8ff   |
| purple-tab                | #cfcaff   |
| fg-escape-char-construct  | #e7a59a   |
| fg-escape-char-backslash  | #abab00   |
| fg-lang-error             | #ef8690   |
| fg-lang-warning           | #b0aa00   |
| fg-lang-note              | #9d9def   |
| fg-lang-underline-error   | #ff4a6f   |
| fg-lang-underline-warning | #d0de00   |
| fg-lang-underline-note    | #5f6fff   |
| fg-window-divider-inner   | #646464   |
| fg-window-divider-outer   | #969696   |
| fg-unfocused              | #93959b   |
| fg-docstring              | #b0d6f5   |
| fg-comment-yellow         | #d0a070   |
| bg-header                 | #212121   |
| fg-header                 | #dddddd   |
| bg-whitespace             | #101424   |
| fg-whitespace             | #aa9e9f   |
| bg-diff-heading           | #304466   |
| fg-diff-heading           | #dae7ff   |
| bg-diff-added             | #0a280a   |
| fg-diff-added             | #94ba94   |
| bg-diff-added-deuteran    | #001a3f   |
| fg-diff-added-deuteran    | #c4cdf2   |
| bg-diff-changed           | #2a2000   |
| fg-diff-changed           | #b0ba9f   |
| bg-diff-removed           | #40160f   |
| fg-diff-removed           | #c6adaa   |
| bg-diff-refine-added      | #005a36   |
| fg-diff-refine-added      | #e0f6e0   |
| bg-diff-refine-added-deut | #234f8f   |
| fg-diff-refine-added-deut | #dde4ff   |
| bg-diff-refine-changed    | #585800   |
| fg-diff-refine-changed    | #ffffcc   |
| bg-diff-refine-removed    | #852828   |
| fg-diff-refine-removed    | #ffd9eb   |
| bg-diff-focus-added       | #1d3c25   |
| fg-diff-focus-added       | #b4ddb4   |
| bg-diff-focus-added-deute | #003959   |
| fg-diff-focus-added-deute | #bfe4ff   |
| bg-diff-focus-changed     | #424200   |
| fg-diff-focus-changed     | #d0daaf   |
| bg-diff-focus-removed     | #601f29   |
| fg-diff-focus-removed     | #eebdba   |
| bg-mark-sel               | #002f2f   |
| fg-mark-sel               | #60cfa2   |
| bg-mark-del               | #5a0000   |
| fg-mark-del               | #ff99aa   |
| bg-mark-alt               | #3f2210   |
| fg-mark-alt               | #f0aa20   |
