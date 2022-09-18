---
title: "Refinements to ef-themes deuteranopia regexp colours"
excerpt: "Report on the improvements I made to the colours used for regexp groups in ef-deuteranopia-dark, ef-deuteranopia-light."
---

I have made refinements to the colours that are used for regexp groups
in the `ef-deuteranopia-dark` and `ef-deuteranopia-light` themes.  As
their name suggests, these themes are optimised for users with red-green
colour deficiency.  Normally, I would only report this in the change
log, but I need to show pictures in order to communicate the subtlety of
this effect.

## Screen shot and simulation in the GNU IMP

The first picture is taken directly from my Emacs, while the second is
done in the GNU Image Manipulation Program to simulate how a person with
deuteranopia will discern those patterns.

[ Click to enlarge the image, as the smaller size may distort the
  perception of colours. ]

<a href="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-light-regexp.png' | absolute_url}}"><img alt="ef-deuteranopia-light theme regexp groups sample" src="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-light-regexp.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-light-regexp-simulation.png' | absolute_url}}"><img alt="ef-deuteranopia-light theme regexp simulation groups sample" src="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-light-regexp-simulation.png' | absolute_url }}"/></a>


<a href="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-dark-regexp.png' | absolute_url}}"><img alt="ef-deuteranopia-dark theme regexp groups sample" src="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-dark-regexp.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-dark-regexp-simulation.png' | absolute_url}}"><img alt="ef-deuteranopia-dark theme regexp simulation groups sample" src="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-dark-regexp-simulation.png' | absolute_url }}"/></a>

## Comparison to ef-light, ef-dark

Just a sample with a couple of other themes from the collection (it
includes 14 in total, as of this writing).

### ef-light and ef-deuteranopia-light

<a href="{{'/assets/images/attachments/2022-09-18-ef-light-regexp.png' | absolute_url}}"><img alt="ef-light theme regexp groups sample" src="{{'/assets/images/attachments/2022-09-18-ef-light-regexp.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-light-regexp.png' | absolute_url}}"><img alt="ef-deuteranopia-light theme regexp groups sample" src="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-light-regexp.png' | absolute_url }}"/></a>

### ef-dark and ef-deuteranopia-dark

<a href="{{'/assets/images/attachments/2022-09-18-ef-dark-regexp.png' | absolute_url}}"><img alt="ef-dark theme regexp groups sample" src="{{'/assets/images/attachments/2022-09-18-ef-dark-regexp.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-dark-regexp.png' | absolute_url}}"><img alt="ef-deuteranopia-dark theme regexp groups sample" src="{{'/assets/images/attachments/2022-09-18-ef-deuteranopia-dark-regexp.png' | absolute_url }}"/></a>

## Coming in version 0.6.0 (next stable release)

These are still in development.  I might make some further tweaks,
though the general direction is determined.  Expect everything to be
available via GNU ELPA in the coming days.

+ Package name (GNU ELPA): `ef-themes`
+ Official manual: <https://protesilaos.com/emacs/ef-themes>
+ Change log: <https://protesilaos.com/emacs/ef-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/ef-themes-pictures>
+ Git repo on SourceHut: <https://git.sr.ht/~protesilaos/ef-themes>
  - Mirrors:
    + GitHub: <https://github.com/protesilaos/ef-themes>
    + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Mailing list: <https://lists.sr.ht/~protesilaos/ef-themes>

