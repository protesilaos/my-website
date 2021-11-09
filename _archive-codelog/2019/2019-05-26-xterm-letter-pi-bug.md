---
title: "Xterm's woes with Greek letter Pi and box-drawing"
subtitle: "The weirdest bug I have ever encountered"
excerpt: "Xterm cannot display the lowercase Greek letter Pi (π) when using most outline monospaced fonts. There is a solution though."
---

**UPDATE 2019-07-01:** I submitted a bug report.  [Details
here](https://protesilaos.com/codelog/2019-07-01-xterm-greek-pi-bug/).

**UPDATE 2019-06-01:** Upon further inspection, I am using the following
font-related settings, which address the issue discussed herein.  Some
typefaces might still have _minor_ issues with drawing boxes.

	! Font settings
	! The font settings address the issue discussed in this blog post:
	! https://protesilaos.com/codelog/2019-05-26-xterm-letter-pi-bug/
	xterm*faceName: Hack,DejaVu Sans Mono,Monospace
	xterm*faceSize: 9.5
	xterm*renderFont: true
	xterm*boldColors: false
	xterm*faceSize1: 8
	xterm*faceSize2: 12
	xterm*faceSize3: 15
	xterm*faceSize4: 18.25
	xterm*faceSize5: 20.5
	xterm*faceSize6: 25.5
	xterm*forceBoxChars: false
	xterm*limitFontsets: 3
	xterm*scaleHeight: 1.0

Original text below…

* * *

Given certain font configuration combinations, the current version of
Xterm on Debian 'buster' has problems displaying the lower case Greek
letter Pi (π).  The terminal will print that letter form as a fixed font
while keeping everything else as a proportional font.  The flow of text
breaks.

This behaviour is exhibited with a variety of typefaces (Debian package
in parentheses):

* Hack (fonts-hack)
* IBM Plex Mono (fonts-ibm-plex)
* Iosevka
* Monoid (fonts-monoid)
* Mononoki (fonts-mononoki)
* Source Code Pro
* Ubuntu Mono (fonts-ubuntu-console)

A workaround is to define awkard point sizes when using one of the
offending typefaces, such as `10.5`, while also tweaking the
`scaleHeight` property.  This, however, has an undesirable side effect:
it prevents tmux and other applications that draw boxes from creating
continuous lines for their borders.  Lines appear dashed and, depending
on the distance between the dashes (and point size), may exhibit a "halo
effect" around them.  Lines become blurry and outright annoying to stare
at.

DejaVu Sans Mono displays lower case Pi correctly at point size 10 (my
preferred choice), but has problems with drawing borders.  Box drawing
can be fixed by tweaking its `size` and the `scaleHeight` property.
However, that prevents it from properly drawing Pi.

The only font family that faces no such trade-off is Fira Code, aka
`fonts-firacode` (based on Fira Mono, which is not in the Debian
archives).  Fira {Code,Mono} prints minuscule Pi (π) in its proper form
and draws continuous lines as expected.

All of the above are based on the assumption that `forceBoxChars` is set
to `false`.  Otherwise none of the afore-mentioned typefaces can pass
the test.

Modifying the `fontconfig` rules for aliasing and hinting causes other
undesired effects.  Besides, it makes no sense to distort all letter
forms across the system for Xterm to draw Pi and box lines as expected.

I ultimately do not know what it is specifically about Fira {Code,Mono}
that lends to its adaptability in this scenario.  I would assume it has
to do with the inherent proportions of its hyphen `-` and column `|`,
though this has not been researched further.

