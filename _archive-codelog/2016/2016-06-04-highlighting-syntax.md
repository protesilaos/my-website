---
title: "On highlighting code syntax"
date: 2016-06-04
excerpt: "Highlighting code involves an understanding of its structure and of the inner hierarchy of the applied colour scheme."
permalink: /codelog/highlight-code/
---
I have thus far developed a number of [colour schemes](https://protesilaos.com/schemes/) for the purposes of highlighting code syntax. I group them under the label "Prot16", which is a reference to their starting point: the sixteen-colour palette.

The question on the back of my mind has been whether this exercise constitutes science or art. I guess it is a combination of both, if by the latter we can also denote a method for combining colours with a primarily functional end. By that I mean that the presentation cannot just "look good". It needs to look good in the context of an actual coding session. The application is the criterion.

To be a bit more descriptive:

- **Science.** A prerequisite is an understanding of the code, its syntax and order. For highlighting to perform its function, the colours themselves must reveal the code's inner structure. For example, if only variables are blue and a piece of code is primarily blue, then we know from this indication alone that the sample consists of many variables.
- **Art.** We are concerned with visual presentation and search for the *gestalt*. The colours need to be interoperable, work together in all of their combinations, though not as colours per se, but as referencing parts of code syntax. They must preserve their distinctness yet also contribute to the design quality of the theme as such. A scheme is a functional combination of colours, though never a combination of functional colours.

## The palette

I use a sixteen-colour palette for each theme. From it I derive two variants, a "light" and a "dark". These are necessary for a complete experience that remains consistent in a variety of lighting conditions (I do work with both depending on the room and the time of the day). Each variant uses twelve colours and only differs from its counterpart in the four base values.

My palettes are ordered thus (number of colours in parentheses):

- Dark base (4)
- Light base (4)
- Primary accent colours (3)
- Secondary accent colours (2)
- Tertiary accent colours (3)

The base sets consist of a background, a background highlight, secondary text, and primary text. The accents are variations of red, orange, yellow, green, cyan, blue, violet, and magenta.

Creating the palette is quite a challenge:

1. I start with an idea of the primary accents. They need to combine well and create sufficient contrast.
2. I derive background colours for the light and the dark variant. They must have hints of a specific hue, yet remain neutral.
3. I test the primary colours on the backgrounds. Here is where I make the initial refinements to both sets.
4. I then introduce the secondary accents. They must complement the primary ones. This can be particularly tricky for the cyan and the magenta, which can look very close to the blue and the red respectively. To that end and to avoid confusion, the selection of the secondary colours is contingent on stage 1.
5. I test all of them together and make yet more refinements to achieve harmony.
6. Then I add the tertiary accents. Their role in the theme is to provide greater though carefully considered contrast.
7. Once again, I test all of the combinations and make the necessary adjustments.
8. I create a local package for the Atom text editor and use it in a variety of real world scenarios, such as to write in markdown or produce some code. If something does not feel right, I go back to the drafting phase.
9. I finalise the palette only if the theme works in practice. Whatever changes I may introduce thenceforth are limited to other aspects of the Atom package (usually support for a specific language).

All of my themes share a single code base. Their sole substantive difference is in the file where I define the colour values as global variables.

## Visual order

In every code language there are parts of the syntax that are used more often than others. For instance, a CSS file will have many class names and properties, whereas SCSS will rely on variables and mixins. Colour can help make this clear at first sight.

Because of the differences between programming languages, the application of the palette is not automatic. Attention must be given to what each one uses the most. That which is most prevalent must be given a primary accent value. Other entities must be styled accordingly.

Colour denotes function, at least when it comes to design of this sort. Every user of the Internet already knows that. Think of how a link to another page is styled differently from ordinary text. When you see a blue word in an otherwise black body of text you know it is clickable. It will lead you somewhere else. Similarly, code highlighting must already indicate *in context* what each part of the code is about.

One mistake I often see in web design is for different functions to be styled in the same way. A case in point is when underlined text is both a hyperlink and a form of emphasis. Or when the same colour is used for completely different parts of the article, such as links and headings. That kind of presentation fails to convey the differences in meaning or purpose. The user cannot know what is what just by looking.

Visual order is important to reduce friction. The user saves the time that would otherwise be wasted on guesswork. Any potential source of confusion is addressed so that they may focus on what matters the most. Couched in those terms, syntax highlighting helps with writing code. It makes it easier to scan the document and identify its various parts.

## The impetus

A few months ago I discovered Ethan Schoonover's [Solarized](http://ethanschoonover.com/solarized). That was my favourite theme and the single most important influence on my work. I fully shared its philosophy but was not particularly satisfied with its implementation, at least insofar as the Atom port is concerned. I thought it was not doing a great job at establishing visual order. This was particularly problematic with the dark variant and its overwhelming use of blue.

I had to create my own themes because I could not find anything that would satisfy all of the following:

- **Has carefully-considered contrast.** Based on my experience (I wear thick glasses), poorly implemented colour combinations will strain the eyes.
- **Does not impose time restrictions.** My typical writing/coding session starts very early in the morning when it is still night outside and extends into daytime. I therefore need a theme that can make the transition as smooth as possible. Switching between two unrelated light/dark variants tends to disturb me. I end up noticing the styling more than the item I am working on.
- **Uses colour as a means.** This also relates to the need for visual order. As far as syntax highlighting is concerned, I do not like the use of colour for its own sake. It is frivolous. The raison d'être of a syntax theme is to help discern the code's structure, not pretend to compete with real art.

## The future

Development on the Atom packages will eventually come to a conclusion, minor refinements notwithstanding.

My intention now is to work on something different: a template/theme for Jekyll-powered websites that will be distributed as a Ruby gem. One of its features will be the option to easily switch between all of my colour schemes, in both their light and dark variants.

More on that in the coming weeks. You can already get a glimpse of what I have in mind by browsing through the individual web pages under [Prot16](https://protesilaos.com/schemes/). You will notice that the website changes theme to match that of the project.
