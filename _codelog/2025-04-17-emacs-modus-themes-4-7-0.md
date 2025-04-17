---
title: 'Emacs: modus-themes version 4.7.0'
excerpt: 'Information about the latest version of my highly accessible themes for GNU Emacs.'
---

I just published the latest stable release of [the Modus
themes](https://protesilaos.com/emacs/modus-themes). The change log
entry is reproduced further below. For any questions, you are welcome
to [contact me](https://protesilaos.com/contact/). I will now work to
apply these same changes to emacs.git, so please wait a little longer
for the updates to trickle down to you.

+ Package name (GNU ELPA): `modus-themes` (also built into Emacs 28+)
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/modus-themes>
  + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes.

* * *

## 4.7.0 on 2025-04-17

This release introduces many subtle stylistic tweaks to the "tinted",
"deuteranopia", and "tritanopia" theme variants.


### The `modus-themes-list-colors` command uses a tabulated list

This command and its `modus-themes-list-colors-current` help users see
the colour values and semantic palette mappings defined by the given
theme. In the past, their buffer was designed in the same spirit as
that of the command `list-faces-display`, whereas now it is like the
buffer of the command `list-packages`. Concretely, users may now sort
by column. Do `M-x describe-mode` while in that buffer to learn about
the available commands and their respective key bindings.


### The "tinted" themes have slightly different colours

The overall feel of the `modus-operandi-tinted` and `modus-vivendi-tinted`
themes is the same as before. Though in a side-by-side comparison between the
old and new versions reveals lots of subtle differences. The general
idea is to make the themes a bit more consistent by tweaking the
foreground values to be more harmonious in combination with their
background.


### The "deuteranopia" themes are more consistently blue and yellow

These are the `modus-operandi-deuteranopia` and `modus-vivendi-deuteranopia`,
which are optimised for users with red-green colour deficiency. In the
past, these themes used blue and yellow hues wherever a concept of
"success" versus "failure" had to be established. This approach is
more generalised now, to include programming syntax highlighting and
many other contexts. In short, the themes are more blue+yellow, while
retaining their original feel.


### The "tritanopia" themes are more consistently red and cyan

As above, the `modus-operandi-tritanopia` and `modus-vivendi-tritanopia`
themes, which are optimised for users with blue-yellow colour deficiency,
use a red+cyan palette in more places. Overall, they feel like they
did before, only they are more consistent.


### Miscellaneous

-   Extended support for the `icomplete` faces that are coming in Emacs
    version 31.

-   Added support for `treemacs` faces, courtesy of Rahul Juliato in
    pull request 121: <https://github.com/protesilaos/modus-themes/pull/121>.
    Rahul has assigned copyright to the Free Software Foundation.

-   Added support for the `tldr` package.

-   Extended support for `adoc-mode`. Thanks to Leilei332 for the
    contribution in pull request 137: <https://github.com/protesilaos/modus-themes/pull/137>.
    The change is within the ~15-line limit, meaning that the author
    does not need to assign copyright to the Free Software Foundation.

-   Added support for my `spacious-padding` package, specifically the
    faces it can use when the `spacious-padding-subtle-mode-line` user
    option is enabled.

-   Added support for the `howm` package.

-   Extended support to the new faces of the `transient` package. More
    specifically, all those faces use the same colour for key bindings
    because the idea of colour coding keys (e.g. light yellow means
    something different than dark blue) does not work in practice when
    considering accessibility. Such semantics should not be limited to
    differences in colour: they should also have distinct indicators,
    such as ASCII or Unicode characters.

-   Revised the `avy` package's faces to only use one coloured
    background. The multiple coloured backgrounds have been a perennial
    problem for our accessibility requirements and have made the themes
    needlessly more complex just to support an edge case. With this
    simplified style, `avy` continues to work fine: it simply is less
    flamboyant. Other interfaces with `avy`-like model of interaction,
    such as optional extensions to the `vertico` and `corfu` packages,
    have these same changes, in the interest of consistency.

-   Update the `meow` sample configuration in the manual. This package
    is not directly supported at the theme level because (i) I do not
    use it and (ii) it is very hard for an outsider to it to trigger the
    display of all of its faces in the right context. Without seeing how
    all of them look together, I cannot come up with a reliable design.
    The manual offers a "good enough" approximation.

-   Broadened the support of the `vterm` faces to include the "bright"
    colours, while updating those that were already covered. Thanks to
    Edgar Vincent for informing me that some of the vterm faces were
    changed a while ago. This was done in issue 317 on the GitLab
    mirror: <https://gitlab.com/protesilaos/modus-themes/-/issues/317>.

-   Revised the `org-column-title` face to inherit the `fixed-pitch`
    face if the user option `modus-themes-mixed-fonts` is non-nil. This
    user option makes it possible to have a buffer with proportionately
    spaced fonts (such as by enabling `variable-pitch-mode`), while
    keeping spacing-sensitive elements, like tables and code blocks, in a
    monospaced font.

    Thanks to pedro-nonfree for bringing this matter to my attention in
    issue 129: <https://github.com/protesilaos/modus-themes/issues/129>.

-   Simplified the helper function `modus-themes--retrieve-palette-value`
    to make it more efficiently. Thanks to Basil L. Contovounesios for
    the contribution in merge request 60 on the GitLab mirror:
    <https://gitlab.com/protesilaos/modus-themes/-/merge_requests/60>.

-   Reworded the minibuffer prompt of the `modus-themes-list-colors`
    command.

-   Made Ivy and IDO subdirectories and "virtual" buffers easier to tell
    apart from matching text highlights.

-   Included coverage for the `auto-dim-other-buffers-hide-face` of the
    package `auto-dim-other-buffers`

-   Covered the built-in `abbrev-table-name` face.
