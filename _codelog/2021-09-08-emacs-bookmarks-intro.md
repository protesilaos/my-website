---
title: "Primer on Emacs bookmarks"
excerpt: "Bookmarks are compartments that store arbitrary data about files/contexts that we can access with Emacs."
layout: vlog
mediaid: "7eWAfmABHMs"
---

In this video I offer an introduction to the built-in bookmarking
framework of Emacs.  Bookmarks are compartments that store arbitrary
data about files/contexts that we can retrieve on demand.  They can
potentially work with practically every major-mode inside of Emacs and
can interface with other core features such as TRAMP to, e.g., restore
an Eshell buffer over a particular file access protocol.

The video also briefly covers my custom extensions for the bookmarks'
list view as well as my handler function for making EWW compliant with
the standard `bookmark.el` library instead of its own bookmarking
facility.

All configurations and custom code are published on this website as part
of my dotemacs: <https://protesilaos.com/emacs/dotemacs>.  The link includes
references to the Git sources.
