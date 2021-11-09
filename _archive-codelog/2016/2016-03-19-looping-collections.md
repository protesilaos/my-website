---
title: Looping through multiple Jekyll collections
date: 2016-03-19T04:49:00+00:00
excerpt: "A way to merge posts from different collections in a single array."
permalink: /codelog/looping-collections/
---
I maintain several collections on this website. I write about the European Union, deliver seminars on the European integration process, and produce the occasional post on the coding aspects of this website. The latter is a side activity, though I am passionate about it. My need is to keep content feeds separate by default. I would not want a reader to subscribe to a feed expecting to read my analyses on the EU or get the latest seminar only to end up receiving articles such as this one. I had initially settled for three feeds, each dedicated to a set of content, as can be seen in the *follow* page.[^FollowPage]

The downside to my original approach, even if only a marginal one, was that I did not offer the option for someone to follow every post on this website. Perhaps there are those who share the exact same interests as me and would be ok with having code-related stuff occasionally show up alongside EU politics. I needed a "catch-all" feed!

I was therefore searching for a way to concatenate arrays in a `for` loop. I did not find anything concrete, while I initially neglected some useful filters in the official documentation. I did eventually find a solution in the official forum, offered by *budparr*.[^TalkReference]

Following that example I proceeded to implement a "master" feed xml for all my collections that have an intrinsic chronological order. The idea is to loop through `site.documents` using the `where` filter. I settled on the following:

```xml
{% raw %}{% assign documents = site.documents | where: 'master', true | sort: 'date' | reverse %}

{% for document in documents limit:10 %}
  <entry>
    <title>{{ document.title | xml_escape }}</title>
    <link href="{{ site.url }}{{ document.url }}" />
    <published>{{ document.date | date: "%Y-%m-%dT%H:%M:%SZ" }}</published>
    <updated>{{ document.date | date: "%Y-%m-%dT%H:%M:%SZ" }}</updated>
    <id>{{ site.url }}{{ document.url }}</id>
    <content type="html">{{ document.excerpt | xml_escape }}</content>
  </entry>
{% endfor %}{% endraw %}
```

The loop's filter is a global front matter variable `master` with value set to `true` that I included in the `_config.yml` file for each collection. Here is the relevant part:

```
defaults:
  - scope:
      type: euhandbooks
    values:
      layout: "euhandbook"
  - scope:
      type: codelog
    values:
      master: true
  - scope:
      type: posts
    values:
      master: true
  - scope:
      type: seminars
    values:
      master: true
  - scope:
      type: publications
    values:
      master: true
```

I do not know if this is considered best practice or even if it is the most optimal way to deliver on my need. It works nonetheless. The master feed will show in reverse chronological order every item I have designated from all my collections (with the exception of the books, whose chapters have no date assigned to them).

The same approach can be used to implement something like a master blog, where I would present everything I write. I might do that sometime, though I would rather avoid it for a single reason: *clarity*. A blog of that sort requires explaining its context, such as that it aggregates the other three blogs, is not meant for everyone, etc. That may create confusion, especially since it can be a landing page. Whereas an xml feed, an otherwise niche tool, is not likely to do so, also due to how I present it in the *follow* page.

[^FollowPage]: [Follow protesilaos.com](https://protesilaos.com/follow/).

[^TalkReference]: [Tip: Merge Collections (workaround)](https://talk.jekyllrb.com/t/tip-merge-collections-workaround/2124). Published in the Jekyll forum on March 16, 2016.
