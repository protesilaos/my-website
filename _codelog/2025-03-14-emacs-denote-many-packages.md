---
title: "Emacs: Denote is becoming many packages"
excerpt: "I am almost done splitting the 'denote' Emacs package into 'core' and 'extensions'. Here is what users need to know."
---

In February I announced the plan to reorganise the Denote project into
"core" and "extensions": <https://protesilaos.com/codelog/2025-02-11-emacs-splitting-denote-many-packages/>.
In essence, Denote is a file-naming scheme: you create new files
and/or rename existing ones (of any file type). Having that naming
scheme empowers you to retrieve stuff more easily without the need for
advanced tooling.

Though it turns out we can do a lot of useful things on top of this
simple-yet-powerful idea: custom Dired listings, Org dynamic blocks,
sequence notes, journaling, and many more. Having a clear separation
between core and extensions makes it easier for us to implement all
the features we want without worrying that the main package is
becoming bloated.

Concretely, much of the functionality that was part of the `denote`
package will now be provided by other packages. To this end, I just
made a change to the official elpa.git repository:

```
commit f23ff49fb8df22390fe139b432f763860a354175
Author: Protesilaos Stavrou <info@protesilaos.com>
Date:   Fri Mar 14 07:14:55 2025 +0200

  * elpa-packages (denote-journal, denote-markdown, denote-org, denote-sequence, denote-silo): Add new packages

 elpa-packages | 10 ++++++++++
 1 file changed, 10 insertions(+)
```

## Finalising the reorganisation of Denote

What remains to be done is for me to merge the `reorganise-denote`
branch of denote.git into `main`. I will do this as soon as the new
packages are indexed on GNU ELPA (maybe later today or tomorrow).

Users of the GNU ELPA package will not be affected immediately. Those
who build from source will, however, have to take action.

## Expect breaking changes

Users will experience breaking changes when they update to the new
`denote` package: functionality will be missing. In principle, all
those should be easy to fix: install the appropriate new package and
rename the functions/variables in your configuration accordingly. In
detail:

- The file `denote-journal-extras.el` becomes the package
  `denote-journal`. In your configuration replace
  `denote-journal-extras` with `denote-journal`.
- The file `denote-org-extras.el` (Org dynamic blocks and related)
  becomes the package `denote-org`. In your configuration replace
  `denote-org-extras` with `denote-org`.
- The file `denote-silo-extras.el` becomes the package `denote-silo`.
  In your configuration replace `denote-silo-extras` with
  `denote-silo`.

Additionally, the files that were in development but never made it as
part of a formal release, namely, `denote-md-extras.el` and
`denote-sequence.el`, will debut as their own packages:
`denote-markdown` and `denote-sequence`, respectively.

## You are welcome to ask me any questions

I am reluctant to introduce breaking changes, though this has to be
done for the long-term wellness of the project. If you have any
questions, please contact me directly or open an issue on the GitHub
repository. I am happy to help you.

## A concerted release cadence

All new packages are marked as version `0.0.0`, which means that only
those who track GNU-devel ELPA (or build from source) will notice
them. The formal release will coincide with the new version of
`denote` (`4.0.0`), which I expect to publish some time in April or
May 2025.
