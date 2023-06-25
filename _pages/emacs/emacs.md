---
title: 'My packages and/or custom code for GNU Emacs'
excerpt: 'List of all my packages and/or custom code for GNU Emacs'
permalink: /emacs/
---

## Modus themes

Highly accessible themes, conforming with the highest standard for
colour contrast between background and foreground values (WCAG AAA).
They also are optimised for users with red-green colour deficiency.

The themes are very customisable and provide support for a wide range
of packages.  Their manual is detailed so that new users can get
started, while it also provides custom code for all sorts of more
advanced customisations.

Since August 2020, the original Modus themes (`modus-operandi`,
`modus-vivendi`) are built into Emacs version 28 or higher.  Emacs 28
ships with `modus-themes` version `1.6.0`.  Emacs 29 includes version
`3.0.0`.  Emacs 30 provides a newer, refactored version that
thoroughly refashions how the themes are implemented and customized.
Such major versions are not backward-compatible due to the limited
resources at my disposal to support multiple versions of Emacs and of
the themes across the years.

+ Package name (GNU ELPA): `modus-themes`
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/modus-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/modus-themes>
    + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes

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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/denote>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/denote>
    + GitLab: <https://gitlab.com/protesilaos/denote>
+ Mailing list: <https://lists.sr.ht/~protesilaos/denote>
+ Video demo: <https://protesilaos.com/codelog/2022-06-18-denote-demo/>
+ Backronyms: Denote Everything Neatly; Omit The Excesses.  Don't Ever
  Note Only The Epiphenomenal.

## Ef (εὖ) themes

The `ef-themes` are a collection of light and dark themes for GNU
Emacs that provide colourful ("pretty") yet legible options for users
who want something with a bit more flair than the `modus-themes` (also
designed by me).

+ Package name (GNU ELPA): `ef-themes`
+ Official manual: <https://protesilaos.com/emacs/ef-themes>
+ Change log: <https://protesilaos.com/emacs/ef-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/ef-themes-pictures>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/ef-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/ef-themes>
    + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/ef-themes>
+ Backronym: Eclectic Fashion in Themes Hides Exaggerated Markings,
  Embellishments, and Sparkles.

## Beframe

`beframe` enables a frame-oriented Emacs workflow where each frame has
access to the list of buffers visited therein.  In the interest of
brevity, we call buffers that belong to frames "beframed".

+ Package name (GNU ELPA): `beframe`
+ Official manual: <https://protesilaos.com/emacs/beframe>
+ Change log: <https://protesilaos.com/emacs/beframe-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/beframe>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/beframe>
    + GitLab: <https://gitlab.com/protesilaos/beframe>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/fontaine>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/fontaine>
    + GitLab: <https://gitlab.com/protesilaos/fontaine>
+ Mailing list: <https://lists.sr.ht/~protesilaos/fontaine>
+ Backronym: Fonts, Ornaments, and Neat Typography Are Irrelevant in Non-graphical Emacs

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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/spacious-padding>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/spacious-padding>
    + GitLab: <https://gitlab.com/protesilaos/spacious-padding>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
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
differ from the standard `query-replace` (which I still use).  The
provided commands prompt for substitute text and perform the
substitution outright.

+ Package name (GNU ELPA): `substitute`
+ Official manual: <https://protesilaos.com/emacs/substitute>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/substitute>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/substitute>
    + GitLab: <https://gitlab.com/protesilaos/substitute>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/mct>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/mct>
    + GitLab: <https://gitlab.com/protesilaos/mct>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/tmr>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/tmr>
    + GitLab: <https://gitlab.com/protesilaos/tmr>
+ Mailing list: <https://lists.sr.ht/~protesilaos/tmr>
+ Backronym: TMR May Ring; Timer Must Run

## aLtCaPs

Transform words to alternating letter casing in order to convey
sarcasm or mockery.  For example, convert `I respect the authorities`
to `i ReSpEcT tHe AuThOrItIeS`.

+ Package name (GNU ELPA): `altcaps`
+ Official manual: <https://protesilaos.com/emacs/altcaps>
+ Change log: <https://protesilaos.com/emacs/altcaps-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/altcaps>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/altcaps>
    + GitLab: <https://gitlab.com/protesilaos/altcaps>
