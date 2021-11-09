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

# Run all the local scripts for building the web fonts.  See the
# individual scripts for dependencies and documentation.
#
# This script is part of a broader effort to remove nodejs from my
# workflow when developing my website.
#
# My site and its source code:
# * https://protesilaos.com/
# * https://gitlab.com/protesilaos/protesilaos.gitlab.io

# The project is controlled with git.  Else throw an error and exit.
if [ -x /usr/bin/git ]; then
	project_root_dir="$(git rev-parse --show-toplevel)"
else
	echo "ERROR. Missing dependency: git"
	echo "Exiting"
	exit 1
fi

. "$project_root_dir/dev/subset_ttf.sh"
. "$project_root_dir/dev/create_webfonts.sh"
. "$project_root_dir/dev/minify_webfonts_css.sh"
