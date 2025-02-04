---
title: "Iosevka Comfy is discontinued; hello 'Aporetic' fonts"
excerpt: "Release notes for the latest tagged release of my Aporetic fonts."
---

I am discontinuing the development of the _Iosevka Comfy_ fonts,
effective immediately. My new fonts are called _Aporetic_ and are the
successor to my earlier project.

Aporetic fonts:

+ Git repository: <https://github.com/protesilaos/aporetic>.
+ Sample pictures: <https://protesilaos.com/emacs/aporetic-fonts-pictures>
+ Backronym: Aporetic's Predecessor Objects' Reserved Eponym Truly Included "Comfy".

Iosevka Comfy:

+ Git repositories:
  + GitHub: <https://github.com/protesilaos/iosevka-comfy>
  + GitLab: <https://gitlab.com/protesilaos/iosevka-comfy>
+ Sample pictures: <https://protesilaos.com/emacs/iosevka-comfy-pictures>
+ Backronym: Iosevka ... Could Only Modify a Font, Yes.

## Legal reason for the change

"Iosevka" is a reserved name. I had not realised this until I reread
the SIL Open Font License, Version 1.1, specifically:

> 3. No Modified Version of the Font Software may use the Reserved
>    Font Name(s) unless explicit written permission is granted by the
>    corresponding Copyright Holder. This restriction only applies to
>    the primary font name as presented to the users.

## Technical reasons for the change

I wanted to change the names of the font families to make them more
intuitive. Instead of something like "Iosevka Comfy Motion Duo" I now
have "Aporetic Serif". The full list is further below.

I also had to reduce the number of variants and font weights to both
(i) streamline what I am offering and (ii) make it possible to build
the fonts on my computer.

## Changes relative to Iosevka Comfy

The fonts are these:

| Current name        | Old name                 |
|---------------------|--------------------------|
| Aporetic Sans       | Iosevka Comfy Duo        |
| Aporetic Serif      | Iosevka Comfy Motion Duo |
| Aporetic Sans Mono  | Iosevka Comfy            |
| Aporetic Serif Mono | Iosevka Comfy Motion     |

I no longer provide "fixed" and "wide" variants.

All glyphs are the same as before except for the zero (`0`), which is
now always rendered with a forward slash and a wider body. The reason
for this change is that the narrow oval shape could be mistaken for a
Greek theta (`θ`).

Font weights are also reduced to just `regular` and `bold`.

## Why "aporetic"

It is a nice Greek word and no other fonts with this name exist.
