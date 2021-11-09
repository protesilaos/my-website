---
title: 'Sample of a BSPWM resize method'
excerpt: 'Shell script and sample key bindings to resize BSPWM nodes'
---

I was asked to provide some information on how to resize a floating
window in BSPWM.  As I seldom use floating windows, I have never tried
to put much effort into this issue.  Anyhow, here is a _skeleton_ of a
solution.

## The shell script

Here is the basic code. Place it in a file called `bspwm_resize` or
something appropriate (and make it executable and add it to your
`PATH`).

If you need to limit it to floating windows, you could use a check for
`bspc query -N -n .floating`.

```
#!/bin/bash

[ "$#" -eq 3 ] || { echo "Needs exactly three arguments."; exit 1; }

motion="$1"
direction="$2"
size="$3"

if [ "$motion" = 'expand' ]; then
	# These expand the window's given side
	case "$direction" in
		north) bspc node -z top 0 -"$size" ;;
		east) bspc node -z right "$size" 0 ;;
		south) bspc node -z bottom 0 "$size" ;;
		west) bspc node -z left -"$size" 0 ;;
	esac
else
	# These contract the window's given side
	case "$direction" in
		north) bspc node -z top 0 "$size" ;;
		east) bspc node -z right -"$size" 0 ;;
		south) bspc node -z bottom 0 -"$size" ;;
		west) bspc node -z left "$size" 0 ;;
	esac
fi
```

## The commands for the key bindings

Then in your SXHKD file, you can use standard keys of your choice or the
less known "continuous input" technique.  I prepared a demo for the
latter.  This specific mode is denoted by the colon sign `:`.

What it does: you enter the "mode" with the keys to the left of the
colon and then you execute the relevant commands by just pressing what
is to the right of the colon.  So there is no need to continuously press
the entire sequence.

Exit the "mode" with the Escape key.

```
super + e : {h,j,k,l}
    bspwm_resize expand {west,south,north,east} 50

super + shift + e : {h,j,k,l}
    bspwm_resize contract {west,south,north,east} 50
```

## Closing thoughts

I never developed something specifically for floating windows, because I
rarely use them.  And when I do, it usually is something involving the
mouse, at which point it is acceptable to just resize them with
Alt+Right-click-drag (or move them the same way with Alt and Left click
drag).

That covers it.  Hopefully it gives you something to work with.  If you
need help, please contact me.
