---
title: "Emacs: comments on the Rubber Duck Show of 2023-03-16"
excerpt: "Some thoughts on Emacs, inspired by the Rubber Duck Show."
---

Here are some general thoughts and comments on
<https://www.youtube.com/watch?v=lPjPa_yqM9g>.

* * *

* I think calling Emacs an "operating system" is a helpful metaphor to
  describe how powerful its potential is.  Though metaphors can lead
  to misunderstandings and this is one of them.  Emacs is designed to
  process buffers and maybe display them in windows (inside of
  frames).  Emacs is good at what it does, but trying to do things
  like render a video or draw graphics quickly leads you to a
  dead-end.  As a Lisp machine, Emacs can do anything given the right
  code.  But for that potential to be realised, many non-trivial
  factors need to hold true.

* I think the best explanation of what Emacs does is to consider it
  the layer of integration/interactivity on top of Unix.  This is
  exemplified by `dired` (or `dirvish` for that matter).  Dired
  basically is a wrapped for `cp`, `mv`, `rm`, `mkdir`, `chmod`, and
  related.  It adds to them facilities of marking files, limiting the
  view to what you need to focus on, using keyboard macros, making the
  buffer editable, etc..  These together contribute to a powerful
  text-editing and file-managing experience.

* It does not end there though, as Emacs is extensible.  For a
  proof-of-concept extension of Dired, check my work-in-progress
  `mandoura` package: <https://git.sr.ht/~protesilaos/mandoura>.  You
  mark some files or directories and invoke a command to produce a
  temporary file that consolidates those entries into an `mpv`
  playlist.

* This layer of interactivity is best understood when we start
  integrating different "apps" into wider workflows.  An example of
  this is how we take an email and produce a task out of it that shows
  up on our agenda.  There is a link back to the original email so we
  can read that conversation again.  The same idea applies when we go
  from the file manager to editing the file, from there to an `M-x
  shell`, then to a `vc-dir` or `magit` interface, and so on.  Doing
  all these on the command line or with a combination of Vim+Tmux+CLI
  is possible but not as integrated.  Those standalone tools cannot be
  customised in a uniform way.  Vim has its own language, Tmux has
  another, Mutt a third one, and so on.  Whereas in Emacs you apply
  the same skill---knowledge of Emacs Lisp---everywhere, so the more
  you learn in one area the better you can be in others.

* A case where Emacs-as-an-integration-layer-for-Unix is poignant is
  with editable `grep` buffers.  You perform your regular search, make
  the results' buffer editable, run a `query-replace` or some keyboard
  macro to make edits in bulk, and---bam!---you refactored thousands
  of lines in a few seconds.  And all this is done interactively where
  you get live feedback of what is happening.

* Emacs does not contradict the Unix philosophy.  It does one thing
  and does it well: it is an interpreter of Lisp programs in the same
  way Bash is an interpreter of shell scripts.  What we do inside of
  Emacs is, in abstract terms, a bunch of scripts running in concert
  to empower the user with various patterns of interaction.

* It is ironic that when we talk about Unix-y workflows we consider
  Vim a part of them.  Much like Emacs, Vim does not just "edit text".
  It has workspaces (tabs), panes (splits), a `:term` command, and so
  on.  These are all good, in my opinion, though they actually are an
  argument in favour of the Emacs-y paradigm of adding a layer of
  interactivity on top of core utilities.

* Yes, an IDE that is optimised for one language will give you all the
  bells and whistles.  An editor will most probably not be able to
  match that.  At least not without considerable effort.  The question
  which I do not have the experience to answer is whether a good
  developer can have an IDE-like output of work without the IDE.
  Intuitively, this seems possible but maybe I am missing something.
  In other words, I get the impression that an IDE is not a
  prerequisite to the given work.

* I think it matters to how we feel about the tool we use.  There is
  no one-size-fits-all, no canon on what we should be following.  For
  instance, I like the completion framework of Emacs, `orderless`
  pattern matching, the previews of `consult`, etc., but am not huge
  on in-buffer completion and concomitant "smartness"
  (e.g. auto-inserting closing brackets).  Those extras impose a mode
  of working that contradicts my way of thinking/editing.  I have
  `corfu` installed but mostly use the generic `dabbrev` or just type
  out the whole thing.  False positive text expansions annoy me.  I
  don't use anything that auto-inserts texts and actively dislike
  popups and such embellishments---they distract me.  Just looking at
  an IDE, I think to myself how terrible that experience would be for
  me with all those icons, bars, popups...  Emacs can be sufficiently
  powerful yet visually austere.  For me this is a requirement, as I
  otherwise feel overwhelmed and become unproductive (or at least feel
  that way).

* What Amir points out about outgrowing your editor's out-of-the-box
  facilities is exactly why Emacs' extensibility is worth the
  investment in time and effort.  It will always grow with you to
  match your current needs.  Sure, Emacs is hard and learning Elisp
  just to extend Emacs is not a marketable skill per se.  But such
  knowledge gives you the power to be flexible and super opinionated
  about how YOU work.  You want to do things a certain way because
  that is what makes sense to you.  Emacs gives you the tools to
  achieve that.

