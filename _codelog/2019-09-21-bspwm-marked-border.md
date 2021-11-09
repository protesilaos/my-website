---
title: 'Change BSPWM marked border'
excerpt: "Conceptual approach to adjusting the width of a marked window's border in BSPWM."
---

The other day I was asked whether it is possible to change the width of
a window's border while it is marked.  The short answer is affirmative.
This is a piece of functionality I considered but never implemented in
[my free book about BSPWM on Debian](https://protesilaos.com/pdfd) 10
'buster'.

So here is an outline of how it could be achieved.

## Querying the marked nodes

We can produce the list of all marked windows with:

	bspc query -N -n .marked

You can fine-tune this to your liking by specifying the scope of the
query.  For example `.marked.local` will only apply to the current
desktop (see `man bspc`).

We can then use that to adjust the size of the first matching item to 10
pixels (assuming the normal border is another value).

	bspc config -n "$(bspc query -N -n .marked)" border_width 10

And here is the same principle for all marked nodes.

```
#!/bin/bash

for i in $(bspc query -N -n .marked); do
	bspc config -n "$i" border_width 10
done
```

## Using the `subscribe' command

For an event based approach, we can leverage BSPWM's reporting system.
We can poll for changes to the status of the flags that apply to nodes,
targetting specifically the "mark" flag.

Here is the loop.  Adjust the border width values to your liking (by the
way, running the command without a value will give you the current one).

```
#!/bin/bash

while read -r line; do
	case "$line" in
		*'marked on')
			bspc config -n "$(bspc query -N -n .marked)" border_width 10
			;;
		*'marked off')
			bspc config border_width 1
			;;
	esac
done < <(bspc subscribe report node_flag)
```

Note that the very last part uses Bash's process redirection to pass
information to the loop.

## Closing thoughts

Recall that assigning flags in BSPWM follows a toggle approach.  If the
flag is active, then assigning it again will remove it and vice versa.
Here is the relevant part from `man bspc`:

```
-g, --flag hidden|sticky|private|locked|marked[=on|off]
Set or toggle the given flag for the selected node.
```

I never bothered with developing a workflow around these principles
because I would always use marks for quick, targetted operations (see my
book's chapter about advanced BSPWM concepts).  As such, I am not sure
whether it would be better to simply bind the commands to keys, which
would set and reset the border upon toggling the flag, or whether the
programmatic approach would be preferable.

Please experiment with these concepts.  Feel free to contact me in case
you produce something neat or wish to discuss this further.  Note though
that you cannot use these principles to change a border's colour.  That
is just a global value.
