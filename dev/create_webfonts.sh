#!/bin/bash

# NOTE 2021-04-11: This is an old script that I have not used in years.
# It needs to be reviewed, else deleted.

    # This program is free software: you can redistribute it and/or modify
    # it under the terms of the GNU General Public License as published by
    # the Free Software Foundation, either version 3 of the License, or
    # (at your option) any later version.

    # This program is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU General Public License for more details.

    # You should have received a copy of the GNU General Public License
    # along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Description {{{
# ---------------
#
# Convert TTF font files to WOFF and WOFF2 and move them to the desired
# directory inside my website's source code.
#
# First check the 'subset_fonts.sh' before running this script.  That is
# what reduces the source files to the Unicode range required for use on
# my website.
#
# Debian Buster dependencies:
#
# 	apt install git sfnt2woff-zopfli woff2
#
# This script is part of a broader effort to remove nodejs from my
# workflow when developing my website.
#
# My site and its source code:
# * https://protesilaos.com/
# * https://gitlab.com/protesilaos/protesilaos.gitlab.io
#
# }}}

# Our project is controlled with git.  Else throw an error and exit.
if [ -x /usr/bin/git ]; then
	project_root_dir="$(git rev-parse --show-toplevel)"
else
	echo "ERROR. Missing dependency: git"
	echo "Exiting"
	exit 1
fi


# These are specific to my own website's repo.  Adapt accordingly.  The
# paths are assumed to exist, so no further logic is added for the
# occasion where they might not.
#
# NOTE source path can have per-font-family subdirectories.  Whereas
# output files should all just be placed in the designated path, without
# any filesystem differentiation between font families.
if [ -d "$project_root_dir/_src/ttf" ]; then
	fonts_source_path="$project_root_dir/_src/ttf"
	fonts_output_path="$project_root_dir/assets/fonts"
else
	echo "ERROR: Missing directory: $project_root_dir/_src/ttf"
	echo "Exiting"
	exit 1
fi

# Convert the font files to WOFF and WOFF2 formats (web fonts)
find "$fonts_source_path" -name '*.subset.ttf' -print0 | while IFS= read -r -d $'\0' line; do
	sfnt2woff-zopfli "$line"
	woff2_compress "$line"
done

# Move the web fonts to their right location
find "$fonts_source_path" -name '*.subset.woff*' -print0 | while IFS= read -r -d $'\0' line; do
	mv -f "$line" "$fonts_output_path/"
done

# vi:foldmethod=marker
