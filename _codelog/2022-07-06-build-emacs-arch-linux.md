---
title: "How I build Emacs on Arch Linux"
excerpt: "An overview of how I build Emacs on my system for my daily usage and how I keep other executables for testing purposes."
---

As I get this question periodically, it is best to record my approach
here.  That way I can provide a link instead of writing a full reply
each time.

On Arch we can build custom packages cleanly by writing a `PKGBUILD`.
This is a shell script that fetches the source and prepares it for
installation.  In the case of Emacs, we do not need to write the entire
script ourselves: the community-driven Arch User Repository (AUR)
already includes the `emacs-git` package.

As we likely want to customise certain aspects of the build, `emacs-git`
should not be installed as-is (and generally one ought to always inspect
what they install from the AUR).  Instead, we must fetch the `PGBUILD`
source, edit it, and build the package from there.  This requires the
`base-devel` package group.  The resulting output is a regular package
as far as the `pacman` is concerned.

We get the build script:

    git clone https://aur.archlinux.org/emacs-git.git/ path/to/emacs-git-aur

Then we change to the `emacs-git-aur` directory and visit the `PKGBUILD`
file.  It is properly annotated so one must **read all the comments
carefully** to understand what each variable pertains to.

As of this writing, I am experimenting (again) with the PGTK build and
am running various Wayland DEs/compositors, including GNOME 42, so I
made this change:

```diff
 PKGBUILD | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/PKGBUILD b/PKGBUILD
index a084fc0..0430a5b 100644
--- a/PKGBUILD
+++ b/PKGBUILD
@@ -45,9 +45,9 @@ GPM=              # Mouse support in Linux console using gpmd.
 NOTKIT=           # Use no toolkit widgets. Like B&W Twm (001d sk00l).
                   # Bitmap fonts only, 1337!

-PGTK=             # Use native GTK3 build. Supports Wayland, yay!
+PGTK="YES"        # Use native GTK3 build. Supports Wayland, yay!

-GTK3="YES"        # GTK3 old windowing interface.
+GTK3=             # GTK3 old windowing interface.

 LUCID=            # Use the lucid, a.k.a athena, toolkit. Like XEmacs, sorta.
                   #
```

I already want native compilation, which the script already enables, so
the above diff is enough.  The next step is to build the package
outright (`$` refers to regular user privileges):

    /path/to/emacs-git-aur $ makepkg -siC

Remember to check `makepkg --help` to understand what those flags do.
Basically, the `-C` is not necessary here, but I added it just to be
sure (it is required for clean builds).

As a final step, `makepkg` will prompt to install the package and ask to
escalate privileges.  In case we miss that part, we do not need to
restart the whole process.  The easier way is to check the directory we
are in for a file named `emacs-git-29.0.50.157962-1-x86_64.pkg.tar.zst`
or something like that and run the following (`#` denotes superuser
privileges):

    /path/to/emacs-git-aur # pacman -U emacs-git-29.0.50.157962-1-x86_64.pkg.tar.zst

**The first build will take a long time**, especially with native
compilation enabled, but subsequent ones shall be faster (I wrote this
blog post while waiting for it).

Rebuilding a package automatically fetches the updates.  All we ever
need is to re-run `makepkg -si` (occasionally with `-C` included).
However, as time goes by, we might also have to check the `PKGBUILD` for
updates, such as when new build options are added upstream.  No problem!
We just `git pull` from the source we cloned earlier (the
`https://aur.archlinux.org/emacs-git.git/`).  Again, the rest is all
about scrutinising the `PKGBUILD` and running `makepkg`.

## My unsophisticated approach to multiple builds of Emacs

The above are enough for my own usage.  As I maintain [lots of package
for Emacs](https://protesilaos.com/emacs), I need to keep Emacs 27 and
28 around to test things.  Rather than install the different binaries
and handle the separate `.desktop` entries, I do the poor programmer's
trick of building but not installing anything.

We download the tarball from a GNU mirror as explained on [the official
Emacs website](https://www.gnu.org/software/emacs/download.html).  For
this example I am using `emacs-26.3.tar.xz`.  We unpack it into a target
directory and switch to it.  The `INSTALL` file which found at the root
of that directory provides all the information we need.

Assuming all the dependencies are satisfied, these shell invocations are
enough:

    path/to/emacs-26.3 $ ./configure
    path/to/emacs-26.3 $ make

Normally we would install the build artefacts, but since this executable
is only needed for testing purposes, we can stop at the `make` step
(plus, a generic `make install` does not produce a valid package for
`pacman`).

After `make`, the `emacs` executable is inside the `src` directory.  If
we ever need to run it, we do:

    path/to/emacs-26.3/src $ ./emacs

And because this is for testing purposes, the addition of the `-Q` flag
is the norm:

    path/to/emacs-26.3/src $ ./emacs -Q

## Learning about the Emacs build options

The above is a streamlined experienced that I have been using for more
than a year now on a regular basis.  I have never had a need to delve
into the minutia.  If, however, one wants to do that then the
authoritative sources are the `INSTALL` and `INSTALL.REPO` files in the
Emacs repository:

    git clone https://git.savannah.gnu.org/git/emacs.git

The former is for tarballs, such as the above example with Emacs 26
while the latter is for tracking the development version.

For example, the `INSTALL.REPO` tells you how to list all the build
instructions and relevant environment variables once the `configure`
script has been produced:

    path/to/emacs.git $ ./configure --help

Read the sources for the details.  Good luck!
