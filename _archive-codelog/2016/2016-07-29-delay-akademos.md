---
title: "Delaying the release of 'Akademos'"
date: 2016-07-29
excerpt: "My Akademos Jekyll theme will be shipped towards the end of 2016."
permalink: /codelog/delay-akademos/
---
*Akademos* is a near replica of the theme once used on this website.[^WebsiteV1] I intend to release it as a Ruby gem that can be added to any Jekyll site. The original idea was to ship the first version by the end of July, to coincide with the release of Jekyll 3.2. That proved to be unrealistic for a couple of reasons:

1. **Jekyll themes are a work in progress.** Akademos can only function properly by making use of some otherwise simple files from the `_data` directory.[^DataFilesNote] The theme's options are dependent on them. Jekyll's current version does not support the inclusion of such files. Perhaps 3.3 or 3.4 will do so.
2. **Too many options are unhelpful.** The headline feature of Akademos is the ability to choose a global stylesheet based on the Prot16 colour schemes (check [the styles' demo](https://protesilaos.com/akademos/demo-colours/) for details). While I still think this is a good thing to have, the list of choices now on offer has grown out of hand. The finished article will ship with 6 styles.[^ThemesListNote]

The current plan is to release Akademos towards the end of this year. My understanding is that Jekyll's new theming feature will be expanded upon in the meantime.

At any rate and if you feel like doing things yourself, you can already clone the contents of [this repo's gh-pages branch](https://github.com/protesilaos/akademos/tree/gh-pages). It is the underlying code of the Akademos demo site. The current [installation guide](https://protesilaos.com/akademos/guide/) does apply. Use it.

[^WebsiteV1]: Version 1.0 used *Akademos*. See the contents of the website [at that time](https://gitlab.com/protesilaos/protesilaos.gitlab.io/releases/tag/v1.0.0).

[^DataFilesNote]: As to why I tend to rely on `_data` files, read my last two blog posts on the matter: (i) [Jekyll theme options for users](https://protesilaos.com/codelog/jekyll-theme-options/), (ii) [Jekyll navigation based on data file](https://protesilaos.com/codelog/jekyll-menu-data/).

[^ThemesListNote]: The provisional list with the Akademos style options is (1) Alto light, (2) Cyprium light, (3) Blau dark, (4) Flowerbed dark, (5) Gaia uniform, (6) Neptune uniform. The [demo page](https://protesilaos.com/akademos/demo-colours/) will be updated accordingly when the theme's release date is specified. For the specifics of each colour scheme, refer to the corresponding [Prot16 project page](https://protesilaos.com/schemes/).
