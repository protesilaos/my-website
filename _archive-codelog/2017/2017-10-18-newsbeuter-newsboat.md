---
title: "Newsboat replaces abandoned (?) newsbeuter"
subtitle: "The same program, only it is actively maintained"
excerpt: "Newsbeuter seems to have been abandoned. Fortunately there is a fork: newsboat is the same code base and is maintained."
date: 2017-10-18
permalink: /codelog/newsboat-newsbeuter/
---
For some reason I happened to stumble upon the source code of `newsbeuter`, my default RSS/Atom feed reader. According to [issue #525](https://github.com/akrennmair/newsbeuter/issues/525), the project seems to have been abandoned. That is a pity. I really like this tool.

On the upside, a drop-in replacement is available: [newsboat](https://github.com/newsboat/newsboat). It is a fork of the original program. The only difference is that it is actively maintained.

Though I did not encounter any problems with `newsbeuter`, I decided to make the switch just for the sake of being on the safe side. Once I compiled the new program, I ran the following command to complete the transition:

```shell
# Rename configs
# Assuming ~/.newsbeuter
mv .newsbeuter .newsboat
```

My feeds and podcasts (`podbeuter` => `podboat`) work as they did before.

Thank you for the fork! Hopefully the author of `newsbeuter` is doing all right and will get back to maintaining the repo.

## By the way

The podcasting options of this program are fairly simple. They get the job done without much fanfare. Exactly what I need. 

When you open a feed item in `newsboat` that contains an enclosed link (the audio file), just hit `e` to *enqueue* it. It will then be available for download when you run `podboat`.
