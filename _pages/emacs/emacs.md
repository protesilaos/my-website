---
title: 'My packages and/or custom code for GNU Emacs'
excerpt: 'List of all my packages and/or custom code for GNU Emacs'
permalink: /emacs/
---

## Modus themes

Highly accessible themes, conforming with the highest standard for
colour contrast between background and foreground values (WCAG AAA).
They also are optimised for users with red-green or blue-yellow colour
deficiency.

The themes are very customisable and provide support for a wide range
of packages.  Their manual is detailed so that new users can get
started, while it also provides custom code for all sorts of more
advanced customisations.

Since August 2020, the original Modus themes (`modus-operandi`,
`modus-vivendi`) are built into Emacs version 28 or higher. Emacs 28
ships with `modus-themes` version `1.6.0`. Emacs 29 includes version
`3.0.0`. Emacs 30 provides version `4.4.0`. Version 4 is a major
refactoring of how the themes are implemented and customized. Such
major versions are not backward-compatible due to the limited
resources at my disposal to support multiple versions of Emacs and of
the themes across the years.

+ Package name (GNU ELPA): `modus-themes`
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/modus-themes>
  + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes.

## Ef (εὖ) themes

The `ef-themes` are a collection of light and dark themes for GNU
Emacs that provide colourful ("pretty") yet legible options for users
who want something with a bit more flair than the `modus-themes` (also
designed by me).

+ Package name (GNU ELPA): `ef-themes`
+ Official manual: <https://protesilaos.com/emacs/ef-themes>
+ Change log: <https://protesilaos.com/emacs/ef-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/ef-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/ef-themes>
  + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Backronym: Eclectic Fashion in Themes Hides Exaggerated Markings,
  Embellishments, and Sparkles.

## Denote

Denote is a simple note-taking tool for Emacs.  It is based on the idea
that notes should follow a predictable and descriptive file-naming
scheme.  The file name must offer a clear indication of what the note is
about, without reference to any other metadata.  Denote basically
streamlines the creation of such files while providing facilities to
link between them.

Denote's file-naming scheme is not limited to "notes".  It can be used
for all types of file, including those that are not editable in Emacs,
such as videos.  Naming files in a consistent way makes their
filtering and retrieval considerably easier.  Denote provides relevant
facilities to rename files, regardless of file type.

+ Package name (GNU ELPA): `denote`
+ Official manual: <https://protesilaos.com/emacs/denote>
+ Change log: <https://protesilaos.com/emacs/denote-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/denote>
  + GitLab: <https://gitlab.com/protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.

## Consult-Denote

Glue code to integrate my `denote` package with Daniel Mendler's
`consult`. The idea is to enhance minibuffer interactions, such as by
providing a preview of the file-to-linked/opened and by adding more
sources to the `consult-buffer` command.

+ Package name (GNU ELPA): `consult-denote`
+ Official manual: <https://protesilaos.com/emacs/consult-denote>
+ Change log: <https://protesilaos.com/emacs/consult-denote-changelog>
+ Git repository: <https://github.com/protesilaos/consult-denote>
+ Backronym: Consult-Orchestrated Navigation and Selection of
  Unambiguous Targets...denote.

## Denote Sequence (Sequence notes or Folgezettel with Denote)

The `denote-sequence` package provides an optional extension to
~denote~ for naming files with a sequencing scheme. The idea is to
establish hiearchical relationships between files, such that the
contents of one logically follow or complement those of another.

+ Package name (GNU ELPA): `denote-sequence` (⚠️ Not available yet)
+ Official manual: <https://protesilaos.com/emacs/denote-sequence>
+ Git repository: <https://github.com/protesilaos/denote-sequence>
+ Backronym: Denote... Sequences Efficiently Queue Unsorted Entries
  Notwithstanding Curation Efforts.

## Theme buffet

The `theme-buffet` package arranges to automatically change themes
during specific times of the day or at fixed intervals. The collection
of themes is customisable, with the default options covering the
built-in Emacs themes as well as my `modus-themes` and `ef-themes`.

Bruno Boal is the lead developer and I am a co-maintainer.

+ Package name (GNU ELPA): `theme-buffet`
+ Git repo on SourceHut: <https://git.sr.ht/~bboal/theme-buffet>
  - Mirrors:
    + GitHub: <https://github.com/BBoal/theme-buffet>
    + Codeberg: <https://codeberg.org/BBoal/theme-buffet>
