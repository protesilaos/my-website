---
title: "Re: Why host Emacs packages on GitHub? (Microsoft VS Freedom)"
excerpt: "I comment on my reasoning for hosting my free software (Emacs packages) on GitHub."
---

The following is an excerpt from a recent exchange that I am
publishing with permission. The identity of my correspondent remains
private.

* * *

> Something off-topic but I noticed that you had made an announcement in
> January that you switched git providers from sourcehut to GitHub and
> GitLab (with the former as the main one). May I suggest another git
> provider: codeberg.org. It is opensource, non-profit and can be run
> independently on a server (I believe the software is called forgejo)
> as compared to GitHub which is owned by Microsoft. The main reason I
> suggest this is because I find using GitHub contradictory to standing
> for free and opensource software.

I am aware of the problems and do know Codeberg. I cannot run my own
server due to the costs and time involved. The technical reason for not
opting for such alternatives is that I will not be getting enough
contributions there. Either we like it or not, GitHub has the network
effect.

When I was using SourceHut, I would rarely get a patch sent my way.
Those I would receive were often malformed and I needed to modify them
before applying them. SourceHut also has this bug where a patch sent as
an attachment gets a `>` appended to its first line when I receive it:
this breaks the formatting, again requiring manual intervention.

Speaking of patches, the web interface of SourceHut did not have (and
maybe still does not) any indication that the message has an attachment.
No button to download the thing. Nothing! So unless you know which
message to download, you are left with the user-unfriendly option of
fetching the entire thread in an mbox format that you must then process
further to eventually get the patch out of it. And you must hope the
patch is in working condition to save you from further trouble.

I do not blame SourceHut, as they clearly state they are still in alpha.
I do recognise though that there are better things in life than trying
to fix a political problem with unpolished software. I will return to
the notion of the "political problem" below.

More on the technical side of things for now. I take my `denote` package
as a case study for assessing contributions to a free software project.
Unlike most of my other packages that are solo endeavours, Denote
attracts lots of questions, issues, and pull requests. All of them are
on GitHub. This was the case even when SourceHut was the "official"
source and GitHub was a mirror (I also have a GitLab mirror, which
probably never received a single contribution): the vast majority of the
contributions were on the GitHub mirror, while SourceHut was adding
friction to my maintenance work.

A package like Denote benefits from the input of a diverse set of users.
We learn about more use-cases and can think of ways to make the code
even more flexible. This results in a program that can add value to more
people's workflow. Users will have a free software program that extends
their Emacs in ways which improve their computing experience.

I could pull Denote off of GitHub and develop it without ever listening
to anyone. It would still be free, but its tangible benefits would be
fewer, as I would be limiting its scope to the patterns of interaction
that only make sense in my workflow.

Freedom and diversity go hand-in-hand. We empower people to express
their individuality. The cumulative effect is a richer corpus of shared
resources, from which we can all draw from to elevate our experience.

Yes, there are well-known problems with Microsoft. As they are with
every mega-corporation or plutocrat. We have legal-institutional
arrangements that enable the rise of such platform-owners,
"platformarchs" as I call them, who control the very foundations of
entire industries. To reform those, we need to get involved in politics.
It is not pretty, I know all too well, but it is the only way we have to
campaign for thoroughgoing changes. But the impression I get from many
of the hacker types out there is the sentiment encapsulated in the
phrase "let's keep politics out of this". You can have a purely
technical discussion, sure, though you cannot expect to have others be
your voice when you yourself remain silent: politics will run its course
and you will be left there trying to come up with some half-measure that
does more harm to yourself than the status quo.

Removing Emacs packages from GitHub will not undermine the oligopolies
of this world, nor will it disturb the symbiotic relationship those
entities have with each state apparatus around the planet. Unless
there is a movement that pushes for such reforms in shared spaces,
city halls, and parliaments, us technical folks will be sitting here
trying to work out the possibilities of a free society in our
inconsequential thought experiments.

Taking a step back, I am not convinced that withdrawing into our bubble
is morally good, let alone helpful at the social scale. For example, I
learnt about free software through the GNU Image Manipulation Program.
The GNU IMP is available on non-free platforms (as is Emacs, by the
way), meaning that your average computer user, like me from the early
2010s, can be introduced to a community that works for one aspect of
freedom. If the GNU IMP was only available on Linux, I would have never
heard of it and, probably, never had that impetus to explore alternatives.

Oh, I mentioned Linux... Have you checked who contributes to the kernel
we are using? Yes, some of those dreaded corporate actors are there. If
we keep applying the logic of withdrawal, the only viable option is to
banish computers from our life altogether. And then we continue applying
the same reasoning to everything we use or consume... You get the idea.
I have no plan to do this and will instead continue to couch my
decision-making in terms of practicality and of working toward lofty
goals with the understanding that the complexities of this world limit
my viable options.

Withdrawal is a luxury. We have a well-known figure, the pioneer of
free software whom I respect for that, Richard Stallman, who prides on
not using loyalty cards, phones, and the like, but then admits that in
those cases where those items are beneficial or unavoidable he has
someone else take the hit on his behalf (for an introduction:
<https://stallman.org/rms-lifestyle.html>). I do not see how using
what effectively is a meat shield to roll over the problem to another
person does any good to society at-large or fixes the underlying
issue.

We can make the same arguments for why would someone cure their illness
with medication when big pharma is doing all these horrible deeds. Or
why even pay a decent person/company with cash when central banking and
the financial system at-large is responsible for all sorts of troubles
in our world. Why be the citizen of a country that wages wars abroad?
And so on. The point is that we live in a morally grey reality in which
we have to make compromises. We cannot escape into a pure world and
remain insulated from everything that is happening around us. There are
ways to go about acquiring the simulacrum of purity, like using somebody
else's phone, though I find those of dubious value.

If we want to change the world, we have to participate in the process
of its remaking. Politics is a collective effort. It is not about me,
you, or any one maintaining a perfect record of not using this or that
"injustice".

Furthermore, the focus on the individual's performance has the
unintended side-effect of comparing everyone to a godly standard. We
thus witness controversies on social media because person X is not as
moral as an angel or because they said something dumb when they were a
teenager. In the process, we lose sight of the bigger picture, of the
structures involved and the conditions those create. This
decontextualisation makes us apolitical in our thinking, but it does not
make society apolitical as such. It just means that those who do get
involved in politics are the relatively few with an agenda (and this
usually is not in our interest).

So, no, I do not think that moving off of GitHub fixes the well-known
issues we have in our societies. My projects will degrade in quality, my
contributions will not reach as many people, potentially liberating them
in some way, and, above all, it will not be part of a concerted plan
for political reform. Same idea for my presence on YouTube. I am not
there to show my love for the platform, but because I can reach more
people. I detest clickbait, dislike the tricks and gimmicks we find
aplenty there, but still have something I want the "uninitiated" to be
exposed to, be it my Emacs videos, philosophy, or even what I share
about my life at the hut. They are not much, but they may inspire
someone out there to do something good.

I do not claim to hold the moral high ground. This goal is of no import
to me, as I think of the collective magnitudes: how to work towards open
spaces with institutions that codify values germane to freedom.