* I started using Emacs in the summer of 2019 with a rudimentary
  knowledge of programming.  Emacs makes it trivial to write your own
  Elisp, inspect existing one, see the results right away, read all
  the documentation in an interconnected way...  Fast forward to
  almost four years after I started and I have close to 20 packages I
  wrote/maintain plus lots of extras I use in my dotfiles.  It does
  not matter if those packages are popular or if I am the only one
  using them.  What they do is allow me to express myself through the
  tool I use.  Emacs lets me be unapologetically opinionated about how
  I work with it.  I know it will evolve to reflect what I want to do
  with it.

* I think the out-of-the-box experience of Emacs can be improved
  considerably.  Small tweaks like enabling `delete-selection-mode`
  and having a better minibuffer experience with packages like
  `vertico` and `orderless`.  I also think the `custom-file` should be
  enabled by default instead of writing code directly into the user's
  init file.  Still, those changes will not fundamentally refashion
  Emacs.  It will remain difficult to approach.  The kind of person
  who will stick with Emacs is one who has the patience to learn how
  this tool works and, potentially, how to extend it to realise its
  full potential.  Extending Emacs does not mean writing one's own
  Elisp: using packages from other people is the same idea.  What
  matters is how those are pieced together and whether we understand
  what the intent is.

* This leads me to a life lesson that is not peculiar to Emacs.
  Everything that involves a degree of sophistication requires time
  and effort.  We are conditioned to have pleasurable things
  immediately and prefer to work in short feedback loops of
  gratification.  Such an attitude is not conducive to learning things
  in depth.  Think of how one becomes fluent in a foreign language,
  plays the guitar proficiently, is a martial arts master, or has
  refined opinions about various topics.  These are achieved with
  patience, which engenders persistence.  The more we learn, the
  better we become, the more awesome we feel.  Investing in Emacs is
  the same in that regard: it is the gift that keeps giving.

* There is this career calculus of measuring the worthiness of an
  investment.  That is fine and I agree with it.  The missing part
  though is the subjectivity of mastery.  When we learn something
  deeply, we simply feel great about it and ourselves in general.
  Whether that spills over to other parts of one's life will depend on
  the person and the milieu they are immersed in.  For me, it feels
  empowering to have Emacs be an extension of what I want to do on the
  computer.  It gives me confidence to accomplish other
  complex/demanding tasks.

* The other constraint we have in life is the narrow conception of
  marketability.  There are many skills that do not count as
  "qualifications", litanies to the contrary notwithstanding.  We are
  incentivised to go with the mainstream option and just focus on
  getting the work done.  Mastering skills that may not be readily
  marketable (e.g. martial arts or philosophy) makes you better at
  everything you do because it gives you the right disposition:
  patience.  Since day one of using Emacs, I have felt that using it
  in earnest will make me a better person overall.  Yes, this sounds
  ridiculous when you only think of an editor as an editor.  Though is
  it not the same if we reduce a guitar to just something that
  produces sounds?  We cannot decouple the person from their
  activities and, more importantly, we cannot truly understand those
  activities without accounting for their impact on the person.

* Another difficulty is the quest for the killer app.  This is an
  age-old longing humans have for convenience.  We want to have the
  most powerful tool that requires the least amount of effort.  Much
  like becoming a karate master over the weekend.  Perhaps you have
  heard about the "golden fleece", Jason and the Argonauts.  There is
  a reason the golden fleece is the stuff of myth and why the
  protagonists among the Argonauts in the original story meet a tragic
  end.  The moral of the myth is to not pursue things that seem to
  solve all your problems, while neglecting what is practical and
  actualisable.  The Argonauts set out on this long, open-ended
  adventure for the "killer app" only to end up worse off.

* More generally, I think it is a mistake to make decisions solely on
  the basis of what will work in one's career.  That is the mindset of
  the specialist over a given short-to-medium term.  Trends change,
  especially in technology.  What remains constant is one's
  disposition.  We don't seem to talk enough about working on our
  character.  For me, the real "10x" factor is all the intangibles of
  attitude we develop with patience, NOT the tools or methods we
  employ.  A relevant philosophy video of mine:
  <https://protesilaos.com/books/2023-02-21-productivity-honesty-accountability-structures/>.

* As such, the question "will Emacs make me a better developer" is
  flawed.  No, Emacs is not the golden fleece.  Committing to it has
  the potential side-effect of making you more eclectic in your
  choices.  Though what really matters is to switch your focus away
  from tools into personal development.  Let the tool be an extension
  of your will.  And here is where Emacs shines, because it allows you
  to be highly opinionated.  Emacs without the attitude of learning
  patiently is just an awkward operating system and an editor with
  questionable defaults.
