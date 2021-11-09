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

# Minify and concatenate the _src/css/_*.css.  These files are bundled
# into a single file, _src/css/webfonts.scss, via the `@import`
# directive.  We only need to operate on that file.
#
# Dependencies on Debian Buster:
# 	apt install git sassc
#
# This script is part of a broader effort to remove nodejs from my
# workflow when developing my website.
#
# My site and its source code:
# * https://protesilaos.com/
# * https://gitlab.com/protesilaos/protesilaos.gitlab.io

# This assumes our project is controlled with git
if [ -x /usr/bin/git ]; then
	project_root_dir="$(git rev-parse --show-toplevel)"
else
	echo "ERROR. Missing dependency: git"
	echo "Exiting"
	exit 1
fi

# These are specific to my own website's repo.  Adapt accordingly.
if [ -d "$project_root_dir/_src/css" ]; then
	webfonts_source_path="$project_root_dir/_src/css/webfonts.scss"
else
	echo "ERROR: Missing directory: $project_root_dir/_src/css"
	echo "Exiting"
	exit 1
fi

if [ -d "$project_root_dir/assets/css" ]; then
	webfonts_output_path="$project_root_dir/assets/css/webfonts.min.css"
else
	echo "ERROR: Missing directory: $project_root_dir/assets/css"
	echo "Exiting"
	exit 1
fi

if [ -x /usr/bin/sassc ]; then
	echo "Preparing to minify webfonts…"
	echo "This repo's root directory is:"
	echo "$project_root_dir"
	echo "Source file at $webfonts_source_path"
	echo "Output file at $webfonts_output_path"
	sassc --style compressed "$webfonts_source_path" "$webfonts_output_path"
	echo "Job done!"
else
	echo "ERROR. Missing dependency: sassc"
	echo "Exiting"
	exit 1
fi
