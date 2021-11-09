---
title: "Org’s export dispatcher has a new face for its keys"
excerpt: "The export dispatcher menu that Org produces now has a new face to highlight its options. It makes things more usable."
---

**Update 2020-10-25 10:57 +0300:** Added screen shots with the Modus
Operandi and Modus Vivendi themes.
{:.info}

**Update 2020-11-28 15:33 +0300:** Update screen shots for
`modus-themes` version `1.0.0`.
{:.info}

As of commit `7ebb2d562` in the git repo of Emacs' Org mode, the export
dispatcher uses a new face to highlight its available keys and possible
options: `org-dispatcher-highlight`.  It supersedes the general purpose
`org-warning` for this particular interface.

## Before and after

This demonstration is on `emacs -Q`.  First without the patch and then
with it:

<img alt="Org dispatcher before" src="{{ '/assets/images/attachments/org-export-dispatcher-face-old.png' | absolute_url }}"/>

<img alt="Org dispatcher after" src="{{ '/assets/images/attachments/org-export-dispatcher-face-new.png' | absolute_url }}"/>

And below are [my Modus themes](https://protesilaos.com/emacs/modus-themes)
(Modus Operandi and Modus Vivendi, version `1.0.0` or higher) with the
new face tweaked to match their established metaphors.  We apply yellow
colouration to convey a sense of urgency, as the dispatcher is a special
window that remaps common key bindings by assigning special commands to
them:

<img alt="Modus Operandi Org dispatcher wide" src="{{ '/assets/images/attachments/modus-operandi-org-export-wide.png' | absolute_url }}"/>

<img alt="Modus Operandi Org dispatcher narrow" src="{{ '/assets/images/attachments/modus-operandi-org-export-narrow.png' | absolute_url }}"/>

<img alt="Modus Vivendi Org dispatcher wide" src="{{ '/assets/images/attachments/modus-vivendi-org-export-wide.png' | absolute_url }}"/>

<img alt="Modus Vivendi Org dispatcher narrow" src="{{ '/assets/images/attachments/modus-vivendi-org-export-narrow.png' | absolute_url }}"/>

## In the interest of usability

The [email to the Org mailing
list](https://lists.gnu.org/archive/html/emacs-orgmode/2020-10/msg00158.html)
reveals my rationale:

>The export dispatcher's active keys are highlighted using the
>`org-warning` face.  That face is applied in various contexts,
>including the agenda.
>
>Users who have difficulty reading the active keys of the export
>dispatcher are therefore forced to modify `org-warning` throughout
>their setup, even though their problem is present only while viewing
>the dispatch UI (because highlighted keys are one or a few characters
>long).
>
>The attached patch is an attempt to address this issue by creating a
>new face that is specifically designed for the dispatch UI.
>
>For the background+foreground combinations, the selected values conform
>with the highest accessibility standard for colour contrast (WCAG AAA,
>else a minimum contrast ratio of 7:1).  I limited my options to what
>`M-x list-colors-display` provides.

The relevant diff:

```diff
 lisp/org-faces.el | 14 ++++++++++++++
 lisp/ox.el        |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/lisp/org-faces.el b/lisp/org-faces.el
index c0556b8bb..94b283ad6 100644
--- a/lisp/org-faces.el
+++ b/lisp/org-faces.el
@@ -45,6 +45,20 @@ The foreground color of this face should be equal to the background
 color of the frame."
   :group 'org-faces)
 
+(defface org-dispatcher-highlight
+  '((default :weight bold)
+    (((class color) (min-colors 88) (background dark))
+     :background "gray20" :foreground "gold1")
+    (((class color) (min-colors 88) (background light))
+     :background "SlateGray1" :foreground "DarkBlue")
+    (((class color) (min-colors 16) (background dark))
+     :foreground "yellow")
+    (((class color) (min-colors 16) (background light))
+     :foreground "blue")
+    (t :inverse-video t))
+  "Face for highlighted keys in the dispatcher."
+  :group 'org-faces)
+
 (defface org-level-1 '((t :inherit outline-1))
   "Face used for level 1 headlines."
   :group 'org-faces)
diff --git a/lisp/ox.el b/lisp/ox.el
index 6dd2cd4a0..5ffd66816 100644
--- a/lisp/ox.el
+++ b/lisp/ox.el
@@ -6706,7 +6706,7 @@ back to standard interface."
 	    ;; on the first key, if any.  A nil value means KEY will
 	    ;; only be activated at first level.
 	    (if (or (eq access-key t) (eq access-key first-key))
-		(propertize key 'face 'org-warning)
+		(propertize key 'face 'org-dispatcher-highlight)
 	      key)))
 	 (fontify-value
 	  (lambda (value)
```

This commit resolves a conundrum that theme developers could find
themselves in: 

+ Should I make the keys in the export dispatcher as clear as possible
  without compromising on their utility?
+ Or should I allow deadlines in the agenda to have a sense of urgency
  without becoming intrusive and outright unpleasant?

The introduction of the new face removes this constraint altogether by
disaggregating the uses of `org-warning`: dispatcher keys can be drawn
in a style that best complements the intended function of their
presentation, while agenda buffers and other interfaces can still
present _warnings_, such as pending tasks, in a manner that suits the
significations attached to that word.

To retain the old export dispatcher aesthetic, instruct
`org-dispatcher-highlight` to inherit from `org-warning` (or petition
your theme's developer to consider such a reform).  For example:

```elisp
(set-face-attribute 'org-dispatcher-highlight nil :inherit 'org-warning)
```

Please note that what matters is the presence of a new face, not the
exact colour values assigned to it, as shown by the tweaks I made to it
in my Modus themes.

## Thanks to the community

I wrote this patch after receiving [valuable feedback from user
"Anders"](https://gitlab.com/protesilaos/modus-themes/-/issues/2#note_427541924)
on the Modus themes' issue tracker.

My gratitude extends to Bastien Guerry, the maintainer of Org mode, for
accepting my code and for their valuable contributions in general.
