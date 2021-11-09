---
title: 'Manipulating colour values'
subtitle: 'Finding ways to produce colour blends programmatically'
excerpt: 'The methods I used to (i) convert HEX to RGB, (ii) blend two colours to create a median value, and (iii) scripting everything in BASH.'
---
While iterating on my [Tempus themes](https://protesilaos.com/tempus-themes/) project of
accessible colour schemes for terminal emulators and text editors,
I started conducting experiments for mixing colours.  The goal is to
derive a median value from two others.  A couple of variants of red
would produce a third one in between them.  Same with two greens,
yellows, and so on for all basic sixteen colours that constitute each
theme's palette.

## Scripting things with Bash

Part of my experimentation was trying to figure out a way to do things
using the shell.  And I have found a way, only it is not
straightforward…

To start with, to derive the median colour from two others, we follow
this formula:

	blend = ( (R1 + R2) / 2 ) ( (G1 + G2) / 2 ) ( (B1 + B2) / 2 )

This assumes that the colour is defined in RGB, i.e as a mixture of red,
green, and blue channels.  _But what if we have been using hexadecimal
notation?_  A HEX colour might include letters, whereas an RGB one will
always be described with integers.

While there probably is a way to do arithmetic with base16 notation,
I could not figure it out.  As such, I settled on the roundabout way of
converting HEX to RGB, doing the arithmetic, and then turning the
blended colour into HEX.

To rebase a HEX to RGB (base16 to base10), we need to know how to break
it up into its constituent red, green, blue channels.  So a hexadecimal
value such as `202427` would be abstracted to `20 (red channel)`, `24
(green channel)` `27 (blue channel)`.  Doing that in the shell:
	
	#!/bin/bash

	col0=202427 # black variant

	echo "${col0:0:2}" # prints first pair of characters (red)
	echo "${col0:2:2}" # prints second pair of characters (green)
	echo "${col0:4:2}" # prints third pair of characters (blue)

This gives us:

	20
	24
	27

Now we need to convert each channel to decimal notation, which is what
is used for RGB.  Instead of doing the mathematics, we can use the
`printf` built-in mechanism for converting base16 to base10.  This is
done with the `%d` specifier.  To denote the presence of a hexadecimal
number, we prepend `0x`.  More concretely, we use the substring
extraction we saw earlier to operate on each of the colour's three
channels:

	printf "%d,%d,%d" 0x${col0:0:2} 0x${col0:2:2} 0x${col0:4:2}

This command takes `0x20`, `0x24`, `0x27` in sequence and prints them in
decimal notation as R,G,B.  Let us put it all together and see what we
get, while also introducing our other shade of black:

	col0=202427 # black variant
	col8=292b35 # bright black variant

	col0rgb=$(printf "%d,%d,%d" 0x${col0:0:2} 0x${col0:2:2} 0x${col0:4:2})
	col8rgb=$(printf "%d,%d,%d" 0x${col8:0:2} 0x${col8:2:2} 0x${col8:4:2})

	echo "$col0rgb"
	echo "$col8rgb"

Our new RGB colour is `32,36,39`.  Doing the same on the bright black
variant `292b35`, will give us `41,43,53`.

Notice the presence of commas.  Without them they would be not be valid
RGB colours.  However, for this particular task what we want is to
ultimately blend the two and get a HEX out of them.  No commas then:

	col0rgbalt=$(printf "%d%d%d" 0x${col0:0:2} 0x${col0:2:2} 0x${col0:4:2})
	col8rgbalt=$(printf "%d%d%d" 0x${col8:0:2} 0x${col8:2:2} 0x${col8:4:2})

With that done, here comes the ugly part of using the formula that
derives the median value between the two.  The code we will be using
looks like this:

	printf "%d" "$(( (${col0rgbalt:0:2} + ${col8rgbalt:0:2}) / 2 ))"

We need to do this for each of the RGB channels.  So thrice:

	printf "%d%d%d" "$(( (${col0rgbalt:0:2} + ${col8rgbalt:0:2}) / 2 ))" "$(( (${col0rgbalt:2:2} + ${col8rgbalt:2:2}) / 2 ))" "$(( (${col0rgbalt:4:2} + ${col8rgbalt:4:2}) / 2 ))"

	col08rgb=$(printf "%d%d%d" "$(( (${col0rgbalt:0:2} + ${col8rgbalt:0:2}) / 2 ))" "$(( (${col0rgbalt:2:2} + ${col8rgbalt:2:2}) / 2 ))" "$(( (${col0rgbalt:4:2} + ${col8rgbalt:4:2}) / 2 ))")

	echo "$col08rgb"

This gives us `363946`, which in valid RGB would be `36,39,46`.  As we
can tell, it is positioned in between `32,36,39` and `41,43,53`.  Great,
almost done!  Now convert that to base16, this time using the `%x`
specifier, while omitting the `0x` notation:

	printf "%x%x%x" ${col08rgb:0:2} ${col08rgb:2:2} ${col08rgb:4:2}

Our new colour is `24272e`, which once again is between `202427` and
`282b35`.  Perfect!

## Moving forward with our newfound knowledge

The Tempus Themes use a 16 colour palette that represents the standard
one you would find on any GNU/Linux terminal emulator.  The colours are,
in order:

* black, red, green, yellow, blue, magenta, cyan, white
* bright {black, red, green, yellow, blue, magenta, cyan, white}

These are denoted numerically as:

* 0, 1, 2, 3, 4, 5, 6, 7
* 8, 9, 10, 11, 12, 13, 14, 15

By creating a blend out of each regular and bright pair, we get an extra
eight colours, bringing the total count to twenty four.  _Should we
commit to that path though?_

I remain undecided.  Part of developing the Tempus Themes is to preserve
a certain contrast ratio that conforms **at minimum** with the WCAG AA
accessibility standard.  This is the scientific guide to choosing
colours.  However, a theme is also a work of art.  It needs to have
a certain aesthetic to it, a recognisable look and feel.  Deriving
colours programmatically can detract from the appeal of the end product.
We do not want that, as fascinating as the procedure may be.

So far, the exception to this hesitation of mine is to allow
programmatic blending only from the background values of each theme.
Basically a third colour that is designated internally as the "dimmed"
background.

I still wish to make design decisions myself, while letting the computer
handle the repetitive tasks.

## The Tempus Themes are under active development

If you have not checked my project in a while, please have another look
at the [main git repo](https://gitlab.com/protesilaos/tempus-themes)
(each app-specific implementation has its own dedicated repository, see
links in the README).

The latest template I added concerns the GTK4 Source View widget.
Basically, this means that you can use the Tempus Themes in GNOME
Builder.

Besides, these themes are also deeply incorporated in [my
dotfiles](https://gitlab.com/protesilaos/dotfiles).  I use them daily
and always try to improve them further and/or port them to more
applications (notwithstanding the comprehensive list currently on
offer).

For the sake of completeness, the colours used in the examples above,
are `col0` and `col8` from [Tempus Winter](https://protesilaos.com/tempus-winter/).  
