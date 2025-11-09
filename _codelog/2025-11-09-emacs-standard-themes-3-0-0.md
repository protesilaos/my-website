---
title: "Emacs: 'standard-themes' version 3.0.0"
excerpt: "Release notes for the latest version of my 'standard-themes' for GNU Emacs."
---

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

Below are the release notes.

* * *


## Version 3.0.0 on 2025-11-09

This major version makes Standard build on top of my Modus themes. The
latter provides extensive face/package coverage and a wide range of
customisation options. As a result, the Standard themes retain their
design while giving more control to the user.

These release notes are essentially the same as what I wrote earlier
today for my `ef-themes` package, which is now also built on top of my
Modus themes: <https://protesilaos.com/codelog/2025-11-09-emacs-ef-themes-2-0-0/>.

In short:

-   User options that were provided by the Standard themes are now mere
    aliases for their Modus counterparts.
-   Commands that were defined by the Standard themes are now reduced to
    convenience wrappers that build on top of Modus.
-   The new minor mode `standard-themes-take-over-modus-themes-mode` can
    be enabled to make all Modus commands that load a theme only
    consider the Standard themes. This is effectively the opposite of
    enabling the `modus-themes-include-derivatives-mode` or using one of
    the Standard commands to load just a Standard theme (like
    `standard-themes-rotate`).
-   The manual of the Modus themes covers everything from the basics to
    advanced topics on how to use and customise the themes. Evaluate
    `(info "(modus-themes) Top")` or visit <https://protesilaos.com/emacs/modus-themes>.

You are welcome to contact me if something is unclear.
