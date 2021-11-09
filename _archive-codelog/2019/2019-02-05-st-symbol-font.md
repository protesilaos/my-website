---
title: 'Save Simple Terminal from symbolic font segfault'
excerpt: 'How to run the Simple Terminal (st) with support for symbolic fonts.'
---

The scenario: you are on Debian (or derivatives) and are using the
Simple Terminal by the upstream suckless source or community repos such
as my [soft fork of ST](https://gitlab.com/protesilaos/st).

The problem: when ST tries to draw symbolic Unicode points—emoji—it
throws an error and quits.  This can happen quite often when using TUIs
such as `neomutt` and `newsboat`: you might get updates that include
such symbols in their title string.  I have also seen Git repos where
people use emoji in their commit messages…

The solution: 

	sudo apt install fonts-symbola
	
Everything will then work as intended.  Just confirmed as much on
a machine running Debian Buster/Sid.

## Not needed for graphical applications

To get emoji support on GUIs, I rely on another typeface altogether:

	sudo apt install fonts-noto-color-emoji

Then I use the appropriate rules in my fontconfig.  The following is
just a sample `fonts.conf`.  For the fully fledged implementation, refer
to [my dotfiles](https://gitlab.com/protesilaos/dotfiles):

	<fontconfig>
		<!-- If the requested font is sans-serif -->
		<!-- Display sans-serif and then emoji fallbacks -->
		<match target="pattern">
			<test qual="any" name="family">
				<string>sans-serif</string>
			</test>
			<edit name="family" mode="prepend_first">
				<string>emoji</string>
			</edit>
		</match>
		
		<alias>
			<family>emoji</family>
			<default><family>Noto Color Emoji</family></default>
		</alias>
	</fontconfig>

All of the above granted, I wish I could do without emoji in my
terminal…
