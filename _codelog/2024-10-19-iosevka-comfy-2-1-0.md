---
title: "Iosevka Comfy version 2.1.0"
excerpt: "Release notes for the latest tagged release of my bespoke derivative of the Iosevka font project."
---

_Iosevka Comfy_ is a customised build of the Iosevka typeface, with a
consistent rounded style and overrides for almost all individual
glyphs in both roman (upright) and italic (slanted) variants.  Many
font families are available, covering a broad range of typographic
weights.  The README file in the git repository covers all the
technicalities.

+ Git repositories:
  + GitHub: <https://github.com/protesilaos/iosevka-comfy>
  + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Backronym: Iosevka ... Could Only Modify a Font, Yes.

Below are the release notes.

* * *

## Update to Iosevka Comfy version 2.1.0 (on top of Iosevka 31.9.1)

This is a small release that fixes a detail in the `m` character of
all the "motion" variants. It now has a tail at the bottom right
corner in addition to the top left serif. This is the same design used
wherever relevant, such as in the `n` and `u` glyphs.

Other than that, the rebuild is an attempt to fix the broken files
that appear on NixOS, as reported by Damien Cassou in issue 17:
<https://github.com/protesilaos/iosevka-comfy/issues/17>. I do not
know if this fixes the problem, but I cannot think of a better
approach. This is not reproducible on my end (Debian stable).

## All the variants

A quick reminder of all the Iosevka Comfy variants:

```
| Family                          | Shapes | Spacing | Style      | Ligatures |
|---------------------------------+--------+---------+------------+-----------|
| Iosevka Comfy                   | Sans   | Compact | Monospaced | Yes       |
| Iosevka Comfy Duo               | Sans   | Compact | Duospaced  | Yes       |
| Iosevka Comfy Fixed             | Sans   | Compact | Monospaced | No        |
|---------------------------------+--------+---------+------------+-----------|
| Iosevka Comfy Motion            | Slab   | Compact | Monospaced | Yes       |
| Iosevka Comfy Motion Duo        | Slab   | Compact | Duospaced  | Yes       |
| Iosevka Comfy Motion Fixed      | Slab   | Compact | Monospaced | No        |
|---------------------------------+--------+---------+------------+-----------|
| Iosevka Comfy Wide              | Sans   | Wide    | Monospaced | Yes       |
| Iosevka Comfy Wide Duo          | Sans   | Wide    | Duospaced  | Yes       |
| Iosevka Comfy Wide Fixed        | Sans   | Wide    | Monospaced | No        |
|---------------------------------+--------+---------+------------+-----------|
| Iosevka Comfy Wide Motion       | Slab   | Wide    | Monospaced | Yes       |
| Iosevka Comfy Wide Motion Duo   | Slab   | Wide    | Duospaced  | Yes       |
| Iosevka Comfy Wide Motion Fixed | Slab   | Wide    | Monospaced | No        |
```

Below are the updated screenshots (click to enlarge).

<a href="{{'/assets/images/iosevka-comfy/iosevka-comfy.png' | absolute_url }}"><img alt="iosevka-comfy" src="{{'/assets/images/iosevka-comfy/iosevka-comfy.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/iosevka-comfy/iosevka-comfy-duo.png' | absolute_url }}"><img alt="iosevka-comfy duo" src="{{'/assets/images/iosevka-comfy/iosevka-comfy-duo.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/iosevka-comfy/iosevka-comfy-fixed.png' | absolute_url }}"><img alt="iosevka-comfy fixed" src="{{'/assets/images/iosevka-comfy/iosevka-comfy-fixed.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/iosevka-comfy/iosevka-comfy-motion.png' | absolute_url }}"><img alt="iosevka-comfy-motion" src="{{'/assets/images/iosevka-comfy/iosevka-comfy-motion.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/iosevka-comfy/iosevka-comfy-motion-duo.png' | absolute_url }}"><img alt="iosevka-comfy-motion-duo" src="{{'/assets/images/iosevka-comfy/iosevka-comfy-motion-duo.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide.png' | absolute_url }}"><img alt="iosevka-comfy-wide" src="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide-duo.png' | absolute_url }}"><img alt="iosevka-comfy-wide duo" src="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide-duo.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide-fixed.png' | absolute_url }}"><img alt="iosevka-comfy-wide fixed" src="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide-fixed.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide-motion.png' | absolute_url }}"><img alt="iosevka-comfy-wide-motion" src="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide-motion.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide-motion-duo.png' | absolute_url }}"><img alt="iosevka-comfy-wide-motion-duo" src="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide-motion-duo.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide-motion-fixed.png' | absolute_url }}"><img alt="iosevka-comfy-wide-motion-fixed" src="{{'/assets/images/iosevka-comfy/iosevka-comfy-wide-motion-fixed.png' | absolute_url }}"/></a>
