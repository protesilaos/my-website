---
title: "Emacs live refining 'ef-themes' Diff/Magit colours at 2026-10-29 18:00 Europe/Athens"
excerpt: "I am doing a live stream where I will start the work of abstracting the Modus themes core into its own library."
layout: vlog
mediaid: "JnDcXPzFsfA"
---

[ The stream will be recorded. You can watch it later. ]

This is a spontaneous live stream that starts in ~10 minutes. I will
do some work on my `ef-themes` package for Emacs. I want to tweak the
color values of all themes in order to achieve inter-theme consistency
as I noticed some cases that are problematic.

I will keep the chat open, in case there are any questions related to
this or anything else---I always answer everything.

## About the `ef-themes`

The `ef-themes` are a collection of light and dark themes for GNU
Emacs that provide colourful ("pretty") yet legible options for users
who want something with a bit more flair than the `modus-themes` (also
designed by me).

Starting with version `2.0.0`, the `ef-themes` are built on top of the
`modus-themes`. This means that all customisation options of the Modus
themes apply to the Ef themes. Same for all Modus commands that load a
theme. Enable `ef-themes-take-over-modus-themes-mode` to set up this
arrangement (or enable `modus-themes-include-derivatives-mode` instead
to blend Ef and Modus into one collection).

+ Package name (GNU ELPA): `ef-themes`
+ Official manual: <https://protesilaos.com/emacs/ef-themes>
+ Change log: <https://protesilaos.com/emacs/ef-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/ef-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/ef-themes>
  + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Backronym: Eclectic Fashion in Themes Hides Exaggerated Markings,
  Embellishments, and Sparkles.
