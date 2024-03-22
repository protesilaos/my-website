---
title: "Re: Advice regarding note-taking in Emacs"
excerpt: "Excerpt from a private exchange on how to start taking notes with Emacs."
---

What follows is an excerpt from a private exchange that I am sharing
with the permission of my correspondent. I am not disclosing their
identity. The topic is about how to start using Emacs to take notes.
Part of what I cover involves tooling, while I also comment on matters
of method.

* * *

> After my last failed attempt to switching to emacs, I've decided to
> once again venture towards switching, with my primary motivation at
> the time being a cohesive framework for note-taking and implementing
> a second brain.
>
> I was wondering, what your recommendations for the same would be.
> All I know about emacs-specific note-taking framework is org-mode,
> in addition to your denote package.

There are many other packages as well. It does not really matter.
Without a clear workflow, no tool will magically fix your problems.
Put differently, the first brain dictates the utility of the second
one; the latter is no substitute for it.

I will not tell you about Denote. Just pick standard Org by creating a
single file called `notes.org`. In that file, create new notes as
top-level headings. Each note can have subheadings. Org handles those
nicely as it can "fold" (show or hide) the contents of a heading and
its subheadings.

To navigate this `notes.org`, set the file-specific option of showing
only the headings by default when first opening the file. Add this to
the top of your file:

```org
#+startup: content
```

You can navigate the file using search methods, but do not worry about
that at this initial stage. Your goal is to get in the flow of writing
notes, which should eventually be of a high quality.

For this early stage, focus on producing content. Try to elucidate
your thoughts and provide sufficient contextual information. Remember
that writing notes is not the same as bookmarking. It has to be more
involved, so that you have to put in some effort to understand/explain
the subject matter.

Write with intent and spend the quality time this activity requires.
The "I need to do it quickly" mindset contradicts the concept of a
second brain, indeed of mindfulness altogether. If you are in a hurry,
then you are not focused on retaining knowledge anyway. Whatever you
write is, at best, a sloppy entry on a matter that needs to be
re-learnt. If you never have time, then work on that first and then
revisit the project of taking notes.

Again, it is the first brain that sets you up for success. The inverse
narrative is a marketing gimmick. Get in the habit of writing
regularly. Express your thoughts in a way that another person can also
understand. This is important for your future self who, once withdrawn
from the specific factors that informed the given note, is also a
stranger to the topic. After a while, we forget what we were thinking
or trying to achieve, so the notes we store must be done in such a way
as to be helpful to us long-term.

Once you are doing well with this simple Org setup, you are ready to
consider more packages that will complement or otherwise enhance your
workflow (or just stick with what you have, which is fine). I will not
tell you what those packages are because you will know what your needs
are once you go through this process. You will figure out what works
for you and what does not. You will thus have a better sense of what
is missing.

> Also, do you have any specific philosophy in mind when taking notes?
> I frankly find your method of disposing knowledge on your website
> and videos, quite methodological, of which I would like to implement
> in my own note-taking and knowledge sharing.
>
> I recently came across this "Zettelkasten Method" of note-taking. Do
> you have any thoughts about it?

I have heard about Zettelkasten but have not studied it. I do not
follow it, although I recognise there is an overlap with some concepts
covered by my Denote package (but Denote's cornerstone is the
file-naming scheme, which is a computer-centric arrangement to
optimise search even when using rudimentary tools---having separate
ideas/format in individual files is how I have always known personal
computing). What makes me sceptical about the hype surrounding the
Zettelkasten method is that its proponents quote the rich corpus of
its author's work as proof that this method will suffice for you. But
what if Luhmann was a genius and a workaholic? How much weight do
those character traits carry? Will Zettelkasten grant me those too? Of
course not!

Maybe Zettelkasten is good for you, but I encourage you to keep things
simple at this early stage, as I outlined above. Using that method
means that you require some extra tooling, which will put you down the
path of figuring out which packages you should add, how to configure
them, and so on. This is a major distraction for you at this point.
Your goal is to write notes, not procrastinate using productivity as a
pretext. Do start writing and then you can revisit this topic once you
are prepared to improve on what you already have.

Even if you do not need some extra tools and you go with the original
method of Luhmann (using paper slips), you still need to think like
Luhnmann. Do you? I think not. You can train to do so, though this too
is a lateral task to the one you are asking me about.

My approach to this and other matters of workflow is to listen to what
people have to say but to ultimately proceed through experimentation.
Start small so that your experiments will not be too costly should
they fail. Expand or adjust your workflow as the need arises and the
solution becomes obvious. Whatever method emerges from this organic
process will be aligned with how your brain works, what sort of person
you are, how you intuit about things, and so on.

> P.S. In regards to switching to emacs, I'm in a similar boat
> currently as you were about 5 years ago i.e. my current text editor
> of choice is vim. I was wondering if had any tips to learn and not
> lose motivation in switching to emacs for a person such as myself.
> Would you recommend I learn the stock emacs keybindings for
> text-editing? (I tried those before it felt very unnatural compared
> to (what I personally feel) superior vim keybindings.

I used to think Vim keys are the superior paradigm. But I kept an open
mind and decided to give Emacs keys a fair chance. After a while,
everything felt natural and I am happy with what I have. I write a lot
of prose, so the modal paradigm does not do much for me anyway. While
I was using Vim, I felt it made me faster, though I realised it was a
placebo effect. How fast I edit text is not the deciding factor in
what I do. But I digress.

To be successful with Emacs, you want to take it slow. Add a package
or snippet of code when you have a clear need for it and at least have
a basic understanding of what it is doing. What guarantees the
infamous "Emacs bankruptcy" is the bad habit of copy-pasting code
without an overarching objective.

Take it slow and read the official documentation. It is the best
source on the matter. Then you can complement that study with other
sources, such as blog posts or video tutorials. As you piece together
your own configuration, you gain insight into your choices and
requirements, such that you have a better sense of the system you are
piecing together.

Notice here the parallel with what I wrote above about discovering the
particularities of your case organically. It is easy for me to tell
you to just use this or that. It also is presumptuous, as one size
does not fit all. Start with the basics and proceed through trial and
error: it is just a computing environment and it is okay to play
around as you explore it. You will eventually discover what others in
the community consider best practices or modern standards, though
knowing the "why" they are considered such will do you good as it will
empower you to judge matters from a position of knowledge.

Good luck!
