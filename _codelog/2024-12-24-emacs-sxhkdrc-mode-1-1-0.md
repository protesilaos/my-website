---
title: 'Emacs: sxhkdrc-mode version 1.1.0'
excerpt: 'Information about the latest version of my Emacs major mode for editing the Simple X Hot Key Daemon files.'
---

This is a major mode for editing `sxhkdrc` files. SXHKD is the Simple
X Hot Key Daemon which is commonly used in minimalist desktop sessions
on Xorg (I use it with bspwm, herbstluftwm, and i3wm). The `sxhkdrc`
file configures key chords, binding them to commands. For the
technicalities, read the man page `sxhkd(1)`.

+ Package name (GNU ELPA): `sxhkdrc-mode`
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/sxhkdrc-mode>
  + GitLab: <https://gitlab.com/protesilaos/sxhkdrc-mode>
+ Backronym: Such Xenotropic Hot Keys Demonstrate Robustness and
  Configurability ... mode.

* * *

This is a small set of changes to an already stable package.


## The Outline of a file is more refined

Each file now has an outline which consists of comment pseudo headings
(starting with three or more `#` followed by a space) and lines with a
key binding. Before it was just the comment headings.

Additionally, the heading levels are defined such that key bindings
are inside the comment headings when we do the folding. This is what
we have in, for example, `elisp-mode`.

The built-in `outline-minor-mode` benefits from this change as do
third-party commands like `consult-outline` from the `consult`
package.

For example, we can get `outline-minor-mode` folding of this:

    # Focus in the given direction. With Shift move the client in the
    # given direction. With Ctrl resize the frame in the given direction.
    mod4 + {_, shift +, ctrl +} {h,j,k,l}
        herbstclient {focus,shift,resize} {left,down,up,right} {_,_,0.05}

To this:

    # Focus in the given direction. With Shift move the client in the
    # given direction. With Ctrl resize the frame in the given direction.
    mod4 + {_, shift +, ctrl +} {h,j,k,l}...

And the same idea for all heading levels.


## Syntax highlighting includes the dot in command names

I made it so that when we bind a command to a key, we get its full
name highlighted even if that includes a file name extension. So now
the `herbstluftwm_load_workspace_layout.sh` in the following sample
will get colourised instead of the name without `.sh`:

    mod4 + w ; {f,t,h,m}
        herbstluftwm_load_workspace_layout.sh {full,third,half,middle}

Another benefit of this refinement is that something like the built-in
command `mark-sexp` will recognise the whole name as a syntactic unit.
