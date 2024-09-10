---
title: "Emacs: show-font version 0.1.0"
excerpt: 'Information about the latest version of my show-font package for GNU Emacs.'
---

This is about the first version of `show-font.el`. I just pushed the
changes to show-font.git and elpa.git, so expect the new package to be available in the coming hours. Below are some screen shots and the release notes for version `0.1.0`.

## Sources

+ Package name (GNU ELPA): `show-font`
+ Official manual: <https://protesilaos.com/emacs/show-font>
+ Change log: <https://protesilaos.com/emacs/show-font-changelog>
+ Git repository: <https://github.com/protesilaos/show-font>
+ Backronym: Show How Outlines Will Feature Only in Non-TTY.

## Screen shots

Always  **click to enlarge** the image for best results.

<a href="{{'/assets/images/attachments/2024-09-10-emacs-show-font-light.png' | absolute_url }}"><img alt="show-font.el with different fonts using a light theme" src="{{'/assets/images/attachments/2024-09-10-emacs-show-font-light.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2024-09-10-emacs-show-font-dark.png' | absolute_url }}"><img alt="show-font.el with different fonts using a dark theme" src="{{'/assets/images/attachments/2024-09-10-emacs-show-font-dark.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2024-09-10-emacs-show-font-list-light.png' | absolute_url }}"><img alt="show-font.el with different fonts in a list using a light theme" src="{{'/assets/images/attachments/2024-09-10-emacs-show-font-list-light.png' | absolute_url }}"/></a>

<a href="{{'/assets/images/attachments/2024-09-10-emacs-show-font-list-dark.png' | absolute_url }}"><img alt="show-font.el with different fonts in a list using a dark theme" src="{{'/assets/images/attachments/2024-09-10-emacs-show-font-list-dark.png' | absolute_url }}"/></a>

## Version 0.1.0 on 2024-09-10

With `show-font` the user has the means to preview fonts inside of
Emacs. This can be done in the following ways:

-   The command `show-font-select-preview` uses the minibuffer to
    completion with completion for a font on the system. The selected
    font is then displayed in a bespoke buffer.

-   The command `show-font-list` produces a list with all the fonts
    available on the system each font on display is styled with its
    given character set.

-   The `show-font-mode` is a major mode that gets activated when the
    user visits a `.ttf` or `.otf` file. It will preview with the font,
    if it is installed on the system, else it will provide a helpful
    message and an option to install the font (NOTE 2024-09-10: this
    only works on Linux).

The previews include a pangram, which is controlled by the user option
`show-font-pangram`. The default value is a playful take on the more
familiar &ldquo;the quick brown fox jumps over the lazy dog&rdquo; phrase. Users
can select among a few presets, or define their own custom string.

The function `show-font-pangram-p` is available for those who wish to
experiment with writing their own pangrams (it is not actually limited
to the Latin alphabet).

The user option `show-font-character-sample` provides a more complete
character set that is intended for use in full buffer previews (i.e.
not in the list of fonts). It can be set to any string. The default
value is a set of alphanumeric characters that are commonly used in
programming: a good monospaced font should render all of them
unambiguously.

Finally, the following faces control the appearance of various
elements.

-   `show-font-small`
-   `show-font-regular`
-   `show-font-medium`
-   `show-font-large`
-   `show-font-title`
-   `show-font-title-small`
-   `show-font-misc`
-   `show-font-button`
