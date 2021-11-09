---
title: Moved from WordPress to Jekyll
date: 2016-02-01T15:49:00+00:00
excerpt: I recreated my website with a different software. The reason was practicality. The reader is not affected by this change.
permalink: /wordpress-jekyll/
topic: Meta
---
For the last three years my website was powered by [WordPress](https://wordpress.org). I recently switched to a different piece of software: [Jekyll](http://jekyllrb.com/). The transition took about ten days of incessant work in addition to a lot of prior planning. I only paused twice to produce my last two blog posts. The reason for rewriting the underlying code base was practicality. I needed a minimal, efficient platform specific to my blogging needs: to output text in regular intervals and to have full control over the process.

WordPress is very good at what it does. Plus, it is open source and has a vibrant community around it. What it is not is *simple*. Even a basic installation requires maintenance on a number of fronts. Themes, plugins, a database, the server, regular and multiple backups. All demand your attention. I ended up spending too much time configuring the system's moving parts rather than focus on my content.

Jekyll is different. It has no database, no need for server logic to interpret the input, no native commenting tools, no back-end replete with menus, options and settings. In short, Jekyll gets out of your way. For a blogger [and a minimalist] such as myself, a simple and neat solution is always preferable to any complex arrangement. I was initially hesitant to commit to such a drastic change in my workflow, especially since I was not familiar with Ruby and the command line. With a little bit of research that obstacle was overcome.

I realised the power of Jekyll indirectly. It all started in early November 2015 when I was searching for a means to publish my short ebook on the EU. I ended up using [GitBook](https://www.gitbook.com/), a static site generator *just like Jekyll*. Its simplicity was impressive: my markdown files were almost automagically rendered as HTML and made available as a concatenation of web pages. That is exactly what I always wanted! Text distributed through the browser and organised in some meaningful way. To be sure, WordPress does that, though it adds much more than the essentials.

My blogging life has reached its fifth year. I started off with Blogger, moved to WordPress, and now Jekyll. In the process I have become a somewhat better writer and a coder. What I have come to appreciate is a parsimony of sorts: to be good, implements must operate seamlessly and predictably, without constantly calling for your attention. As Tom Preston-Werner puts it in his [excellent article](http://tom.preston-werner.com/2008/11/17/blogging-like-a-hacker.html) about "Blogging like a hacker":

> I feel a lightness now when I’m writing a post. The system is simple enough that I can keep the entire conversion process in my head. The distance from my brain to my blog has shrunk, and, in the end, I think that will make me a better author.

The reader should not be affected by this transition. What you may notice though is that I have used this major overhaul as an opportunity to incorporate my ebook into my website. At the planning stage I understood that since both would be static sites I could factor in some additional labour hours in order to complete their integration. Currently my ebook is exactly what it ought to be: an extension—an integral part—of my corpus of publications. If you have already read it, you may just spend a few seconds checking its [dedicated sections](https://protesilaos.com/euhandbook/) on this website. If not, this is a good chance to catch up. At any rate, please bear in mind that I plan to substantially update it some time in 2016 (maybe during April).

What I did with the ebook is an indication of what I may be doing with some other content-related projects I have in the works. You will be informed about them when the time is right.

In conclusion, I just wish to express my gratitude to the open source community in general. Their cumulative contributions enable people such as myself to achieve much more than what would otherwise be possible. In case you are interested in the source code of my website, you can examine the corresponding [repository](https://gitlab.com/protesilaos/protesilaos.gitlab.io). This project is in active development.
