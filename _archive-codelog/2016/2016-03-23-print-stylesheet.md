---
title: "This website is now optimised for print"
date: 2016-03-23T02:49:00+00:00
excerpt: "Offering a specific design for print can improve the reading experience of users, at least a subset thereof."
permalink: /codelog/print-stylesheet/
---
I have created a print stylesheet to further improve the reading experience offered by protesilaos.com.[^Audience] Henceforth the browser's native print function will deliver a better output than what it used to.

Designing for print is rather straightforward, especially if the website is already developed for a multi-screen environment and remains minimalist anyhow. Any element on the page that would make no sense in print form must be reworked or removed. The way to proceed is to add CSS rules inside the `@media print` query.

My approach is first to blacklist any element that needs to be removed. That means to add a `display: none` property to it. An illustration:

```css
@media print {
  .site-header,
  .nextprev,
  .site-footer {
    display: none;
  }
}
```

Then I need to improve my links so that: (a) they display the url, (b) are closer to the colour of the rest of the text, (c) are hidden when referencing a section of the page (e.g. back-to-footnote links).

Point (a) is achieved by passing `content: " (" attr(href) ")"` to the link's `:after` pseudo element.

For point (b), I just decided to darken the existing link colour by using `color: darken($link-color, 20%)` (I write in SCSS).

As for (c), I use a `href` selector to target and then blacklist those links. This is what I mean:

```css
@media print {
  a[href^="#"]:after {
    display: none;
  }
}
```

## The edge case

The problem I came across with the method of displaying urls was with printing the canonical url of the *internal* links. I write in markdown and have made a habit of setting internal links in relative terms, such as `{% raw %}[About me](https://protesilaos.com/author/){% endraw %}` rather than `{% raw %}[About me](https://protesilaos.com/author/){% endraw %}`. In such instances the result is to display only what is specified as url in the markdown file, i.e. the decontextualised `/about/`, which makes little sense in its own right.

The workaround I found, and which may still prove problematic in future tests, is to target any url that starts with a forward slash (`/`) and add my root url to it. Here is my point:

```css
a[href*="//"]:after {
  content: " (" attr(href) ")";
}

a[href^="/"]:after { /* Targets relative urls */
  content: " (protesilaos.com" attr(href) ")";
}
```

Note that the `href` selector for the internal links features a caret (`^`) whereas all the rest are marked with an asterisk (`*`). The former signifies "starts with", while the latter stands for "includes".[^Selectornote]

## Print remains relevant

Even in the multi-smart-device world of ours there are instances where a user will want to maintain a physical copy of the webpage. I might as well try to reduce their environmental impact by eliminating any superfluities that would otherwise get printed.

In more practical terms though, this addition gives me the option to offer my forthcoming book on the European Union (coming late April/early May) in two ways:

1. default: chapter by chapter, with each having its own url (essentially a concatenation of html files just like my [first book](https://protesilaos.com/euhandbook/));
2. alternative: full book content in a single url.

The latter may be the preferred choice for those who want to print the book outright. I'll give it some more thought (and test it) before settling on the final approach.

At any rate, I expect this new addition to the design of protesilaos.com to immediately benefit a portion of my readers. Happy reading!

[^Audience]: The Codelog notwithstanding, I write analyses on the European Union. I know for a fact that in the world of politics printing webpages is common practice. A website such as mine that is meant to provide for a long reading experience must also account for the needs of its users, even if those are secondary in order.

[^Selectornote]: Adding to these, the dollar sign (`$`) is used for "ends with". I employ that to style the `:after` element of my feed links, such as those shown in the [follow me](https://protesilaos.com/follow/) page.
