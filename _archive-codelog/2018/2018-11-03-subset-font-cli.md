---
title: "Script to subset fonts for the web"
subtitle: "Smaller font files with only the glyphs I need"
excerpt: "I wrote a small script that leverages a python tool to reduce font files only to the selected Unicode points."
date: 2018-11-03
permalink: /codelog/script-subset-font-web/
---

It is a good practice to optimise font files before self hosting them.
Each font family may contain hundreds of glyphs that are not used
anywhere on the website.  This typically concerns the characters from
scripts other than the one[s] you write in.  Subsetting a font file
removes those superfluous code points.  It is the right way to reduce
overall file size.  For example, I only use glyphs from the Latin and
Greek alphabets, as well as punctuation marks and numerals that are
common to both.

## Self hosted Google Fonts was a decent compromise

In the past, I would get fonts optimised for my use case from the Google
Fonts project.  It already offers font presets that include the
supported Unicode subsets.  You can download a `ttf` file or set
thereof, then run command line tools to convert it to the `woff` and
`woff2` formats for use on the web.  Or you can use a web app like the
[google webfonts
helper](https://google-webfonts-helper.herokuapp.com/fonts) which
automates those steps for you.

The major downside with that method is the lack of control.  You are
limited to fonts that are hosted on Google's platform.  Some of the best
free/libre typefaces are not available there, such as the DejaVu fonts,
Mononoki, Hack, FiraGO, Iosevka, and so on.

Besides, the plethora of choice on that platform is largely an illusion.
The available options are limited to a small group of fonts once you
factor in the need for supporting multiple languages, bold, italics,
etc. (most offerings are incomplete or at least not suited to my
requirements).

Personally, I prefer the aforementioned free fonts.  The problem is that
they do not provide subsets or convenient built-in tools to reduce the
Unicode coverage only to the set of needed glyphs.  For my application,
an optimised `woff` is about 50KB while `woff2` falls to 30KB.  Compare
that to something around 1MB for Latin + Extended Latin + Greek and
Coptic + Cyrillic…

This is where Google's service has a clear advantage.  It is why I would
ultimately compromise on my demands, using self hosted variants of
Google Fonts because I did not know how to subset fonts myself.  And no,
sending ~5MB of font data per initial page load was never something I
wanted to do.

## The "fonttools" package to the rescue

Subsetting fonts is no longer a hindrance.  Today I discovered a package
in the Debian repos which offers the means to subset a font from the
command line.  It is the `fonttools` collection of python programs.

    sudo apt install fonttools

After figuring out the command I needed to execute, I wrote a small BASH
script that automates the process for each `ttf` file in the present
working directory.  Below is the essence of the script in its current
"alpha" version.  I bundle it with [my
dotfiles](https://gitlab.com/protesilaos/dotfiles) under the "bin"
directory, as this is something I might develop into a multi-purpose
utility.

    #!/bin/bash

    # This function accepts two arguments.  The first is the name of the ttf
    # file without the file type extension.  The second is the desired
    # output format (woff|woff2).  These are provided by the subsequent
    # loop.
    subset_font() {
        pyftsubset "$1.ttf" \
        --unicodes='U+0020-007E,U+00A1-00FF,\
        U+0370-03CE,U+2010,U+2012-2014,U+2018-201F,U+2022-2027' \
        --layout-features='*' \
        --flavor="$2" \
        --output-file="$1.$2"
    }

    # Loop through all ttf files in the present working directory and run
    # the `subset_font` function defined above.
    for i in $(find ./*.ttf | sed 's,\(\./\)\([a-zA-Z0-9_-]*\)\(\.ttf\),\2,g'); do
        subset_font $i 'woff'
        subset_font $i 'woff2'
    done

Note the value of the `--unicodes` flag in the `subset_font` function.
I had to figure out the Unicode code points I had to reference. This
website on [Unicode tables](https://unicode-table.com) proved an
invaluable resource.

## About the two font families I use

This section is out-of-date.  I now only use one font: Clear Sans.  See
[commit
5f168cf6](https://gitlab.com/protesilaos/protesilaos.gitlab.io/commit/5f168cf6eacbeb47eff6e6a5f7300b502a659317)
for the details.  However, FiraGO and Hack (alt) are still the default
typefaces on my GNU/Linux computer.  Refer to [my
dotfiles](https://gitlab.com/protesilaos/dotfiles) for more on that.
{:.warn}

As I linked to my dotfiles already, I might as well write a few words
about the fonts I have chosen.

The first is [FiraGO](https://bboxtype.com/typefaces/FiraGO/), a
sans-serif typeface, which is what is applied to the body text and
headings.  It is the main font of this website and is available in
regular and bold weights with corresponding italics.  This is also the
system font I apply on my Debian machines running my custom working
environment.

*FiraGO* is the continuation of *Fira Sans*, with support for more
scripts and, possibly in the future, more variants.  At this point,
*FiraGO* has not yet deviated substantially from its predecessor, though
this is to be expected.  

Fira Sans was a project funded by Mozilla to cover the needs of the
Firefox OS endeavour.  It is a free/libre implementation of Erik
Spiekermann's "modern classic": the *FF Meta*.  Consider reading
[Matthew Butterick's
review](https://typographica.org/typeface-reviews/fira-sans/) on the
matter.

My second font is [Hack](https://sourcefoundry.org/hack/), a monospaced
design that is ideal for long coding sessions *because it is not
flamboyant*.  It only tries to be utilitarian.  Legible, clear, well
balanced, decipherable.  A true workhorse.  It seems to me that *Hack*
is the best typeface to emerge from the libre software milieu, as it is
derived from the *DejaVu* fonts, which themselves trace their roots to
*Bitstream Vera*.

The *Hack* designers offer the
[alt-hack](https://github.com/source-foundry/alt-hack) repository for
those who, like me, want to build a modified version of the font with
some alternate glyphs.  This is what I use (and what I distribute with
my dotfiles, under the same license terms as the original).  I have
built the font from source and applied these patches:

1. [u0028-curved](https://github.com/source-foundry/alt-hack/tree/master/glyphs/u0028-curved)
2. [u0029-curved](https://github.com/source-foundry/alt-hack/tree/master/glyphs/u0029-curved)
3. [u0030-forwardslash](https://github.com/source-foundry/alt-hack/tree/master/glyphs/u0030-forwardslash)
4. [u0033-flattop](https://github.com/source-foundry/alt-hack/tree/master/glyphs/u0033-flattop)

To my eyes, these minor tweaks make *Hack* "sturdier" and are slightly
more consistent with the overall personality of the typeface.  This is
just a matter of agreeing on the defaults.  The original glyphs for
those four code points add a bit more "character" to an otherwise
Spartan presentation; the kind of flair I would rather avoid.  Not that
they are bad per se—just that I prefer their alternatives in the context
of what *Hack* represents.

## The right tool for the job

I will be refining my subsetting script and may build on top of it to
automate various tasks, such as building the optimised `woff` and
`woff2` files for my website when new upstream versions are released.

Now that I have found a way to manipulate practically every available
typeface out there, I can think of no good reason to ever compromise
again with something like Google Fonts.

Granted, there is a bit of an effort involved, which is well worth it
for the added flexibility it offers.