+ Mailing list: <https://lists.sr.ht/~protesilaos/altcaps>
+ Backronyms: Alternating Letters Transform Casual Asides to Playful
  Statements.  ALTCAPS Lets Trolls Convert Aphorisms to Proper
  Shitposts.

## sxhkdrc-mode

This is a major mode for editing `sxhkdrc` files.  SXHKD is the Simple
X Hot Key Daemon which is commonly used in minimalist desktop sessions
on Xorg, such as with the Binary Space Partitioning Window Manager
(BSPWM).  The `sxhkdrc` file configures key chords, binding them to
commands.  For the technicalities, read the man page `sxhkd(1)`.

+ Package name (GNU ELPA): `sxhkdrc-mode`
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/sxhkdrc-mode>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/sxhkdrc-mode>
    + GitLab: <https://gitlab.com/protesilaos/sxhkdrc-mode>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/logos>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/logos>
    + GitLab: <https://gitlab.com/protesilaos/logos>
+ Mailing list: <https://lists.sr.ht/~protesilaos/logos>
+ Video demo: <https://protesilaos.com/codelog/2022-03-11-emacs-logos-demo/>
+ Backronyms: `^L` Only Generates Ostensible Slides; Logos Optionally Goes through Outline Sections

## Pulsar

This is a small package that temporarily highlights the current line
after a given function is invoked.  The affected functions are defined
in the user option `pulsar-pulse-functions`.  What Pulsar does is set up
an advice so that those functions run a hook after they are called.  The
pulse effect is added there (`pulsar-after-function-hook`).

+ Package name (GNU ELPA): `pulsar`
+ Official manual: <https://protesilaos.com/emacs/pulsar>
+ Change log: <https://protesilaos.com/emacs/pulsar-changelog>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/pulsar>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/pulsar>
    + GitLab: <https://gitlab.com/protesilaos/pulsar>
+ Mailing list: <https://lists.sr.ht/~protesilaos/pulsar>
+ Backronym: Pulsar Unquestionably Luminates, Strictly Absent the Radiation

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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/lin>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/lin>
    + GitLab: <https://gitlab.com/protesilaos/lin>
+ Mailing list: <https://lists.sr.ht/~protesilaos/lin>
+ Backronym: LIN Is Noticeable

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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/cursory>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/cursory>
    + GitLab: <https://gitlab.com/protesilaos/cursory>
+ Mailing list: <https://lists.sr.ht/~protesilaos/cursory>
+ Backronym: Cursor Usability Requires Styles Objectively Rated Yearlong

## Notmuch Indicator

This is a simple package that renders an indicator with an email count
of the `notmuch` index on the Emacs mode line.  The underlying mechanism
is that of `notmuch-count(1)`, which is used to find the number of items
that match the given search terms.  In practice, the user can define one
or more searches and display their counters.  These form a string which
realistically is like: `@50 😱1000 💕0` for unread messages, bills, and
love letters, respectively.

+ Package name (GNU ELPA): `notmuch-indicator`
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/notmuch-indicator>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/notmuch-indicator>
    + GitLab: <https://gitlab.com/protesilaos/notmuch-indicator>
+ Mailing list: <https://lists.sr.ht/~protesilaos/notmuch-indicator>
+ Backronym: notmuch-... Increasingly in Need of Displaying
  Inconsequential Counters Alongside Trivia that Obscure Reality.

## Dired Preview

This is a simple package to automatically preview in a side window the
file at point in Dired buffers.  Preview windows are closed when they
are no longer relevant, while preview buffers are killed if they have
not been used for other purposes beside previewing.  The package
provides several customisation options to control its behaviour.

+ Package name (GNU ELPA): `dired-preview` (⚠️ not available yet;
  public testing phase as of 2023-06-25)
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/dired-preview>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/dired-preview>
    + GitLab: <https://gitlab.com/protesilaos/dired-preview>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Backronym: Directories Invariably Render Everything Decently; PDFs
  Require Extra Viewing Instructions for Emacs to Work.

## Standard themes

