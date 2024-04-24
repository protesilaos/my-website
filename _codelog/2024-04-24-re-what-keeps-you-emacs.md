---
title: "Re: what keeps you coming back to Emacs?"
excerpt: "Excerpt from a private exchange where I comment on why I keep using and enjoying Emacs."
---

The following is part of a private exchange. I am publishing it with
permission, without disclosing the identity of my correspondent.

* * *

> I hope you don’t mind me asking but what keeps you coming back to
> Emacs? I am currently wondering whether to look at Neovim again - it
> does seem to be faster and with a strong community around it. I love
> Emacs and its community but from time to time wonder whether I am on
> the wrong side of Lisp vs Lua for example in the case of Neovim for
> performance, simplicity, modernity, etc.
>
> What is your driver to work so hard in Emacs, Prot?

I come from a background of using the command line, all sorts of
terminal-based programs like Mutt and Newsboat, Tmux, Vim, and a
tiling window manager. None of those tools speak the same language. To
make them work in concert, you have to know many programming and/or
configuration paradigms. Just to get the same theme everywhere is a
pain: try to configure Taskwarrior, Newsboat, Mutt, MPC, Vim, Tmux,
i3, and friends to get an idea. Then try to set a high contrast light
theme in the terminal to notice how hard-coded assumptions will break
your workflow (e.g. the 'apt' program's progress bar, or the tabs and
borders of 'htop'). Plus, you are confined to a terminal emulator,
whose typographic capabilities are limited, such that you cannot have
fonts of varying widths and heights (maybe there are terminals that do
this nowadays, though XTerm, ST, and those based on VTE did not cover
all my needs pre-2019).

Emacs provides the missing layer of interactivity on top of Unix. We
have a highly capable programming language (Emacs Lisp) to configure
all parts of our computing environment in a uniform fashion. If you
know how to write a function or set a variable for task management,
you know how to do it for email, and for writing or coding, et cetera.
The skills you acquire as you gain more experience with Emacs have a
compounding effect. You eventually get more out of the time you invest
in them, which practically means that you are empowered to design the
workflow you want and be as opinionated as you like with your tool.

I am not a programmer by training and did not have any formal
education in this or related fields: I studied politics for the most
part. I also was not a tech kid: I got my first computer in my
mid-20s. Emacs' introspectability has helped me learn how to program
by playing around with Elisp. It is so easy to find some code that is
of immediate interest to you, tweak it, evaluate it, and check its new
behaviour live. Take, for example, the command that shows you which
command a key is bound to: `describe-key`. It produces a Help buffer
that includes a link to the source code. Follow the link and you are
reading the actual code. From there it is only a matter of time and
practice until you get the hang of it and start tweaking things to
work the way you want.

Emacs is a tool with high pedagogical potential because it is a
sandbox that enables experimentation. The feedback loop between test
and results is short and intuitive. If I, as a humanities person and
philosopher, am able to learn Elisp and write lots of Emacs packages,
I can only imagine what a skilled programmer or engineer will be
capable of.

To the point of how didactic Emacs is, consider that once you learn to
define a function with `defun` and make it interactive with the
`(interactive)` spec, it is trivial to write your first "extension" in
Elisp. For example:

- Use `describe-key` to find which command is bound to the down arrow
  key.

- Read the documentation that pops up.

- Now write an interactive function that goes down 15 lines.

- Write another that goes up 15 lines.

[ These are actually the first functions I remember writing. ]

There you have it: you are programming in Emacs Lisp!

This introspectability---and the immediacy of the experience---is
helpful to beginners and veterans alike. Whenever an expert wants to
extend or intercept a function or parts thereof, they rely on what
they had learnt while they were still a newcomer, adding to it as they
go.

Not to imply that only coders benefit from Emacs though (most of what
I do is prose, anyway). One can be productive without ever writing
their own custom snippets of Elisp. For instance, I handle my email in
Emacs. I can just call `org-store-link` to capture a link to the
message I am reading and then insert that link in some task that shows
up on my agenda (or use `org-capture` to streamline this process).
When I follow the link, it opens my actual email client and I can
review what the exchange was about. These linkages are possible
because of the unified computing environment I mentioned earlier. This
same pattern applies in other contexts as well. And it is all plain
text, which is consistent with Emacs' spirit of hackability/introspectability.

The technical merits of Emacs are numerous, though I must also stress
its moral quality as free software. To my mind, Emacs is the
embodiment of the four essential software freedoms:
<https://www.gnu.org/philosophy/free-sw.en.html>. It does not give us
freedom in some vague sense, but in the practical way of
introspectability and extensibility. We not only study the program,
but also modify it in real time. Emacs is thus an example to follow
for how to empower users to be free and how to teach them to seek
freedom wherever possible. Even the intangibles, such as how you are
incentivised to make Emacs your own, underpin the ethos of freedom and
the fact of diversity.

Is Emacs perfect? Of course not. There are lots of changes that can be
made. Though we must remember that this is a community of volunteers.
To have what we want at the technical level, we must do the requisite
work at the interpersonal level: to ensure that there is a thriving
and welcoming milieu from where innovation will come.

In conclusion then, I use Emacs as it is technically superior to what
I was using before. The more I learn, the better my Emacs becomes.
This is the gift that keeps giving. I also use Emacs because I care
about software freedom and want to do my part in inspiring others to
be more free.
