---
title: "Speeding up Jekyll"
date: 2016-12-03
excerpt: "The various techniques I use to improve the build/preview and rendering speed of my Jekyll site."
permalink: /codelog/jekyll-speed/
---
This website is built with Jekyll, the static site generator. Hosting is provided by GitLab pages. In this blog post I document the methods used to improve overall speed in (i) development time and (ii) page rendering.

## A few words about the source code

My website has lots of content. There are around 400 markdown files under the `_posts` and `_archive` directories. Others are populated with a bunch of files that often include Liquid logic. Plus, I maintain several collections, such as `_books`, `_schemes`, and `_codelog`. All these add up to build times that run in the several minutes.

If I run an unconditional `jekyll serve` I will be waiting for more than 200 seconds to have a local server up and running. That is impractical. Furthermore, if I pass a flag such as `limit_posts` I am still being confined to restrictions in the `_posts` directory. All the rest—collections, includes, other assets—continue to be processed. That is undesirable.

The solution is surprisingly simple. It only requires a bit of effort to organise the code base in a meaningful way. Since Jekyll creates static pages, there is no need to build everything anew every time a new element is to be introduced. Well, at least not at the previewing phase.

## Configurations for optimal Jekyll serve

The plan is to exclude from local build times those directories/files that do not affect the task at hand. If, for example, we want to work on the homepage, we can choose to include only the relevant files in the previewing process. Development thus focuses only on what is being edited. The rest remain constant.

To do this, we create a `_config-dev.yml` at the root of the website's repo. The actual name of the file may vary. What is important is its content. In it we include *only* the settings that are specific to the work flow. The normal settings are stored in the `_config.yml`.

Here is a sample of the standard `_config.yml` file:

```yaml
# Site settings
title: Protesilaos Stavrou
description: "EU policy analyst. Front end web developer. Writer. Blogger."
url: "https://protesilaos.com"
date_format: "%Y-%m-%d"

# Build settings
incremental: false
markdown: kramdown
kramdown:
  input: GFM
  auto_ids: false
  footnote_backlink: ^
  hard_wrap: false
  syntax_highlighting: rouge
highlighter: rouge
permalink: pretty
```

And here is an example of the `_config-dev.yml`, which can include overrides of default options:

```yaml
limit_posts: 1
incremental: false
exclude:
  - README.md # ------------------ Basis ---------------------------
  - CNAME
  - Gemfile
  - vendor
  - package.json
  - node_modules
  - gulpfile.js
  - _codelog # ------------------- Code ----------------------------
  - pages/indices/codelog.html
  - pages/indices/code.html
  - _includes/triton-syntax.scss
  - _schemes # ------------------- Schemes -------------------------
  - _includes/main.min.js
  - _includes/prot16-packages.html
  - pages/indices/schemes.html
  - _layouts/scheme.html
  - _data/themes.yml
  - _includes/prot16-schemesmenu.html
```

So when we operate on a local server, instead of the typical `bundle exec jekyll serve` command, we run:

```
bundle exec jekyll serve --config _config.yml,_config-dev.yml
```

This loads the standard configurations in addition to the bespoke ones. What is listed in the `exclude` does not count towards build time and is omitted from the preview altogether. It takes a few seconds to have the server up and running. And that is a huge win, given where we started.

We do not add the excluded files to the `_config.yml` because that would remove them from the live site. Build duration for the total end product remains unaltered.

## Partialise stylesheets

Once development times are improved, we can apply various techniques to speed up page renders. There are two methods to be implemented: (1) inlining css and (2) contextualising it.

The first is to *remove* the main stylesheet from the generic `css` directory. Place it instead in the `_includes`. Make sure you delete the front matter block (the three opening and closing dashes at the top). Then inline the stylesheet in the head with the following:

```html
{%raw%}{% capture inline-styles %}
  {% include your-stylesheet.scss %}
{% endcapture %}{%endraw%}

<style type="text/css">
  {%raw%}{{ inline-styles | scssify }}{%endraw%}
</style>
```

The second method is to divide your `_sass` partials into context-specific stylesheets. One for your homepage, another for your posts, your custom context, and so on.

Obviously you proceed with whatever makes sense for your installation. I personally have four stylesheets, without accounting for the web fonts. The main is applied everywhere. The secondary is also applied throughout, only it is implemented with some JavaScript for asynchronous loading (more on that in the next section). The third is specific to my code projects. The fourth only loads on the homepage.

For such specific styles we modify the aforementioned code to include some conditional logic.

```html
{%raw%}{% if page.layout == "something" or page.url contains "something-else" %}
  <style type="text/css">
    {% capture inline-styles %}
      {% include your-stylesheet.scss %}
    {% endcapture %}
    {{ inline-styles | scssify }}
  </style>

{% elsif %}

<!-- Something else -->

{% endif %}{%endraw%}
```

## Defer loading non-critical styles

The above are enough to cover most use cases. But there is more for those seeking optimisations on the margin. Some stylesheets, such as web fonts, can be loaded in a non-blocking manner. The Filament Group has [a great guide](https://www.filamentgroup.com/lab/font-events.html) on the topic. I followed their guidelines. Do the same.

In outline:

1. Define the non-critical stylesheet, say, your web font's CSS file.
2. In the `<head>` call the [loadCSS](https://github.com/filamentgroup/loadCSS) and [Font Face Observer](https://github.com/bramstein/fontfaceobserver) scripts to fetch and then render the styles once they are ready. Voila!

Here is how we can do that in conjunction with the above methods:

```html
{%raw%}{% if page.typography == "webfont" %}
  <!-- The non-critical stylesheet -->
  <link rel="preload" href="/css/your-web-font.css" as="style" onload="this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="/css/your-web-font.css"></noscript>

  <!-- Includes the Font Face Observer -->
  <script type="text/javascript">
    {% include ffo.min.js %}
    var font = new FontFaceObserver('Your web font');

    font.load().then(function () {
      document.documentElement.className += " webfonts-loaded";
    });
  </script>
{% endif %}

<!-- Includes loadCSS -->
<script type="text/javascript">
  {% include loadcss.min.js %}
</script>{%endraw%}
```

## Speed for you and your readers

Check out [my website's repo](https://gitlab.com/protesilaos/protesilaos.gitlab.io) to see the full extent of the above examples. The scores on Google's speed test tool are 90+. They could have been even higher if (i) I could control the server side on GitLab Pages, and (ii) I opted to use only generic font families with no custom fonts whatsoever. But I am okay with that.

To recapitulate, our objective is to leverage the tools at our disposal. Jekyll can be very powerful, provided we are willing to put in some extra work. Preview times are easy to improve. It just takes a few minutes to identify the items that can be added to the `exclude` list for omission from the `jekyll serve`.

Static pages are faster than their equivalent dynamic ones. If you are already using Jekyll this may be one of the reasons. But "faster" may not necessarily mean *fast enough*. That requires some careful organisation of the code base to implement components only when and where they are truly needed.