The `standard-themes` are a pair of light and dark themes for GNU
Emacs.  They emulate the out-of-the-box looks of Emacs (which
technically do NOT constitute a theme) while bringing to them thematic
consistency, customizability, and extensibility.  In practice, the
Standard themes take the default style of the font-lock and Org faces,
complement it with a wider and hamronious colour palette, address many
inconsistencies, and apply established semantic patterns across all
interfaces by supporting a large number of packages.

+ Package name (GNU ELPA): `standard-themes`
+ Official manual: <https://protesilaos.com/emacs/standard-themes>
+ Change log: <https://protesilaos.com/emacs/standard-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/standard-themes-pictures>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/standard-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/standard-themes>
    + GitLab: <https://gitlab.com/protesilaos/standard-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/standard-themes>
+ Backronym: Standard Themes Are Not Derivatives but the
  Affectionately Reimagined Default ... themes.

## The official Emacs TUTORIAL in Greek

I am the author and maintainer of the `TUTORIAL.el_GR` file that is part
of Emacs 29 (current development target) since 2022-05-08.  You can find
it in the Emacs source code inside the `etc/tutorials/` directory.  If
you report a bug about it with `M-x report-emacs-bug`, consider adding
me in carbon copy (Cc).  The `etc/tutorials/TUTORIAL.translators` file
mentions the email address you should use.

## Dotemacs

My personal Emacs configuration.  It is comprehensive, both in terms of
the [custom] code it contains as well as the documentation on what each
piece of functionality does.

+ Website: <https://protesilaos.com/emacs/dotemacs>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/dotfiles>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/dotfiles>
    + GitLab: <https://gitlab.com/protesilaos/dotfiles>
+ Mailing list: <https://lists.sr.ht/~protesilaos/dotfiles>
+ Backronym: Do Observe, Transpose, Examine, or Mirror All
  Configurations, Stranger

## Iosevka Comfy

This is not an "Emacs package" per se though I use it full time in my
Emacs setup (it complements my work on the `modus-themes` and
`fontaine`).

_Iosevka Comfy_ is a build of the Iosevka typeface with a rounded style
and open shapes, adjusted metrics, and overrides for almost all
individual glyphs in both roman (upright) and italic (slanted) variants.
It is more vertically compact than the standard upstream configuration.
Glyphs are rounder and have tailed ends or serifs only when those are
required to both impose a predictable rhythm and keep characters
distinct from each other.

The README file in the git repository covers all the technicalities.

+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/iosevka-comfy>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/iosevka-comfy>
    + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Sample pictures: <https://protesilaos.com/emacs/iosevka-comfy-pictures>
+ Backronym: Iosevka ... Could Only Modify a Font, Yes

## Mandoura

⚠️ WORK-IN-PROGRESS

Use MPV to play media files via Dired.

The name of this package is a reference to a Greek musical instrument
from the island of Crete.  Though according to the Oracle of Delphi,
it is a cryptic message for future generations: "MPV Access Needs
Dired to Output User's Requested Audio".

+ Package name (GNU ELPA): `mandoura` (⛔ not available yet)
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/mandoura>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/mandoura>
    + GitLab: <https://gitlab.com/protesilaos/mandoura>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/research>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/research>
    + GitLab: <https://gitlab.com/protesilaos/research>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
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
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/agitate>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/agitate>
    + GitLab: <https://gitlab.com/protesilaos/agitate>
+ Mailing list: <https://lists.sr.ht/~protesilaos/agitate>
+ Backronym: Another Git Interface Trying to Agitate Tranquil Emacsers

## Custom Emacs build for Arch Linux

This is just like every other package recipe for Arch.  We provide a
PKGBUILD and then `pacman` does the rest.  The project's README file
describes the procedure. ⛔ For experts only!

+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/emacs-arch-linux-pkgbuild>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/emacs-arch-linux-pkgbuild>
    + GitLab: <https://gitlab.com/protesilaos/emacs-arch-linux-pkgbuild>
+ Mailing list: <https://lists.sr.ht/~protesilaos/general-issues>
+ Backronym for "PKGBUILD ... of Emacs": Package Knowhow Germane to
  Building Unapologetically Individuated Local Deployments ... of
  Emacs.

* * *

For more on my Emacs-related contributions, check my [coding
blog](https://protesilaos.com/codelog) which includes lots of videos and
written publications on the topic.
