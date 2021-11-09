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
# This script generates a favicon.ico and places it at the root of the
# project's directory.  Web browsers can pick up that file even without
# being told to do so in the HTML head.
#
# To generate the favicon.ico, this script will first create a set of
# smaller .png files from a base image.  It will then optimise and
# combine them into the end product.
#
# Debian Buster dependencies:
#
# 	apt install git imagemagick optipng
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

if [ -d "$project_root_dir/_src/favicons" ]; then
	favicons_source_path="$project_root_dir/_src/favicons"
else
	echo "ERROR: Missing directory: $project_root_dir/_src/favicons"
	echo "Exiting"
	exit 1
fi

if [ -f "$favicons_source_path/favicon_260x260.png" ]; then
	master_favicon="$favicons_source_path/favicon_260x260.png"
else
	echo "ERROR: Missing master favicon file: $favicons_source_path/favicon_260x260.png"
	echo "Exiting"
	exit 1
fi

# Define the array with the desired image sizes.
favicon_sizes=(16x16 32x32)
####favicon_sizes=(16x16 24x24 32x32 48x48 64x64)

# We will be populating the list of resized icons in the loop below…
resized_favicons=()

for i in "${favicon_sizes[@]}"; do
	# First create the smaller images.
	convert -resize $i $master_favicon $favicons_source_path/favicon_resized_${i}.png

	# Populate the list of resized favicons
	resized_favicons+=("$favicons_source_path/favicon_resized_$i.png")
done

# Optimise the resized files
for i in "${resized_favicons[@]}"; do
	optipng -quiet "$i"
done

# Combine the resized favicons into a single .ico file.
convert "${resized_favicons[@]}" "$project_root_dir/favicon.ico"

# Update the favicon version in the HTML head (force cache refresh).
sed -i "s,favicon.ico?v=[a-zA-Z0-9]*,favicon.ico?v=$(date +%Y%m%d%H%M)," \
"$project_root_dir/_includes/head.html"

# vi:foldmethod=marker
