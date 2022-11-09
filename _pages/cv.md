---
title: "Curriculum Vitae"
excerpt: "CV of Protesilaos Stavrou."
permalink: /cv/
layout: page
---

Protesilaos Stavrou

Website: <https://protesilaos.com>  
Email: <public@protesilaos.com>  
Residence: Cyprus (Troodos mountain range)

## Profile

I am a self-taught programmer and philosopher.

I maintain [lots of packages for GNU
Emacs](https://protesilaos.com/emacs), including the `modus-themes`
which are a part of core Emacs and the increasingly popular `denote`
note-taking system ([watch its
demo](https://protesilaos.com/codelog/2022-06-18-denote-demo/)).  My
code focuses on clarity, correctness, and composability.  I place
great emphasis on documentation.  All the manuals I write are thorough
and comprehensive.  My themes (`modus-themes` and `ef-themes`
projects) are designed in accordance with accessibility standards for
colour contrast (WCAG AA and WCAG AAA), as well as to empower users
with red-green or blue-yellow colour deficiency (deuteranopia and
tritanopia, respectively)---inclusiveness is of paramount importance.

I talk, write, and do philosophy.  I generally try to express myself
in plain terms and make my thoughts relatable to everyone.  I consider
my theories "practical", in the sense that I put them to the test and
live by those precepts.

I am an original thinker, an independent spirit, a patient and
attentive listener, a polific writer, as well as a disciplined person
in all aspects of my life.

## Skills

- Writing
- Public speaking (video format)
- Conceptual analysis
- Technical documentation
- Emacs Lisp
- Git
- Shell (Bash)
- HTML
- CSS
- Jekyll
- Colour palette design

## Activities

- **2019 -- Present:** Started working with Emacs.  Learnt to program
  in Emacs Lisp, without a background in programming.  I maintain more
  than 10 packages and have contributed to core Emacs, among other
  projects in the community.  The Free Software Foundation awarded me
  the *2021 Award for Outstanding New Free Software Contributor*:
  <https://www.fsf.org/awards/onfsc-award>.

- **2016 -- Present:** Switched my computer to the GNU/Linux operating
  system and began learning about Unix tools.  My distribution of
  choice is Arch Linux.

- **2011 -- Present:** Launched my personal website, protesilaos.com,
  which now contains more than 1000 publications on a range of topics,
  including philosophy, programming, and politics.  The website also
  hosts all the technical documentation of my Emacs packages.  My
  publications are provided for free and in freedom.

- **2012 -- 2016:** Worked as a parliamentary assistant at the European
  Parliament.  Also did some minor freelancing jobs related to
  European Union politics.

## Education

- Bachelor's Degree in European Politics, Economics, and Law from the
  European University Cyprus (2012).
- Self-taught programmer.
- Self-taught philosopher.
- Native Greek speaker.
- Proficient English speaker.
- Competent with French.
- Decent with Spanish.
- Rudimentary understanding of Portuguese and Italian.

## Publications

{% assign indices = site.data.indices %}

{% for i in indices %}
-  <strong><a href="{{ i.url | absolute_url }}">{{ i.name }}</a> :: </strong> {{ i.description }}
{% endfor %}
