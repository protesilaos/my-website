---
title: "Jekyll navigation based on data file"
date: 2016-07-09
excerpt: "How to create an easy-to-maintain navigation menu using Jekyll's ability to call data files."
permalink: /codelog/jekyll-menu-data/
---
When I first moved from WordPress to Jekyll I found the process of creating a navigation menu somewhat counter-intuitive. Different theme authors would implement their own solution, while the official documentation offers an approach that falls short of being the golden standard. After a few trials and errors I have settled with a method that makes use of a data file and some simple Liquid logic to produce a list of links.

So let me show you how I do it.

Under the `_data` directory I create a new file called `menu.yml`. In it I add the structured data of my menu items. In this case that is their name/label and URL slug.

```yml
# menu.yml contents

- name: About
  url: "/author/"
- name: Contact
  url: "/contact/"
- name: Codelog
  url: "/codelog/"
- name: Prot16
  url: "/schemes/"
- name: Akademos
  url: "/akademos/"
```

Once I have the data structure in place, I create a `navigation.html` file under the `_includes` directory. This is where I insert the Liquid logic to create the menu based on the data.

```html
<!-- navigation.html contents -->

{% raw %}{% assign links = site.data.menu %}

<ul>
{% for link in links %}
  <li>
    <a href="{{ link.url }}">
      {{ link.name }}
    </a>
  </li>
{% endfor %}
</ul>{% endraw %}
```

What this code snippet does is instruct the system to generate an unordered list and add list items with the `name` and `url` assigned to them in the `menu.yml`.

The resulting HTML would be:

```html
<ul>
  <li>
    <a href="/author/">
      Author
    </a>
  </li>
  <li>
    <a href="/contact/">
      Contact
    </a>
  </li>
  <li>
    <a href="/codelog/">
      Codelog
    </a>
  </li>
  <li>
    <a href="/schemes/">
      Prot16
    </a>
  </li>
  <li>
    <a href="/akademos/">
      Akademos
    </a>
  </li>
</ul>
```

I can then use Liquid to include the `navigation.html` in my page templates, more specifically in the header section.

```html
<header class="site-header">
  <!-- Some code goes here -->

  <nav class="site-nav">
    {% raw %}{% include navigation.html %}{% endraw %}
  </nav>
</header>
```

Then proceed to add some styles to make it look as intended. Here's a sample in SCSS:

```scss
.site-nav {
  ul {
    font-size: $h7;
    list-style-type: none;
    padding: 0;
    margin: 0;

    @include desktop {
      font-size: $h6;
    }
  }

  li {
    display: inline-block;
    margin-right: $sone;
    line-height: $sone * 2;

    &:last-child {
      margin-right: 0;
    }

    @include tablet {
      line-height: $vrythm;
    }

    @include desktop {
      margin-right: $sone * 1.25;
    }
  }
}
```

And we are done!

At this point I should note that I prefer to manually insert my own URL slug. In each page's front matter, I define it using the `permalink` key. Example:

```
---
title: Contact information
permalink: /contact/
---
```

## Why this approach?

For a few reasons:

1. **Ease of use.** It makes it very easy to change menu items. Just modify the `menu.yml` file under `_data`. Liquid will do the rest. With a minimum of training even non-technical users can have a menu up and running.
2. **List of links, not pages.** Some solutions I have come across instruct Jekyll to produce a list of items specified as "pages". Whereas here the system will just use links. Any web page may be included, both internal and external ones, all without them qualifying as "page" in the technical/Jekyll sense.
3. **Agnostic to directory structure.** The combination of data and Liquid is abstract enough that it does not impose any constraint on the overall structure of the directories. The menu items can be scattered across multiple folders and still cause no problems whatsoever. Obviously it is a good idea to keep things organised, but that should not be up to Liquid to decide.
4. **Sorted as required.** The Liquid loop I presented above does not use any filter to sort the menu items. It will produce the list of links in the exact order they appear in their data file. A different sequence can be achieved using simple Liquid filters. One may even add more objects to the `_menu.yml` and use those to organise the list. Since my menu is short, I prefer to keep things simple.
5. **The label is not a title.** The labels displayed in the menu, e.g. "Contact", are not the actual title of the page they reference. The latter may be several words long, while the navigation module can be kept concise and tidy. By decoupling the two, I can write titles that serve the purpose of a title and menu labels that are specific to that task. All thanks to the inclusion of the `name` key in the `menu.yml`.

The same approach can be applied to a range of cases. One closely related to the above is a list of social media accounts, each using the corresponding brand icon. That needs a tiny bit more on the styling part, but is otherwise identical.

This is how I have decided to implement the navigation module in [Akademos](https://protesilaos.com/akademos/), my upcoming theme for Jekyll-powered websites. I explain these technicalities in the installation guide. Hopefully users will find the approach to be functional and adaptable.
