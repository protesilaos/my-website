---
id: 11293
title: Enumerative and generic rules
date: 2015-05-30T07:45:57+00:00
author: Protesilaos Stavrou
excerpt: On how the formulation of a rule impacts its application and capacity to function as intended in operations that increase in scale.
guid: https://protesilaos.com/?p=11293
permalink: /enumerative-generic-rules/
categories:
  - Philosophy
tags:
  - Logic
---
Think of a rule as a condition that applies, effectively or normatively, to a given item or arrangement thereof. The item(s) covered by the rule, the ones affected by it, form the set included in it, while all the rest make up the set which is excluded from it.

The way a rule is formulated determines the allocation of items between these two basic sets. An enumerative approach will yield an exhaustive list of items-to-be-included, while a generic expression will deliver an inexhaustive set of included items.

Say you have a news website with three categories of articles: politics, sport, culture. You want to have a function in place that gathers the content of all three categories and displays it on the homepage.

The enumerative rule `R1` will be like this:

<pre>The categories "politics", "sport", "culture" shall appear on the homepage</pre>

Whereas the generic rule `R2` would be something like:

<pre>All available categories shall appear on the homepage</pre>

On the face of it, there seems to be no difference whatsoever between the two statements. Both will render the exact same content on the homepage, as there is a perfect overlap between the notions of _the categories &#8220;politics&#8221;, &#8220;sport&#8221;, &#8220;culture&#8221;_ and _all available categories_.

Where one may find the functional distinction between `R1` and `R2` is in their scalability, their capacity to work as intended at an ever-expanding scale of operations.

One such increase in scale can be the creation of two more categories of content: business, travel. While these may exist in the database, `R1` will fail to display them on the homepage, for they are clearly not included in the exhaustive list. In contrast `R2` will present them due to the inference that the two new categories are encompassed by the concept of _all available categories_.

We will therefore have to assume `R2` to be more effective than `R1` provided both have the same intention (though an explicit rule is not inefficient per se).

## More than programming

This is not just about some neat logic of web design. It applies to life in general. Consider the case of politics. Bureaucracy is a feature of any modern state. It is an epiphenomenon of the interoperations that occur in a complex network of rules; rules that usually are enumerative without any functional need for being so.

Based on my experience, what usually is the problem in a sclerotic legal corpus is not so much the quantity of laws, but the actual way their provisions are formulated. The tendency is to spell out every possible scenario, instead of focusing on what may be the common thread underlying the possible states of affairs.

Once an outcome that was not foreseen occurs, the law requires an amendment or those involved in the edge case must resort to litigation. Either process entails further deliberations that may yet again produce rules akin to those they set to rephrase.

Alas, when it comes to &#8220;real world&#8221; rules more time is spent on grandstanding than on grasping the essentials of the issue at hand!