---
title: 'Emacs: fontaine version 0.2.0'
excerpt: 'Information about the latest version of my fontaine package for GNU Emacs.'
---

Fontaine lets the user specify presets of font configurations and switch
between them on demand.  This makes it easy to optimise for different
contexts, such as a "reading" preset with large, spacious fonts, and an
"editing" preset with smaller, more compact fonts.

Sources:

+ Package name (GNU ELPA): `fontaine`
+ Official manual: <https://protesilaos.com/emacs/fontaine>
+ Change log: <https://protesilaos.com/emacs/mct-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/fontaine>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/fontaine>
    + GitLab: <https://gitlab.com/protesilaos/fontaine>
+ Mailing list: <https://lists.sr.ht/~protesilaos/fontaine>

Below are the release notes.  Also make sure to check my [growing] list
of Emacs packages: <https://protesilaos.com/emacs>.

* * *

## Version 0.2.0 on 2022-05-09

-   Fontaine can apply its changes on a per-frame basis.  One frame may,
    for example, use a preset of font configurations for the purposes of a
    "presentation" while the other has a "small" setup.  Concretely,
    invoke the commands `fontaine-set-preset` and `fontaine-set-face-font`
    with a universal prefix argument (`C-u`).  Without a prefix argument,
    these commands apply to all frames (as it was before).

-   The `fontaine-presets` accepts a special `t` preset which provides
    "shared fallback values" for all presets.  The manual has a section
    titled "Shared and implicit fallback values for presets" which covers
    all permutations of `fontaine-presets` at length.  The gist is that
    the user can write more concise presets.  Thanks to Ted Reed for
    proposing the idea and testing my prototype in the mailing list:
    <https://lists.sr.ht/~protesilaos/fontaine/%3C87y1zcmo67.fsf@zenithia.net%3E>.

-   Simplified the sample configuration on how to restore the latest saved
    value or fall back to a preferred preset.  Thanks to Christopher
    League for proposing an elegant expression over at the mailing list:
    <https://lists.sr.ht/~protesilaos/fontaine/%3C87sfpop0dm.fsf@contrapunctus.net%3E#%3C87pmksoyv6.fsf@contrapunctus.net%3E>

-   The `fontaine-latest-state-file` is now handled by the package
    `no-littering`.  Thanks to Christopher League for adding it there:
    <https://github.com/emacscollective/no-littering/commit/76b7335202a5b6ddc6b6798a2e2fd5b09df57dc2>

-   The new user option `fontaine-font-families` specifies the preferred
    font families that are provided as completion candidates of the
    command `fontaine-set-face-font`.  If left to its default nil value,
    Fontaine tries to find relevant fonts from the underlying system,
    though this is not always accurate depending on the build of Emacs and
    where it runs in.

-   The doc string of `fontaine-presets` mentions some important caveats
    or information about font settings in emacs.  Thanks to Eli Zaretskii
    for the feedback on the emacs-devel mailing list:
    <https://lists.gnu.org/archive/html/emacs-devel/2022-04/msg01281.html>.