+ Mailing list: <https://lists.sr.ht/~bboal/general-issues>
+ Backronym: Themes Harmoniously Exchanged Mid Evening Beget
  Understandable Feelings of Fascination, Excitement, and Thrill.

## Beframe

`beframe` enables a frame-oriented Emacs workflow where each frame has
access only to the list of buffers visited therein.  In the interest of
brevity, we call buffers that belong to frames "beframed".

+ Package name (GNU ELPA): `beframe`
+ Official manual: <https://protesilaos.com/emacs/beframe>
+ Change log: <https://protesilaos.com/emacs/beframe-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/beframe>
  + GitLab: <https://gitlab.com/protesilaos/beframe>
+ Video demo: <https://protesilaos.com/codelog/2023-02-28-emacs-beframe-demo/>
+ Backronym: Buffers Encapsulated in Frames Realise Advanced
  Management of Emacs.

## Fontaine

Fontaine allows the user to define detailed font configurations and set
them on demand.  For example, one can have a `regular-editing` preset
and another for `presentation-mode` (these are arbitrary, user-defined
symbols): the former uses small fonts which are optimised for writing,
while the latter applies typefaces that are pleasant to read at
comfortable point sizes.

+ Package name (GNU ELPA): `fontaine`
+ Official manual: <https://protesilaos.com/emacs/fontaine>
+ Change log: <https://protesilaos.com/emacs/fontaine-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/fontaine>
  + GitLab: <https://gitlab.com/protesilaos/fontaine>
+ Backronym: Fonts, Ornaments, and Neat Typography Are Irrelevant in Non-graphical Emacs.

## spacious-padding

This package provides a global minor mode to increase the
spacing/padding of Emacs windows and frames.  The idea is to make
editing and reading feel more comfortable.  Enable the mode with `M-x
spacious-padding-mode`.  Adjust the exact spacing values by modifying
the user option `spacious-padding-widths`.

