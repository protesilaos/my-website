---
title: "Emacs: all my packages have an AGENTS.md and CLAUDE.md to restrict use"
excerpt: "I am following the policy of core Emacs to not accept LLM-generated contributions."
---

I just finished adding `AGENTS.md` and `CLAUDE.md` to each of my Emacs
packages. I copied the files from the emacs.git trunk. Those files
inform LLMs about the project's policy to reject LLM-generated
contributions.

The reason for this change is that (i) I have assigned copyright to
the Free Software Foundation, (ii) all my code is distributed under
the terms of the GNU General Public License, and (iii) my packages are
designed to be compatible with core Emacs (all my packages can, in
principle, be part of emacs.git).

I do not want to merge changes that can jeopardise the legal standing
of my code base and, more generally, choose to remain aligned with
what the Emacs developers are doing.
