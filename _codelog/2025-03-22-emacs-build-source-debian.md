---
title: "Emacs: how I build from emacs.git on Debian stable"
excerpt: "Step-by-step guide on how I build Emacs from source on Debian stable."
---

I have been following the `master` branch of the emacs.git repository
for many years now. It helps me test new features and make necessary
adjustments to all the packages I develop/maintain. Below I explain
how I make this happen on my computer, which is running Debian stable
(Debian 12 "Bookworm" as of this writing). If you are a regular user,
there is no reason to build from source: just use the latest stable
release and you should be fine.

## Configure the `apt` development sources

To build Emacs from source on Debian, you first need to have the
`deb-src` package archive enabled. In your `/etc/apt/sources.list`
file you must have something like this:

```
deb http://deb.debian.org/debian/ bookworm main
deb-src http://deb.debian.org/debian/ bookworm main
```

After modifying the sources, run the following on the command line to
fetch the index with new package names+versions:

```
sudo apt update
```

## Get the Emacs build dependencies

Now that you have enabled the `deb-src` archive, you can install the
build dependencies of the Debian `emacs` package with the following on
the command line:

```
sudo apt build-dep emacs
```

With this done, you are ready to build Emacs from source.

## Get the Emacs source code

You need the `git` program to get the source code from the emacs.git
website. So install it with this command:

```
sudo apt install git
```

Now make a copy of the Emacs source code, using this on the command
line:

```
git clone https://git.savannah.gnu.org/git/emacs.git ~/path/to/my/copy-of-emacs.git
```

Replace `~/path/to/my/copy-of-emacs.git` with the actual destination
of your preference. I have a `~/Builds` directory where I store all
the projects I build from source. I thus do:

```
git clone https://git.savannah.gnu.org/git/emacs.git ~/Builds/emacs.git
```

If the cloning process is too slow on your end, perform a _shallow
clone_ instead. For example:

```
git clone --depth 1 https://git.savannah.gnu.org/git/emacs.git ~/Builds/emacs.git
```

And if the Savannah website is not responsive, then clone from the
GitHub mirror (with the `--depth 1` if necessary):

```
git clone https://github.com/emacs-mirror/emacs.git ~/Builds/emacs.git
```

## Switch to the Emacs directory

Assuming you have the copy of emacs.git stored at `~/Builds/emacs.git`,
you switch to that directory with the following:

```
cd ~/Builds/emacs.git
```

Keep in mind that unless you explicitly switch to another branch, you
are on `master`, i.e. the latest development target.

**NOTE:** All subsequent commands are ran from your equivalent of
`~/Builds/emacs.git`.

## Run the `autogen.sh` the first time

This script will generate the configuration scaffold. You only really
need to do this once (and I always forget about it for this very
reason). Simply do this on the command line:

```
./autogen.sh
```

It checks that you have all you need to get started and prints output
like this:

```
Checking whether you have the necessary tools...
(Read INSTALL.REPO for more details on building Emacs)
Checking for autoconf (need at least version 2.65) ... ok
Your system has the required tools.
Building aclocal.m4 ...
Running 'autoreconf -fi -I m4' ...
Building 'aclocal.m4' in exec ...
Running 'autoreconf -fi' in exec ...
Configuring local git repository...
'.git/config' -> '.git/config.~1~'
git config transfer.fsckObjects 'true'
git config diff.cpp.xfuncname '!^[ 	]*[A-Za-z_][A-Za-z_0-9]*:[[:space:]]*($|/[/*])
^((::[[:space:]]*)?[A-Za-z_][A-Za-z_0-9]*[[:space:]]*\(.*)$
^((#define[[:space:]]|DEFUN).*)$'
git config diff.elisp.xfuncname '^\([^[:space:]]*def[^[:space:]]+[[:space:]]+([^()[:space:]]+)'
git config diff.m4.xfuncname '^((m4_)?define|A._DEFUN(_ONCE)?)\([^),]*'
git config diff.make.xfuncname '^([$.[:alnum:]_].*:|[[:alnum:]_]+[[:space:]]*([*:+]?[:?]?|!?)=|define .*)'
git config diff.shell.xfuncname '^([[:space:]]*[[:alpha:]_][[:alnum:]_]*[[:space:]]*\(\)|[[:alpha:]_][[:alnum:]_]*=)'
git config diff.texinfo.xfuncname '^@node[[:space:]]+([^,[:space:]][^,]+)'
Installing git hooks...
'build-aux/git-hooks/commit-msg' -> '.git/hooks/commit-msg'
'build-aux/git-hooks/pre-commit' -> '.git/hooks/pre-commit'
'build-aux/git-hooks/prepare-commit-msg' -> '.git/hooks/prepare-commit-msg'
'build-aux/git-hooks/post-commit' -> '.git/hooks/post-commit'
'build-aux/git-hooks/pre-push' -> '.git/hooks/pre-push'
'build-aux/git-hooks/commit-msg-files.awk' -> '.git/hooks/commit-msg-files.awk'
'.git/hooks/applypatch-msg.sample' -> '.git/hooks/applypatch-msg'
'.git/hooks/pre-applypatch.sample' -> '.git/hooks/pre-applypatch'
You can now run './configure'.
```