Inspiration for this package comes from [Nicolas Rougier's impressive
designs](https://github.com/rougier) and [Daniel Mendler's
`org-modern` package](https://github.com/minad/org-modern).

+ Package name (GNU ELPA): `spacious-padding`
+ Official manual: <https://protesilaos.com/emacs/spacious-padding>
+ Change log: <https://protesilaos.com/emacs/spacious-padding>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/spacious-padding>
  + GitLab: <https://gitlab.com/protesilaos/spacious-padding>
+ Sample images:
  - <https://protesilaos.com/codelog/2023-06-03-emacs-spacious-padding/>
  - <https://protesilaos.com/codelog/2023-11-15-spacious-padding-extra-ui-dev/>
+ Backronyms: Space Perception Adjusted Consistently Impacts Overall
  Usability State ... padding; Spacious ... Precise Adjustments to
  Desktop Divider Internals Neatly Generated.

## Substitute

Efficiently replace targets in the buffer or context.

Substitute is a set of commands that perform text replacement (i)
throughout the buffer, (ii) limited to the current definition (per
`narrow-to-defun`), (iii) from point to the end of the buffer, and
(iv) from point to the beginning of the buffer.

These substitutions are meant to be as quick as possible and, as such,
differ from the standard `query-replace` (which I still use when
necessary). The provided commands prompt for substitute text and
perform the substitution outright, without moving the point.

+ Package name (GNU ELPA): `substitute`
+ Official manual: <https://protesilaos.com/emacs/substitute>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/substitute>
  + GitLab: <https://gitlab.com/protesilaos/substitute>
+ Video demo: <https://protesilaos.com/codelog/2023-01-16-emacs-substitute-package-demo/>
+ Backronym: Some Utilities Built to Substitute Targets Independent of
  Their Utterances, Thoroughly and Easily.

## Minibuffer Confines Transcended (mct.el)

Enhancements for the default minibuffer completion UI of Emacs.  In
essence, MCT is (i) a very thin layer of interactivity on top of the
out-of-the-box completion experience, and (ii) glue code that combines
built-in functionalities to make the default completion framework work
like that of more featureful third-party options.

+ Package name (GNU ELPA): `mct`
+ Official manual: <https://protesilaos.com/emacs/mct>
+ Change log: <https://protesilaos.com/emacs/mct-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/mct>
  + GitLab: <https://gitlab.com/protesilaos/mct>
+ Video demo: <https://protesilaos.com/codelog/2021-10-22-emacs-mct-demo/>
+ Backronym: Minibuffer Confines Transcended; Minibuffer and
  Completions in Tandem.

## TMR

TMR is an Emacs package that provides facilities for setting timers
using a convenient notation.  Lots of commands are available to operate
on timers, while there also exists a tabulated view to display all
timers in a nice grid.

+ Package name (GNU ELPA): `tmr`
+ Official manual: <https://protesilaos.com/emacs/tmr>
+ Change log: <https://protesilaos.com/emacs/tmr-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/tmr>
  + GitLab: <https://gitlab.com/protesilaos/tmr>
+ Backronym: TMR May Ring; Timer Must Run.

## aLtCaPs

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

## show-font

This package lets you preview a font inside of Emacs. It does so in
three ways:

- Prompt for a font on the system and display it in a buffer.
- List all known fonts in a buffer, with a short preview for each.
- Provide a major mode to preview a font whose file is among the
  installed ones.

Check out its sources:

+ Package name (GNU ELPA): `show-font`
+ Official manual: <https://protesilaos.com/emacs/show-font>
+ Change log: <https://protesilaos.com/emacs/show-font-changelog>
+ Git repository: <https://github.com/protesilaos/show-font>
+ Sample pictures: <https://protesilaos.com/codelog/2024-09-10-emacs-show-font-0-1-0/>
+ Backronym: Should Highlight Only With the Family Of the Named Typeface.

## sxhkdrc-mode

This is a major mode for editing `sxhkdrc` files. SXHKD is the Simple
X Hot Key Daemon which is commonly used in minimalist desktop sessions
on Xorg (I use it with bspwm, herbstluftwm, and i3wm). The `sxhkdrc`
file configures key chords, binding them to commands. For the
technicalities, read the man page `sxhkd(1)`.

+ Package name (GNU ELPA): `sxhkdrc-mode`
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/sxhkdrc-mode>
  + GitLab: <https://gitlab.com/protesilaos/sxhkdrc-mode>
+ Backronym: Such Xenotropic Hot Keys Demonstrate Robustness and
  Configurability ... mode.

## Logos

This package provides a simple approach to setting up a "focus mode".
It uses the `page-delimiter` (typically `^L`) or the outline together
with some commands to move between pages whether narrowing is in effect
or not.  It also provides some optional aesthetic tweaks which come into
effect when the buffer-local `logos-focus-mode` is enabled.  The manual
shows how to extend the code to achieve the desired result.

(all my videos since early 2022 use `logos`).

+ Package name (GNU ELPA): `logos`
+ Official manual: <https://protesilaos.com/emacs/logos>
+ Change log: <https://protesilaos.com/emacs/logos-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/logos>
  + GitLab: <https://gitlab.com/protesilaos/logos>
+ Video demo: <https://protesilaos.com/codelog/2022-03-11-emacs-logos-demo/>
+ Backronyms: `^L` Only Generates Ostensible Slides; Logos Optionally Goes through Outline Sections.

## Pulsar

This is a small package that temporarily highlights the current line
or region after a given function is invoked. Several user options
control the exact behaviour. [Watch the original demo](https://protesilaos.com/codelog/2022-03-14-emacs-pulsar-demo/).

+ Package name (GNU ELPA): `pulsar`
+ Official manual: <https://protesilaos.com/emacs/pulsar>
+ Change log: <https://protesilaos.com/emacs/pulsar-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/pulsar>
  + GitLab: <https://gitlab.com/protesilaos/pulsar>
+ Backronym: Pulsar Unquestionably Luminates, Strictly Absent the Radiation.

## Lin

Lin is a stylistic enhancement for Emacs' built-in `hl-line-mode`.  It
remaps the `hl-line` face (or equivalent) buffer-locally to a style that
is optimal for major modes where line selection is the primary mode of
interaction.

The idea is that `hl-line-mode` cannot work equally well for contexts
with competing priorities: (i) line selection, or (ii) simple line
highlight.  In the former case, the current line needs to be made
prominent because it carries a specific meaning of some significance in
the given context: the user has to select a line.  Whereas in the latter
case, the primary mode of interaction does not revolve around the line
highlight itself: it may be because the focus is on editing text or
reading through the buffer's contents, so the current line highlight is
more of a reminder of the point's location on the vertical axis.

+ Package name (GNU ELPA): `lin`
+ Official manual: <https://protesilaos.com/emacs/lin>
+ Change log: <https://protesilaos.com/emacs/lin-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/lin>
  + GitLab: <https://gitlab.com/protesilaos/lin>
+ Backronym: LIN Is Noticeable.

## Cursory

Cursory provides a thin wrapper around built-in variables that affect
the style of the Emacs cursor on graphical terminals.  The intent is
to allow the user to define preset configurations such as "block with
slow blinking" or "bar with fast blinking" and set them on demand.
The use-case for such presets is to adapt to evolving interface
requirements and concomitant levels of expected comfort, such as in
the difference between writing and reading.

+ Package name (GNU ELPA): `cursory`
+ Official manual: <https://protesilaos.com/emacs/cursory>
+ Change log: <https://protesilaos.com/emacs/cursory-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/cursory>
  + GitLab: <https://gitlab.com/protesilaos/cursory>
+ Backronym: Cursor Usability Requires Styles Objectively Rated Yearlong.

## Notmuch Indicator

This is a simple package that renders an indicator with an email count
of the `notmuch` index on the Emacs mode line.  The underlying mechanism
is that of `notmuch-count(1)`, which is used to find the number of items
that match the given search terms.  In practice, the user can define one
or more searches and display their counters.  These form a listing which
realistically is like: `@50 😱1000 💕0` for unread messages, bills, and
love letters, respectively.

+ Package name (GNU ELPA): `notmuch-indicator`
+ Official manual: <https://protesilaos.com/emacs/notmuch-indicator>
+ Change log: <https://protesilaos.com/emacs/notmuch-indicator-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/notmuch-indicator>
  + GitLab: <https://gitlab.com/protesilaos/notmuch-indicator>
+ Backronym: notmuch-... Interested in Notmuch Data Indicators that
  Count Any Terms Ordinarily Requested.

## Dired Preview

This is a simple and robust package to automatically preview in a side
window the file at point in Dired buffers.  Preview windows are closed
when they are no longer relevant, while preview buffers are killed if
they have not been used for other purposes beside previewing.  The
package provides several customisation options to control its
behaviour.

+ Package name (GNU ELPA): `dired-preview`
+ Official manual: <https://protesilaos.com/emacs/dired-preview>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/dired-preview>
  + GitLab: <https://gitlab.com/protesilaos/dired-preview>
+ Backronym: Directories Invariably Render Everything Decently; PDFs
  Require Extra Viewing Instructions for Emacs to Work.

## Standard themes

The `standard-themes` are a collection of light and dark themes for
GNU Emacs. The `standard-light` and `standard-dark` emulate the
out-of-the-box looks of Emacs (which technically do NOT constitute a
theme) while bringing to them thematic consistency, customizability,
and extensibility. Other themes are stylistic variations of those.

In practice, the Standard themes take the default style of the
font-lock and Org faces, complement it with a wider and harmonious
colour palette, address many inconsistencies, and apply established
semantic patterns across all interfaces by supporting a large number
of packages.

+ Package name (GNU ELPA): `standard-themes`
+ Official manual: <https://protesilaos.com/emacs/standard-themes>
+ Change log: <https://protesilaos.com/emacs/standard-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/standard-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/standard-themes>
  + GitLab: <https://gitlab.com/protesilaos/standard-themes>
+ Backronym: Standard Themes Are Not Derivatives but the
  Affectionately Reimagined Default ... themes.

## The official Emacs TUTORIAL in Greek

I am the author and maintainer of the `TUTORIAL.el_GR` file that is
part of Emacs 29 since 2022-05-08. You can find it in the Emacs source
code inside the `etc/tutorials/` directory. If you report a bug about
it with `M-x report-emacs-bug`, consider adding me in carbon copy
(Cc). The `etc/tutorials/TUTORIAL.translators` file mentions the email
address you should use.

## Dotemacs

My personal Emacs configuration.  It is comprehensive, both in terms of
the [custom] code it contains as well as the documentation on what each
piece of functionality does.

+ Website: <https://protesilaos.com/emacs/dotemacs>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/dotfiles>
  + GitLab: <https://gitlab.com/protesilaos/dotfiles>
+ Video demo: <https://protesilaos.com/codelog/2023-12-18-emacs-org-advanced-literate-conf/>
+ Backronym: Do Observe, Transpose, Examine, or Mirror All
  Configurations, Stranger (dotemacs); Dotfiles Operate Transparently
  For the Included Linux and Emacs Setups (dotfiles).

## Aporetic

[ _Aporetic_ is the successor to my _Iosevka Comfy_, mainly because
  "Iosevka" is a reserved name, but also to simplify the overall
  project: <https://github.com/protesilaos/iosevka-comfy>. ]

This is not an "Emacs package" per se though I use it full time in my
Emacs setup (it complements my work on Emacs themes and `fontaine`, for
example).

Customised build of the Iosevka typeface, with a consistent rounded
style and overrides for almost all individual glyphs in both roman
(upright) and italic (slanted) variants.

+ Git repository: <https://github.com/protesilaos/aporetic>.
+ Sample pictures: <https://protesilaos.com/emacs/aporetic-fonts-pictures>
+ Backronym: Aporetic's Predecessor Objects' Reserved Eponym Truly Included "Comfy".

## Iosevka Comfy

[ As of 2025-02-04, the Iosevka Comfy project is discontinued. The
  main reason is that "Iosevka" is a reserved name. See my Aporetic
  fonts instead. ]

This is not an "Emacs package" per se though I use it full time in my
Emacs setup (it complements my work on Emacs themes and `fontaine`, for
example).

_Iosevka Comfy_ is a customised build of the Iosevka typeface, with a
consistent rounded style and overrides for almost all individual
glyphs in both roman (upright) and italic (slanted) variants.  Many
font families are available, covering a broad range of typographic
weights.  The README file in the git repository covers all the
technicalities.

+ Git repositories:
  + GitHub: <https://github.com/protesilaos/iosevka-comfy>
  + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Sample pictures: <https://protesilaos.com/emacs/iosevka-comfy-pictures>
+ Backronym: Iosevka ... Could Only Modify a Font, Yes.

## Mandoura

⚠️ WORK-IN-PROGRESS

Use MPV to play media files via Dired.

The name of this package is a reference to a Greek musical instrument
from the island of Crete.  Though according to the Oracle of Delphi,
it is a cryptic message for future generations: "MPV Access Needs
Dired to Output User's Requested Audio".

+ Package name (GNU ELPA): `mandoura` (⛔ not available yet)
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/mandoura>
  + GitLab: <https://gitlab.com/protesilaos/mandoura>
+ Backronym: MPV Access Needs Dired to Output User's Requested Audio.

## Research (research.el)

⚠️ WORK-IN-PROGRESS

Run shell searches and store them reproducibly in buffers.

The goal of `research.el` ("re-search" is a shorthand for "repeatable
search") is to provide a thin wrapper for shell invocations that
search for file names or file contents.  The output is stored in an
Emacs buffer which retains the parameters that generated it.  This
buffer can then repeat the command that created it by means of
`revert-buffer` (bound to `g` by default).  File paths are
automatically buttonised so that they can be used as links to the file
they reference.

RESEARCH provides the means to write the Emacs Lisp that wraps around
the desired shell invocation.  We call the resulting commands and the
buffers they generate "re-searchable".

+ Package name (GNU ELPA): `research` (⛔ not available yet)
+ Official manual: <https://protesilaos.com/emacs/research>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/research>
  + GitLab: <https://gitlab.com/protesilaos/research>
+ Backronym: Repeat Ephemeral Searches in Emacs via Access to
  Reproducible Command Hubs.

## Agitate (experimental)

Agitate is a collection of commands or potentially useful functions
that expand on the available version control features of Emacs.  Those
are meant to complement a workflow that relies on the built-in Version
Control framework and its accoutrements (`diff-mode.el`,
`log-view.el`, `log-edit.el`, `vc-git.el`, and potentially others).

+ Package name (GNU ELPA): `agitate`
+ Official manual: <https://protesilaos.com/emacs/agitate>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/agitate>
  + GitLab: <https://gitlab.com/protesilaos/agitate>
+ Backronym: Another Git Interface Trying to Agitate Tranquil Emacsers.

## Custom Emacs build for Arch Linux (PKGBUILD)

This is just like every other package recipe for Arch.  We provide a
PKGBUILD and then `pacman` does the rest.  The project's README file
describes the procedure. ⛔ For experts only!

+ Git repositories:
  + GitHub: <https://github.com/protesilaos/emacs-arch-linux-pkgbuild>
  + GitLab: <https://gitlab.com/protesilaos/emacs-arch-linux-pkgbuild>
+ Backronym for "PKGBUILD ... of Emacs": Package Knowhow Germane to
  Building Unapologetically Individuated Local Design ... of Emacs.

* * *

For more on my Emacs-related contributions, check my [coding
blog](https://protesilaos.com/codelog) which includes lots of videos and
written publications on the topic.
