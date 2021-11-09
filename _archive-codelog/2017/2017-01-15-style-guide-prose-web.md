---
title: "Styles for prose on the web"
subtitle: "What I have learned over the years"
excerpt: "A set of conventions to write effectively and present text in a pleasant way."
date: 2017-01-15
permalink: /codelog/styles-prose-web/
---
The purpose of this document is to present certain best practices I have developed over the years as a writer and web developer. They are an integral part of my work.

Stylistic choices are a form of convention. There are no universal laws in operation, though there exist certain objective criteria which help guide our thinking. The goal is to present text in an organised and coherent fashion.

As to why I am hereby writing down something I already know and practice myself, the answer lies in a couple of qualities germane to the written word:

- **Self-reflection.** I can always go back in time to see what a previous version of myself thought about these issues and how or whether I have evolved.
- **Share the knowledge.** If these are useful to me, then maybe they can be of value to someone else.

## Elements of style

These are the things a writer should consider. Applying them with consistency and care will help improve the quality of the end product. Readers will appreciate it, even if that may happen at a subconscious level.

### Leading statements in lists

Lists can contain lots of valuable information. To make sure that the reader does not skip past the essential point of each list item, we can start with a sentence that captures the gist of the rest of the sentence/paragraph. I already did so in the above list—with "Self-reflection" and "Share the knowledge"—and you will see it further below.

In general, the longer the list item, the greater the need for such a leading statement. All such statements are styled with strong emphasis to establish a certain structure that is particularly easy to scan through.

### The forms of emphasis

There are three ways in which a writer may denote emphasis:

1. **Regular emphasis.** Writing in *italics* or else using the `em` or `i` HTML tag. This ought to be considered the default option. It is subtle yet effective. It should be used to draw attention to a fine point of argument and to show that the statement is nuanced.
2. **Strong emphasis.** Writing in **bold** or else using the `strong` or `b` HTML tag. This is best applied in cases where structure is needed, such as this very list, or when a specific word or *short* phrase is absolutely essential to the argument.
3. **Contextual emphasis.** The use of negative space in the corpus of text to disrupt a certain pattern and thus draw attention to the item that stands apart. The most practical way is to place a short statement on its own line. It also works with headings that are yet to be styled appropriately. A single line with a couple of words does look different than a fully fledged paragraph. It also stands out even when glancing through the article.

Good emphasis is always done in moderation. Only a single form is recommended. Text that is written in italics, has a bold weight, and occupies its own space is like someone in a room full of people trying to draw attention by jumping around, shouting, and breaking things around them. Just one would suffice. We care about *style* and must, therefore, develop a keen eye for identifying exaggerations.

A general rule of effective emphasis is to read the text out loud. Test these:

- **Can you read entire sentences out loud and, if so, do you still think that this kind of emphasis is effective to convey the intended meaning?** Did you manage to emphasise everything?
- **How can you use your voice to apply two forms of emphasis?** I believe you cannot do that unless you are especially talented.

Contextual emphasis is applied in speech by the use of pauses. A longer moment of silence than what the rhythm would suggest is sufficient to draw attention. One does not need to pause *and* shout.

To further strengthen the effect of added emphasis, we use it sparingly. If everything is emphasised, then nothing is. Apply it to single words or short phrases.

As for text underlining, it has become a norm of the Web to use it for styling hyperlinks. Some websites denote links by relying only on this method. No change in colour. No further visual cues. To this end, underlining should never be used as a form of emphasis.

### Section and subsection headings

There are six levels of HTML headings. Each page should have only one `h1` as recommended by the relevant specs. The rest are up to the author. I understand that there may be a scenario where all six levels are required to elaborate on a certain theme. For most cases though only `h2` and `h3` are needed. Any further depth risks delivering negative marginal returns, for it may end up denoting the obvious.

Instead of referring to the headings in numerical terms, let us name them by their function. All `h2` are thus to be considered "section headings", while `h3` are "subsection headings".

By renaming them we are in a better position to appreciate their role. Sections cover topics at length, whereas subsections go in depth. What you are now reading is part of the section "Elements of style" though its specific content differs from that of the subsection about "The forms of emphasis".

It is by following this line of thinking that I have come to the conclusion that `h4`, `h5`, `h6` are practically useless. Otherwise, each argument should start with its own heading.

### Single and double quotes

I wrap a statement in single quotes `' '` when it is meant to be read as a misuse of the actual terms or is lacking in some other sense that is described in context. For example, if we were to criticise a point of view for not being federalist, we could call it 'federalist'.

As for double quotes `" "`, these are meant to denote proper names or phrases. For example, the title of this document is "Styles for prose on the web".

### Parenthetic statements

There are three ways to insert a statement in the regular flow of text.

