---
title: 'My simple note-taking system for Emacs (without Org)'
excerpt: 'Introduction to "usls", my personal solution to writing notes in plain text using standard Emacs tools.'
---

Update 2020-10-09 06:55 +0300:  Added annex with Karl Voit's comment.
{: .info}

Earlier today I [published as part of my
dotemacs](https://protesilaos.com/emacs/dotemacs/#h:787df548-0d95-4512-a61d-27852198f561)
the initial implementation of `usls`, the "Unassuming Sidenotes of
Little Significance" (USLS).  This is a small set of utilities that help
me write and maintain timestamped and categorised plain text files in a
flat directory listing.  It builds on core Emacs commands, such as
`dired` and `find-file`, while relying on functionality provided by
standard libraries like `thingatpt`.

The present article offers an overview of `usls`, my workflow, and their
underlying values.

## Plain text and Emacs commands

USLS is the realisation of a personal note-taking system that I have
developed over the course of the last few months.  Its primary aim is to
remain faithful to a plain text workflow that could, in principle, be
implemented with nothing but a POSIX shell.

Everything from the resulting file name to the actual contents must be
usable in the most basic computing environment, such as a TTY, or a
generic text editor and file manager.  It must also be intelligible to
non-Emacs users for when I wish to share a note or, perhaps in the
future, to ask someone to act on my files.

To accomplish this, we set on a naming convention that offers an
adequate filtering mechanism at the visual level (more on naming in the
next section).  Each filename is written as `DATE--CATEGORY--TITLE.txt`:

```
/home/prot/Documents/notes:
20201006_113858--politics--eu-deep-concerns-about-varosha.txt
20201006_120634--economics--google-and-fitbit-merger-is-a-scary-prospect.txt
20201007_124941--economics--plentiful-and-predictable-liquidity.txt
```

While this may seem primitive, just looking at a long list of that kind
will quickly reveal patterns.  With the help of `dired`, we can filter
by regular expression.  For example:

+ mark items that match a regexp with `% m`.
+ `t` to toggle the mark so that you select all the files that did not
  match the initial search.
+ `k` to hide those from the list (bring everything back with `g`).

Simple and super effective.

Speaking of Dired, one can always use `j` to jump to a file's line using
completion.  I have Icomplete with the `orderless` pattern matching
style by Omar Antolín Camarena (check my dotemacs).  Jumping to a file
using out-of-order groups of flex/regexp matches feels empowering---and
is what I am used to doing throughout my Emacs setup.

Same principle for other standard tools, such as when conducting a
directory-wide grep.  There is no need to have a `usls`-specific
solution when there are plenty of general purpose alternatives in the
Emacs milieu, including the capable built-in `project.el` library that
[Manuel Uberti recently wrote about](https://manueluberti.eu/emacs/2020/09/18/project/) (2020-09-18).

In short, `usls` does not implement a file manager, content searcher,
project organiser, etc.  Its focus is on streamlining the process of
creating notes.

## The file's name and contents

The command `usls-new-note` is the main point of entry to this tool.
Calling it will first open a minibuffer prompt asking for the file's
title.  That gets inserted in the resulting buffer as-is, while a
hyphenated variant is used to construct the filename.  Once that prompt
closes, a second one appears asking for a category.  Here the user is
presented with a list of completion candidates.  It is possible to pick
an item from those on offer or type in a new one (for Icomplete I bind
`exit-minibuffer` to `C-j` as a means to forcefully send input, just as
for a non-matching item or a substring).

The resulting buffer is as follows (`%?` indicates the point):

```
title: Plentiful and predictable liquidity
date: 2020-10-07
category: Economics
orig_name: ~/Documents/notes/20201007_124941--economics--plentiful-and-predictable-liquidity.txt
orig_id: 20201007_124941
------------------------

%?
```

The date, the original filename and ID are generated automatically.
Those header fields are mostly intended for grep operations and to offer
a sense of context without having to resort to demanding alternatives
for meta-data management (powerful though they may be).

Now here comes the feature I use the most: invoking `usls-new-note`
while the region is active will append its text to the resulting buffer.

```
title: Plentiful and predictable liquidity
date: 2020-10-07
category: Economics
orig_name: ~/Documents/notes/20201007_124941--economics--plentiful-and-predictable-liquidity.txt
orig_id: 20201007_124941
------------------------

%?

* * *

REGION GOES HERE
```

This alone makes it easy to benefit from some of that `org-capture`
goodness while remaining faithful to the overarching design principle of
simplicity.  I use this a lot when going through `elfeed` news, `gnus`
mails/groups, and even websites accessed via `eww`.  There is no setup
for any of them.  All we do is copy the region.

Concerning the actual contents of the note, I tend to write long and
carefully considered entries, though the system does not impose any
particular paradigm.  One could easily maintain bullet points.  Seeing
though as this is plain text, there is not much you can do with graphics
or all those extras that Org provides (unless you reinvent Org, but I
digress).  I actually consider such a constraint an upside: it focuses
the mind on the task of distilling an idea or set thereof.

## Categories and the absence of tags

Tags never worked for me.  This has been true ever since I created my
first blog circa 2011.  You add a bundle of words to each entry,
expecting that over the long term this method will give rise to emergent
themes.  Wordpress even provides a "tag cloud" widget (last time I
checked) so that you can see which word has the most entries.  Perhaps
this yields returns for large sets of files and is appropriate for data
mining on an industrial scale.  On my end, however, it always felt like
tags were an assortment of terms that offered little insight into the
linkages between my writings.

Think about a set of tags for this blog post: "emacs", "notes",
"library", "package".  When studied _as a group_ they do have a
descriptive value: an emergent quality.  We can infer what this is all
about.  Yet when each of those is interpreted in its own right it is
more likely to confuse rather than enlighten us.  Imagine having ten
entries under "library" and another ten under "books".  You then realise
that you must invent more specific tags such as "university-library" or
"emacs-library", until you reach a point where you have too many tags
for too few entries.  Which eventually forces you to expend energy on
administrivia rather than the essence of your text: which tags to
select, whether three or five of them are enough, and so on.

As such, I have settled on a simple rule of assigning a single word to
each entry, which I call a "category".  It describes in very broad terms
what the note is about.  To help you choose among competing options,
think which one would have the highest descriptive value when read on
its own.  So the current article would be associated with "emacs"
instead of "code", "library", "package"…

Categories must be generic though remain sufficiently informative.  It
would, for instance, be impractical to archive an economics' piece under
"science", just as it would be tricky to write sub-categories like
"monetary", "finance", "fiscal", etc. which would inevitably introduce
the same problems as with tags.  There is no magic solution here.  Just
pick a word that makes sense to you and is flexible enough.

On the technical side of things, `usls-new-note` presents its completion
candidates for categories using two sources that get combined in to a
single list:

1. A pre-determined list (`usls-known-categories` as of this writing);
2. Dynamically inferred entries based on filenames in `usls-directory`.

## Linking entries and finding connections

Most of my notes are standalone pieces.  I elucidate my thoughts as best
I can and try not to rely on implicit information or "further reading"
material for statements I make (with the understanding that I do have
all of it in my head).  Still, there are cases where links to other
items are mandatory.  My answer is quite uninspiring on the surface
level: add a unique identity (timestamp) that points to a file name,
plus some caret signs.

```
Some text I am writing.^20201007_124941

^^ 20201007_124941--economics--plentiful-and-predictable-liquidity.txt
```

Those are conveniently inserted with `usls-id-insert`, which uses
completion to select among a list of files that includes every item in
the `usls-directory`, except the current entry.

Strictly speaking, this is not a link.  It is a reference to a file name
whose location is assumed as relative to the directory that includes
those files.  Emacs can handle such cases gracefully.  Place the point
over either the ID (single caret) or the full name (double caret) and
type `C-x C-f M-n`.  There should only ever be a single match.  To make
this process a bit faster, though still faithful to what Emacs already
does, `usls-follow-link` presents completion candidates of all such
references (the "follow link" misnomer notwithstanding).

There is no backward linking feature to speak of.  While appealing and
probably beneficial in some fields of endeavour, it requires lots of
extras to work reliably; extras that I would rather avoid else risk
jeopardising my attempt at a minimalist setup.

If you need to find all files that reference a given ID/name, call some
grep command (`rg.el`, `counsel-rg` and the rest of the bunch, or
`occur`, `multi-occur` for buffers).  It works just fine.  Plus, with
the `wgrep` package you can edit the results of grep in a dedicated
buffer, in case you ever wish to refactor things---combine that with the
standard `wdired` for maximum effect and don't forget `query-replace`,
keybard macros or multiple cursors, etc.

## This is not a "second brain"

You can already discern the elements of my approach to the task of
composing plain text notes: leverage standard Emacs functions, avoid
duplication of efforts, minimise dependencies or complexity, and focus
on the text you intend to write, all while relying on a straightforward
file naming scheme and some ancillary syntactic notation.  Any extras
can come from existing packages, per the user's needs.

The name of this library---Unassuming Sidenotes of Little Significance
or `usls`---is a mere joke about it being "useless" when compared with
comprehensive solutions that promise to grant you a second brain.

While my code is just an exercise in Emacs Lisp that impliments a
simplistic private system for recording thoughts, I do believe that the
key to productivity does not rest with any of the tools on offer, but
with the clarity of concept one has developed prior to making use of
them.

What is the utility of a second brain if you have not yet realised the
potential of the first one?

In conclusion, what I have right now is a working prototype.  I will
continue to iterate on it whenever I discover some area that could be
improved further, without deviating from the underlying design values
documented herein.  The library is currently part of my dotemacs and is
available under this heading:
<https://protesilaos.com/emacs/dotemacs/#h:787df548-0d95-4512-a61d-27852198f561>.
Perhaps it will inspire you to implement a workflow that matches your
expectations and makes you feel in control of what is happening.

Also note that `usls` is not meant as a substitute for Org, such as to
track to-do lists, produce an agenda, etc.  This is about private
records of longer form notes, such as commentary on a paper I read.  I
still use Org to organise life's details and also to produce documents
such as my literate Emacs configuration (my dotemacs) or the Info manual
of my Modus themes.

## Annex with comment made by Karl Voit

Karl Voit is an expert on Personal Information Management (PIM) and
contacted me to share valuable insights.  Message reproduced with
permission in the text block below.

The short version of my reply is that I am open to reviewing things and
learning from others.  Some decisions, such as the format of the date or
the lack of spaces are purely stylistic or matters of convenience: I am
fine with other techniques.  What matters is the general principle of
keeping things simple and accessible.

In concrete terms, I plan to use `completing-read-multiple` so that one
could insert more than one category at the prompt (notwithstanding other
ideas I may take from [Karl's website](https://karl-voit.at/), once I
eventually read through the wealth of knowledge found there).

```
From: Karl Voit
Subject: USLS
To: public@protesilaos.com
Date: Thu, 8 Oct 2020 18:11:51 +0200

Hi,

Thanks for writing down about your cool system.

I do have a few remarks on your approach. I don't assume, you will
change your approach. However, I'd like to mention a few things
related to your file name convention and categories.


DATE--CATEGORY--TITLE.txt
with:
20201006_113858--politics--eu-deep-concerns-about-varosha.txt

I'd prefer a more ISO 8601 approach for general compatibility.

My own concept with focus on shell and CLI tools is summarized on:
https://karl-voit.at/managing-digital-photographs/

It consists of conventions + a set of self-written tools.

In my case, the file name convention looks like:

/this/is/a/folder/2014-04-20T17.09 Picknick in Graz -- food graz.jpg
 [ move2archive  ] [  date2name   ] [appendfilename] [ filetags ]

ISO 8601 can not be applied to file names directly because ":" is
not a valid character on Microsoft file systems. Therefore, I
settled with ".".

You do seem to avoid spaces in file names. IMHO, while this was good
practice up to maybe ten or fifteen years ago, I don't see any
reason to continue. I myself switched to spaces and (most recently)
also to special characters in file names as well without an issue.
YMMV. I got sick of looking for "*Vorhaenge*" as well as for
"*Vorhaenge*" in order to locate my own files (german Umlauts as
7-bit-pendants) and file names from others using the proper Umlaut.

Support from all standard tools in my zsh is perfect for special
characters such as Umlauts as well. No reason left to limit myself.


Categories vs. tags:

I do have some background there and this is maybe the main reason
for my comments.

The issues you're describing are very common aspects when tags are
used. IMHO a promising approach is to curate a finite and limited
set of tags, called "controlled vocabulary" (CV). Compare to
https://github.com/novoid/filetags which offers methods to deal with
CVs - even multiple of them - in an elegant way, I think.

This way, you need to limit yourself to high-level concepts instead
of describing the content of the information.

This should avoid the excessive use of new tags for all kinds of
files. 

Furthermore, multi-classification is a good thing to have. 

You're describing one possible approach to curcimvent
multi-classification: choosing the currently most important
category.

This is a valid approach but it comes with a well-studied
disadvantage: your mental model of the world is constantly changing.
The way you're thinking while creating the file name is different
from the world and context when retrieving the information.

From this background, it would be wiser not to have any category at
all and use the content to locate information (3rd order of orders
according to David Weinberger): full-text search.


I experienced with those ideas myself for quite some years until I
defined my method, conventions and wrote my tools.

Again: since you've invested so much already, there will be a very
small chance that you will change anything here. However, I had to
think about similar topics and came out with a different approach.
Maybe there is something you can take away from my result for your
system as well.


PS: If you - for some reason - want to publish my text. I'm fine
with it as long as you omit my email address.
```
