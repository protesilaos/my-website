---
title: "Emacs coaching with Sacha Chua"
excerpt: "I will do a coaching session with Sacha Chua. She wrote a blog post about it and I am making comments on it."
---

Sacha Chua contacted me to schedule a coaching session later this
week. She wrote about it here:
<https://sachachua.com/blog/2026/03/thinking-about-coaching-goals-with-prot/>.

I maintain a strict privacy policy with everyone I meet. Specifically,
I do not say anything about our meeting. But since Sacha has already
published this information, I am happy to do this in the open.

What follows are some comments on her post.

## Testing interactive functions

> writing tests, especially for things that are more interactive

What helps here is to think of the interactive part as the way to get
the arguments. If the interactivity is more involved, then you want to
think how it can be broken down into smaller routines. Each routine
should eventually be reduced to a function that can be called
non-interactively with a certain argument. This way, your tests are
easier to reason about.

Consider this example:

```elisp
(defun my-greet-person (name)
  "Return Hello string to person with NAME."
  (format "Hello %s" name))
```

The substantive part of the test would be something like this:

```elisp
(let ((name "Sacha"))
  (string= (my-greet-person name) "Hello Sacha"))
```

Now add interactivity to the function:

```elisp
(defun my-greet-person (name)
  "Return Hello string to person with NAME.
When called interactively, prompt for NAME.  Else NAME is a string."
  (interactive (list (read-string "Whom to greet: ")))
  (format "Hello %s" name))
```

Even though this function can be called interactively, the test is the
same because the `interactive` simply sets the value of `name`.

There will, of course, be more complex scenaria. We can think how best
to approach them. Though this is the general idea.

## Navigating Lisp code across many files

> navigating code that might be scattered in literate config files or
> in Emacs Lisp files

What I find helpful:

