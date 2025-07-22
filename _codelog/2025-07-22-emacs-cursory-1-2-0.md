---
title: "Emacs: cursory version 1.2.0"
excerpt: 'Information about the latest version of my Cursory package for GNU Emacs.'
---

Cursory lets users define preset configurations for the cursor. Those
cover the style of the cursor (e.g. box or bar), whether it is
blinking or not, and how fast, as well as the colour it uses. Having
distinct presets makes it easy to switch between, say, a "reading
mode" with an ambient cursor and a "presentation mode" with a cursor
that is more noticeable and thus easier to spot.

+ Package name (GNU ELPA): `cursory`
+ Official manual: <https://protesilaos.com/emacs/cursory>
+ Change log: <https://protesilaos.com/emacs/cursory-changelog>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/cursory>
  + GitLab: <https://gitlab.com/protesilaos/cursory>
+ Backronym: Cursor Usability Requires Styles Objectively Rated Yearlong.

Below are the release notes.

* * *


## Version 1.2.0 on 2025-07-22

This version contains small additions to a stable package.


### Set the last preset when starting up Emacs

The new function `cursory-set-last-or-fallback` makes it easier to set
the last known preset when starting Emacs or via a hook such as `after-init-hook`.
Internally, it takes care to fall back to a set of default values that
always work.

Before the introduction of `cursory-set-last-or-fallback` users had to
do something like this:

```elisp
;; Old way of setting a preset:
(cursory-set-preset (or cursory-last-selected-preset cursory-recovered-preset 'box))

;; Old way of doing the above via a hook:
(add-hook 'after-init-hook (lambda () (cursory-set-preset (or cursory-last-selected-preset cursory-recovered-preset 'box))))
```

Those would also fail if the named preset did not exist (`box` in the
above example). Whereas the addition of a fallback preset guarantees a
result that works.

Note that I am defining the `cursory-fallback-preset` using `defconst`
instead of exposing it as a user option. This is to avoid a scenario
where the values are accidentally set incorrectly.


### Presets can define a `:cursor-color`

This is a new attribute which corresponds to the background value of
the `cursor` face.

-   When the value is nil or `unspecified` (the default), Cursory does
    not modify the `cursor` face.

-   When the value is a hexadecimal RGB color value, like `#123456` it
    is used as-is. Same if it is a named color among those produced by
    the command `list-colors-display`.

-   When the value is the symbol of a face (unquoted), then the
    foreground of that face is used for the `cursor` face, falling back
    to `default`.

Concretely, users can have something like this in their configuration:

```elisp
(setq cursory-presets
      '((box
         :cursor-color "#21439f"
         :blink-cursor-interval 1.2)
        (baring
         :cursor-type (bar . 2)
         :cursor-color error ; the `error' face will typically be red (see `list-faces-display')
         :blink-cursor-interval 0.8)
        (underscore
         :cursor-color "green" ; see `list-colors-display'
         :cursor-type (hbar . 1)
         :blink-cursor-interval 0.3
         :blink-cursor-blinks 50)
        (t ; the default values
         :cursor-color unspecified ; use the theme's original
         :cursor-type box
         :cursor-in-non-selected-windows hollow
         :blink-cursor-mode 1
         :blink-cursor-blinks 10
         :blink-cursor-interval 0.2
         :blink-cursor-delay 0.2)))
```

Remember to read the documentation of `cursory-presets` for all the rest.


### The `cursory-mode` persists the `:cursor-color` while changing themes

Before, the `cursory-mode` would only take care to save the last
selected preset and to persist it across Emacs sessions. In addition
to that, it now also ensures that loading a new theme does not
override the `:cursor-color`.


### The `cursory-set-preset` prompt is smarter about its default value

When the `cursory-set-preset` is called interactively, it uses the
minibuffer to prompt for a preset among the `cursory-presets`.

In the past, its default value would simply be the last selected
preset. Cursory would not check whether that symbol was still a member
of the `cursory-presets`. This had the potential to set the wrong
configurations.

Now the prompt only uses as its default value the last selected and
existing preset among those found in the history of selections. It
will not provide a default if it cannot find any.

Note that the &ldquo;default value&rdquo; in the context of the minibuffer refers
to the input that will normally be provided if the user types `RET`
without writing anything into the minibuffer.
