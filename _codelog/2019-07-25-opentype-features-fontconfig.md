---
title: 'Fontconfig typographic features on GNU/Linux'
excerpt: 'How to enable OpenType features on GNU/Linux for typefaces that support them.'
---

Modern typography provides technologies for tweaking various aspects
of the font's presentation.  The general idea is to make the typeface
flexible enough for adapting to a variety of typographic requirement.
Common features include tabular numerals, stylistic alternatives for
select glyphs (e.g. slashed zero), ligatures, small caps, ordinal
figures.  Each font family will have support for its own classes.

GNU/Linux users can access [these
features](https://en.wikipedia.org/wiki/OpenType_feature_tag_list) by
leveraging the `fontconfig` library's rule declaration.  There may be
differences between distros on where the system-wide defaults are
placed.  But user-specific settings should normally be defined at
`~/.config/fontconfig/conf.d`.  Here is an overview of my current
settings (see [my dotfiles](https://gitlab.com/protesilaos/dotfiles)):

	.config/fontconfig/conf.d/
	├── 10-hinting-full.conf
	├── 10-sub-pixel-rgb.conf
	├── 11-lcdfilter-default.conf
	├── 20-unhint-small-hack.conf
	├── 45-generic.conf
	├── 45-latin.conf
	├── 50-enable-terminus.conf
	├── 60-generic.conf
	├── 60-latin.conf
	├── 80-alegreya-fontfeatures.conf
	├── 80-alegreya-sans-fontfeatures.conf
	├── 80-condensed-large-dejavu.conf
	├── 80-firago-fontfeatures.conf
	└── README

The numbering matters as it determines the sequence for loading these
rules.  This is what Debian provides on the matter:

>conf.d/README
>
>Each file in this directory is a fontconfig configuration file.  Fontconfig
>scans this directory, loading all files of the form [0-9][0-9]*.conf.
>These files are normally installed in /usr/share/fontconfig/conf.avail
>and then symlinked here, allowing them to be easily installed and then
>enabled/disabled by adjusting the symlinks.
>
>The files are loaded in numeric order, the structure of the configuration
>has led to the following conventions in usage:
>
><pre>
>Files begining with:	Contain:
>00 through 09		Font directories
>10 through 19		system rendering defaults (AA, etc)
>20 through 29		font rendering options
>30 through 39		family substitution
>40 through 49		generic identification, map family->generic
>50 through 59		alternate config file loading
>60 through 69		generic aliases, map generic->family
>70 through 79		select font (adjust which fonts are available)
>80 through 89		match target="scan" (modify scanned patterns)
>90 through 99		font synthesis
></pre>

Rules are written in XML.  See [this
spec](https://www.freedesktop.org/software/fontconfig/fontconfig-user.html)
for all available constructs.

## Trying things out

Now on to implementing our newfound knowledge!  Say you have
downloaded [FiraGO](https://bboxtype.com/typefaces/FiraGO) and placed
a directory containing its font files somewhere it can be read by your
operating system.  Font files can end in either `.otf` or `.ttf`.  On
Debian, user-specific typefaces are read from `~/.local/share/fonts`.
So FiraGO would be like this:

	.local/share/fonts/FiraGO
	├── FiraGO-BoldItalic.otf
	├── FiraGO-Bold.otf
	├── FiraGO-Italic.
	└── FiraGO-Regular.otf

Then inside the local `conf.d` we add `80-firago-fontfeatures.conf`,
which contains the following:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <description>Enable select opentype features for FiraGO.</description>

  <!--
	  Typographic features are provided on a per-typeface basis.
	  Tables with all available features are available here:
	  https://en.wikipedia.org/wiki/OpenType_feature_tag_list 

      Also read the fontconfig user spec:
      https://www.freedesktop.org/software/fontconfig/fontconfig-user.html
  -->

  <match target="font">
    <test name="family" compare="eq" ignore-blanks="true">
      <string>FiraGO</string>
    </test>
    <edit name="fontfeatures" mode="append">
      <string>tnum on</string> <!-- tabular numbers -->
      <string>zero on</string> <!-- slashed zero -->
    </edit>
  </match>
</fontconfig>
```

Focus on the part inside of the `<edit>` tags.  This is where we
toggle the features that FiraGO supports (as documented in its
download page).  As you can see, I only need tabular numbers and a
slashed zero.  This makes FiraGO far better as a UI font, while not
detracting from its already superb ability to present body copy.

To target another font family, simply replace "FiraGO" from this part:
`<string>FiraGO</string>`.  I have tried this method with a number of
typefaces, all delivering the expected results.

Pro tip: combine FiraGO with Fira Code (`apt install fonts-firacode`)
for a consistent typographic experience across your desktop
environment.



