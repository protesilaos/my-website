---
title: "Reply to Emacs questions about configuration, Evil, and more"
excerpt: "A detailed response to questions about my Emacs configuration and various preferences thereof."
---

This is in response to [issue 12 in my dotfiles.git](https://github.com/protesilaos/dotfiles/issues/12).
I am posting it here since (i) some of the information is useful in
general and (ii) it is easier for me to find it here.

The specifics of my Emacs configuration:

- <https://protesilaos.com/emacs/doteamcs>
- <https://github.com/protesilaos/dotfiles/tree/master/emacs>

* * *

## Configuration modules and Elisp packages

> What is the motivation to divide between what seems to be like e.g.
> prot-lisp consisting of what seems to be just functions (library)
> and prot-emacs-modules which seems to be just package configuration
> (like what you'd fine in the body of a use-package declaration)?

I keep `prot-emacs-modules` and `prot-lisp` separate because they have
a different role. The latter consists of what effectively are Emacs
Lisp "packages". I write them in the same style as actual packages
that I maintain (check <https://protesilaos.com/emacs>).

The modules are the specifics of my configuration. They have the exact
preferences I rely on in my current session. A package may define
options. The module picks one among them.

This is exactly what we all do when we configure a package from GNU
ELPA, for example: the package defines options and in our `init.el` we
set it up as we see fit.

Strictly speaking, this distinction is not necessary for a personal
Emacs configuration. All the code is mine. I could easily hardcode
values, not provide abstractions, and not bother with clear points of
entry. Doing so would work well for my use-case, which is the main
goal of all this code, anyway. But that would be a counterproductive
habit; "counterproductive" because I want the code I write to be easy
for others to copy and adapt. It also conditions me to be more
thoughtful with my programs and more organised with my writings.

There are some exceptions where a function is defined in the modules.
This is either because the function really is about my configuration
or it is part of some experiment I am doing.

## Trying out my custom modeline

> Also, is there anything you'd suggest to make it easier to try out
> e.g. your modeline from the config and and tweak from it into my
> own? Copying the contents of those two files and trying to evaluate
> it is not enough as it depends on other functions. I guess the only
> way is to take your whole config and play with it in a separate
> emacs --init-directory and dig around for relevant parts, right?

It is probably better for you long-term to follow the video I did
about writing a custom modeline and tweaking its colours:

- <https://protesilaos.com/codelog/2023-07-29-emacs-custom-modeline-tutorial/>
- <https://protesilaos.com/codelog/2024-01-13-customize-emacs-mode-line/>

By understanding those concepts, you will be prepared to copy only the
parts you need from `prot-modeline.el` and tweak them accordingly.

That granted, here is how you can get my code into your setup (and
anything from `prot-lisp/` for that matter). The `use-package` for
`prot-modeline` is the equivalent of what I have in my modules right
now.

```elisp
(use-package prot-common
  :vc ( :url "https://github.com/protesilaos/dotfiles"
        :lisp-dir "emacs/.emacs.d/prot-lisp"
        :main-file "prot-common.el"
        :rev :newest))

(use-package prot-modeline
  :vc ( :url "https://github.com/protesilaos/dotfiles"
        :lisp-dir "emacs/.emacs.d/prot-lisp"
        :main-file "prot-modeline.el"
        :rev :newest)
  :config
  (setq mode-line-compact nil) ; Emacs 28
  (setq mode-line-right-align-edge 'right-margin) ; Emacs 30
  (setq prot-modeline-show-frame-name (alist-get 'undecorated initial-frame-alist))

  (setq-default mode-line-format
                '("%e"
                  prot-modeline-kbd-macro
                  prot-modeline-narrow
                  prot-modeline-buffer-status
                  prot-modeline-window-dedicated-status
                  prot-modeline-input-method
                  "  "
                  prot-modeline-buffer-identification
                  "  "
                  prot-modeline-major-mode
                  prot-modeline-process
                  "  "
                  prot-modeline-frame-name
                  "  "
                  prot-modeline-vc-branch
                  "  "
                  prot-modeline-eglot
                  "  "
                  prot-modeline-flymake
                  "  "
                  mode-line-format-right-align ; Emacs 30
                  prot-modeline-which-function-indicator
                  prot-modeline-notmuch-indicator
                  "  "
                  prot-modeline-misc-info)))
```

## About not using `use-package`

> It seems you don't use use-package (I see `(require ...` in the
> modules) anymore? Curious why.

I consider this "sand in the gears". It forces those who read my
configuration to slow down and be careful about what they are copying.
If they just paste my Elisp into their setup, they will get an error.
Slowing down gives them the chance to read the code and think about
what they are working towards.

Yes, this sounds like I am doing them a disservice. But I think they
will benefit from this practice long-term. Copying willy-nilly is how
you never learn.

Concretely about the use of `require`, in the modules I use my own
macros. Every `require` should be wrapped in a `prot-emacs-configure`.
Not all my modules rely on `require` though. I have some packages that
are loaded when a certain condition is met, typically via a hook.

In `prot-lisp/` the use of `require` is standard: this is how packages
are supposed to do it.

By the way, writing my own configuration macros has helped me
understand things at a deeper level. It also gives me maximum control
over my setup. But the real reason is the sand in the gears that I
alluded to.

## Autoloads and deferred loading

> Is there any reason to autoload features? I've come across some
> guides on using Emacs and it seems people tend to prefer to autoload
> everything as much as possible but I feel like it only makes sense
> to autoload only features you might not use during a session. The
> time to load on startup when you front load instead of autoload
> seems less important than the time it takes to load when you
> actually use a feature during a session. Especially if running Emacs
> as a server or using a single long-running instance.

With `use-package` you get deferred loading when you use keywords such
as `:bind` and `:hook`. Internally, this depends on the `autoload`
mechanism that Emacs has. Autoloads are hints that inform Emacs about
the existence of some function or variable in a certain file. When
that symbol is called for the first time before its file is loaded,
Emacs goes to the corresponding file, evaluates everything, and then
runs the original code. For example:

```elisp
(autoload 'prot-test-hello "prot-test")
```

If we call `prot-test-hello`, Emacs evaluates `prot-test.el`, and runs
`prot-test-hello`. This works only if the file is in the `load-path`.

Users generally do not need to understand the technicalities. When
installing a package, Emacs generates an index of all the autoloads
automatically. If you are curious, go to the `elpa/` subdirectory of
your Emacs directory, find a package, and read the autolaods file
(e.g. `denote-autoloads.el`).

Strictly speaking, deferred loading is not necessary. If you are going
run Emacs for several hours non-stop, then the ~60 seconds it takes to
load an average configuration do not matter. Even ten minutes are not
be important in such a scenario: you can brew a coffee in the meantime.

Deferred loading is still beneficial though:

- It makes you think about the relationship between the various parts
  of your configuration. Having an Emacs that loads fast and works
  well means that you have understood how you are piecing things
  together.
- Deferred loading makes it easier to experiment with your
  configuration and to restart Emacs when necessary. Imagine wanting
  to try things out, restart Emacs, and wait for several minutes each
  time... That breaks your flow.

Autoloads help you discover new features. For example, when you press
`M-x` in a generic Emacs you are presented with thousands of options.
Most of those are not loaded yet. Emacs just knows the symbols and
will load their files when you make the selection. A package developer
can leverage this feature to provide functionality that may be useful
only under certain circumstances. That is a helpful way for the user
to notice the before and after states. It also gives the user maximum
control of what to load and when, which improves confidence in one's
Emacs configuration.

## GUI or terminal

> Do you ever run Emacs on the terminal or GUI only and do you always
> have a single long-running instance or do you sometimes use multiple
> instances?

I always use the GUI. It can combine different font families and font
sizes and it can also display images---how else am I supposed to check
my selfies? The terminal is fine in its own right and is especially
useful for remote connections. But I do not have that use-case.

My terminal emulator is `xterm`, by the way. It works well, though I
do not rely on it. Everything that could be done in a terminal is
handled by Emacs. I also am on Debian stable, so trying the newest
programs is neither a straightforward option nor a priority: I have a
stable setup and focus on getting work done.

I use a single instance of Emacs. In my configuration I also have
`server-start`. This gives me the option to evaluate Emacs Lisp code
even when Emacs is not focused, such as when I switch the theme of my
entire desktop environment or window manager.

I do not run Emacs for long hours. When I am done with whatever I am
working on, I switch off the computer. The typical workflow is for 2-3
hours maximum. Then I will do some outdoor activity.

## Choice of keybindings and Evil

> Any thoughts on using Evil?

It is fine and I am indifferent to it. What makes Emacs so nice is
that you can evaluate Emacs Lisp live and work with the new state. The
choice of keybindings is a personal choice. There is no better or
worse.

People will, of course, argue about which paradigm is more efficient.
This is the kind of knowledge that seldom translates into real-world
productivity. The bottleneck is how fast and how well you can think.
Then what matters are the qualities of your output. Moving text around
quickly does not make you productive per se or, indeed, a decent
writer/programmer.

This is a matter of comfort though, which can indirectly influence
your productivity simply by improving your mood and willingness to
write. I put colours and fonts in that same category. If it makes you
feel better, then use it.

That granted, to configure `evil-mode` properly you need to have a
solid understanding of Emacs and be willing to control every part of
your setup. Otherwise you will run into cases where something does not
work as expected and you will not know how exactly to change it.

> It seems like you're willing to embrace Emacs defaults--is there
> anything you've still maintained Emacs to be more Vim-like, e.g.
> modal and arguably more ergnomic/mnemonic?

The general scheme of Emacs default keybindings is good enough for me.
Though I change plenty of keybindings to do what I want. Actually, I
plan to rebind basics such as `C-n`, but I have not found the time to
do it thoroughly. There are many default keybindings that I do not
like.

I do not think Vim is ergonomic by default. Impulsively reaching out
to the Escape key is not helpful, especially if you are twisting the
wrist in the process. Typing Shift with the relatively weak small
fingers is not beneficial either. Yes, you can circumvent those, but I
am referring to the out-of-the-box experience, because if you are
thinking about making changes then you might as well do the same for
the Emacs-style keys.

Emacs keys are not ergonomic either. Ergonomics is a matter of the
entire office setup, from the keyboard, to the desk, the placement of
the monitor, the typing style. I have an article on the matter:
<https://protesilaos.com/codelog/2026-05-04-emacs-keyboard-ergonomics/>.

My custom keyboard has `hjkl` mapped to the arrow keys on a so-called
"layer" that I can activate with my thumbs. The `yuio` keys above
correspond to `Home`, `PageDn`, `PageUp`, `End`, respectively. Those
are the bigger motion counterparts of the cardinal directions. Extend
this to `Ctrl` and one of those keys to perform a different motion,
like `C-<home>` to go to the beginning of the buffer, `C-<right>` to
move forward by a word. This works everywhere, by the way.

I actually have plenty of articles on the topic of keyboards, if you
are so inclined: <https://protesilaos.com/keeb>.

## Persisting Emacs sessions

> I may have missed this, but how do you approach persistent session
> (if at all)?

I do not. This is not necessary in my workflow. I have bookmarks for
the buffers/files I visit frequently. Then I have Git projects that I
always keep in a clean state with a history that is meaningful. When I
need to work on something, I switch to the bookmark/project and start
from where I left it.

> I like that if I return a project I've worked on a few weeks ago,
> restoring these aspects is a good way to suggest where I last left
> off instead of starting from scratch (little things like window
> layout or set of open buffers is suggestive of progress of the
> project).

This is a matter of how one's brain works. Mine is more abstract, so
having things in a specific spatial arrangement does not add much
value. Configuring Emacs to take care of all relevant cases is thus
not appealing to me. I will commit my changes and leave everything in
a condition that makes the next step obvious. I am happy to write
`TODO` and `FIXME` comments in my code and/or have a relevant task in
my Org agenda. This is a matter of logical sequencing. It is easier
for me to reason about it.

I used to load the built-in `desktop.el`. Then I realised that loading
hundreds of buffers for something that I might not need is
counter-productive. Furthermore, storing a specific state for a
potential future occasion requires that I remember to load the right
file, manage all such files, and so on, which is cognitively
burdensome and ultimately no more efficient than working with Git.
