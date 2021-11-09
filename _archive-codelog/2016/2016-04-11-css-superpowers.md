---
title: "The power of Sass"
date: 2016-04-11T03:24:00+00:00
excerpt: "Some of the advanced features of the Sass preprocessor allow for significant efficiency gains."
permalink: /codelog/sass-power/
---
I am self-taught. The way I learned CSS was to first identify one area of the web page that I needed to style differently and then search through the stylesheet for something that would signify it. Hours of trial and error helped me grasp how things work, at least on a surface level.

One of the downsides of being an autodidact is that you get to learn the art your way, which may embed your mistakes. I was first hacking into Blogger and then a self-hosted WordPress. I was editing their CSS directly through their interface. I therefore reproduced such errors as (i) not making use of white space, (ii) repeating myself, (iii) not having an overall hierarchy for my styles, (iv) lack of consistency between the elements, (v) the propensity to add superfluous styling, and so on.

I have eventually addressed these malpractices, in large part thanks to the use of a text editor.[^AtomEditor] The catalyst, however, has been my transition to a new workflow that involves Jekyll, Git, and the Sass preprocessor.[^SassNote] I initially thought of Sass as some sort of a "CSS with variables" but I soon learned that it is *much* more than that. It allows for modular stylesheets, the nesting of elements, functions known as "mixins", inheritance (which is one of my favourite concepts from Plato's philosophy—subject for another post), and probably some more advanced techniques I am not aware of.

## Modularity

Sass allows for partial stylesheets, designated by a starting `_` in their file name, which are then imported into the main file (in my case, that is `akademos.scss`). For example:

```scss
// Includes content from _sass directory

@import
  'variables',
  'base',
  'links',
  'syntax';
```

The `_sass` directory is where all the partials are found. Should I ever need to, say, remove the styling of the links, I would just not import its partial into the main file and could even delete the `_links.scss` file altogether.

The greatest benefit this setup offers is *clarity*. I understand where everything is and have a better sense of what I include in the final stylesheet.

## Nesting

Sass helps you economise on words. In standard CSS you need to declare each selector, such as:

```scss
.post-content p {
  color: #333;
}

.post-content a {
  color: #07C;
}

.post-content blockquote {
  font-style: italic;
}
```

Instead of repeating what is common in this multitude, the `.post-content` class, we can abstract it thus:

```scss
.post-content {
  p {
    color: #333;
  }

  a {
    color: #07C;
  }

  blockquote {
    font-style: italic;
  }
}
```

One area of my website where nesting has been particularly useful is the syntax highlighting stylesheet. Each selector must be preceded by a `.highlight` class. With over 60 of them, writing it in standard CSS becomes a tedious task. Whereas with nesting, the `.highlight` is only mentioned once.

Here's how it would have been before:

```scss
.highlight {
  background-color: #002B36;
  color: #839496;
  border: thin solid $darken-1;
}

.highlight .c { color: #839496 }
.highlight .err { color: #839496 }
.highlight .g { color: #839496 }
```

And here is the nested version:

```scss
.highlight {
  background-color: #002B36;
  color: #839496;
  border: thin solid $darken-1;

  .c { color: #839496 }
  .err { color: #839496 }
  .g { color: #839496 }
}
```

Nice.

## Mixins

These are quickly becoming my favourites. Mixins are sets of variables. They help with optimising your input. On this website I sometimes need to add a "label" next to a piece of text. For instance, I do that with feed links, where I declare a pseudo element with `content: "RSS"`. In the past I would write the attributes of the label each time I needed them. Now I just include this mixin:

```scss
@mixin label($content, $hue) {
  content: "#{$content}";
  display: inline-block;
  font-family: $mono;
  font-size: $h7;
  font-weight: $normal;
  font-style: normal;
  line-height: inherit;
  background: #{$hue};
  color: $ochre;
  padding: ($space-2 * 0.05) ($space-2 * 0.2);
  margin-right: ($space-2 * 0.2);
}
```

This has two variables specific to it, which allow for adapting it to the exact needs of each element. These namely are the `$content` and `$hue` arguments for `label`.

For my feed links to be styled the way they do, I simply include the mixin and pass the necessary arguments. Example:

```scss
a[href$="/politics.xml"]:before {
  @include label("RSS", $cyan);
}
```

When I style a new label, I just add the mixin again, such as:

```scss
// "Follow me" link
.footer-call a:before {
  @include label("•••", $blue);
}
```

Better!

## Optimality on the margin

By combining the various features of Sass we improve the efficiency of our stylesheets. At least as far as I am concerned, this new workflow around Jekyll helps me become a better coder. Within a mere couple of months of usage, I developed better practices for organising my work and learned some neat tricks for improving it.

I am sure there is more to Sass. The official documentation has some interesting use cases. I will continue experimenting as I am super excited with its potential. Any progress will, as always, be reflected on this website and be recorded in [its Git repository](https://gitlab.com/protesilaos/protesilaos.gitlab.io). I may also write something about it.

[^AtomEditor]: I use [Atom](https://atom.io/) for writing and coding.

[^SassNote]: As far as I can tell, the term "Sass" has two uses: (1) it denotes the [Sass preprocessor](http://sass-lang.com/), and (2) it refers to the original syntax of the preprocessor. The Sass syntax looks interesting, but I prefer the newer version—SCSS—for its less stringent requirements on spacing.
