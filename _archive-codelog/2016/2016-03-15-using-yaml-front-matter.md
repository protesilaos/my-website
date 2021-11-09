---
title: Using YAML front matter
date: 2016-03-15T02:49:00+00:00
excerpt: "YAML variables can be referenced via liquid tags to add content to template files."
permalink: /codelog/using-yaml-front-matter/
---
Jekyll requires a YAML front matter block to interpret files using its liquid templating system. The front matter is the set of variables that apply to the file in question. While some are predefined by Jekyll, we can set any arbitrary object and give it the appropriate value.

I have started to tap into the potential offered by this arrangement. To offer some examples, let us start with the front matter of this very article:

```{% raw %}
---
title: Using YAML front matter
date: 2016-03-15T02:49:00+00:00
excerpt: "YAML variables can be referenced via liquid tags to add content to template files."
layout: codelog
permalink: /using-yaml-front-matter/
topic: Jekyll
---{% endraw %}
```

I learned that there are two ways to call YAML variables, each depending on the context. The `page.{variable name}` format is used in a self-referencing document. The template for a single article such as this one is an example. Whereas a loop would require calling it via its proper name which takes the form of `{collection name}.{variable name}`.

Here is how that is used in a loop, say on the homepage:

```html
{% raw %}<section class="home-loop">
    <h2>{{ site.text.codelog }}</h2>
    <ul>
      {% assign codelogs = site.codelog | sort: 'date' | reverse %}
      {% for codelog in codelogs limit:3 %}
        <li class="clearfix">
          <a href="{{ codelog.url | relative_url }}">{{ codelog.title }}</a>
          <span class="post-meta">{{ codelog.date | date: '%b %d, %Y' }}</span>
        </li>
      {% endfor %}
      <li class="clearfix">
        <a class="allposts" href="/codelog/">All Codelog entries</a>
      </li>
    </ul>
  </section>{% endraw %}
```

What I particularly like about this is that it complements the use of collections. Collections are Jekyll's way of organising content. Think of the blog posts as one such group. On this website I have six collections, each with its own particular needs:

- posts
- books
- seminars
- publications
- codelog
- diary

Organising my work in such a way would have been of little value without the flexibility offered by the YAML custom variables. One such case is with the code for embedding youtube videos in my seminar series. Rather than copy/paste the entire embed code, I establish a template specifically for the seminars which includes this:

```html
{% raw %}<div class="mediaframe">
  <div class="mediawrapper">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/{{ page.mediaid }}?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </div>
</div>{% endraw %}
```

The `page.mediaid` unique value is included in each seminar's front matter, thus successfully embedding the video.

To the above I can also add the fact that these objects may be used in conjunction with conditional tags. So I could choose to show/hide content depending on the presence/absence of a specific front matter variable. I could for instance wrap the above code in a conditional statement that would deliver the code block only if the `page.mediaid` were present (or any arbitrary object for that matter).

This is kind of what I do with the navigation/menu, to determine whether a page would appear there and in what order. The pages must have a `tag` assigned to them.[^Tagsnote] They are sorted based on a numeric value assigned to an `order` parameter. Here is the menu's code:

```html
{% raw %}{% assign pages = site.pages | sort: 'order' %}

{% for page in pages %}
  {% if page.tag %}
  <a class="page-link" href="{{ page.url | relative_url }}">{{ page.tag }}</a>
  {% endif %}
{% endfor %}{% endraw %}
```

In short, working with YAML front matter and liquid tags is awesome! I will keep experimenting.

[^Repo]: [GitLab repository of protesilaos.com](https://gitlab.com/protesilaos/protesilaos.gitlab.io). The code is offered under the MIT License.

[^Tagsnote]: The custom front matter key `tag` should not be confused with the preconfigured Jekyll object `tags`.
