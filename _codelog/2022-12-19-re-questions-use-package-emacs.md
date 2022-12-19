---
title: "Re: Questions regarding use-package (Emacs)"
excerpt: "Excerpt from a recent exchange on the topic of the Emacs 'use-package' package."
---

The following is an excerpt from a recent exchange.  It is reproduced
with permission.  The identity of my correspondent remains private.

* * *

> I remember watching one of the earlier videos of yours where you
> mentioned you do not use use-package anymore. IIRC the reasoning was
> to utilise Emacs built-ins more and rely less on external code.
>
> Just out of morbid curiosity, were there any other reasons? Since
> use-package is now part of the core, and you have matured even more
> as an Elisp developer, would you have any notes on improving
> use-package to make it more applicable for larger audience?
>
> Another reason behind asking this is, I've been trying to get more
> into Elisp understanding and use-package, as it happens, was the
> project I picked to start with.
>
> Any ideas/advice/suggestions welcome.

I will answer your question.  Can I publish this on my website, so
that I can reference it in the future if somebody else asks me?  I
want to include the quote directly above.  I will keep your details a
secret.  Is that okay?

Starting with the point about prioritising built-in functionality: I
continue to do so, though I also account for a package's overall
quality and fitness for purpose.  If a third-party package appears to
me as better than its built-in alternative, I opt for it.  Examples
include my `modus-themes` when I first designed them in response to my
dissatisfaction with available built-in options, but also my
preference for `vertico` over `icomplete`, `ido`, and even the
standard Completions' buffer.

This is informed by my refined understanding of what it means for a
standalone package to be shipped with Emacs as opposed to being
available in some package archive: there is no technical difference
between the two.  My `modus-themes`, for example, is a standalone
package.  It is the same whether a user gets it directly from core
Emacs, some package archive, or clones it directly from the Git
source.  The inclusion of a standalone package in Emacs does not, in
and of itself, somehow upgrade or alter it.

Exception to this are foundational packages that are meant to be used
by other projects, such as for parsing data or creating new user
interfaces (e.g. transient.el).  Those benefit from inclusion in core
Emacs, as they became a standard that the community can reference.

Couched in those terms, I think `use-package` does not change by its
mere addition to core Emacs: it is not a foundational package that
other projects need to depend on.  So if I was not using it before, I
have no reason to use it now.  Which brings me to the "why" that is.

I stopped using `use-package` because (i) I did not like how its
domain-specific language deviates from how the same things are done
without it and (ii) did not want to deal with inconsistencies in its
syntax.

The DSL is inconvenient for me.  For example, the `:custom` entries
cannot be evaluated on a per-form basis the way they are with, say,
`setq` and now `setopt`.  If I want to evaluate specific forms without
the whole package declaration, I must take the forms out of their
`:custom` context, rewrite them, and then do my work.  Even if a
keyboard macro or `query-replace` makes the rewrite easier, it still
is something I have to do: it interferes with my flow.  Same idea when
converting the value of a `:hook` to the `add-hook` syntax; `:map` to
`define-key`.

As for the inconsistencies I alluded to, I did not want to deal with
how the `:hook` keyword defaults (or defaulted?) to omit "-hook" from
hook symbols, while `:map` keeps the "-map" suffix in the
corresponding symbols.  I know that there is/was a user option for
`:hook`, but that still breaks things for users who copy code that
includes the suffix but have not set that option accordingly---I had
to provide support for this incompatibility multiple times, to the
point where I realised it was not worth it.

Taking a step back, the extra features of `use-package` such as
`:defer` are not useful in my setup.  I do not care about startup
times.  Not one bit.  I launch Emacs once per session.  When I am
done, I close it and switch off the computer.  The way I do it is to
launch Emacs, go fetch a drink, and then get back where I expect
everything to be available.  So what if it takes 5 seconds or a
minute?  I was away from the computer.  With `:defer` I would have to
stop in the middle of my workflow to wait for the packages to become
available.  All for a small improvement to `emacs-init-time` that I
was not benefiting from anyway, as I was still fetching my drink
during startup.

I ended up using `use-package` as the equivalent of:

    (progn
      ;; do stuff
      )

I know this is what `use-package` is reduced to once we remove all the
extras (`:custom`, `:hook`, `:map`, `:defer`, ...), so this is exactly
what I did in my dotemacs.  I did it my own way to prevent people from
having the false safety of copy-pasting code without thinking about
it.  I want those who read my config to understand what they are
doing.  It works for me and is highly opinionated, which is what the
Emacs spirit is all about.

I must stress that this is not an argument against `use-package`.  I
am happy that it is added to core, as it is the de facto standard.
Lots of users will benefit from this change.  It just so happens that
I am not among them.
