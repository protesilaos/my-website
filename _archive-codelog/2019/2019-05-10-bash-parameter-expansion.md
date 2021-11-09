---
title: "Parameter Expansion in BASH"
excerpt: "In this video I showcase some of the powerful ways of
manipulating variables in pure Bash."
mediaid: 'S4D9KaW3ERw'
layout: vlog
---

In this screen cast I showcase some of the features of BASH for
manipulating variables, aka "parameters".  Parameter expansion is a very
powerful feature.  Mastering it should greatly improve your shell
scripting skills (see the [GNU Bash
manual](https://www.gnu.org/software/bash/manual/)).

Started applying this knowledge to the scripts that are distributed with
[my dotfiles](https://gitlab.com/protesilaos.com/dotfiles), in
preparation of the next beta version of "Prot's Dots For Debian" (which
I introduced in [the previous
entry](https://protesilaos.com/codelog/2019-04-28-beta-bspwm-pdfd/)).

Below I include the code samples shown in this screen cast.

* * *

First demo script:

	#!/bin/bash

	name=protesilaos

	# Replace parameter with its value
	echo "$name"

	# Get parameter length
	echo "${#name}"
	
	# Extract substring ${parameter:offset:length}
	echo "${name:0:4}"
	
	# Capitalise first character
	echo "${name^}"
	
	# All majuscules
	echo "${name^^}"

Second example:

	#!/bin/bash

	name=PROTESILAOS

	# First character is lower case
	echo "${name,}"

	# All miniscules
	echo "${name,,}"

	# Use default value if parameter is unset/null
	unset name
	echo "$name"
	echo "${name:-Protesilaos}"
	echo "${name:-$USER}"

Third sample:

	#!/bin/bash

	freedom='GNU Not UNIX ; GNU plus Linux'

	# Replace first occurence of pattern with string
	echo "${freedom/GNU/Gahnoo}"

	# Replace all matches of pattern with string
	echo "${freedom//GNU/Gahnoo}"
	
	# Remove first match of pattern
	echo "${freedom/* ; /}"
	
	freedom='GNU Not UNIX ; GNU is Not Unix ; Gahnoo slash Linaks ; GNU/Linux'
	
	echo "$freedom"
	
	# Remove all occurences of pattern
	echo "${freedom//* ; /}"
