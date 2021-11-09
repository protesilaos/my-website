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

# Script to control Jekyll.  An optional argument will determine the
# command to run: install, update, build, dev (variant of jekyll serve
# using _config-dev.yml).  The default is to run it without an argument
# to perform a standard `jekyll serve`.
#
# Part of my website:
# * SITE: https://protesilaos.com/
# * SOURCE: https://gitlab.com/protesilaos/protesilaos.gitlab.io

# The project is controlled with git.  Else throw an error and exit.
if [ "$(command -v git 2> /dev/null)" ]; then
	project_root_dir="$(git rev-parse --show-toplevel)"
else
	echo "ERROR. Missing dependency: git"
	echo "Cannot determine the project's root directory"
	echo "Exiting"
	exit 1
fi

help_message() {
	echo 'Run this script to execute "bundle exec jekyll serve"'.
	echo 'Or pass a single argument for the following commands:'
	echo 'install == bundle install --path vendor/bundle'
	echo 'update == bundle update'
	echo 'build == bundle exec jekyll build'
	echo 'dev == bundle exec jekyll serve --config _config.yml,_config-dev.yml'
	echo 'h OR help == print this message'
	exit 1
}

if [ "$(command -v bundle 2> /dev/null)" ]; then
	case "$#" in
			0)
				cd "$project_root_dir" && bundle exec jekyll serve
				;;
			1)
				case "$1" in
					install)
						cd "$project_root_dir" && bundle install --path vendor/bundle
						;;
					update)
						cd "$project_root_dir" && bundle update
						;;
					build)
						cd "$project_root_dir" && bundle exec jekyll build
						;;
					dev)
						cd "$project_root_dir" && \
						bundle exec jekyll serve --config _config.yml,dev/configs/_config-dev.yml
						;;
					books)
						cd "$project_root_dir" && \
						bundle exec jekyll serve --config _config.yml,dev/configs/_config-books.yml
						;;
					code)
						cd "$project_root_dir" && \
						bundle exec jekyll serve --config _config.yml,dev/configs/_config-code.yml
						;;
					news)
						cd "$project_root_dir" && \
						bundle exec jekyll serve --config _config.yml,dev/configs/_config-news.yml
						;;
					greek)
						cd "$project_root_dir" && \
						bundle exec jekyll serve --config _config.yml,dev/configs/_config-greek.yml
						;;
					politics)
						cd "$project_root_dir" && \
						bundle exec jekyll serve --config _config.yml,dev/configs/_config-politics.yml
						;;
					-h|--help|h|help)
						help_message
						;;
					*)
						help_message
						;;
				esac
				;;
			*)
				help_message
				;;
	esac
else
	echo 'ERROR. Missing dependency «bundler»' 
	exit 1
fi