- Use the Emacs bookmarking system. I add a bookmark for anything I
  visit frequently. Then I can find what I need with `bookmark-jump`
  or `consult-buffer` (from Daniel Mendler's `consult` package).
- Have a single root for all your programming projects. In my case
  this is `~/Git/`.
- In that directory, create subdirectories with areas of interest. One
  of them should be specific to the projects you maintain. For
  example, I have `~/Git/emacs-community/` and `~/Git/Projects/`. The
  latter consists of everything I develop/maintain.
- With these directories in place, you can always rely on a recursive
  Grep to find what you need.
- Otherwise, we have `xref-find-definitions` as well as all the help
  functions like `describe-function` which normally link to the file
  where the definition is.

## Sharing with others

> If I get better at sharing what I'm working on, I might be able to
> connect with more people and bounce ideas around.

Getting better is nice. I think here the goal is to structure what you
are sharing in a certain way. Then people can use it more easily. Once
that happens, you will receive more feedback.

> Also, accountability might help me nudge this over the threshold.

This is key. When we make a promise in earnest, we are motivated to
deliver on it. The fact that you have published this adds to the
effectiveness of it.

> I'm curious about other people's workflows for sharing. I like
> joining meetups, but I tend to share stuff only if no one else has
> anything planned, because I have my blog and my YouTube channel in
> case I want to share anything with a wider group of people. I just
> have to actually post things.

Each person is different and there is no one answer to rule them all.
What I do, as someone who publishes on a number of topics, is to reach
a point that is an honest representation of my current level. This
point is not approaching perfection, as that is a trap. If it were
about perfection, I would never publish anything!

Once I do what is within my current level, I am casual about it. In
other words, I do not need to prove that I am worthy of it---I am
already there and this is my current normal state. This makes the
process of writing less emotionally challenging (well, not challenging
at all). It also opens me to learn more. I am not defensive or
argumentative because, fundamentally, I feel secure with what I have:
I am not hiding something and do not worry about what others may
think.

About your case, I get the impression that you are already improving
your content. It starts by recognising that there is improvement to be
had. Then, you write blog posts such as the one I am now commenting on,
which show that you have put thought into your processes. In other
words, you are mindful of your current state. Whatever I may point out
during our meeting will thus be easier for you to incorporate in your
thinking. Why? Because you already know the space, as it were, and
so you will have a good intuition of where to put the new thing.

## Getting used to streaming

> Streaming: Still need to get the hang of talking to myself or having
> half-conversations with chat: can be worked around by scheduling a
> session with Prot and opening it to the public

I am happy to do this in public. Either as a coaching session or some
collaborative live stream. We can discuss the details.

At any rate, "practice makes perfect". The only way to get used to
talking to the camera is to do it enough times. I can talk at length,
though I still find it hard to laugh when I am by myself, so I look
dead serious in all of my monologues. Whereas, say, in the "Prot Asks"
series I often laugh. This is because I have a natural response
towards someone. Talking to the selfie camera does not create in me
the same friendly emotions.

## Sharing code

> renaming things when I want to move them to a library

Before finding a name, you need to have a clear vision for the
package: what is it meant to do. Then try to think about words that
describe either the goal or the workflow. Use phrases, like what you
have with "speech input". Those work fine.

Come up with placeholder names if you are not sure. Then, once you are
ready to share the package, do a final round of thinking to check if
you can think of a more suitable name. Otherwise just use some
descriptive phrase.

This concerns the prefix for the entire package. Though your code may
still consist of different areas of focus. For example, in my `denote`
package there is a subset of functionality related to "rename"
operations. All of those share a compound prefix of the name of the
package plus the name of the area they are specialising in like this
helper function: `denote-rename-buffer--format`. By the name alone, I
can tell that it relates to the "rename" operation and, specifically,
is ancillary to `denote-rename-buffer`.

I can provide concrete suggestions for your code.

> duplicating small functions (ex: simplify string)

You may choose to put those in their own package. Though I personally
do not mind a little bit of duplication/repetition when that is easier
to maintain. The principle of not repeating yourself is good in
general, though there are cases where trying to avoid it is not worth
the effort.

> figuring out how to make it possible for someone else to start using
> my stuff

For any non-trivial code you write, you want to treat it like its own
"package". In other words, it exists in a file of its own, it has all
the `require` calls for its dependencies, defines `defcustom`
variables if it must, uses `autoload` where relevant, and has a
`provide` call at the end. Even if you never move it out of your
configuration, you have already done the work of clearing up your
thoughts/code. Others will already benefit from that, as they can now
copy the file with greater confidence in its utility.

## Questions for Prot

> Meta: what are people finding useful for coaching and behaviour
> change, like learning new keyboard shortcuts or workflows?

Each person has their own goals. Some enjoy a pair programming
session. Others like me to check on their progress and to provide
feedback. Plus, there is more than the purely Emacs component: I make
comments about matters of perspective, whether it is about some piece
of code or life in general.

Those granted, I do not collect any data about the people I meet. I do
not ask them for testimonials or feedback. I prefer not to do that
because I do not wish to ever have to handle private information. I
like my meetings to be nice and simple. Plus, I do not want to
manipulate or influence the behaviour of people.

> Your literate config exports to individual .el files. I could
> probably do something similar to separate my functions from my
> personal config in order to make it easier for people to reuse parts
> of my config. Is it worth doing so? Do people tell you that they use
> those private Emacs Lisp files by loading them, or do they mostly
> rely on your published packages?

Most rely on my packages. I design those to be as flexible as possible
and maintain them accordingly.

The individual `.el` files of my configuration are helpful to me. I
stay in the flow of designing my code in a package-ready way. If
anybody needs to use it, then they already have something that is
close to an actual package.

> Do you have some tweaks to make it easier to jump to function
> definitions considering a literate configuration?

No, I have not had a need for this. When I choose to work on some part
of my configuration, I navigate to the relevant heading (with
something like `consult-outline`) and then use `org-edit-special` to
edit the source block.

You will show me what you have been doing, which may give me some
ideas.

> What's your general process for migrating things from your config to
> a repository or package?

It all starts with splitting the code into many `.el` files. Make sure
one file is not entangled with other files. Or, at least, put in the
effort to list every other file as a dependency and write the
necessary `require` for it.

Have one such file for each area of focus. This way you can reason
about what you have and what may be missing. A clear initial idea will
determine the direction of the package long-term. The reason is that
it establishes boundaries: what to do and what not to do.

From there, you can decide if some file is of value to other users. If
you think it is, then start implementing `defcustom` variables for it,
define the commands that users would want, and have `autoload`
directives for them if they are meant as points of entry.
