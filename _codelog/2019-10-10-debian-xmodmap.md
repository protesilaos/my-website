---
title: 'Debian: set Hyper and other keys with Xmodmap'
excerpt: 'Note on using the "xmodmap" utility to remap keys and enable the Hyper modifier.'
---

I wanted to improve the Emacs experience for some awkward key bindings
that require you to hold down both Ctrl and Meta.  My goal was to create
a shortcut for `C-M-KEY` bindings.

While I could not find a way to simulate that combination by a single
key press, I figured I could just use an extra modifier.

Using Super was not an option.  I already have that as a shortcut for
key sequences such as `C-x b` that become `s-b`.  So I decided to enable
the Hyper key, since my keyboard does not have one by default (standard
US QWERTY).

## Contents of ~/.Xmodmap

Here is my `~/.Xmodmap` in its current form.  It is meant to work on my
Debian 10 'buster' system—your mileage may vary.  The inline comments
should offer the guidance you need.  In short:

+ Use Caps Lock as an extra Control.  This disables the default
  behaviour of locking the letter casing.
+ Map Hyper to the right Super ("windows key").  The left Super remains
  in tact.
+ Assign Compose to the Menu key (positioned to the right of Super_R).
  I use this to type all sorts of useful characters, such as the em
  dash.

```
!!!!!!!!!!!!!!!
! Prior notes !
!!!!!!!!!!!!!!!

! These settings have been implemented succesfully on Debian 10
! 'buster' running a variety of desktop environments on top of Xorg.

! To get the current status of the modifiers:
!
!	xmodmap -pm
!
! To find out the key codes that are available:
!
!	xmodmap -pke
!
! Or narrow the results, e.g.:
!
!	xmodmap -pke | grep -E '(Alt|Shift)'
!
! Alternatively, use `xev` to print the key code upon key press.
!
! Here are some of the most likely candidates for changes:
!
!	keycode 37  = Control_L
!	keycode 50  = Shift_L
!	keycode 62  = Shift_R
!	keycode 64  = Alt_L
!	keycode 66  = Caps_Lock
!	keycode 105 = Control_R
!	keycode 133 = Super_L
!	keycode 135 = Menu

!!!!!!!!!!!!!!!!!
! Modifications !
!!!!!!!!!!!!!!!!!

! Clear the modifiers concerned
clear lock
clear mod3
clear mod4

! Set Caps Lock as an extra Ctrl
keycode 66 = Control_L

! Set the Right Super as Hyper
keycode 134 = Hyper_R

!!! OR Set the Right Alt as Hyper
!! keycode 108 = Hyper_R

! Set the Menu key as Compose
keycode 135 = Multi_key

! Add/update the modifiers
add control = Control_L

! Add a new Hyper_R modifier and move Hyper_L from mod4 to mod3
add mod3 = Hyper_L Hyper_R
add mod4 = Super_L Super_R
```

Create that file and then load it with `xmodmap ~/.Xmodmap`.

## Sample of Emacs keys using Hyper

Everything works as expected on my end.  I can now inspect the functions
that Emacs calls when pressing `C-M-KEY` (do that with `C-h k` followed
by the key press you are interested in).

For example, here is a set of aliases.  These do not change the
defaults.  They just provide additional means of accomplishing the same
task (so replace the initial `H` with `C-M` to view the original keys).

```
(use-package lisp
  :bind (("H-f" . forward-sexp)
		 ("H-b" . backward-sexp)
		 ("H-n" . forward-list)
		 ("H-p" . backward-list)
		 ("H-a" . beginning-of-defun)
		 ("H-e" . end-of-defun)
		 ("H-h" . mark-defun)
		 ("H-d" . narrow-to-defun)
		 ("H-k" . kill-sexp)
		 ("H-K" . backward-kill-sexp)
		 ("H-[" . insert-pair)
		 ("H-]" . delete-pair)
		 ("H-SPC" . mark-sexp)))
```

I have yet to find a way to simulate `C-M-` by just pressing `H-`
without having to define each key binding individually.  For example, I
would like to have something like:

```
(setq (x-ctrl-keysym x-meta-keysym) 'hyper)  ; Not valid elisp
```

With that, Hyper would not be a real modifier.  It would rather be the
same as holding down Ctrl+Alt at the same time.  Will continue exploring
this and update this article accordingly.
