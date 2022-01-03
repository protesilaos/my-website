---
title: "Re: VSCode or Vim ports of the Emacs modus-themes?"
subtitle: "Notes on possible ports of the modus-operandi and modus-vivendi themes to text editors or other platforms"
excerpt: "My answer to the frequently asked question on whether I plan to port the Modus themes to editors other than Emacs."
---

The following is a frequently asked question, though I realise I have
never addressed it on my website.  I am reproducing my reply with
permission, without divulging the identity of my correspondent.  I will
also include such information in the themes' manual.

As always, feel welcome to [contact me](https://protesilaos.com/contact)
for further information.

* * *

> I was wondering if there are any plans to port your theme to other 
> editors? Or is there a possibility to make a rough guideline as an 
> orientation for people who want to port the theme? From the source code 
> alone I had trouble identifying which color a variable, function etc. 
> would have.

There is no plan to do this in the foreseeable future because I only use
Emacs and cannot maintain ports for other editors.  I can provide a
quick-and-dirty simulacrum if you give me a template, but that is not
how I maintain the project: the details matter greatly (I can elaborate
at length if you need specific examples, but I won't do that here in the
interest of brevity).

Each program has its own requirements so it won't always be
possible---or indeed desirable---to have 1:1 correspondence between what
applies to Emacs and what should be done elsewhere.  I think no port
should ever strive to be a faithful copy of the Emacs implementation but
instead try to follow the spirit of the design.  In other words, if
something must be done differently on Vim/VSCode then that is okay so
long as (i) the accessibility standards are not compromised and (ii) the
overall character of the themes remains consistent.

The former criterion should be crystal clear as it pertains to the
scientific foundations of the themes: high legibility and taking care of
the needs of users with red-green colour deficiency (deuteranopia) by
avoiding red+green colour coding paradigms and/or by providing red+blue
variants.

The latter criterion is the _je ne sais quoi_ of the artistic aspect of
the themes: in the manual I provide insights in the "Frequently Asked
Questions", but I can expand further if you need specific guidance.  In
the meantime, either evaluate this from inside Emacs:

```
(info "(modus-themes) Frequently Asked Questions")
```

Or visit:
<https://protesilaos.com/emacs/modus-themes#h:b3384767-30d3-4484-ba7f-081729f03a47>.

With regard to the artistic aspect (where "art" qua skill may amount to
an imprecise science), I understand this is not a hard-and-fast rule as
it requires one to exercise discretion and make decisions based on
context-dependent information or constraints.  As is true with most
things in life, when in doubt, do not cling on to the letter of the law
but try to understand its spirit.

For a trivial example: the curly underline that Emacs draws for spelling
errors is thinner than, e.g., what Firefox/Chromium has, so if I was to
design for an editor than has a thicker curly underline I would make the
applicable colours less intense to counterbalance the typographic
intensity of the added thickness.

You ask about colour mapping.  I will answer though I must seize this
opportunity to stress the fact that a theme is not a colour scheme.  A
"colour scheme" is what terminal emulators implement, where you can
tweak the first 16 escape sequences and then each CLI program will make
its own decisions on what to use, to the effect that you are virtually
powerless to enforce consistency.  As such, a theme is characterised by
what the semantics of the word suggest: "thematic consistency".

Consistency is not an alias for uniformity.  Again, we need to exercise
judgement based on the specifics of each case.  To make this insight
relatable, consider a definition of discrimination:

* The treatment of substantially different magnitudes as if they were of
  the same class.
* Or the treatment of the same class of magnitudes as if they were of a
  different class.

(To treat similar things differently; to treat different things alike.)

Same for producing a theme.  If you enforce uniformity without
accounting for the particular requirements of each context, you are
making a not-so-obvious error of treating different cases as if they
were the same.

This is, by the way, why I always try to use the packages that the
modus-themes support instead of just applying colours on a whimsy.

With those granted, a visual method to get information on the applicable
colours is to use `M-x list-faces-display`.  This will produce a list
with two columns.  The first has the name of each "face" (construct that
holds colour- and text- related attributes).  The second shows a preview
of its style.  You can then click on, e.g., `font-lock-builtin-face` to
see what foreground colour it uses.  To save you from the trouble, here
is the list with all font-lock faces and their default text colour when
using `modus-operandi` (but please remember what I wrote above):

```
((font-lock-warning-face . "#702f00")
 (font-lock-variable-name-face . "#00538b")
 (font-lock-type-face . "#005a5f")
 (font-lock-string-face . "#2544bb")
 (font-lock-regexp-grouping-construct . "#8b1030")
 (font-lock-regexp-grouping-backslash . "#654d0f")
 (font-lock-preprocessor-face . "#a0132f")
 (font-lock-negation-char-face . "#813e00")
 (font-lock-keyword-face . "#5317ac")
 (font-lock-function-name-face . "#721045")
 (font-lock-doc-face . "#2a486a")
 (font-lock-constant-face . "#0000c0")
 (font-lock-comment-face . "#505050")
 (font-lock-builtin-face . "#8f0075"))
```

I got it with this code (will refine it to be more useful as this is
just a sample (some faces have a `:background` attribute, or `:inherit`
from another face, and so on)):

```elisp
(defvar modus-themes-font-lock-color-map nil)

(dolist (face '( font-lock-builtin-face font-lock-comment-face
                 font-lock-constant-face font-lock-doc-face
                 font-lock-function-name-face font-lock-keyword-face
                 font-lock-negation-char-face font-lock-preprocessor-face
                 font-lock-regexp-grouping-backslash
                 font-lock-regexp-grouping-construct
                 font-lock-string-face font-lock-type-face
                 font-lock-variable-name-face font-lock-warning-face))
  (push (cons face (face-attribute face :foreground))
        modus-themes-font-lock-color-map))
```

Lastly, to get information on what face the character at point uses,
invoke the command `describe-char` either via `M-x` or with the key
binding `C-u C-x =`.  It will produce a Help buffer that contains
information towards the end of the content on what the applicable face
is, if any.

If you plan to develop a port, I am always willing to help you whenever
you have any doubts on how to tackle a specific problem.  Just contact
me and we will make it happen.
