---
title: "Comment on Unix versus Emacs"
subtitle: "Be mindful of dogmatism and try to avoid it"
excerpt: "My opinion on the persistent question of whether Emacs can fit into a Unix-centric workflow."
---

I receive messages from time to time asking me to share my views on the
topic of whether Emacs can fit into a Unix-centric workflow.  One such
email arrived in my inbox yesterday.  I replied to it and asked whether
I could publish the answer on my website, while omitting all private
information.

My commentary is reproduced below.  In block quotes (indented
paragraphs) are the statements I am replying to.

* * *

> For the past 2-3 months I having using Emacs as my "Integrated
> Environment" but unlike my vim days I am struggling to recommend
> it to someone or convince myself 'Emacs >> vim+cli-tools'.
>
> For ex:
> + Why use vim? -> To edit text efficiently.
> + Why use TWM? -> You can manage TUI with ease.
> + Why use Emacs? -> For integrity? For lisp? For Emacs-like-bindings?

I think Vim and Emacs are quite similar in several key areas:
interactive, extensible, scriptable, and featureful out-of-the-box or
with third-party extensions.  The differences are matters of approach,
perspective, and degree or concern issues of a secondary nature and/or
ancillary utility.

The fact that Vim and Unix are talked about in the same breadth suggests
to me that we---the general "we"---are treating terms somewhat
cavalierly.  If one wants to remain faithful to Unix, then why are they
making a special exception for Vim, instead of using vi, ed, or just
sed?  Those other programs are truer to the Unix ethos of small
specialised tools.

For example, newer versions of Vim come with the `:term` command that
spawns a built-in terminal.  And we still pretend that Vim partakes of
the Unixy quality while Emacs does not.

To be clear, I am not arguing that Vim should not have such a feature.
It is useful and am sure a lot of people like it, especially in light of
NeoVim gaining ground in the community.  I am just pointing out an
inconsistency in the thesis of those who extol the Unix virtues while
still peddling Vim as a paragon of minimalism.

> My main concern with Emacs is "we are trying to redo everything
> in elisp or we are trying to run a elisp WM" which is quite
> different from what I have learned.
>
> Video: https://www.youtube.com/watch?v=1mr3issv79s

I think no one needs to switch to Emacs.  If what you already have
covers your needs, then there is absolutely no reason to redo everything
and refashion it as its Elisp equivalent.

With regard to Luke's video, I feel that he is making an assessment on
the premise of indirect or incomplete information.  Again, no one has to
switch to Emacs.  Though if you are the kind of person who wants to
speak their mind from a position of knowledge, you need to stop being
opinionated and vociferous about something you have not given a fair
chance to and tried in earnest.  To put it differently, start using
Emacs from scratch, go through the manual, tinker with Elisp, work full
time with it for ~6 months and then tell us what you think.  "But I do
not want to!"  Well, I repeat that you do not have to.

This is how I converted to Emacs in the summer of 2019.  Started with an
empty init file, without any prior experience in Lisp (and I am not a
programmer anyway), and with no false expectations of wanting Emacs to
become my powerhouse of productivity from day one.  The first days were
very difficult.  Fast forward to present time and am happy to have made
such an investment: there is no going back.

