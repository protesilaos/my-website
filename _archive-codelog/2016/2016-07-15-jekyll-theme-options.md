---
title: "Jekyll theme options for users"
date: 2016-07-15
excerpt: "Theme-specific options should be included in a separate data file rather than the '_config.yml'."
permalink: /codelog/jekyll-theme-options/
---
When I set out to create the [Akademos Jekyll theme](https://protesilaos.com/akademos/), I wanted to provide the user with certain options.[^AkademosReleaseNote] They could decide on whether to display links to their social media accounts, show the post author's name, add a Google Analytics tracking code, and, above all, choose their preferred Prot16 style.

The official Jekyll docs do not appear to have a guide for theme authors. It is up to the individual to do as they see fit. Hence the presence of many themes that expect from the user to configure theme-specific options in the `_config.yml` file.

I find this to be suboptimal. Theme-specific options should not be included in that file. Doing so creates a certain lock-in effect. What applies to one theme does not necessarily hold true for another. It should not, therefore, be part of a piece of data that is common to all.

## Put defaults in the right place

A large enough Jekyll site has *universal* and *particular* defaults. The former encompasses such things as the website's name, the markdown engine, build settings, the use of a syntax highlighter, and the like. As for the latter, it covers every option that is specific to a given application, typically a theme.

You want users to change the particular configurations without the risk of breaking the site. If an option of that sort is set incorrectly, the site will still work, although the theme may malfunction, at least on that specific item. A potential problem indeed, though still less of an issue than accidentally deleting, say, the default permalink value.[^GoodOptionsNote]

## Use a data file

This is a good case for using a data file, under the `_data` directory. Make the particular defaults part of a `theme.yml` and let the user deal with that.

The only difference from a developer's perspective is with respect to the Liquid calls. Say you have a key `example` that you include in the `_config.yml`. To call its value, you would use something like:

```html
{% raw %}{{ site.example }}{% endraw %}
```

Whereas the same key within the `theme.yml` would require:[^LiquidAssignNote]

```html
{% raw %}{{ site.data.theme.example }}{% endraw %}
```

Though this is more verbose, it does provide you with the safety of keeping the universal settings in tact. It also gives you another set of data to manipulate when working on something more complex.[^DataFilesUses]

## Focus on the user

Safety aside, a major benefit is enhanced usability: the ease of adding options. When you ask the user to include some key/value in the `_config.yml` you must also warn them not to touch anything else. Whereas with the afore-outlined approach they can just copy-paste stuff in an empty file.

Sure, this may be trivial, but it does help the user feel more comfortable with touching the site's source code. Whatever helps them perform simple tasks should be prioritised.

To recapitulate, use a data file for your theme's options in order to:

- avoid locking users in your application;
- help separate between universal and particular settings;
- provide the user with a sense of security when modifying part of their site's source code.

[^AkademosReleaseNote]: Akademos is not yet available for deployment. I am waiting for Jekyll 3.2 in order to conduct some final tests. The theme will be released as a Ruby gem.

[^GoodOptionsNote]: A good user-facing options file would anyway be designed in such a way so that no mistake could break the theme.

[^LiquidAssignNote]: That is unless you use Liquid's `assign` tag.

[^DataFilesUses]: For a couple of use cases on data files, see my previous posts: (1) [Creating the Prot16 project pages](https://protesilaos.com/codelog/prot16-pages/), and (2) [Jekyll navigation based on a data file](https://protesilaos.com/codelog/jekyll-menu-data/).
