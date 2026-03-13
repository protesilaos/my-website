---
title: "Computing in freedom with GNU Emacs"
excerpt: "A holistic introduction to Emacs: how useful it is and how it champions free software."
layout: vlog
mediaid: "M6ZHDJeG-dI"
---

This is a holistic introduction to Emacs: how useful it is and how it
champions free software. It is a modified version of the talk I did
for the "FLOSS @ Oxford" event, organised by people at the University
of Oxford. This is the page I wrote about that event:
<https://protesilaos.com/codelog/2026-03-12-my-emacs-talk-floss-oxford/>.

* * *

# Table of Contents

1.  [This is a holistic introduction to Emacs](#orgfd50a75)
2.  [Emacs as a capable text editor](#org3a4ba20)
3.  [Support for Unicode](#org5591f88)
4.  [Include several fonts on the same page](#orgf1c4f01)
5.  [Emacs can display graphics alongside text](#orge4f335e)
6.  [Emacs is an extensible text editor](#orgf8c1b6f)
7.  [Extending Emacs creates a community](#org99a48c2)
8.  [The extensibility of Emacs happens live](#orgd27848f)
9.  [My view without the "presentation mode"](#org394a3f3)
10. [Emacs puts you in control of your computing](#org034b25d)
11. [Your control extends to all workflows](#org64517ba)
12. [For an integrated computing environment](#org06c4615)
13. [Many apps do not combine nicely](#org40d4ee4)
14. [Emacs makes your workflow consistent](#orgd541b5c)
15. [Integrated computing in practice](#orgff36a33)
16. [Emacs makes integration easier](#org3c03994)
17. [Integration gives you emergent properties](#org79e8a3a)
18. [This is plain text that works like a slideshow](#orgf9e4f44)
19. [Consistency facilitates productivity](#orgc31ae17)
20. [Consistency remove the cognitive burden](#org124b771)
21. [The consistency of Emacs in action](#orgb512578)
22. [Use Emacs Lisp to configure everything](#org0bd43c1)
23. [Learning Emacs Lisp improves the experience](#org2e55e24)
24. [Emacs embodies software freedom](#org614ea19)
25. [The freedom of Emacs helps with learning](#org40d68c8)
26. [Emacs is not only for programmers](#orge1d150b)
27. [You benefit from all the Emacs extensions](#org2be826e)
28. [Some powerful extensions are built-in](#org9f08566)
29. [The documentation culture of Emacs](#org370d80c)
30. [Most packages have high quality manuals](#org96add87)
31. [Emacs has a steep learning curve](#org45b5677)
32. [Do not skip the manuals](#org4460604)
33. [Adjust your expectations](#org5ce2296)
34. [Why it is worth learning how to use Emacs](#org3e35022)
35. [The initial effort pays off long-term](#org8a7c786)
36. [Good luck and have fun!](#org9b2bf6a)

Hello everyone! My name is Protesilaos, also known as "Prot".

This presentation is a modified version of the talk I gave last night
at the *FLOSS @ Oxford* event:
<https://ox.ogeer.org/event/computing-in-freedom-with-gnu-emacs-protesilaos-stavrou>.

It was an event organised by people from the University of Oxford. I
thank them for giving me the opportunity to participate in their
programme.

I want to have this modified version here for people who do not read
my website. They may not be aware that I talked at this Oxford event.

Having the video on this platform means that everyone can benefit from
it.


<a id="orgfd50a75"></a>

# 1 This is a holistic introduction to Emacs

In this presentation I will talk to you about GNU Emacs, or simply,
"Emacs". Emacs is a program you run on your computer. I am using it
right now for this presentation.

Emacs is free or libre software. It allows you to read all of its
source code, to modify it, and to share it with your customisations.
Thus you contribute to&#x2014;and benefit from&#x2014;a community of
welcoming Emacs users.

I will tell you what all this means in practice and how you can
improve your computing experience by switching to Emacs.


<a id="org3a4ba20"></a>

# 2 Emacs as a capable text editor

When you first start using Emacs, it feels like a regular text editor
program.

You move the cursor around and edit text. Nothing obviously impressive
out-of-the-box.

As a text editor, Emacs is highly capable. It has all sorts of
keyboard shortcuts that let you efficiently operate on text.

You can control Emacs without relying on the mouse, if you want.


<a id="org5591f88"></a>

# 3 Support for Unicode

Emacs supports the Unicode standard, which is essential for
inclusivity of peoples.

The world's scripts can be expressed in Emacs. I am a native Greek
speaker.

I can use functionality that is built into Emacs to switch to the
Greek alphabet in order to write something, such as to say
«καλησπέρα», which means "good evening".

I can even spell out "Dao De Jing" (道德经), which is the title of a
book from ancient China.

Plus emoji: 🦚🦬🐉.


<a id="orgf1c4f01"></a>

# 4 Include several fonts on the same page

The multitude of scripts can be present in the same document.

This is an advantage for multilingual people like myself or those who
do research that involves many natural languages.

Emacs can combine several fonts in the same page as well as different
colours.

Each fonts can have its own attributes, such as for its relative size
and typographic intensity.

Same idea for colours.

On my screen right now, I am already combining two different font
styles: that of the heading and the body of the text.


<a id="orge4f335e"></a>

# 5 Emacs can display graphics alongside text

Emacs does not limit you to a text-only interface. It can also display
images and PDF documents. Below I have a link to an image file. I will
now type a keyboard shortcut to reveal this image. And I will do it
again to hide it.



This, by the way, is a spot somewhere in my mountains.


<a id="orgf8c1b6f"></a>

# 6 Emacs is an extensible text editor

Although you can benefit from using Emacs as a generic text editor,
what really appeals to people like me is the option to extend Emacs.

"Extend" here means to introduce new functionality; functionality that
is not available in the default program you install on your computer.

These extensions are written in the same programming language as most
of Emacs. It is a programming language called "Emacs Lisp" or "Elisp".

You can extend Emacs on your own, by writing some program in Elisp, or
you can download an existing extension that the community has made
available.


<a id="org99a48c2"></a>

# 7 Extending Emacs creates a community

For example, when I create a new extension for Emacs, I publish it
under the terms of a free software license&#x2014;the same terms that
Emacs uses.

Others can then download my extension and use it as they prefer. If
they want, they can make their own modifications on top, which may
introduce other extensions that I had not thought of in my original
implementation.

And if those users follow my example, then I can also benefit from
their additions once they publish them.

As such, there exists a community of enthusiastic users of Emacs who
care about sharing their works with the rest of the world.


<a id="orgd27848f"></a>

# 8 The extensibility of Emacs happens live

Users can extend Emacs by running some Emacs Lisp program. Such a
program can be as short as a single line. Or it can be as long as it
needs to be. It does not matter.

Users run the program and Emacs immediately does what the program
renders possible.

For example, I am doing this presentation inside of Emacs. But Emacs
does not have a "presentation mode" built into it. I thus developed my
own extension which empowers me to do what I am doing right now.

Let me toggle off my presentation mode to show you what I mean.


<a id="org394a3f3"></a>

# 9 My view without the "presentation mode"

Notice that the display has changed.My main font is monospaced now.

The headings are smaller than they were before: they are the same size
as the rest of the text. There is no number next to the heading
anymore.

Then, there is a bar at the bottom of my screen, with information
about what I am working on. On the side, there are line numbers,
indicating where my cursor is in this file. Plus, my current line is
highlighted with a distinct background colour. Let me shift it up and
down to illustrate this point.

All those elements are useful while I am programming. But they look
distracting when I wish to focus on some portion of text. So, I just
type the keyboard shortcut I have and&#x2014;voilà!&#x2014;I get the
style I prefer.


<a id="org034b25d"></a>

# 10 Emacs puts you in control of your computing

You may wonder: why do I even need a customisable text editor?

The answer is about control. You are in charge of what you use and how
you use it. You can piece together a workflow that works the way you
prefer.

This presentation mode I toggled on and off earlier behaves exactly
how I want. I decided which set of interface tweaks to apply. Another
user may have a different preference in this regard.

For instance, they may like having line numbers on the side of the
screen. There is no right or wrong answer. What matters is that Emacs
gives us the means to do what makes sense to us.


<a id="org64517ba"></a>

# 11 Your control extends to all workflows

Now apply this principle to everything you can use Emacs for: this
will generally be a text-centric project.

I run my agenda exclusively through Emacs.

I handle all my email correspondence with Emacs.

I do programming and I write prose, such as blog posts for my website
and books or technical manuals.

For each of these, I know that Emacs will empower me to perform my
tasks without arbitrary restrictions.

Emacs lets me use Elisp to modify how I do my emails, for instance,
and how I present tasks in my custom agenda view.


<a id="org06c4615"></a>

# 12 For an integrated computing environment

Without Emacs, I would not be in a position to control my computing
experience to the extent I do.

The reason is that I would be relying on many different applications.
Each application has its own interface and design paradigms.

Each application is configured, if at all, in a way that is specific
to it. Customisations in one application do not carry over to other
applications.

And, if we consider the important implementation details, each
application may configurable in its own programming language.

In other words, that is not an integrated computing experience.


<a id="org40d4ee4"></a>

# 13 Many apps do not combine nicely

To have the same degree of control that Emacs makes possible, I would
have to hope that somehow all those disparate applications would
conspire in my favour.

That is wishful thinking.

The reality is that piecing together many different applications is an
exercise in frustration and the path to a life of ever-distracting
context switching.


<a id="orgd541b5c"></a>

# 14 Emacs makes your workflow consistent

Having everything I need inside of Emacs ensures that things happen in
a manner that is consistent.

All customisations are written in the same programming language,
namely, Emacs Lisp.

What I define for one context, such as this "presentation mode", can
be used in another context.

For example, I can have this presentation style enabled when I read
emails. Why?

Because it can make it more comfortable for me at a certain hour. And
I can even automate this with conditional logic, so it happens on its
own when I open a new email under certain circumstances.


<a id="orgff36a33"></a>

# 15 Integrated computing in practice

When you work with many applications that do not play nicely together,
you cannot do something that the developers have not envisaged.

For example, your email client likely does not have access to a
"presentation mode". Same for your other applications.

Similarly, your many applications will not necessarily know how to
read and interpret the configurations you have in one application.

Suppose you define your favourite colour scheme for your email client.
You take the time to consider the harmonies and use precise typography
to your liking.

Now, you switch to your calendar application and none of that work
carries over: you have to do it again, assuming it is even possible.


<a id="org3c03994"></a>

# 16 Emacs makes integration easier

Colours and styles may seem like relatively small issues. But they are
indicative of something greater: disparate applications do not work
together seamlessly.

Emacs does not have this problem. You define something for one context
you have in mind and, eventually, it can be used in another context
that initially you had not even thought of.

For example, in my Emacs I wrote a small function to quickly copy the
"thing" at where the cursor is. This is useful when I do programming,
as the "thing" can be an entire expression, like the definition of a
function. But the "thing" may also be a link that I got in my email.

I had not thought of that use-case in advance. Yet it was trivial to
have my function do what I need in this once unforeseen situation.


<a id="org79e8a3a"></a>

# 17 Integration gives you emergent properties

The integrated computing environment of Emacs is more than the sum of
its parts.

This is because you can combine different pieces of functionality in
ways that the original developer had not foresaw.

You do not simply have your writing, your email, your agenda, et
cetera, in Emacs.

You have the functionality of one in tandem with the functionality of
another. And you draw linkages between them as you see fit.

Consider once again this presentation I am now doing. What I have in
front of me is the transcript of my talk. This is a plain text
document, which I can edit live. Let me CAPITALISE THIS to illustrate
the point.


<a id="orgf9e4f44"></a>

# 18 This is plain text that works like a slideshow

I have made this file look a little bit like a series of slides.

Notice that if I scroll up and down, which I will do shortly, you only
get the current section I am reading from: you do not have access to
the rest of the document. I will scroll up and down now.

This is a feature known as "narrowing". Let me "widen" the view and
then try to scroll again. You will now be exposed to the rest of the
text.

The original developer of this "narrowing" facility did not know how
someone like me would make use of it.

I have it here for my presentation. Each heading becomes its own
pseudo-slide. I have narrowing for my emails, when I want to read a
portion of the text in a more focused way. It is all about how I
choose to do my computing.


<a id="orgc31ae17"></a>

# 19 Consistency facilitates productivity

For many years before switching to Emacs, I did not enjoy using the
computer.

I needed too much time to accomplish every single task.

I could never find any of my files in a timely fashion because there
was no program that would enforce on my behalf a predictable
file-naming scheme.

All my notes were eventually not retrievable. This made them useless.
Data you save is only good if you can find what you are searching for.

My music collection was inconsistent because I needed special software
to write the metadata&#x2026; In short, I was not as productive as I
would like to be.

And, above all, it was not fun.


<a id="org124b771"></a>

# 20 Consistency remove the cognitive burden

Most of my work at the time was centred around the email client and a
word processor.

The email client had its own subsystem for handling reminders for
tasks. The format of those tasks was not interoperable with other
programs.

I could not access the tasks with my favourite text editor. I thus had
to use the clunky interface of the email client, which was never
designed for task management&#x2014;and was not configurable.

And then I had all the cognitively burdensome annoyances of my two
applications looking quite different from each other.

My emails did not behave like my documents, which made it harder for
me to flip between the two and continue writing. I would roll my eyes
each time.


<a id="orgb512578"></a>

# 21 The consistency of Emacs in action

Emacs has elevated my computing experience.

I have been much more productive ever since I switched to it. Allow me
to demonstrate a tiny bit of what I do each day.

I will temporarily exit the presentation mode in this window.

Then, in the bottom half of my screen, I will open my email client to
read a message I got.

Once you follow my switch to the email client, I will hide the window
that shows this presentation.

After that I will switch to my agenda to record a task and review what
I have to do.

All this is done inside of Emacs. Time for action!


<a id="org0bd43c1"></a>

# 22 Use Emacs Lisp to configure everything

What I just demonstrated is a very small part of what I do every
single day.

There is much more, though I cannot cover it all in this presentation.

The point, however, is the consistency of the experience; consistency
throughout.

I have customised my email client by writing some Emacs Lisp code for
it. I have done the same for the custom agenda I have. And much more.

Every time I work with Emacs Lisp, I acquire skills that are
applicable outside the confines of the problem I am solving.

For example, by configuring email the way I want, I pick up
programming skills that I can then apply to the design of my custom
agenda.


<a id="org2e55e24"></a>

# 23 Learning Emacs Lisp improves the experience

This is an investment that pays off more and more.

Emacs will adapt to match my evolving needs. Each new workflow I
incorporate in my Emacs setup will thus benefit from all the knowledge
and features I have accumulated.

I do not have to relearn everything because I am not switching to
another application.

I do not have to throw away all the work I did all those years. It is
here to stay.

I do not feel the pressure to try the new shiny app of the day. I did
that many times and always regretted it. I lost my data and time in
the process.

Because I am rooted in this stability of Emacs, I remain productive
and efficient.


<a id="org614ea19"></a>

# 24 Emacs embodies software freedom

I mentioned earlier that Emacs is free or libre software. This means
that you can read its source code, modify it, and share your changes
with others.

Emacs has a license that gives users power. There is no corporation
that can take Emacs away from us. It belongs to the community and we
all tend to its wellness.

In the case of Emacs, software freedom is not just about the license.
It informs how you use the program. Emacs makes such freedom an
irriducible part of its functionality.

You can, at any moment, ask Emacs what does a keyboard shortcut
actually do. What is the definition of a function. What is the value
of a variable. And you may even access the source code to check for
yourself.

I will demonstrate this right now.


<a id="org40d68c8"></a>

# 25 The freedom of Emacs helps with learning

I actually learnt to program in Emacs Lisp by exercising this freedom.

I would tinker with Emacs and continuously check on its state. What
does this do? Which function is called by that keyboard shortcut? How
is a program able to determine if the file is not saved?

I wanted to learn how, for example, we move down a line. From there, I
learnt that we can move down many lines at once.

I then figured that we can move down the lines and then also do
something else, such as place the cursor at the end of the line and
create a pulse effect to bring attention to it.

Not only did I learn how to configure Emacs, I even wrote tens of
extensions for it. I have also authored a libre book titled "Emacs
Lisp Elements". This freedom is not theoretical. I did not have a
background in programming, yet was empowered to act and to grow as a
person.


<a id="orge1d150b"></a>

# 26 Emacs is not only for programmers

Emacs is extended with Emacs Lisp. If you know how to program in that
language, you can be extra opinionated and particular about the way
Emacs facilitates your work.

But even without any expertise of this sort, you can still do much of
what you like. Remember that I started using Emacs without a
background in programming.

Emacs blurs the distinction between user and developer. Many of the
developers actually start out as users like myself. They learn along
the way and, eventually, they contribute to the development of Emacs.

I even have written code that is in core Emacs: my `modus-themes` as
well as several other smaller patches.


<a id="org2be826e"></a>

# 27 You benefit from all the Emacs extensions

The Emacs community has developed a rich corpus of extensions. You do
not need to invent anything right away in order to be productive.

We call these extensions "packages", as they are distributed in a way
that makes them easy to install and then use directly.

The Emacs program you will download on your computer ships with plenty
of packages built-in.

Depending on your needs, you may not even have to install anything
from what the community has to offer.

Though if you want a package, it is fairly easy to get it and run it
on your system.

Emacs is not picky about how you should use it. You are empowered to
be opinionated.


<a id="org9f08566"></a>

# 28 Some powerful extensions are built-in

For example, Emacs ships with a package called `org` or "Org mode". At
its core, this is a markup language. I am using it right now in this
document.

Notice how lines that start with an asterisk function as headings.
This is what the markup does.

Org lets you write documents, including books, handle your tasks,
organise your agenda, and much more. It is a powerhouse.

There are so many things to discover in Emacs as well as the broader
package ecosystem.

Emacs as a whole provides high quality documentation that explains
everything.


<a id="org370d80c"></a>

# 29 The documentation culture of Emacs

When you install Emacs, you get with it plenty of technical manuals.
There is also an interactive tutorial to help you make sense of the
basics.

Furthermore, when you ask Emacs for help about the definition of a
function or the value of a variable, you receive the documentation for
the thing you are looking for.

The expectation for all contributions to the official Emacs program is
that the code is well-documented and the manual is updated
accordingly.


<a id="org96add87"></a>

# 30 Most packages have high quality manuals

Core Emacs sets the standard of what good documentation looks like.
Package developers follow this practice.

For example, my `denote` package has a manual that is over 7500 lines
long. It exceeds 52000 words. In it users find detailed instructions
as well as code snippets that they can copy and use outright. And this
is not the exception. All my packages are like that, to the extent
necessary. Most other developers do the same.

As a community, we have access to so much knowledge for free and in
freedom. If we are committed enough, we can learn from others and thus
become better ourselves. We do so in a spirit of sharing and caring.
For me, specifically, all this was of great help. I am self-taught
because I received all those great resources from the community. I
consider it my duty to give back in kind.


<a id="org45b5677"></a>

# 31 Emacs has a steep learning curve

Because Emacs is extensible, there is practically no limit to what you
can do with it. At least this is the case for all tasks that are
text-heavy.

Emacs will just gracefully evolve to match your requirements, provided
you can extend it on your own or with a relevant package.

The downside, however, is that it is not easy to become proficient in
it. If you are committed, you can learn the basics within the first
few days.

Though you will need to invest a few weeks or months to become
skillful. It depends on how much effort you put into it, what sort of
work you are doing, and what your background is.

I learnt the basics within a few days. I started writing my own Emacs
Lisp within weeks. And within a year I had my `modus-themes` moved
into core Emacs.


<a id="org4460604"></a>

# 32 Do not skip the manuals

Several "starter kits" are available to help you get started. They set
things up so that you do not need to discover everything at the
outset.

The new version of Emacs (Emacs 31) will even come with a "newcomers
theme", which configures several settings in advance.

These can make the learning curve a bit smoother. For me, anything
that improves the onboarding experiences is a plus.

Though I do not think that Emacs will ever become "plug and play".
This is due to its sheer depth and extensibility. It does so much that
you still need to invest the time and effort into learning it.

However you start, the most reliable study involves the manuals. Those
are written for the benefit of the user. Read them carefully.


<a id="org5ce2296"></a>

# 33 Adjust your expectations

What I can say with confidence is that Emacs is not for tourists. You
cannot switch to it with the expectation that you will have a good
time right away.

No. That will not work. There simply is no shortcut to excellence.

I encourage you to take it one step at a time. Emacs will make you
more productive, provided you are patient enough to unlock its
virtually boundless potential.

Take it slow and be methodical. Rely on the official manual no matter
your starting point. Read from it and gradually incorporate its
insights into your workflow.

The community&#x2014;myself included&#x2014;has plenty of resources to
complement that study. Blog posts, video tutorials, books&#x2026; But
do not skip the official manual. Learning it slowly means that you
will become proficient faster than you otherwise would.


<a id="org3e35022"></a>

# 34 Why it is worth learning how to use Emacs

I already talked about the technical side of things with regard to the
integrated computing environment. Now combine that with two facts:

1.  Emacs is free software. This means that we as a community are its
    custodians.
2.  GNU Emacs has been around since the 1980s. It will stay relevant
    for decades to come.

Emacs is not old, it is timeless. This is because it can be extended
in a spirit of freedom.

Whatever new technology or idea we have as a collective, we can
eventually bring it into Emacs.

This way, our integrated computing environment adapts with the times.

Thus Emacs remains ever-relevant.


<a id="org8a7c786"></a>

# 35 The initial effort pays off long-term

Couched in those terms, the initial effort you will put into learning
Emacs is actually not that much.

You have to maintain a longer-term view of this project.

If you are patient, Emacs will be one of the most reliable tools you
will ever use throughout your life. And I say this as a handy man
myself, someone who uses many tools for manual labour, having built
the house I am in, among others.

I switched to Emacs in the summer of 2019. It is almost 7 years
already. I see no reason not to use it for the next 7 years, if I can.

I will still want to write articles, do programming, maintain my
agenda, and probably make presentations like this one.


<a id="org9b2bf6a"></a>

# 36 Good luck and have fun!

Remember that you will not learn Emacs over the weekend. You are in it
for the long-term. Take it slow and you will enjoy the experience.

This is all I have for you today folks. Thank you very much for your
attention!

You can find this and everything else I publish on my website:
<https://protesilaos.com>.
