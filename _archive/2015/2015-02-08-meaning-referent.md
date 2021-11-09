---
id: 8779
title: Meaning and referent
date: 2015-02-08T08:43:43+00:00
author: Protesilaos Stavrou
excerpt: Objects can be referred to by a unique identifier. The meaning of such identifier is intersubjectively enforced by those familiar with its substantiation or can be strictly limited to an effective private language. Examples of web design are used to drive the more general point.
guid: https://protesilaos.com/?p=8779
permalink: /meaning-referent/
categories:
  - Philosophy
tags:
  - Contextuality
  - Logic
  - Metaphysics
---
Contents:

  * Introduction
  * Names as identifiers
  * Intersubjectivity of meaning
  * Conclusion

## Introduction

Does the meaning of a name have an intrinsic connection to the object referenced? Is it objectively contained in the word or attached to it by means of [intersubjective] convention? Can an object be denoted with words/symbols/phrases that have no apparent relation to it? And where would its meaning derive from or be grounded in?

These are some of the questions that may be raised from a closer look of naming and discourse in general. The inferences drawn from the answers to them can have a broader philosophical scope. For the sake of this blog post, attention will be given to the narrower subject of the meaning a name has and the manner of its relation to the object it references.

In our case studies, we shall present some very basic instances of web design language, HTML and CSS in particular, only for the sake of supporting our argument. More specifically, we will use the examples of two website elements, a hyperlink and a text block, to outline the hypothesis that meaning can be contained in — and limited to — an effective private language or be intersubjectively enforced. The assertion being that meaning is not inseparably attached to the referent and, in fact, has no intrinsic connection to it.

In the interest of simplicity and to remain within the scope of philosophy, we will strip away some technical aspects of web design. The reader who is not familiar with web development should therefore not feel unsettled as everything will be explained in detail and things will be kept at their simplest.

## Names as identifiers

Let us make use of a tangible example of a common webpage element. Our referent shall be an anchor text or else a _hyperlink_ (the thing you click to navigate from one webpage to another).

First we decide what we want our hyperlink to actually link to and what will the linkable text (anchor text) be. It will be a call to action: to follow the present author on Twitter by directing the reader to this page/url:

`https://twitter.com/prot_stavrou`

We thus proceed to create the basic structure of the link, which is its HTML code.

<pre class="prot-custom-syntax">&lt;a href="https://twitter.com/prot_stavrou"&gt;Follow @prot_stavrou&lt;/a&gt;</pre>

This will create a very basic link that will perform its function while inheriting whatever properties all hyperlinks of this [portion of this] website have. It will therefore look like this:

[Follow @prot_stavrou](https://twitter.com/prot_stavrou)

What we now want is to reference this object specifically, so we have to give it a name that is peculiar to it or, more generally, a name that differentiates it from other links/elements.

We thus incorporate the necessary identification in our code in the form of the **id** value.

<pre class="prot-custom-syntax">&lt;a id="prot-twitter-follow" href="https://twitter.com/prot_stavrou"&gt;Follow @prot_stavrou&lt;/a&gt;</pre>

The value **prot-twitter-follow** to the extent that it references only this hyperlink has bestowed on it a status of uniqueness, which enables us to write a stylesheet (a CSS code) substantiating its properties, fleshing out said uniqueness.

We may then add some flavour by making it look more like a &#8220;button&#8221; with pronounced boundaries, a cyan background and white typeface.

<pre class="prot-custom-syntax">#prot-twitter-follow {
background: #00aaee;
color: #fff;
padding: 5px 8px;
}</pre>

Our referent will now look like this:

<a style="background: #00aaee; color: #fff; padding: 5px 8px; border-bottom: none;" title="Follow me on Twitter" href="https://twitter.com/prot_stavrou" target="_blank">Follow @prot_stavrou</a>

In the example above we have used an identifier that has little semantic significance outside this very context. It is most likely that our daily discourse will not include such terms as **prot-twitter-follow** in this very form and for this very purpose. Simply put, this term is vaguely meaningful or even meaningless to a general english-speaking audience.

But what if the identifier we selected to refer to this hyperlink were a word that would signify something totally different in the context of ordinary english, while still performing its assigned function?

To answer the question, we will furnish another example: the case of a _paragraph_ block that contains any random text input, whose unique identifier happens to be a word that names a particular fruit. We will identify our text block as **banana**.

The HTML element with some dummy, &#8220;Lorem ipsum&#8221; text:

<pre class="prot-custom-syntax">&lt;p id="banana"&gt; Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus luctus ultricies sagittis. Morbi in iaculis ipsum, sit amet feugiat urna. Etiam tincidunt scelerisque porttitor. Phasellus at augue euismod, tempor ligula in, dapibus eros. &lt;/p&gt;
</pre>

Without any CSS our paragraph will look like all the others on this blog, so we proceed to add the styles directly, which will be an indigo background, a solid pink bottom border, smaller and lighter text as well as a sans-serif typeface.

