---
title: "Emacs: new 'denote-merge' package"
excerpt: "Information about my new optional extension to Denote that streamlines the work of merging contents from one file to another."
---

The `denote-merge` package is an optional extension to Denote. I am
providing in response to requests for functionality that streamlines
the work of merging contents from one file into another. Thanks to Sia
Piperea for reminding me about it, making a suggestion for
region-related functionality, and testing my prototype:

- <https://github.com/protesilaos/denote-org/issues/16>.
- <https://github.com/protesilaos/denote/issues/649>.
- <https://github.com/protesilaos/denote-merge/issues/1>.

The `denote-merge` package is a more refined implementation of those
ideas, plus more. As of now, the package provides support for two
broad kinds of "merging":

- Merge one file into another.
- Merge a region into a file.

For merging a region, in particular, there are options and concomitant
convenience commands to format the region a certain way, such as an
Org source block, a Markdown blockquote, a plain indented region, and
the like.

The official manual describes the technicalities. In short, I have
taken care to make the relevant commands do the right thing, including
to update backlinks, annotate the contents, and establish links, where
relevant.

Note that the GNU ELPA package is not available yet. I have prepared
the relevant patch and am expecting everything to be done in the near
future.

Please stay tuned.

## Sources

+ Package name (GNU ELPA): `denote-merge` (Coming soon!!!)
+ Official manual: <https://protesilaos.com/emacs/denote-merge>
+ Git repository: <https://github.com/protesilaos/denote-merge>
+ Backronym: Denote... Merging Eventually Reformats the Given Entries.
