---
title: "Auto-unlock SSH keys on KDE Plasma 5"
subtitle: "A neat trick to save time on entering passwords"
excerpt: "How to add a simple autostart script to automatically unlock ssh keys when loging in to KDE Plasma 5."
date: 2018-06-07
permalink: /codelog/kde-ssh-add/
---
I am using the KDE Plasma 5 desktop environment on my Debian Sid machines. Everything is great, except the handling of ssh keys. By default, these are not stored in the system's password manager, `kwallet`. What I needed was a way to automatically unlock my keys at login.

Searching online for a solution gave a direction, but no immediate solution. The answers provided in the Arch Wiki and relevant fora did not work. So I had to experiment a bit. After a few rounds of trial and error, I figured out a surprisingly simple solution.

## The solution

Note that this works on an up-to-date Debian Sid (aka Debian "unstable") distribution, running the `kde-full` metapackage. Adapt accordingly based on your distribution's conventions.
{:.note}

Start by creating a new script `~/.config/autostart-scripts/ssh-unlock.sh` with the following:

```sh
#!/bin/bash
SSH_ASKPASS=/usr/bin/ksshaskpass ssh-add $HOME/.ssh/YOUR-KEY-1 $HOME/.ssh/YOUR-KEY-2 </dev/null
```

Replace `YOUR-KEY` with the path to your keys. Then make that script executable:

```sh
chmod +x ~/.config/autostart-script/ssh-unlock.sh
```

Done! When you log back in, you will be asked to provide the password for each of your keys. Make sure you tick the box to store the contents in the KDE wallet.
