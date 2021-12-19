---
title: "Discussion on Emacs and modern app design"
excerpt: "A comment thread involving Emacs and modern app design."
---

What follows is an exchange with [Karolus, Frontend developer & UI/UX
designer](https://podzerek.pl/).  I am sharing it with permission, in
the hope that others find it interesting.

* * *

> Hi Prot, just wanted to know your mindset behind using Emacs for
> almost every task you can possibly imagine. The case you presented in
> the video [PROT EDIT: [About the custom Org
> agenda](https://protesilaos.com/codelog/2021-12-09-emacs-org-block-agenda/)]
> can be easily achievable by modern nowadays tools (open source or
> not - that's not a point) Those tools usually have nicer visualization
> for things like daily agenda, charts etc. They usually have
> possibilities to add shortcuts for almost every action, so I believe
> they can be as much efective as Emacs is. It seems to me that
> incorporating every workflow to Emacs is like building 4 walls around
> yourself to feel really comfortable and cossy, but for a cost of not
> exploring other interesting modern workflows, tools and places. This
> argument is even stronger when it comes to working with others. While
> sharing your screen or your workflow with others, good data
> visualization and ease of use are getting really important and
> crucial. I am fully aware that you may have tackle this topic multiple
> times in the past, so feel free to answer or not. Cheers

Hello Karolus!  The reason I am using Emacs for virtually everything is
because it makes the computer easier for me.  My whole environment is
consistent, such as my preferred colour theme and key bindings, all my
custom commands, a unified way to customise every aspect of my
computing, etc.

My experience from the days I bought dedicated apps is that (i) they are
not interoperable or they somehow limit you to an environment you can't
really control, (ii) they are not easy/possible to extend and/or
customise to your liking.  As for other free and open source solutions,
I think my Emacs setup is better for my needs than what I had before
(namely, Tmux+Vim+CLI tools) because of its uniformity.

Regarding the point of sharing data with others, that can definitely be
an issue in which case your suggestion would be a good fit.  Though I do
not collaborate with anyone so I can't solve a problem I do not have.
If, however, I had to make a compromise I would prioritise the needs of
the team over my personal preferences (unless Emacs could be made to fit
into those requirements).

Same principle for syncing data between devices: I only have one
computer and no smartphone.

Concerning visualisation: I am not a visual person as I often prefer
"the thousand words" over the "one picture", if that makes sense.  Not
to imply that visualisation is ineffective and that I never use it---I
am just trying to keep things simple here by stating my preference.

Out of curiosity, which programs do you have in mind?  Can you point me
to workflows that demonstrate how one can make them work in a way that
would make an Emacs user happy?  In other words, I am interested in (i)
interoperability and sustainability, (ii) customisability and
transparency, (iii) uniform method of extensibility and subsequent
integration of otherwise distinct parts of the workflow.

* * *

> Thank you for answering so quickly.
> 
> Maybe at first let me explain my background and why I am asking this
> kind of a question.
> 
> Currently I am product designer & developer who uses Tmux + Neovim for
> development and Figma for the design.  Because of my profession I have
> to use and test a lot of products. This helps me to:
> 
> + see how other people tackle & solve certain problems
> + have a good understanding how different applications works
> + have a feeling what is currently popular and why
> + make a research to find out similar solutions/products that client may
>   expect
> + learn and evolve (apps from 10 years ago look and feel different than
>   from now)
> + inspire myself + many others
> 
> That being said I am trying to understand what would be the good use
> case or scenerio to implement most workflows into Emacs.  The idea of
> unified and consistent environment with Emacs seems really amazing but
> almost impossible to achieve for most people because of the following
> reasons:
> 
> + steep learning curve (You mentioned that Emacs made your life easier,
>   but I am assuming it wasn't always like that 😉)
> + sharing and modifying data between multiple devices (mobile and
>   wearable devices use is much higher than PC/laptops nowadays)
> + more text, less visuals (seems like completely opposite direction when
>   you observe current software and users needs, visuals are greet and
>   they have their own uses, i.e I'd like to see more visual programming
>   examples in the future but that's a subject for a different
>   discussion)
> + sharing your workflow with others in any way (especially if you
>   consider they do not know anything about emacs)
> + often times your environment have to be expanded or modified, so if
>   any of those cases above appears to be crucial using emacs is no
>   longer an option.
> + relaying on one software which handles everything seems to look cool
>   on paper but in reality it's probably not the best option as you can
>   always lose access to your machine. Sharing and modifying files
>   without your one and only machine will become a nightmare.
> 
> It looks like Emacs is suited for really specific and small group of
> people (nothing bad about that) but even if you are in that group I can
> easily imagine it will go into direction where you have to expand your
> environment in a way that emacs will be no longer a good
> option. Devoting time to learn something that will become not useful in
> the long run can be painful and disappointing especially if it's your
> whole environment.
> 
> Regarding the workflows I found out myself using neovim and terminal
> only for working with a text - mainly code. Neovim is quick and snappy,
> now have a built-in LSP support, so I dropped vscode completely. But vim
> is still only a text editor that can be easily replaced with another one
> if there will be urgent need to do so. For any other workflow not
> related to coding I use dedicated application. For planning personal
> tasks, time boxing, etc. I would personally use app called "tick-tick" -
> it also supports markdown syntax (I tried plenty todos/note taking apps,
> including taskwarrior and vimwiki, but it doesn't work for me, not
> enough media/data visualisation and mobile devices goodness 😃)
> 
> Hopefully this conversation won't offend you in any way, I am just
> trying to understand a good use case and mindset behind using emacs for
> everything. Maybe it will also aspire you to use other softwares than
> emacs 😂. All best, Karolus

* * *

This conversation does not offend me and your interest is sincere.  No
worries!  I am well aware of the fact that there is no such thing as a
one-size-fits-all.  Different people have needs and preferences that
differ profoundly, so what works for one may be unsuitable for another.
We are at our best when we acknowledge diversity and accommodate it.

I agree that Emacs is not for everyone because its true power or full
potential is only available to those who wish to commit to it in
earnest: to take the time to learn it and extend/customise it with Emacs
Lisp (Elisp).  Whether that commitment is worth it is a matter of
subjectivity: again, there is no one-size-fits-all.  All I can note is
that Emacs is a perfect fit for my case.

Emacs is not a text editor (check the text of my recent live stream
about Emacs VS Unix:
<https://protesilaos.com/codelog/2021-09-22-live-stream-emacs-unix/>).
It is a Lisp machine with text editing as its primary point of entry.
This is of paramount importance in understanding how Emacs is more like
/bin/sh in terms of the environment it offers for running arbitrary code
(i.e. Elisp) with which to extend/change the functionality of Emacs.

Everything that is implemented in Emacs partakes of the same environment
(see my EmacsConf 2021 presentation:
<https://emacsconf.org/2021/talks/freedom/> (I haven't posted it on my
website yet)).  For example, I handle my to-do list and my email with
Emacs.  It is trivial to capture a task that includes a direct link to
an email message/thread/view and have it appear on my agenda: when I
need to check the conversation, I simply follow the link.  I also handle
my music with Emacs, so I can, for instance, capture the title of the
currently playing song and store it in a list of "favourite songs" or
"music recommendations" that I might want to share with others.

The linkages between text editing, file management, emails, music, RSS
feeds, and so on, are intuitive to draw once you become familiar with
the "Emacs mindset".  Sure, that will take anywhere between a couple of
weeks to a few months, so again it is not for everyone.

As I noted before, syncing data between machines is not a problem I face
because I only own one computer and have no smartphone.  If I were to
acquire another computer though, I would research how best to sync my
data: it should be possible and I would be willing to go to great
lengths to make it happen.  (For the record, I am not a fan of
smartphones, but that is another discussion.)

Same principle for relying on Emacs too much: if I lose access to my
computer, I am already in trouble because I do not have another one.
That would be a problem regardless of Emacs or any other app for that
matter.

The point of visuals as opposed to text-centric interfaces is, once
again, a matter of preference.  I already stated my inclination for the
latter.  I should then add that I actively dislike the wanton use of
iconography, or all those little graphics that have a largely cosmetic
value (and often a subtle counter-productive function).  They are not
always as clear as precise typography that is given sufficient spacing
or presented in the appropriate structure.

Lastly, there is the issue of devoting time to something that may not be
relevant in the long run.  I think this is actually one of Emacs' most
enduring qualities.  It has been around for nearly half a century and it
shows no signs of slowing down (continuous improvements in core Emacs,
new and great third-party packages, ongoing refinements to mature
packages, etc.).  Investing in Emacs is worth the effort exactly because
one will acquire the requisite skills to adapt their Emacs configuration
to evolving circumstances.  When a new need arises, one simply extends
Emacs on their own or relies on the contributions of the community
(i.e. a package).  In other words, the customisability and extensibility
of Emacs, combined with its uniformity and introspectability
(transparency), lend to its adaptability.

Since you are a product designer, I suppose you are interested in
gathering feedback on a specific use-case or set of preferences?  A
datum you may then consider is that predictability matters greatly: I do
not want my apps to change every few years because that means I have no
control over them and, by extension, my computing environment.  The more
control I have, the better off I am.  This, of course, relates to
software freedom and concomitant rights (e.g. privacy), but let's not
elaborate on that.  I understand the business incentives that underpin
the modus operandi of companies who change/refresh their products every
so often.  It's their job and my opinion on it (which you can infer) is
not relevant here.  Yet Emacs (and free software at-large) is not a
product---with everything that entails---which is exactly what I want.

* * *

Can I post this conversation on my website?  It might be interesting for
others and it is easier for me to keep a publicly available archive of
it (notwithstanding the memo I stored on my machine).  I can keep your
name, if you want, and also include a link to your website.  Or I can
keep it anonymous.  Whatever works for you.  What do you think?

* * *

> My interest with Emacs started with this channel:
> <https://www.youtube.com/watch?v=kRkp-uJTK7s> and after a while youtube
> algorithms recommend me one of your videos. The idea of having one
> ultimate environment intrigued me, but of course nothing seems to be
> without flaws. Having those difficulties (even if they can be tackle)
> like we mentioned with steep learning curve, multiple device use,
> mobile/wearable device use, sharing your workflow with others etc. could
> be really a pain points for many.
> 
> Personally speaking I am too much into graphics and exploring new
> softwares that the proposition of values that emacs has would be enough
> to go deep into learning it. I.e having my favourite music album without
> the album cover by default would bother me in the long run. For me it's
> just nice to have that visual representation of things if you know what
> I mean. I believe graphics used wisely can also reduce the visual
> clutter and help to focus on the right thing at the time. You mentioned
> iconography and other graphics as largely cosmetic values, but this
> opinion unfortunately doesn't go hand in hand with what is currently
> adopted by many softwares and widely used by many people. I think you
> can be surprise how many icons like search, save, logout, notification,
> play/stop etc. are as much expressive and encoded in our brains as
> words. Not to mentioned that graphics have enormous use in marketing,
> brand, games and many others, so you cannot denny that the use of
> graphics in software can be beneficial and have a really huge impact how
> certain software is used.
> 
> Lastly, I would like to ask about good comparison to Emacs then. You
> presented Emacs as a Lisp machine that you can treat similarly to
> /bin/sh.  Base on that It looks like the Vim vs Emacs comparison is no
> longer valid unless you only compare text viewing/editing
> capabilities. So what piece of software could be a good alternative to
> Emacs, just out of curiosity is there any similar solution?
> 
> Thank you for the insights and thoughtful conversation Prot. You
> satisfied my curiosity which is likely related to my professional
> deviation😃 Feel free to share it on your website, you can keep my
> name or preferable nickname "Karolus", I don't mind it. Here is also a
> link to my website: <https://podzerek.pl> feel free to share it too,
> thanks.

DistroTube has switched to using Emacs which, I think, helps raise
awareness about its potential.  David Wilson of the System Crafters
channel is also doing an excellent job:
<https://youtube.com/c/SystemCrafters>.

I understand your point of view: Emacs is largely text-centric.  Nicolas
Rougier is experimenting with ways to broaden the scope of what Emacs
can do with graphics and, generally, with a more deliberate design:
<https://github.com/rougier>.

I agree that when graphics are used wisely they enhance the experience.
Emacs could definitely benefit from such insights.  Perhaps I did not
make myself clear earlier: I am against the exaggerations, the use of
icons everywhere even when they are not needed.  I have similar remarks
for typography, such as that we do not need to emphasise something with
bold, italic, underline, and an extra colour, when one or two of those
attributes would suffice.  Same principle for themes which often use
complementary colours (e.g. blue and yellow) for patterns that do not
need to have their inter-construct contrast amplified (I am the
developer of the modus-themes, which are built into Emacs 28 (or higher)
and even include a section in the manual about "avoiding exaggerations",
as well as an explanation of the dominant colours in most contexts).

There are, of course, cases where graphics are vastly superior to terse
text in terms of conveying the underlying information.  For example, it
is better to behold a visualisation of the volume of the connections
between nodes than to draw a mental representation of it.

As for a good comparison to Emacs, I am not aware of one.  Maybe Neovim
is becoming more Emacs-like in terms of its extensibility, though I have
not used it enough to have an opinion about it.  (What I can state with
certainty is that {Neo,}Vim is not the ultra minimilast program that
some people claim as a rebuttal to using Emacs---it still is great in
its own right.)
