---
title: "On nuance, grammar, and improving one's style"
excerpt: "An exchange on matters of language, grammar, semantic clarity, and the commitment to improve my style."
---

The following is an excerpt of an exchange that initially was about the
capitalisation of proper nouns but ultimately developed into a
commentary on matters of style and grammar.  I have omitted the
personally identifying information and am sharing this with permission
in the hope that others will find it useful.

* * *

> [Prot edit: Here the person is quoting from a file I maintain
> (Emacs-related, but don't worry about it).]
>
> While on it, you might want to also guard against writing _sentence
> fragments_ instead of _sentences_.  I often see it in your texts,
> including in Emacs, but nowhere else.  For instance, take the
> following two "sentences" from `C-h v modus-themes-completions RET`:
> 
> > While Helm, Ivy et al. appear slightly different than their original
> > looks, as they are toned down a bit.
> 
> > Whereas the other group of packages will revert to an even more
> > nuanced aesthetic with some additional changes to the choice of
> > hues.

With regard to sentence fragments: that is usually intentional because I
do not agree with the standard guidelines for grammar.  It is not how we
speak and I find them forced in some cases.  I treat language as a
medium of communication first and foremost, where what matters is the
message being conveyed: for as long as you understand what I am stating,
then I see no major problem.  Not to give the wrong impression though,
as I do follow rules of grammar albeit not as faithfully as one would
expect.

> [Prot edit: I provide an example.] Socrates is human.  Athenian in
> origin.  A philosopher.  Father of seven children.

If you submit this in class you will fail.  I disagree because I do not
treat each sentence atomically but only in its context.  Yes, "Athenian
in origin" does not stand on its own: it does not make sense once you
remove it from its context.  Why would you remove it though?  It was
meant to be read as part of a gestalt form.  The context cannot be
ignored.

The above example is a perfectly intelligible sequence of statements as
we combine them in our mind and thus understand that all relate to
Socrates.  Not that I write as in the example, as I find it a bit too
terse.  Just noting that I take a macro view of language instead of
scrutinising it clause-by-clause, sentence-by-sentence.  There are cases
where the micro approach is necessary and I do use it when I must.

* * *

> Interesting! Thank you for taking the time to explain your view of the
> English grammar. I see your point. You say "I see no major problem,"
> and I agree. Still, I see some minor problems. For example, if I
> wanted to quote you, I have to grab multiple sentences. For another
> example, a blind person will hear a weird intonation when their screen
> reader tries to read the fragments. For yet another example, some
> people will pay with their time to back-trace and re-parse on the
> first read, thinking they misread the sentence somehow. (My
> case. Every single time.) Nothing major, but I also fail to see any
> significant advantages of the practice.
> 
> Speaking of the English language, how about a fun challenge for you?
> When doing a live video, do not say the word "be" in any form. Doing
> so forces one to speak in active voice. In turn, one often must know
> more about the topic at hand. I have no idea if you like these sort of
> challenges, but if you do, I would love to see it!

* * *

[Prot edit: my reply.]

> For example, if I wanted to quote you, I have to grab multiple
> sentences.

I think that is an unintended net positive because it make misquotes
more difficult.  Though this is not a strong point I am making and it
should not be read as an excuse.

> For another example, a blind person will hear a weird intonation when
> their screen reader tries to read the fragments.

I was not aware of this.  It seems crucial then!  Is there some setup I
can try to test how a screen reader works?  Documentation on how to do
it should suffice.  I want to improve things for that use-case and am
willing to change my ways for it.

> For yet another example, some people will pay with their time to
> back-trace and re-parse on the first read, thinking they misread the
> sentence somehow. (My case. Every single time.) Nothing major, but I
> also fail to see any significant advantages of the practice.

This is an issue as well.  I will try to improve things.

> Speaking of the English language, how about a fun challenge for you?
> When doing a live video, do not say the word "be" in any form. Doing
> so forces one to speak in active voice. In turn, one often must know
> more about the topic at hand. I have no idea if you like these sort of
> challenges, but if you do, I would love to see it!

I had never thought about that before.  I know that the use of passive
voice is discouraged, but I am not conscious of how often I express
myself in those terms.  As already implied, I don't treat it as wrong in
my writings, but that is due to how I approach grammar, so maybe I am
not aware of the scale of the issue and thus cannot anticipate how such
a challenge would go.  I will have to try it during some live stream,
but then we need some means of measuring my performance: I usually am
reluctant to rewatch the video...

By the way, I have tried to incorporate `artbollocks-mode` or
`writegood-mode` in my workflow, while I have `flymake-proselint` set
up, though I seldom follow their suggestions [Prot edit: those are
programs that help you with prose].  To rekindle my memory, I just
activated `writegood-mode`.  It should help surface issues in my current
message:

+ In the phrase "should not be read as an excuse" the "be read" comes
  with a warning.  Sure, I could state it as "Though this is not a
  strong point I am making and it is not an excuse", but such a change
  alters the meaning because in the first case I am advising you not to
  interpret it as an excuse whereas in the second I am telling you that
  it is not.  I wanted to convey the former meaning.

+ The "is discouraged" in the phrase "I know that the use of passive
  voice is discouraged", is another warning.  Again, I can reformulate
  the statement such as "I know that we should avoid the passive voice"
  but that rewording changes the exact meaning (as with the previous
  example) and feels awkward in the sense that we are following the
  letter of the law without understanding the spirit of the law.

To be clear: I am not arguing against your points.  I am genuinely
curious to learn more about this and am willing to improve my style,
though the packages/programs that claim to assist one's writing tend to
enforce a less expressive style which is not a clear improvement in a
multitude of cases (I wanted to write "in many cases" but apparently
"writegood-mode" says it is wrong, as if you will definitely not
understand what I am saying, so I used the more awkward "in a multitude
of cases").

* * *

> [Prot edit: the reply I got.]
>
> Great points and discussion!
>
> > In the phrase "should not be read as an excuse" the "be read" comes
> > with a warning.  Sure, I could state it … "it is not an excuse".
>
> You replaced one "to be" with another "to be".
>
> For fun, ask Emacs to fontify all occurrences of "to be", namely "am",
> "is", "are", "was", "were", "been", and "being" [Prot edit: "fontify"
> means to have the program highlight those occurrences].  Then try to
> write some thoughts.  You will struggle to no end, but it will sharpen
> your writing and thus your thinking.
>
> **Important:** Instead working around the passive voice and "to be"
> syntactically, focus on semantics.  Identify appropriate actions,
> actors, objects, quantities, and the like.
>
> Consider your case:
>
> ```
> | passive    | "it should not **be** read as an excuse" |
> | active     | "it is not an excuse"                    |
> | no "to be" | "it does not excuse me"                  |
> ```
>
> As for the word "many", it has low precision.
>
> Consider your case:
>
> ```
> | imprecise, **100 or 11,000 out of 12,000** | "in **many** cases"   |
> | more precise, meaning 50+ precent          | "in most cases"       |
> | even more precise, about 90+ percent       | "in almost all cases" |
> | precise and also readable                  | "almost always"       |
> ```
>
> The `writegood-mode` rejects the first one and rightly so.

* * *

[Prot edit: my reply.]

> For fun, ask Emacs to fontify all occurrences of "to be", namely "am",
> "is", "are", "was", "were", "been", and "being".  Then try to write
> some thoughts.  You will struggle to no end, but it will sharpen your
> writing and thus your thinking.

I will give it a try.  I already added `writegood-mode` to my workflow.

> Consider your case:
>
> ```
> | passive    | "it should not **be** read as an excuse" |
> | active     | "it is not an excuse"                    |
> | no "to be" | "it does not excuse me"                  |
> ```

Thanks for making this crystal clear!  The problem, then, is with how I
think (or over-think) because I still believe that the passive voice is
closer to my intent in that specific context.  I meant "it is not an
excuse, though you can read it that way (and that ultimately does not
matter)".  To my mind, the active voice here means "trust me and take it
for what it is (because it does matter)".  The third variant has a
different meaning which is technically correct though not exactly what I
wanted to say.

Yes, there are contexts where the passive voice obscures the meaning and
I admit that it is easy to unintentionally cause confusion by the wanton
use of the passive voice or some other form of expression.  My point is
that clarity/obscurity is not an innate property of the passive voice,
but of the wider context: clarity/obscurity is an emergent property.
The macro view of what is being communicated cannot be ignored
(`writegood-mode` has two warning for this sentence, by the way, even
though this is an abstraction and the passive voice does not detract
from its meaning).

By enforcing the rule without accounting for the context, we are risking
the loss of nuance.  I understand that "nuance" may be what those rules
want to diminish or eliminate so as to improve the clarity of the given
statement, though one must consider the hidden cost of such an
endeavour.  I am not prepared to provide assent to the notion that
nuance is necessarily undesirable, at least not without considering the
context.  Thus, I ultimately am wary of the decontextualisation of
linguistic patterns as it alters the constitution of the case under
consideration by essentially changing the meaning.

> As for the word "many", it has low precision.
> 
> Consider your case:
>
> ```
> | imprecise, **100 or 11,000 out of 12,000** | "in **many** cases"   |
> | more precise, meaning 50+ precent          | "in most cases"       |
> | even more precise, about 90+ percent       | "in almost all cases" |
> | precise and also readable                  | "almost always"       |
> ```
>
> The write-good-mode rejects the first one and rightly so.

I am aware of this and feel that we are victims of following the rule to
the letter while losing sight of its spirit.  Imprecision is exactly
what I wanted to communicate.  Let's think of it this way: if I had
opted for any of the other three styles I would be implying that I am
confident/certain in what I am stating and that, presumably, I can back
that up with hard numbers.  Whereas I was being dubitative: I was
expressing myself on a topic I have not researched in detail and for
which I only have anecdotal evidence (i.e. my own experience), to the
effect that I was forwarding an opinion that came with the tacit proviso
of "maybe I am wrong because I do not know the extent of the issue".

In other words, my nuanced formulation contained meaning (my
dubitativeness) that we would lose if we were to follow the rule to the
letter.

[We should not forget that I am not a native speaker and may still make
 mistakes; mistakes which I hope to learn from.  Though note that I have
 similar opinions on grammar/style for my mother tongue.]

* * *

> The macro view of what is being communicated cannot be ignored
> (`writegood-mode` has two warning for this sentence, by the way, even
> though this is an abstraction and the passive voice does not detract
> from its meaning).

I like it.  You say "what is being communicated cannot be ignored", and
I ask: Says who?  So what?  For me, writing or speaking in E-Prime,
which goes beyond the passive voice with no "to be", often reveals weak
ideas, weak or missing sources, and more.  Of course, I find it hard.
Then, I also find it interesting and fun, hence the challenge!

> Imprecision is exactly what I wanted to communicate.

Then, "some" would do.  The word "many", like the word "very", often
means nothing.  These words add a false sense of precision, and weak
sources use them for that reason.  The less research, the more "very"
and "many".

P.S. The two sentences below, for example, show clear writing and
thinking.  They contain no weasel words, no passive voice, and they also
constitute E-Prime.  To me, they read like butter (sans the unnecessary
"then").  Well done!

> If you agree, then I can prepare a draft and show it to you for a
> final confirmation. I think we can omit the details about the themes
> and just cover the rest of the discussion.

* * *

[Prot edit: my final reply.]

> > The macro view of what is being communicated cannot be ignored
> > (`writegood-mode` has two warning for this sentence, by the way,
> > even though this is an abstraction and the passive voice does not
> > detract from its meaning).
> 
> I like it.  You say "what is being communicated cannot be ignored",
> and I ask: Says who?  So what?  For me, writing or speaking in
> E-Prime, which goes beyond the passive voice, often reveals weak
> ideas, weak (or missing) sources, and the like.  Of course, I find it
> hard.  Then, I also find it interesting and fun, hence the challenge!

Here I should take a step back to note that I am making an argument for
an edge case.  I do not advocate abandoning grammar or disregarding
rules of style/semantics altogether.  It just so happened that some
statements made for good examples in favour of an eclectic approach that
allows for case-by-case variations.

> > Imprecision is exactly what I wanted to communicate.
> 
> Then, "some" would do.  The word "many", like the word "very", often
> means nothing.  These words add a false sense of precision, and weak
> sources use them for that reason.  The less research, the more "very"
> and "many".

Understood.

> As for the screen readers, I have used proprietary ones before my
> re-conversion to open-source.

Fine.  I want to study this further.

> P.S. For a good example, the two sentences below showcase clear
> writing (and thus clear thinking).  They contain no weasel words, no
> passive voice, and also constitute E-Prime.  To me, they read like
> butter (sans the unnecessary "then").
> 
> > If you agree, then I can prepare a draft and show it to you for a
> > final confirmation. I think we can omit the details about the themes
> > and just cover the rest of the discussion.

I agree and have already committed to improving my style.  The "then"
should not be there.
