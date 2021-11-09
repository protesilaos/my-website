---
title: "Introducing the Prot16 Builder"
subtitle: "Experimental but still useful"
excerpt: "This is an experimental tool for producing ports of my Prot16 colour schemes for various apps."
date: 2017-02-19
permalink: /codelog/intro-prot16-builder/
---
Over the last few weeks, I have been reviewing my workflow regarding the production and distribution of my Prot16 colour schemes. The objective has been to port them over to a number of applications, mostly terminal emulators. Some ports have already been developed, though the process behind the scenes was rather tedious and practically impossible to scale. I thus decided to commit time to developing a system that could help me in my rather repetitive tasks. The result is the *Prot16 Builder*, which comes as a simple nodejs package (find it on [GitHub](https://github.com/protesilaos/prot16-builder) or over at [npmjs](https://www.npmjs.com/package/prot16-builder)).

For those not much into reading, fire up a terminal and execute the following:

```bash
$ npm install -g prot16-builder
$ prot16-builder --help
```

## The background story

I never had an overarching plan from the start. All I did in the beginning was try out various colour combinations and eventually package them into a theme (originally for the Atom editor). Not even the term "Prot16" was conceived. Everything came on its own.

My starting point for developing a colour scheme was Ethan Schoonover's Solarized. A true masterpiece. I thus settled on a method of using a 16-colour palette that consists of 8 base values and 8 accents. As with Solarized, the themes would have to be able to transition from 'light' to 'dark' environments with minor alteration to the mapping of colours (though not the values themselves).

Every theme I developed for the Atom editor hitherto has been done manually. Making ports for 23 schemes (double that if light and dark variants are developed separately) is virtually impossible. Especially once the number of ports increases. Automation was needed to take the next step.

## About the Prot16 Builder

Long story short, I found the [Base16 Builder](https://github.com/base16-builder/base16-builder), which is a re-imagining of the original Base16 tool. I initially tried to integrate my work with what it offered but found its conventions rather limiting for my ends. 

One of the innovations that Prot16 introduces is the notion of the "visual order". The idea is that each theme has an intrinsic colour mapping which gives it its identity. Such visual order is absent from the Base16 Builder, which results in a multitude of themes all feeling exactly the same, only with a change in colour tones. To put it in concrete terms, I do not want all constants to be blue and all variables to be violet. That may be appropriate for a theme such as [Caprice](https://protesilaos.com/caprice/) but is out of place in [Gaia](https://protesilaos.com/gaia/).

So I forked that tool to fit my case. I removed all the schemes and templates it offered and replaced them with my own. All the `.yml` files for the schemes have much more data than their counterparts in the original tool. Apart from defining the palette, I have also provided for the visual order as well as for the necessary definitions for terminal emulators (this practically is about Vim in terminal mode).

The Prot16 Builder is very much an experiment. I still need to refine or otherwise expand upon the following:

- documentation;
- the data structure of the schemes;
- the completeness of the templates, especially for Terminator;
- the comprehensiveness of everything pertaining to Vim, i.e. the themes for the main app and the airline plugin;
- better language support for Vim (or should plugins handle that?);
- clean up the underlying code base;
- improve the bash scripts, especially since they now are instructed to make new directories in my own environment.

## Prot16 everywhere

The reason I am publishing this tool is to provide the opportunity to anyone willing to contribute to easily add their changes. What I am definitely not trying to do is duplicate the work done by all the projects related to Base16. Please use them instead, if that is what you need.

In conclusion, I found the process of hacking at a tool to solve some real world problem to be rather didactic and exciting. Here is wishing that the Prot16 themes are eventually ported to any app or program that could make good use of them.

