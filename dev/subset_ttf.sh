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
# This is a script that extracts ("subsets") a defined range of Unicode
# points from a *.ttf font file.  It removes all glyphs that are not
# part basic latin and greek subsets, the latin1-supplement, numerals
# and punctuation marks.  for use on the web.  For the complete Unicode
# character table and code points, see: https://unicode-table.com
#
# Another script handles the conversion to file formats that are
# appropriate for the Web (part of the same source---see below):
# create_webfonts.sh
#
# Debian Buster dependencies:
#
# 	apt install git fonttools
#
# This script is part of a broader effort to remove nodejs from my
# workflow when developing my website.
#
# My site and its source code:
# * https://protesilaos.com/
# * https://gitlab.com/protesilaos/protesilaos.gitlab.io
#
# }}}

# The project is controlled with git.  Else throw an error and exit.
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
else
	echo "ERROR: Missing directory: $project_root_dir/_src/ttf"
	echo "Exiting"
	exit 1
fi

# This function accepts the path to the *.ttf file as a single argument.
# To learn more about pyftsubset, run it with --help
subset_font() {
    pyftsubset "$1" \
    --unicodes='U+0020-007E,U+00A1-00FF,\
    U+0370-03CE,U+2010,U+2012-2014,U+2018-201F,U+2022-2027' \
    --layout-features=''
}

# Remove older files that were generated by this script
find "$fonts_source_path" -name '*subset.ttf' -print0 | while IFS= read -r -d $'\0' line; do
	rm "$line"
done

# Find all the font files and subset them.  The new files have ".subset"
# prepended to their file type suffix. Example: Hack-Regular.ttf =>
# Hack-Regular.subset.ttf
find "$fonts_source_path" -name '*.ttf' -print0 | while IFS= read -r -d $'\0' line; do
	subset_font "$line"
done

# vi:foldmethod=marker