<pre class="prot-custom-syntax">#banana {
padding: 10px;
background: #3F51B5;
color: #eee;
font-size: 16px;
font-family: Helvetica, Arial, sans-serif;
font-weight: 300;
border-bottom: 3px solid #E91E63;
}</pre>

Here is how our **banana** looks:

<p style="padding: 10px; background: #3F51B5; color: #eee; font-size: 16px; font-family: helvetica, arial, sans-serif; border-bottom: 3px solid #E91E63; font-weight: 300;">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus luctus ultricies sagittis. Morbi in iaculis ipsum, sit amet feugiat urna. Etiam tincidunt scelerisque porttitor. Phasellus at augue euismod, tempor ligula in, dapibus eros.
</p>

For as long as the unique identifier holds and within this context the term **banana** can only refer to paragraph elements with the above-substantiated properties. It is of no relevance to this application what sort of signification(s) &#8220;banana&#8221; may have in contexts other than it.

By having elaborated on those two examples, we hope to have demonstrated how a web element — an object — is given a specific name that has no intrinsic significance whatsoever and whose only meaning _derives_ from two closely-related factors:

  1. _discernability_: that it performs the primary function of discernment, in substantiating and differentiating the object and properties thereof from others in its class and in general;
  2. _specificity_: that the name itself does not conflict with other parts of this effective private code of communication, i.e. that by **prot-twitter-follow** and **banana** we specifically comprehend their respective referents.

## Intersubjectivity of meaning

What follows from the above is that a certain code of communication can consist of arrays of identifiers that render meaningful whatever objects are being referenced. Whether that code of communication can qualify as a language used to convey meanings between subjects will largely depend on the degree to which its internal structure and set of significations are intersubjectively accepted, understood and applied.

Put simply and succinctly, the **prot-twitter-follow** and **banana** identifiers would have an intersubjective meaning if they were tacitly accepted by anyone familiar with the [portion of the] code of communication here presented. If that were so, they would cease to be facets of an [incomplete] effective private language.

The status of a code of communication qua effective private language stems from two parameters: (a) that its technical meaning, the actual reference it makes, is only grasped by its formulator, and (b) that the identifier can only be rendered meaningful within the scope of this language&#8217;s use.

There is a certain application substantiating the identifier. There is no inner meaning to it. Nothing. The words themselves can be selected arbitrarily and still perform the exact same function that will deliver the desired results. Indeed, the names we opted to write could be any random combination and concatenation of gibberish.

In the hyperlink example, the individual words &#8220;prot&#8221; (the shortened version of my name), &#8220;twitter&#8221; and &#8220;follow&#8221; do not enjoy any special status or bring additional utility to our use by virtue of them being understood jointly and separately by english speakers. Neither their peculiar nor their combined signification in ordinary language is _necessarily_ preserved in the application, the context, where the identifier is immersed in and substantiated. As for the second example, it is evident that the **banana** identifier has nothing to do with the fruit.

Based on these observations it is not far-fetched to imagine a group of people with equal technical skills who congregate some space to produce a more systematic code of communication for any given purpose, say, to build a website. They will identify the full array of elements that will interoperatively render the project in its final form and, moreover, they will develop the code that will effectively specify the properties of each and all of those elements. Within that context they will introduce a full range of identifiers that will be perfectly meaningful to them. These are the outlines of an esoteric language, a code of communication that is shared by a relatively closed group of people.

Of course, a language properly so called would also require some sort of grammar and syntax. Furthermore, there may be practical and other constraints to the creation of ad hoc codes of communication that are semantically divorced from the broader lingual milieu. Nonetheless and without willing to deviate from this article&#8217;s topic, we hold that their consideration would not subtract from this blog post&#8217;s thesis.

## Conclusion

In studying [web design] language with attention to the meaning(s) entailed in names we can draw some useful inferences concerning the relation between words qua noetic objects and their [ontic] referents.

We have made use of some very basic examples of website elements and of HTML/CSS code to substantiate our claim about the meaning of names being extrinsic.

In particular, we have argued that names act as identifiers of objects and that word and its meaning are not inextricably bound up together, for meaning stems from the contextual application of the identifier, the discernibility it grants to the referent as well as the quality of and degree to which it is intersubjectively shared, understood and used.

Admittedly, the above only scratch the surface of the topic, while they do relate to other issues we have already examined on this website, such as the [constitution of the case](https://protesilaos.com/constitution-case/ "The constitution of the case"), [implicit properties in objects](https://protesilaos.com/implicit-properties-objects/ "Implicit properties in objects"), [intersubjectivity of value](https://protesilaos.com/value-justice-gyges/ "On the value of justice (Ring of Gyges)") and others.

If our thesis is valid and broadly applicable, then the implication for philosophical and other disputes or controversies that rest on the presumption of some transcendental &#8220;meaning&#8221; in the names they laud and exalt is that they are generated and sustained by little more than a mere misunderstanding.