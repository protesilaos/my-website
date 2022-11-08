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

I maintain lots of packages for GNU Emacs, including the `modus-themes`
which are a part of core Emacs and the increasingly popular `denote`
note-taking system.  My code focuses on clarity, correctness, and
composability.  I place great emphasis on documentation.  The manuals
I write are thorough and comprehensive.  All my themes (`modus-themes`
and `ef-themes` projects) are designed in accordance with accessibility
standards for colour contrast---inclusiveness is of paramount
importance.

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
  including politics, programming, and philosophy.  The website also
  hosts all the technical documentation of my Emacs packages.  All my
  publications are provided for free and in freedom.

- **2012 -- 2015:** Worked as a parliamentary assistant at the European
  Parliament.  Also did some minor freelancing jobs related to
  European Union politics.

## Education

- Bachelor's Degree in European Politics, Economics, and Law from the
  European University Cyprus (2012).
- Self-taught philosopher.
- Self-taught programmer.
- Native Greek speaker.
- Proficient English speaker.
- Competent with French.
- Good with Spanish.
- Rudimentary understanding of Portuguese and Italian.

## Publications

{% assign indices = site.data.indices %}

{% for i in indices %}
-  <strong><a href="{{ i.url | absolute_url }}">{{ i.name }}</a> :: </strong> {{ i.description }}
{% endfor %}
