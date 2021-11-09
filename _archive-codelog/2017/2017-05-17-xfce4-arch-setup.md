---
title: "My easy Xfce setup on a clean Arch install"
subtitle: "Dotfiles to the rescue"
excerpt: "I use my 'dotfiles' git repo to restore my Xfce setup on a new Arch Linux base"
date: 2017-05-17
permalink: /codelog/xfce-arch-setup/
---
**UPDATE 2018-06-26:** This post is out of date.  
I have since switched full time to Debian Sid. I currently use a highly customised environment around `bspwm`.
{:.critical}

I recently had to re-install Arch Linux on one of my machines. What I needed was to setup my current desktop environment with as little effort as possible. Recreating it from scratch would have taken several hours, if not days. Good thing I maintain a git repo with [my dotfiles](https://gitlab.com/protesilaos/dotfiles).

Once I had access to the shell, I cloned the repo, copied `.bashrc` and `.vimrc`, and went on to install the Xfce desktop environment as well as all the packages I use.

The installation is pretty straightforward. In my dotfiles I maintain backups with the lists of packages. All that is needed is to feed the content of such a file into a `pacman` command, such as:

```shell
# Download packages from main repos
sudo pacman -S - < dotfiles/pacman/native.txt
```

If I feel like also putting the AUR packages in place, I first build `pacaur` (the AUR helper):

```shell
bash dotfiles/my-utils/pacaur-build.sh
```

That command runs this nifty script:

```shell
#!/bin/sh

# System update
sudo pacman -Syu

# Prepare build dir
mkdir -p /tmp/pacaur-build
cd /tmp/pacaur-build

# Base devel packages
sudo pacman -S binutils make gcc fakeroot --noconfirm --needed

# Pacaur deps
sudo pacman -S expac yajl git --noconfirm --needed

# Cower build
if [ ! -n "$(pacman -Qs cower)" ]; then
    curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
    makepkg PKGBUILD --skippgpcheck --install --needed
fi

# Pacaur build
if [ ! -n "$(pacman -Qs pacaur)" ]; then
    curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
    makepkg PKGBUILD --install --needed
fi

# Prune
cd ~
rm -r /tmp/pacaur_install
```

Then the process for getting the AUR packages is the same as with the native list:

```shell
# Install AUR packages
pacaur -S - < dotfiles/pacman/foreign.txt
```

Since these may contain a program that requires lots of time to compile, I tend to select only what I truly require. The rest are set up whenever I need them.

## GNU/Linux portability is a blessing

I was aware of the potential of backing up everything that pertains to a GNU/Linux machine. I just never had any practical experience with it. I have been maintaining my dotfiles mostly for reverting to a stable state whenever I go out trying certain customisations. It turns out that approach applies to a clean system install.

This has been my first attempt at replicating a custom Xfce setup on a clean Arch Linux base. I am happy with the results, though I believe the process could be automated even further. Perhaps via a script that would take care of all the configurations in the local `.config` as well as the system files. I still need to research that and act accordingly.

Whatever the case, the freedom to experiment with data porting is there.