Do not be intimidated by it. Focus on the final line instead, which
directs you to the `configure` directive.

## Explore the build flags

How exactly you build Emacs depends on your preferences and
system-specific requirements. At the end of this post, I copy my
current configuration, though **I advise against** copying it without
understanding what it does.

If you have no specific preferences, just use the defaults by running
this on the command line:

```
./configure
```

It will set up the build environment for you. If, however, you wish
to explore your options and customise the `emacs` program you will
get, then issue the following command and carefully read its output:

```
./configure --help
```

The **minimum I recommend** is to specify where the build artefacts
are stored. I use this, which has not caused me any issues over the
years:

```
./configure --prefix=/usr/local
```

## Configure the build environment with your preferred flags

Once you have understood the available options, go ahead and run
`configure`. For example:

```
./configure --prefix=/usr/local --with-x-toolkit=gtk3
```

Whenever you need to rebuild Emacs with some new flags, run the
`configure` command again, passing it the relevant flags. If you wish
to keep the same options for a new build, then simply do not run
`configure` again.

## Make the program

Once `configure` finishes its work, it is time to run the `make`
program. For new builds, this is as simple as:

```
make
```

Sometimes you have old build artefacts that conflict with changes
upstream. When that happens, the build process will fail. You may then
need to use:

```
make bootstrap
```

In general, `make` is enough. It will be slow the first time, but will
be faster on subsequent runs as it reuses what is already there. A
`make bootstrap` will always be slow though, as it generates
everything anew.

## Install the program that was made

After `make` is done, you are ready to install Emacs:

```
sudo make install
```

You will not need escalated privileges (i.e. `sudo`) is you specified
a `--prefix` with a user directory during the `configure` step. How
you go about it is up to you.

## Keeping Emacs up-to-date

Whenever you wish to update from source, go to where your copy of
emacs.git is (e.g. `~/Builds/emacs.git`) and pull the latest changes
using the `git` program:

```
git pull
```

Then repeat `make` and `make install`. Remember that you do not need
to re-run `configure` unless you specifically want to modify your
build (and if you do that, you probably need to `make bootstrap`).

## Learn about the latest `NEWS`

Emacs users can at all times learn about changes introduced in their
current version of Emacs with `M-x view-emacs-news`. It is bound to
the key `C-h n` by default. This command opens the current `NEWS`
file. With a numeric prefix argument, you get the `NEWS` of the given
Emacs version. For example, `C-u 27 C-h n` shows you what Emacs
version 27 introduced.

## Compare your `NEWS` to those of emacs.git

With the help of the built-in Emacs `ediff` package, you can compare
your latest `NEWS` to those coming from emacs.git. I always do this
after pulling the latest changes from source (with `git pull`).

From the root directory of your copye of emacs.git (e.g.
`~/Builds/emacs.git`), and while using Emacs, you can do `M-x
project-find-file` (`C-x p f`) to search the Emacs "project" for a
file called `etc/NEWS`. This is where the latest user-facing changes
are recorded.

If you are not sure where you are on the filesystem while inside
Emacs, do `M-x cd` (or `M-x dired` or `M-x find-file`), select the
root directory of your emacs.git, hit `RET`, and then do `M-x
project-find-file`.

Now that you have `emacs.git/etc/NEWS` in a buffer, also load your
copy of `NEWS` with `M-x view-emacs-news` (`C-h n`).

Then do `M-x ediff-buffers`, which will prompt for two buffers to
compare. First select your version of `NEWS` and then that of emacs.git.

**NOTE:** I think the default Ediff interface is problematic. Put the
following in your configuration to make it work in a single frame:

```elisp
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
```

Also watch my video with the Ediff basics: <https://protesilaos.com/codelog/2023-11-17-emacs-ediff-basics/>.

This is it. You are now in the flow of building Emacs from source.
Good luck with everything!

## My current build options

```
--prefix=/usr/local --without-xinput2 --without-compress-install --without-gpm --without-selinux --with-native-compilation=yes --with-sound=no --without-gif --without-tiff --with-cairo --with-harfbuzz --with-tree-sitter=ifavailable --with-json --without-gsettings --without-gconf --with-x-toolkit=no --without-toolkit-scroll-bars --without-xft --without-xaw3d
```

I am not updating old publications, unless otherwise noted. The most
up-to-date recode of my Emacs build is documented in my dotemacs:
<https://protesilaos.com/emacs/dotemacs>.

Inspect the value of the Emacs variable `system-configuration-options`
to find out how your Emacs is built.

Have fun!
