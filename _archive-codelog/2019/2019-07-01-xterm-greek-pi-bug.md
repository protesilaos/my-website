---
title: 'Bug report: Xterm problems with Greek pi (π) and box-drawing'
excerpt: 'Contents of my bug report concerning the incorrect behaviour of Xterm in treating the Greek letter pi as a box-drawing character.'
---

I submitted the following to the Debian bug tracker
[#931305](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=931305).

* * *

While using proportional fonts, the Greek letter pi (π) is treated as
a box-drawing character or, more likely, as missing from the
proportional font altogether.  This happens _only at certain point
sizes_ AND/OR _only with specific fonts_.

Scenario 1: Greek pi works, but box-drawing does not
----------------------------------------------------

With these settings:

	xterm.vt100.faceName: DejaVu Sans Mono
	xterm.vt100.faceSize: 10
	XTerm.vt100.forceBoxChars: false

The greek letter pi is displayed correctly, but the second vertical line
(drawn with U+2502) is almost the same as the first one (drawn with
U+007C).

<img alt='image scenario 1' src="{{ '/assets/images/attachments/xterm_grpi_boxchars_scenario1.png' | absolute_url }}"/>

Scenario 2: Greek pi does not work, but box-drawing does
--------------------------------------------------------

With these settings:

	xterm.vt100.faceName: DejaVu Sans Mono
	xterm.vt100.faceSize: 10
	XTerm.vt100.forceBoxChars: true

The Greek letter pi is drawn using a fixed-size (bitmap) font.  The
second vertical line is properly displayed using box-drawing characters.

<img alt='image scenario 2' src="{{ '/assets/images/attachments/xterm_grpi_boxchars_scenario2.png' | absolute_url }}"/>

Scenario 3: faceSize: 9.5 forceBoxChars: false works for both
-------------------------------------------------------------

With these settings:

	xterm.vt100.faceName: DejaVu Sans Mono
	xterm.vt100.faceSize: 9.5
	XTerm.vt100.forceBoxChars: false

Everything appears to work as intended.

<img alt='image scenario 3' src="{{ '/assets/images/attachments/xterm_grpi_boxchars_scenario3.png' | absolute_url }}"/>

Scenario 4: Fira Code works using settings from scenarios 1 and 3
-----------------------------------------------------------------

With these:

	xterm.vt100.faceName: Fira Code
	xterm.vt100.faceSize: 10
	XTerm.vt100.forceBoxChars: false

Or this changed:

	xterm.vt100.faceSize: 9.5

Everything seems to work as intended.

<img alt='image scenario 4' src="{{ '/assets/images/attachments/xterm_grpi_boxchars_scenario4.png' | absolute_url }}"/>

Scenario 5: forceBoxChars always breaks Greek letter pi (π)
-----------------------------------------------------------

With these settings:

	xterm.vt100.faceName: Fira Code
	xterm.vt100.faceSize: 10
	XTerm.vt100.forceBoxChars: true

Regardless of typeface, enabling forceBoxChars will always draw the
letter pi in a bitmap font.

<img alt='image scenario 5' src="{{ '/assets/images/attachments/xterm_grpi_boxchars_scenario5.png' | absolute_url }}"/>
