---
title: "Dotfiles: Emacs is now part of my live theme switch"
excerpt: "Details of a git commit that integrates Emacs with my script for performing a system-wide theme switch."
---

In my dotfiles I have a script for performing a live theme switch across
my entire custom desktop session, built around BSPWM.

As of [commit
9ee6a04](https://gitlab.com/protesilaos/dotfiles/commit/9ee6a04755a2b40e0ef6b65509a98e5b6671467c),
the theme switch also affects Emacs, though it was originally designed
for Vim, Tmux, and other tools.  It uses the `emacsclient -e` facility
to run an elisp function of mine that toggles between my two
Emacs-specific themes (the "Modus themes").

Here is the essential code part (with `_depcheck` just being a function
that checks for the presence of the binary by leveraging `command -v`):

```
_emacs() {
    _depcheck emacs

    pgrep -x emacs > /dev/null || return 1

    emacsclient -e "(prot/modus-themes-toggle)"
}
```

The commit message is rather comprehensive, so I am quoting it in its
entirety:

```
Add Emacs theme switch to the T.E.M.P.U.S. script

I just need to provide some background information on this, in order to
avoid confusion.

Tempus themes (Vim, terminals, GTK editors)
-------------------------------------------

The Tempus themes project covers Vim, terminal emulators, and some GTK
text editors (including GNOME Builder).  Its overarching objective is
that of a minimum contrast ration of 4.5:1 (WCAG AA) between the
background and foreground values.  Other tools like Tmux and Dunst all
make use of its colour values.

Because of their roots in terminal emulators, the Tempus themes use the
16-colour palette you find on such tools.  Refer to the portal page for
more on the matter.[1] The project is in a stable state.

Modus themes ("just" GNU Emacs)
-------------------------------

Whereas the Modus themes are designed specifically for Emacs.  They are
much more complex and consist of a wider colour palette that covers the
extensive array of interfaces inside of Emacs.  Their principal
objective is similar to that of the afore-mentioned project: a minimum
contrast ratio of 7:1 (WCAG AAA).

Some items in the Tempus themes collection also conform with this higher
standard, but the project as a whole only guarantees the "AA" score.

Check the git source of the Modus themes.[2] They are under heavy
development.

Project history
---------------

The Tempus themes came first (2017) and are a core part of my custom
desktop session since its early days.  Every relevant interface was
built around them.

As of commit ec885d1 I am in the process of gradually incorporating my
new Emacs setup in my dotfiles.[3]  This means lots and lots of breaking
changes and necessary adjustments.

FEAR NOT: my free/libre book "Prot's Dots For Debian" (PDFD) still
works,[4] because it uses a snapshot of my dotfiles that contains code
before the commit I just referenced.[5] PDFD guides you through the
process of reproducing my custom desktop session on Debian 10 'buster'.
I recently updated it by adding an Annex on the topic of multi-monitor
support in BSPWM (and there have been other minor updates since its
official release in early July 2019).

The T.E.M.P.U.S. script (tempus)
--------------------------------

Now the part that may cause confusion: the TEMPUS script performs a live
theme switch across my entire custom desktop session.  In the past, this
meant using one of the items in the Tempus themes collection to apply
the new colour values.  I thus gave the script a funny and convenient
backronym: Themes Every Meticulous Person Ultimately Seeks (TEMPUS).

Recall that the word "tempus" is Latin for "time" because the first
items of the collection were named after the four seasons:

+ tempus autumn
+ tempus spring
+ tempus summer
+ tempus winter

At any rate, and jokes notwithstanding, the backronym had the technical
upside of offering a straightforward syntax for performing a theme
change via a CLI prompt: you just had to type `tempus' followed by the
unique identifier of an item from the Tempus themes collection.  For
example, to switch to Tempus winter, you would run `tempus winter'.

The other benefit was a more consistent naming convention for the
`dmenu' front-end that offers an interactive medium for selecting an
item from the collection: `tempusmenu'.

I think that the script's name is okay, because it still uses the themes
it was originally designed for.  Besides, I have no intention to remove
support for the Tempus themes.  The project is still relevant.

What I am doing with this commit, is just including a small function
that performs a "theme switch" for yet another component of my custom
desktop session: Emacs.  The fact that Emacs internally uses another
project of mine (the Modus themes) should not really matter.  The
end-user effect is exactly the same as before.

I am just writing all this to make things clear and to refer to the
present commit in case someone asks.

[1]: https://gitlab.com/protesilaos/tempus-themes
[2]: https://gitlab.com/protesilaos/modus-themes
[3]: https://protesilaos.com/emacs/dotemacs
[4]: https://protesilaos.com/pdfd
[5]: https://gitlab.com/protesilaos/dotfiles
```
