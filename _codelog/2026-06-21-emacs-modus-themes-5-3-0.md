---
title: 'Emacs: modus-themes version 5.3.0'
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

## 5.3.0 on 2026-06-21

The Modus themes are in a stable state. To my mind, they provide the
best "default theme" experience across the 40+ original themes I have
carefully designed.

Modus is also a platform for making themes for Emacs. There are plenty
of derivatives already. I am linking to them through the project's
README.md and am always happy to mention more packages&mdash;just let me
know.

This version does not include many user-facing changes. Most of my
work focused on making internal refinements.


### Load the themes through the `early-init.el`

The Modus themes can now be loaded through the `early-init.el` file.
The idea is to avoid the flash of light that occurs under certain
conditions during startup.

This feature is the result of several changes to helper functions,
especially those contributing to the `modus-themes-generate-palette`
function that Modus derivatives may be relying on.

Thanks to Steven Allen for an intermediate refinement in pull request
194 and to Mike Olson for another relevant tweak in pull request 199:

-   <https://github.com/protesilaos/modus-themes/pull/194>
-   <https://github.com/protesilaos/modus-themes/pull/199>

Steven's contribution no longer exists in the code base due to other
changes I made, but was still useful at the time.

Both changes are small, meaning that their authors do not need to
assign copyright to the Free Software Foundation.

Also thanks to Jacod "Jake" Gordon for reminding me to apply one of
the new functions to the `org-habit` faces. This was done in issue
197: <https://github.com/protesilaos/modus-themes/issues/197>.


### The underline for widget fields has the correct colour

Relevant faces use the palette entry for `border` (invoke the command
`modus-themes-preview-colors` or `modus-themes-preview-colors-current`
to view the entries in a theme's palette).

A popular package that makes use of `widget.el` widgets is `notmuch`.

Thanks to ukiran03 for the contribution, which was done in pull
request 193: <https://github.com/protesilaos/modus-themes/pull/193>.
The change is small, meaning that ukiran03 does not need to assign
copyright to the Free Software Foundation.


### A palette can now have a `bg-popup` entry

This gives users and derivative themes the option to pick a suitable
value for popup interfaces, such as those of the `company` and `corfu`
packages.

Thanks to aikrahguzar for making this suggestion in issue 70 of my
`ef-themes` repository (the `ef-themes` are built on top of the
`modus-themes` since Modus version `5.0.0`, Ef version `2.0.0`):
<https://github.com/protesilaos/ef-themes/issues/70>.


### Support for faces or packages

-   `lin` by Protesilaos.
-   `pulsar` by Protesilaos.
-   `institution-calendar` by Protesilaos.
-   `markdown-ts-mode` by Rahul Martim Juliato and Stéphane Marks.
-   `trust-manager` by Eshel Yaron.
-   `typst-ts-mode` by Ziqi Yang. Thanks to Pranshu Sharma for
    suggesting its inclusion in issue 208: <https://github.com/protesilaos/modus-themes/issues/208>.
-   new `elfeed` faces since the maintenance of the project was assumed
    by Daniel Mendler, Karthik Chikmagalur, and Ihor Radchenko. To this
    end, thanks to Steven Allen for pull request 217 that added the
    `elfeed-show-*` faces: <https://github.com/protesilaos/modus-themes/pull/217>


### Internal refinements to the `modus-themes-with-colors` macro

It now correctly handles the order of default palette colours and
user-defined palette overrides. Thanks to JD Smith for the
contribution in pull request 191: <https://github.com/protesilaos/modus-themes/pull/191>.

The change is small, meaning that JD does not need to assign copyright
to the Free Software Foundation.


### The `multiple-cursors` are fine even when a bar is used

When the `cursor-type` is configured to be a `bar`, the fake cursors
produced by the `multiple-cursors` package will still look right.
Thanks to Elias Gabriel Perez for the change to the
`mc/cursor-bar-face` in pull request 213: <https://github.com/protesilaos/modus-themes/pull/213>.


### The `blink-matching-paren-offscreen` is the same as `show-paren-match`

This is for thematic consistency. Thanks to Troy Brown for suggesting
this change in issue 209: <https://github.com/protesilaos/modus-themes/issues/209>.


### Get `vc-annotate` look right

The built-in `vc-annotate` command relies on a user option to read
color values. We cannot handle this nicely at the theme level. Users
need to write their own configuration like this:

```elisp
(defun my-modus-vc-annotate (&rest _)
  (modus-themes-with-colors
    (setq vc-annotate-background-mode nil)
    (setq vc-annotate-very-old-color fg-dim)
    (setq vc-annotate-color-map
          `(( 20. . ,red)
            ( 40. . ,red-cooler)
            ( 60. . ,red-warmer)
            ( 80. . ,yellow-warmer)
            (100. . ,yellow)
            (120. . ,yellow-cooler)
            (140. . ,green-warmer)
            (160. . ,green)
            (180. . ,green-cooler)
            (200. . ,cyan-cooler)
            (220. . ,cyan-warmer)
            (240. . ,cyan)
            (260. . ,blue-warmer)
            (280. . ,blue)
            (300. . ,blue-cooler)
            (320. . ,blue-intense)
            (340. . ,magenta-cooler)
            (360. . ,fg-dim)))))

(with-eval-after-load 'vc-annotate
  (my-modus-vc-annotate)
  (add-hook 'enable-theme-functions #'my-modus-vc-annotate))
```

[ The above code is relevant as of this writing. Though remember that
  I do not keep older publications up-to-date. The only source of
  truth is the manual of the Modus themes. ]


### Two old user options are no longer needed

The user options `modus-themes-completions` and `modus-themes-prompts`
are obsolete. They used to be relevant before the introduction of
palette overrides.


### Rewrote large parts of the manual

I did it for clarity, but also to remove notes that were specific to
older versions of Emacs.


### Many new ERT tests for the project

I have written many tests. They do not cover every single function,
though the plan is to do that eventually. These tests are important to
ensure that Modus is a solid platform for making derivative themes.

Much of this was done live: <https://protesilaos.com/codelog/2026-04-10-emacs-spontaneous-live-modus-themes/>.

Thanks to Benjamin Kästner for a couple of tweaks to a relevant macro
in the tests' file. This was done in pull request 212, with further
changes by me: <https://github.com/protesilaos/modus-themes/pull/212>.


### Links to projects related to Modus

In the README.md I now mention projects that are related to the Modus
themes, such as derivative Emacs themes, but also ports for other
editors.

There is also a link to my `modus-themes-exporter` package, which I
developed during a live stream:

-   <https://github.com/protesilaos/modus-themes-exporter>
-   <https://protesilaos.com/codelog/2026-04-13-emacs-live-develop-modus-themes-exporter-package/>


### Git commits

```
git shortlog 5.2.0..5.3.0 --summary --numbered
    123	Protesilaos
     2	Benjamin Kästner
     2	Steven Allen
     1	Elias Gabriel Perez
     1	JD Smith
     1	Mike Olson
     1	ukiran03
```
