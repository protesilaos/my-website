---
title: "How I coded my new book"
date: 2016-05-09T01:20:00+00:00
excerpt: "These are the practices I used to deliver my new book on the European Union"
permalink: /codelog/euguide-code/
---
Today I published a new book: [Little Guide to the European Union](https://protesilaos.com/euguide/). In this *Codelog* entry I want to document the coding practices used to deliver it in the way I did.

## Filtering subdirectories of Jekyll collections

As far as I know, Jekyll (the static site generator I use) does not recognise subdirectories in a collection. I have a `_books` folder where I wanted to add my two books on the European Union. These books are, in essence, folders with a bunch of markdown files, one for each chapter. So when I try to call a `for` loop for `site.books.[subdirectory]` I get content from both books instead of the subdirectory I wish to target.

The way I thought to filter the loop and limit it to each book is to include a custom YAML object for each book's contents. All files that make up my *Little Guide* have the key `flag` with value `euguide`. Similarly, my *Handbook* has `flag` with `euhandbook`. These are the variables that help me sort files based on the book they belong to.

Thanks to this technique, I can create two separate loops, one for each book's index. For the *Little Guide* I use this:

```html
{% raw %}{% assign euguides = site.books | where: "flag", "euguide" %}

<div class="measure">
  <section class="home-loop">
    <ul>
      {% for euguide in euguides %}
        <li class="clearfix">
          <a href="{{ euguide.url | relative_url }}">{{ euguide.title }}</a>
          <span class="post-meta">Part {{ forloop.index }}</span>
        </li>
      {% endfor %}
    </ul>
  </section>
</div>{% endraw %}
```

Notice how I apply the filter using `where: "flag", "euguide"`. Also note the liquid variable `forloop.index` which adds a number to each item. Without the filter it would not be able to add the proper sequence as it would include content from the entire `_books` folder, i.e. also cover my other book.

## The print-optimised version

For my new book I deliver each chapter as a single webpage. It has its own URL and meta data, which I think is the best approach for content on the web. I do, nonetheless, recognise that people may want to keep a physical copy of my book. It is a laborious task to print several pages and then to figure out in what order they are supposed to be read. It is much easier to print one webpage that includes all of the book's contents.

When I began thinking about how to approach this, I first considered the non-engineer's method: to copy/paste each chapter into a single document. That is rather inefficient and contrary to my intention of updating my book when and where necessary. If I were to maintain two separate sets of files, I could end up in a dependency mess of trying to track down whatever changes I made in one part to see if they were replicated in the other.

Whereas the developer's solution I implement works automagically. I use the above-mentioned loop in a slightly different way. I created a new markdown file and included in it two `for` loops, one for the table of contents and the other with the actual text. Here is the code:

```html
{% raw %}{% assign euguids = site.books | where: "flag, "euguide" %}

<div class="contents">
  <h2>Book contents</h2>
  <ol>
  {% for euguid in euguids %}
    <li>
      {{ euguid.title }}
    </li>
  {% endfor %}
  </ol>
</div>

{% assign euguides = site.books | where: "flag", "euguide" %}

<div>
  {% for euguide in euguides %}
    <h2 class="h1 print-section">
      {{ forloop.index }}. {{ euguide.title }}
    </h2>
    {{ euguide.content }}
  {% endfor %}
</div>{% endraw %}
```
Just to be sure that I do not get confused, I differentiate those two loops by a single letter. The first is `euigids`. The second `euguides`.

Notice the `euguide.content` in the second loop. It displays the entirety of the file's content. Also worth noting is the `print-section` CSS class. It corresponds to this little snippet which separates chapters with a page break when printed:

```scss
.print-section {
  page-break-before: always;
}
```

Also note the semantically correct use of the `h2` tag in conjunction with an `h1` class. The heading will *look* as a big title when printed, but will be parsed as a secondary title in the webpage. We need that because it is incorrect to have more than one `h1` on each page.

My book also comes with a versioning system. I may be making updates and need to document them accordingly. The way to display the book's version, which is set as a global variable in my `_config.yml` file, is to call it on the file of the print-optimised page using a liquid tag: `{% raw %}{{ site.data.text.euguide.version }}{% endraw %}`. This way I do not need to manually update the document every time the version changes (I employ this technique for a number of issues).

## More than a book

Okay I admit this subheading is a bit too much, but you get the idea. This book is not only about the content. The underlying code is equally important. Perhaps more so. Without it the book would not be published. I would have to find some other medium to deliver it or I would end up publishing it in a largely suboptimal fashion.

The reader does not have to know any of this. The code is not meant to call for attention. Like all good implements, it works seamlessly.

Finally, I think I am beginning to use Jekyll in some advanced ways. I first thought of it as some simple tool for keeping blog posts in one place. It is *much* more powerful than that. In fact, it seems to me like a CMS without the handholding (not that this is *necessarily* a good thing for every user). I am loving it and am super excited about what use case I will come up with next.