The whole "switching to Emacs" theme is something I discussed at length
one year ago (watch [All about switching to Emacs](https://protesilaos.com/codelog/2019-12-20-vlog-switch-emacs/)
(2019-12-20)). Also, I agree that Org being 'cool'---whatever that
means---is not a compelling reason to try it: I am not much of an Org
user myself.  In a more recent video I talked about the concept of
"favourite package" in the Emacs milieu (watch [Why Emacs itself is my
“favourite Emacs package”](https://protesilaos.com/codelog/2020-10-21-emacs-favourite-package/)
(2020-10-21)).

> This video [of Luke] really provide some good reasons why to invest on
> 'coreutils' to build a small, maintainable and decentralized system
> rather than investing on a giant mutable system.

Prior to switching to Emacs, I was using BSPWM+Vim+Tmux+CLI for years.
My Vim had no plugins at all.  For email I had mutt, newsboat for feeds,
ncmpcpp+mpd for music, lemonbar for a system panel...  Everything was
done in accordance with this notion of "small, maintainable and
decentralized" programs that are loosely tied together into a computing
environment.

The main problem with such a framework is that there is no layer of
integration between those tools.  When you actually start piecing
together a system you are introducing complexity on a case-by-case, ad
hoc manner, because you now need to write extra code that connects the
otherwise disparate tools.  Can you make your ncmpcpp interface with
newsboat?  Would you like to be able to capture the contents of a mutt
email and produce a note or to-do task out of them?

You can of course tie all those together.  Though you will oftentimes
have to use Vimscript for Vim, some other syntax for mutt, newsboat,
ncmpcpp+mpd, yet another for the suckless programs, another still for
Lemonbar, Polybar or whatever, and so on.

Not only are configuration or scripting languages/paradigms different,
discoverability is also inconsistent.  Vim has on-line help.  Others
have man pages, suckless expects you to read some incomplete README
which constitutes a misunderstanding of minimalism and/or study the
source code.  Again, these are discrepancies that you need to
circumvent, while rationalising them ex post facto as virtues of
peerless Unix engineering.

Side note: I define minimalism as minimum necessary completeness.
Incomplete documentation fails the completeness test.  For a more
theoretical take, read my [Notes on simplicity](https://protesilaos.com/notes-simplicity/) (2019-06-22).

So the "small and decentralised" stops being as "maintainable" as you
would like to think of it in abstract.  Those issues accumulate and
culminate in an inconsistent user experience.  Say you have some nice
theme for Vim.  Now you need to write another theme for newsboat, mutt,
ncmcpp, dmenu, lemonbar...  You get the point.

I am a firm believer in the Unix philosophy, though I do not interpret
it as a dogma but as a set of guidelines whose scope of application is
strictly confined to a given paradigm of interaction.  When the
constitution of the case changes, so must the reasoning about it, else
there is no correspondence between the theory and the reality it is
supposed to apply to.  Unix works well when you are dealing with text
streams.  It leaves something to be desired when you need interactivity
and consistency across a wide range of applications.

For some more abstract writings, read:

+ [On the Dialectician's Ethos](https://protesilaos.com/ethos-dialectic) (2020-09-30).
+ [On materiality and emergence](https://protesilaos.com/materiality-emergence) (2020-12-20).

> Rather than talking in abstract I will now jump straight to my question:
> "Why I should add a layer of complexity on my system rather than using
> existing tools(coreutils, pipes, ...)"

I believe your question already assumes the answer you expect.  If you
frame Emacs as "complexity" and, by extension, as being a priori surplus
to requirements, then it follows that you do not want it, for that would
be frivolous.

If, on the other hand, you take a critical look at the emergent system
of several Unixy tools in unison, like my BSPWM setup from yesteryear,
then you must think of things in a new light: "what is missing from my
coreutils, pipes, and friends?".  Then you can start searching for ways
to ameliorate the issues I outlined above, namely, to achieve a greater
level of consistency and integration between otherwise standalone
applications.  How you go about it is your prerogative.

I treat Emacs as a layer of interactivity on top of Unix.  For example,
I wanted to refactor some things in my website's code base.  I ran an
rg/grep command to put the results in a buffer.  Then I edited that
buffer and saved my changes.  Voila!  A ~1000 matches rewritten in a
matter of seconds, all while I could do things interactively and use the
full power of Emacs' editing capabilities.  Yes, I could probably do the
same with grep, sed, or whatnot, but I would still be missing that ease
of use, indeed the safety, of performing such sweeping changes from the
comfort of Emacs.

Which brings me to the final point: is anyone going to give me hacker
points for relying only on grep and sed?  Do I want to turn my computing
environment into a tokenistic affair; a symbolism that captures my
vanity and pretences on social standing?  Do I want to become an avatar
of social expectations, seeking to extract as much "nerd credibility"
out of my fellows' ideas about me?  Or do I want to get work done and do
so while benefiting from a comprehensive, integrated, singular
experience?  I just want the latter and am unapologetic about it.

This is not to claim that only Emacs can perform such tasks.  Maybe Vim
or some other program can do those as well.  Good!  Use whatever feels
right for you.  My position is more nuanced: we should avoid the
pitfalls that come with ideology and ideocentric perspectives on states
of affairs.  Are you working exclusively with text streams?  Then write
a one-liner on the command line that pipes some output to sed and you
are good to go.  Do you need interactivity?  Then forget about Unix
pipes and use the right tool for the job.  Whether that is Emacs, Vim,
or whatever is another discussion altogether; one that I do not find
particularly interesting and fecund.

In conclusion, I am of the opinion that propitious enthusiasm is all too
often the source of self-righteousness and misguided attempts at
evangelism.  We witness such a recurring theme happen with Unix, Arch
Linux, Emacs, and more.  Some user discovers a new cool workflow and now
they want to convert their peers to it.  This hints at the kind of
thinking that treats the world in simplistic, binary terms: Unix is
simple VS Emacs is complex; Arch Linux is for hackers VS Ubuntu is for
simpletons...  Those are stereotypes that rest on misunderstandings
about the intent and the purpose of each of those paradigms, their
context-specific pros and cons, as well as the potentially numerous
reasons one may have to opt for a given choice.

To my mind, the exuberant disciple is prone to dogmatism because they
read the rules as the single source of authority, while the teacher who
has long studied and internalised those topics knows the extent of their
application---their limitations, that is---and, above all, understands
when they should be circumvented and how.