1. Parentheses `( )` may contain an explanatory or otherwise tangentially relevant statement. They can be inserted in between the words of a sentence, though they are most effective when placed at the end (parentheses are also known as curly brackets—see what I did there?).
2. Brackets `[ ]` are used to insert a word or short statement that could be used in an alternative version of a given sentence. For example, when we use [square] brackets we basically try to combine two versions of a [certain] sentence into one. See? I did it again.
3. Em dashes `— —` can contain a statement that is important and should be read as such. Since the em dash is a fairly long character, it does not need to be preceded/followed by a space. An example: The European Union—this unique form of supranational politics—is founded on two international treaties.

As with everything, parenthetic statements are meant to deviate from the regular flow of writing. They disrupt the rhythm and must, therefore, be used in moderation.

### Ordered and unordered lists

Ordered lists use the `ol` HTML tag, while the unordered use `ul`. The former are recognised by their numerical sequence. The latter are bullet points. As you may have noticed, the present article already contains both types. Ordered lists are best used to document a series of items where their total count can be of use. Unordered lists are better suited for grouping together items that tend not to exhaust their topic. To this end, we may consider `ol` to be exhaustive, while `ul` would stand for non-exhaustive.

### The use of "they" and its derivatives

When necessary, I use the term "they" to refer to a single person. This is not an error. It is a gender-neutral pronoun. The less genderised the language is, the better. It also looks more natural than a repetitive "he/she". We can understand that "they" is not plural in context. Examples:

- Each member should provide *their* email. *They* must, nonetheless, be careful when sharing private data.
- Someone left *their* phone on the desk. *They* should come pick it up.

This can be combined with another gender-neutral pronoun: "one".

- *One* need not worry about the details at this stage. *They* should only look at the bigger picture.

### American or British

Do not mix those two. If you spell "globalization" with a "z" then you should also write "labor", "color", "defense", etc. Whereas if you write "globalisation" with an "s" then you should instead use "labour", "colour",  "defence", and so on.

Whatever the choice, be consistent.

## Homogeneity of parameters

There are some aspects of style that should always remain constant. These would typically qualify as the CSS part of the web page.

### Type scale

At the core of every website I design lies a certain type scale. Every measure is a function of the text size. If root text size is 20px, then a space of `1rem` is equal to 20px. This helps maintain proportions while designing for a mobile-first environment.

A type scale is derived by multiplying the base number by a constant ratio.

Here is a sample of the "minor second" (factor of 1.125) calculated on the basis of 1rem.

```yaml
1rem                      # Body copy
1 x 1.125 = 1.125         # Heading 3
1.125 x 1.125 = 1.266     # Heading 2
1.266 x 1.125 = 1.424     # Heading 1
```

### Line height and vertical rhythm

The line height for body copy should be around 1.5rem. On this very website I use a type scale known as the "minor third" (factor of 1.2). Line height is 1.44rem which is derived by multiplying 1.2rem (the size of `h3` headings) by the ratio.

Vertical rhythm is equal to line height. It is a spacing unit which ensures consistency of white/negative space on the vertical axis. Everything must be a factor of vertical rhythm, typically in the form of a margin/padding. Practically there are four use cases:

```scss
$vertical-rhythm: 1.44rem;                           // Baseline
$vertical-rhythm-small: ($vertical-rhythm / 2);      // Baseline divided by 2
$vertical-rhythm-medium: ($vertical-rhythm * 1.5);   // Baseline multiplied by 1.5
$vertical-rhythm-large: ($vertical-rhythm * 2);      // Baseline multiplied by 2
```

### Margin between paragraphs

The margin between paragraphs, defined as empty space, should always be equal to the line height, aka the vertical rhythm.

Here is a sample scss:

```scss
p {
  + p {
    margin-top: $vertical-rhythm; // A paragraph preceded by a paragraph
  }
}
```

The same goes for the distance between paragraphs and lists, block quotes, and code blocks.

### Top and bottom margins for headings

Headings should always be spaced closer to their content and further away from the rest of text. Have a look at this subsection's heading. It is closer to this paragraph than the one above.

We basically want to have a greater vertical rhythm as a top margin and a smaller as a bottom margin.

Example using the above-mentioned variants of `$vertical-rhythm`:

```scss
p + h2,
p + h3 {
  margin-top: $vertical-rhythm-large;
}

h2,
h3 {
  margin-bottom: $vertical-rhythm-small;
}
```

## Convention as a means

All of the above are *guidelines*. They should not be applied mechanically without reference to the actual material. There may be circumstances where a paragraph should have a greater margin at the top or the bottom. There may be cases where you have to use both regular and strong emphasis, such as to preserve the bold typeface of a quoted—and thus italicised—statement.

In short, exercise judgement. But do not introduce ad hoc styles that are then reused arbitrarily. Stick to a style guide. Implement it meticulously. Exceptions are exactly that. Your readers will appreciate it, most of them by not being distracted by bad stylistic choices, others for the inherent qualities of good design.
