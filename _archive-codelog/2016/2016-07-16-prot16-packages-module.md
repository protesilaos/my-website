---
title: "Developing the 'packages' module for Prot16"
date: 2016-07-16
excerpt: "Analaysis of the methods used to create the 'packages' module for every project in the Prot16 collection."
permalink: /codelog/prot16-packages-module/
---
Almost all of the colour schemes in my [Prot16 collection](https://protesilaos.com/schemes/) have their own GitHub repositories and corresponding Atom syntax themes. I used to provide that piece of information in a simple unordered list.

#### Demo of the old module

- Light variant: [Atom](#) - [GitHub](#)
- Dark variant: [Atom](#) - [GitHub](#)

#### Demo of the new module

<div class="packages clearfix">
  <div class="clearfix">
    <a href="#">Atom</a> <a href="#">GitHub</a>
    <span>Or run the command</span>
    <code>apm install symbiosis-syntax</code>
  </div>
  <div class="clearfix">
    <a href="#">Atom</a> <a href="#">GitHub</a>
    <span>Or run the command</span>
    <code>apm install symbiosis-dark-syntax</code>
  </div>
</div>

## Why the change

The old code worked but was suboptimal on a number of levels:

1. **Role.** These are supposed to be important links. A "call to action" as it were. The user can either download the Atom package or check the GitHub repo. Without some visual cue to denote their significance, these links could be—and perhaps *were*—overseen.
2. **Function.** I was running some speed tests on Google's relevant tool (where my site gets 99/100 both for mobile and desktop), only to be warned that the links on that list were somewhat small tap targets for touch screens. Perhaps a minor problem, but one in need of a solution nonetheless.
3. **Presentation.** This was a list, yet it tried to work like a table with rows and columns. It also had to have a written description of the theme variant included in the links (the "light"/"dark" label). All in all, the visual language left something to be desired.

## The underlying rationale

The unordered list had to go. Its replacement would be an outer block element consisting of two inner blocks, one per theme variant. In each of these there would be links to the corresponding Atom and GitHub pages, styled as buttons. The inner blocks would also provide the command for downloading the package directly from the terminal. Furthermore, the inner blocks would inherit the background and foreground colours of their respective theme variant, eliminating the need for the light/dark label.

The rest of the approach would be to develop something abstract enough that could scale to cover every [present and future] item in the Prot16 collection. All the operations would have to be conducted within an otherwise simple piece of code.

There are some prerequisites to achieve those goals. Fortunately I satisfied everything in advance, namely:

- a consistent format for all the links to Atom/GitHub;
- structured data in my Jekyll site regarding every item under Prot16;
- project permalinks that include the keyword of each Prot16 theme.

So let me walk you through my method.

## Jekyll data and Liquid logic

I maintain a `themes.yml` data file where I document the name and url slug of all the Prot16 items. Here is a snippet (the actual list is quite longer):

```yml
- name: Cyprium
  url: "cyprium"
- name: Flowerbed
  url: "flowerbed"
- name: Symbiosis
  url: "symbiosis"
- name: Playa
  url: "playa"
- name: Orionis
  url: "orionis"
```

Each Prot16 project page has the same URL structure: `protesilaos.com/THEME-URL-SLUG/`. For *Symbiosis*, the theme used on this website, that would be [protesilaos.com/symbiosis/](https://protesilaos.com/symbiosis/).

I can therefore use the data file in conjunction with the permalink of each project to validate an identity/match between them. This allows me to create a loop that checks for that identity and fetches the relevant piece of data for creating the links to Atom and GitHub.

As a bonus of sorts, I can do all that within the same piece of HTML that renders the "packages" module. So here is the mixture of Liquid and HTML I am currently using:

```html
{% raw %}{% assign themes = site.data.themes %}

{% for theme in themes %}
  {% if page.permalink contains theme.url %}
  <div class="packages clearfix">
    <div class="clearfix">
      <a href="https://atom.io/themes/{{ theme.url }}-syntax">Atom</a>
      <a href="https://github.com/protesilaos/{{ theme.url }}-light-syntax">GitHub</a>
      <span>Or run the command</span>
      <code>apm install {{ theme.url }}-syntax</code>
    </div>
    <div class="clearfix">
      <a href="https://atom.io/themes/{{ theme.url }}-dark-syntax">Atom</a>
      <a href="https://github.com/protesilaos/{{ theme.url }}-dark-syntax">GitHub</a>
      <span>Or run the command</span>
      <code>apm install {{ theme.url }}-dark-syntax</code>
    </div>
  </div>
  {% endif %}
{% endfor %}{% endraw %}
```

Please ignore the actual markup. I may modify it further. Focus on these few lines instead:

```html
{% raw %}{% assign themes = site.data.themes %}

{% for theme in themes %}
  {% if page.permalink contains theme.url %}

  <!-- Code goes here -->

  {% endif %}
{% endfor %}{% endraw %}
```

This is a `for` loop that calls the aforementioned data file. Meanwhile, the `if` statement checks whether the page in question contains a url value that exists in the data file. That is where the identity is validated.

What it basically says is "if the current page is part of Prot16, then add its corresponding data".

Courtesy of the workings of this logic I programatically pass the correct `{% raw%}{{ theme.url }}{% endraw %}` value to all the relevant links.[^Prot16PagesArticle]

## The styles

As mentioned above, the packages module is an outer block consisting of two inner blocks: a "light" and a "dark". I could just assign them their own class and proceed to style them accordingly. But that is not necessary. I can just use a `+` operator to differentiate the second one from the first.

Example:

```scss
.packages {

  div {
    background: $lbg;     // Light background
    color: $lt1;          // Light primary text

    + div {
      background: $dbg;   // Dark background
      color: $dt1;        // Dark primary text
    }
  }

}
```

For the sake of brevity, I will not copy/paste the entire SCSS for the packages. You get the idea.[^WebsiteGitLabRepo]

The cool thing about the way I have written all of my theme's variables is that every project page applies its own colours to the module. I do not have to write any additional stylesheet for each Prot16 page.

## Jekyll data is powerful

This is the common thread running through my recents posts, in large part because it is a learning experience. Data files provide a great degree of flexibility on what can be done with Jekyll. I obviously am not the most technical of users, yet I can still get it to perform some interesting tasks.

I may still modify the presentation of the Prot16 pages, but here are the things that will remain constant, i.e. the ones that matter the most from a developer's perspective:

- the combination of SCSS, Liquid, and Jekyll data underpins the design of a scalable system for presenting all of my colour schemes;
- I write much less code than I would otherwise have to;
- it is easier to track down any errors, since there are only a few files involved;
- given the right configurations, this setup is lightweight, and simple in retrospect.

I guess that covers it. Go ahead and have a look at some of [my syntax themes](https://protesilaos.com/schemes/) to see how all this comes together.[^AltoFicusNote]

[^Prot16PagesArticle]: The present analysis can be considered an annex to a previous article: [Creating the Prot16 project pages](https://protesilaos.com/codelog/prot16-pages/). The methods described herein are an extension of the practices presented there.

[^WebsiteGitLabRepo]: Note that [my website's source code](https://gitlab.com/protesilaos/protesilaos.gitlab.io) is available on GitHub. The purely code-related parts are distributed under the MIT License.

[^AltoFicusNote]: For the time being, *Alto* and *Ficus* are not published as Atom themes and, therefore, do not feature the "packages" module documented herein.
