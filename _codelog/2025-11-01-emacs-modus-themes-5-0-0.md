---
title: 'Emacs: modus-themes version 5.0.0'
excerpt: 'Information about the latest version of my highly accessible themes for GNU Emacs.'
---

I just published the latest stable release of [the Modus
themes](https://protesilaos.com/emacs/modus-themes). The change log
entry is reproduced further below. For any questions, you are welcome
to [contact me](https://protesilaos.com/contact/). I will now work to
apply these same changes to emacs.git, so please wait a little longer
for the updates to trickle down to you.

+ Package name (GNU ELPA): `modus-themes` (also built into Emacs 28+)
+ Official manual: <https://protesilaos.com/emacs/modus-themes>
+ Change log: <https://protesilaos.com/emacs/modus-themes-changelog>
+ Colour palette: <https://protesilaos.com/emacs/modus-themes-colors>
+ Sample pictures: <https://protesilaos.com/emacs/modus-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/modus-themes>
  + GitLab: <https://gitlab.com/protesilaos/modus-themes>
+ Backronym: My Old Display Unexpectedly Sharpened ... themes.

* * *

## 5.0.0 on 2025-11-01

This is a major release. There are some small breaking changes. The
big new feature is that Modus can be used as the basis for other theme
projects. Two of my other theme packages, the `ef-themes` and the
`standard-themes` are already done in this way: their next major
versions will formalise what I have been developing for a while now
(though the `doric-themes` will remain their own thing for the time
being).


### Build on top of Modus

This is of immediate interest to package developers or advanced users.
It changes nothing for existing users of the Modus themes. Please
refer to the manual on the matter and feel welcome to contact me if
you have any questions&#x2014;I am happy to help.

Evaluate:

```elisp
(info "(modus-themes) Build on top of the Modus themes")
```

Or visit: <https://protesilaos.com/emacs/modus-themes#h:86eb375b-9be4-43ce-879a-0686a524a63b>.

Why build on top of Modus? To benefit from (i) the wide face coverage
and extensive detail-oriented testing, (ii) the use of palette
mappings, (iii) the palette preview done with
`modus-themes-list-colors` or related, (iv) the inclusion of the
derivative theme in the workings of all Modus commands that load a
theme, like `modus-themes-rotate` and `modus-themes-select` (see the
new minor mode `modus-themes-include-derivatives-mode`).

Derivative themes can be as simple as a few extra colours on top of,
say, `modus-operandi`. They can also be more involved, with new
palette mappings and custom faces that use them. Such themes can
define commands which load only their own themes (see
`modus-themes-define-derivative-command`) and they can even take over
the Modus themes completely, in terms of becoming the only ones that
are exposed to the commands that load a theme, like
`modus-themes-rotate` and `modus-themes-select`.

Thanks to Suleyman Boyar for fixing an intermediate omission with an
earlier version of the code that derives a theme. I did eventually
change the whole approach to use a function instead of a macro, but
Suleyman's contribution was still useful at the time. This was done in
pull request 156: <https://github.com/protesilaos/modus-themes/pull/156>.
The change is small, meaning that Suleyman does not need to assign
copyright to the Free Software Foundation.


### Colours can be copied from the palette preview buffer

The commands `modus-themes-list-colors` and `modus-themes-list-colors-current`
display the given theme's palette in a tabulated listing. Each line
visualises the colour it references. From that buffer it is now
possible to call the following commands (bound to the `modus-themes-preview-mode-map`):

| Default key binding | Name of the command                    |
|---------------------+----------------------------------------|
| `w`                 | `modus-themes-preview-mode-copy-color` |
| `W`                 | `modus-themes-preview-mode-copy-entry` |
| `m`                 | `modus-themes-preview-mode-mark`       |
| `M`                 | `modus-themes-preview-mode-mark-all`   |
| `u`                 | `modus-themes-preview-mode-unmark`     |
| `U`                 | `modus-themes-preview-mode-unmark-all` |

The `modus-themes-preview-mode-copy-color` and its
`modus-themes-preview-mode-copy-entry` counterpart work on the line at
point or those that are marked. The first copies the resolved colour
value, as a string ("resolved" here means that it will find what a
palette mapping actually stands for). The second gets the complete
palette entry, as it appears in the underlying definition. This is a
starting point for writing palette overrides.

Thanks to shimeike for reporting a problem with a regression I
introduced by mistake in one of the development versions of the
function that handles the creation of the tabulated list. This was
done in issue 163: <https://github.com/protesilaos/modus-themes/issues/163>.


### New semantic palette mappings for programming contexts

The `fnname-call` and `variable-use` are now available. They are
applied to faces that are used by major modes which build on top of
`tree-sitter` program as well as the Emacs Lisp semantic highlighting
feature of Emacs 31.

By default, these colours are more subtle than their `fnname` and
`variable` counterparts. The reason is that I want to avoid
exaggerations with the wanton application of colour ("avoiding
exaggerations" is one of the design principles of the Modus themes).

Because of the commitment to the highest legibility standard for
colour contrast, we are using colours that stand out in their context,
yet are still harmonious with each other. This is due to (i) careful
consideration of colour harmonies, (ii) enforced uniformity of styles
where necessary to avoid emphasising the emphasis or stating the
obvious, and (ii) the fact that not too many intense colours appear in
close proximity to each other in most Emacs major modes. If a major
mode or other feature adds colours virtually everywhere, then the
Modus themes are no longer true to their character and become
borderline unusable.

The more subtle colours for `fnname-call` and `variable-use` do not
prevent exaggerations, though they do make them less egregious.

[ Note that themes do not control which face is applied where. That is
  the job of a major mode or specialised minor modes. When in doubt,
  work with the rule that fewer colours are better than many. ]


### Support for Emacs Lisp semantic highlighting

This is built into Emacs version 31. What it does is make different
parts of the Elisp syntax stand out visually. It also augments them
with a mouse tooltip (technically a `help-echo`) that provides
valuable insights about what the thing is.

Thanks to Eshel Yaron, the author of this feature, for (i) asking me
to review the relevant faces, (ii) helping me understand what
"semantic highlighting" is intended for, and (iii) explaining to me
how some faces are meant to be used. This was done in the context of
Emacs bug 79677 and in an aside about a change to my minimalist
`doric-themes` package:

-   <https://lists.gnu.org/archive/html/bug-gnu-emacs/2025-10/msg01156.html>.
-   <https://lists.gnu.org/archive/html/emacs-devel/2025-10/msg00728.html>.

I wrote to Eshel that I do not want many colours clustered together.
This design is more suitable to themes with low intensity. All my
themes exacerbate the effect of dense colouration due to their primary
design goal: legibility.

Currently the added colouration of semantic highlighting is noticeable
far more than I like. This is a compromise on my end. Future versions
of the themes might set more semantic faces to `nil` (or anyhow make
them subtle), subject to further review and user feedback.

This is not a position against semantic highlighting, but a comment on
inconsiderate themes.


### More elements are optionally bold or italic

I have revised all supported faces to make them more conservative
about when they apply typographic qualities that deviate from the
default font. Many faces that were unconditionally rendered with a
bold weight or an italic slant are now subject to the user options
`modus-themes-bold-constructs` and `modus-themes-italic-constructs`.

This means that they are like the default font family by default and
will become bold/italic if the relevant user option is set to a
non-`nil` value.

Faces that are semantically bold or italic and/or which genuinely
benefit from such typographic attributes out-of-the-box are exempt
from this.

Headings are also exempt because they are anyway subject to the user
option `modus-themes-headings` which covers the height and weight of
each heading level's text.

Thanks to chainedghost for reporting a regression in one of the
commits I made. This was done in issue 167:
<https://github.com/protesilaos/modus-themes/issues/167>


### Support for `lsp-mode` and `lsp-ui` packages

Thanks to Jimmy Yuen Ho Wong for the initial contribution in pull
request 142: <https://github.com/protesilaos/modus-themes/pull/142>.
I made some changes on top to use semantic palette mappings, where
applicable, and other such tweaks.


### The `minibuffer-nonselected` face is supported

This is coming in Emacs version 31: it highlights the active
minibuffer when the cursor is in another window. The face is designed
to be as noticeable as possible because this kind of scenario usually
leads to mistakes or confusion.


### Refinements to supported packages or face groups

-   The `markdown-code-face` uses the same semantic palette mapping as
    `org-block`. This was always the intent. Thanks to Frédéric Giquel
    for the fix in pull request 160: <https://github.com/protesilaos/modus-themes/pull/160>.
    The change is small and thus does not require copyright assignment
    to the Free Software Foundation.

-   Fixed a word in the symbol of the `flymake-warning-echo-at-eol`. Thanks to
    Eric Ottosson for the patch in pull request 145: <https://github.com/protesilaos/modus-themes/pull/145>.
    No copyright assignment is required.

-   The two new Emacs 31 faces for packages that are marked for
    installation or deletion in the `M-x list-packages` buffer are now
    included. Thanks to Gautier Ponsinet for sending me the patch.
    Gautier has assigned copyright to the Free Software Foundation.

-   The `hs-ellipsis` in Emacs 31 from the built-in `hideshow` package
    is also covered. It is made to conform with established patterns
    across conceptually equivalent faces (e.g. Org folded headings)
    rather than do its own thing.

-   The `widget-field` uses an underline to be easier to spot. On
    supported Emacs displays (generally graphical Emacs) the underline
    is at the descent line, meaning that it does not cross through
    characters with descenders like `g`.

-   The `git-commit` and `log-edit` faces for writing commit messages in
    Magit and VC are tweaked to avoid exaggerations.

-   The Magit section headings have a slightly modified foreground
    value.

-   The `org-list-dt` face for list definition terms has a slightly
    modified foreground value to (i) be easier to spot while (ii) being
    less intense overall.

-   The `calendar-today` in the `M-x calendar` interface now has a box
    around it on supported displays (graphical Emacs) to better stand
    out from its context. On unsupported displays, the face still gets
    an appropriate background value.

-   The `org-date-selected` and `calendar-today` should look the same,
    contrary to how they did before. This is done in the interest of
    theme-wide consistency (i.e. the kind of detail you appreciate once
    it is no longer there).

-   The mode lines use an underline on displays that cannot render a
    box. This way, the faces remain distinct from their context.

-   All interface buttons, like those that appear in the Custom buffers,
    will be rendered with an underline on displays that cannot handle
    boxes.

-   The `notmuch-message-summary-face`, which is used in threaded
    message views, now has an overline on supported displays (graphical
    Emacs). Individual messages in the thread should thus be more
    discernible.

-   The `tab-bar-tab-highlight` is directly covered to make sure all
    mouse hover effects are consistent across similar interfaces.

-   Some faces that had specific colour values (e.g. `cyan-cooler`) are
    revised to use semantic palette mappings instead. This ensures
    thematic consistency. The most obvious beneficiaries are users of
    the deuteranopia- and tritanopia- optimised themes
    (deuteranopia-friendly themes cannot work with red and green while
    tritanopia-friendly themes must not rely on yellow and blue).


### The `modus-themes-custom-auto-reload` is obsolete

Plus all our user options no longer specify a `:set` function. This
means that the theme will never be reloaded automatically when using
the Custom interface or `setopt` to configure one of the theme's user
options. Reloading the theme is what applies the new styles. The idea
of this feature is good, but the implementation was problematic. Maybe
I will reinstate it in the future, though I cannot let it block this
major release.


### Several `modus-themes-*` faces are obsolete

In previous versions I was defining faces that were used to apply
uniform styles across many packages. This was the old way of doing
things before version `4.0.0` of the themes that introduced palettes
with semantic mappings and, optionally, user-defined overrides to
them.

I have deprecated all of the following and made all the necessary
changes (i.e. several thousands of them), to make palette mappings the
norm everywhere. In general, I encourage you not to rely on any faces
defined by Modus: they are really intended for internal use.

-   `modus-themes-fg-blue`
-   `modus-themes-fg-blue-cooler`
-   `modus-themes-fg-blue-faint`
-   `modus-themes-fg-blue-intense`
-   `modus-themes-fg-blue-warmer`
-   `modus-themes-fg-cyan`
-   `modus-themes-fg-cyan-cooler`
-   `modus-themes-fg-cyan-faint`
-   `modus-themes-fg-cyan-intense`
-   `modus-themes-fg-cyan-warmer`
-   `modus-themes-fg-green`
-   `modus-themes-fg-green-cooler`
-   `modus-themes-fg-green-faint`
-   `modus-themes-fg-green-intense`
-   `modus-themes-fg-green-warmer`
-   `modus-themes-fg-magenta`
-   `modus-themes-fg-magenta-cooler`
-   `modus-themes-fg-magenta-faint`
-   `modus-themes-fg-magenta-intense`
-   `modus-themes-fg-magenta-warmer`
-   `modus-themes-fg-red`
-   `modus-themes-fg-red-cooler`
-   `modus-themes-fg-red-faint`
-   `modus-themes-fg-red-intense`
-   `modus-themes-fg-red-warmer`
-   `modus-themes-fg-yellow`
-   `modus-themes-fg-yellow-cooler`
-   `modus-themes-fg-yellow-faint`
-   `modus-themes-fg-yellow-intense`
-   `modus-themes-fg-yellow-warmer`
-   `modus-themes-intense-blue`
-   `modus-themes-intense-cyan`
-   `modus-themes-intense-green`
-   `modus-themes-intense-magenta`
-   `modus-themes-intense-red`
-   `modus-themes-intense-yellow`
-   `modus-themes-key-binding`
-   `modus-themes-lang-error`
-   `modus-themes-lang-note`
-   `modus-themes-lang-warning`
-   `modus-themes-mark-alt`
-   `modus-themes-mark-del`
-   `modus-themes-mark-sel`
-   `modus-themes-nuanced-blue`
-   `modus-themes-nuanced-cyan`
-   `modus-themes-nuanced-green`
-   `modus-themes-nuanced-magenta`
-   `modus-themes-nuanced-red`
-   `modus-themes-nuanced-yellow`
-   `modus-themes-prominent-error`
-   `modus-themes-prominent-note`
-   `modus-themes-prominent-warning`
-   `modus-themes-prose-code`
-   `modus-themes-prose-macro`
-   `modus-themes-prose-verbatim`
-   `modus-themes-search-current`
-   `modus-themes-search-lazy`
-   `modus-themes-search-replace`
-   `modus-themes-search-rx-group-0`
-   `modus-themes-search-rx-group-1`
-   `modus-themes-search-rx-group-2`
-   `modus-themes-search-rx-group-3`
-   `modus-themes-search-static`
-   `modus-themes-subtle-blue`
-   `modus-themes-subtle-cyan`
-   `modus-themes-subtle-green`
-   `modus-themes-subtle-magenta`
-   `modus-themes-subtle-red`
-   `modus-themes-subtle-yellow`

Thanks to Kevin Fleming and Jimmy Yuen Ho Wong for fixing two cases of
unbalanced/faulty parentheses caused by the aforementioned. These were
done as pull requests 166 and 168, respectively:

-   <https://github.com/protesilaos/modus-themes/pull/166>.
-   <https://github.com/protesilaos/modus-themes/pull/168>.

Both changes are small: no copyright assignment to the Free Software
Foundation is needed (and I think both authors are covered, anyway).


### All `:inherit` face attributes are reviewed and kept to a minimum

The themes now use the `:inherit` attribute much more cautiously than
before. This is because of the reliance on semantic palette mappings:
those give us more control and usually are explicit about the desired
result.

Face inheritance can become circular in some cases. Newer Emacs
versions throw an error accordingly. This was discussed in Emacs bug
79672, with participation from Eli Zaretskii, JD Smith, Manuel Giraud,
Stephane Marks, and Steven Allen: <https://debbugs.gnu.org/cgi/bugreport.cgi?bug=79672>.

Thanks to everybody involved!
