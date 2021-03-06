---
title: 'Primer on regular expressions inside of Emacs'
excerpt: 'In this video tutorial I show how to use regexp notation to solve practical problems in Emacs.'
layout: vlog
mediaid: 'TxYGHjKBMUg'
---

In this video tutorial I show how to use regular expression syntax to
solve various practical problems in Emacs.

Knowledge of regexp notation is not a prerequisite to using Emacs
effectively.  In fact, you can be very productive without knowing
anything about regular expressions.  However, knowing those things
will certainly boost your productivity and make Emacs an even more
powerful tool at your hands.

See [my dotemacs](https://protesilaos.com/emacs/dotemacs) for the
documentation and package declarations I provide.

* * *

This is the full text of my presentation, which was done using
`org-mode` (check my dotemacs for presentations with Org).

```
* Emacs regular expressions in practice

Emacs has a few ways to operate on regexp matches, such as:

+ =isearch=
+ =query-replace=
+ =keep-lines=
+ =flush-lines=

To make our life easier, we can practice with the built-in
=regexp-builder= or the third-party package =visual-regexp=.  This demo
will rely on the latter.

If you have the manual you can run =C-h r i regexp= to get to the
relevant chapter.  *Do it!*

** Line boundaries

The caret =^= denotes the beginning of the line.

The dollar sign =$= marks the end.

Match all lines that start with a space:

Emacs
Emacs
 Emacs
Emacs
 Emacs

And all that end with a capital =S=:

emacs emacS
emacS emacs
emacs emacs
emacS emacS

** Remove or keep lines

Remove the empty lines.  Then keep the ones that contain "username".

<username><![CDATA[name]]></username>
emacs emacS
emacS emacs
emacs emacs
emacS emacS



<userName><![CDATA[nom]]></userName>
emacs emacS
emacS emacs
emacs emacs
emacS emacS




<username><![CDATA[name]]></username>
emacs emacS
emacS emacs
emacs emacs
emacS emacS

** The dot character

The dot or full stop =.= means matches every character except the
newline.

Match these words using their common part =ired= as a string.

dired
fired
mired
tired
wired

** Character sets and ranges

A set of individual characters is marked between brackets =[]=.

Sets can be written as ranges:

| Range      | Scope                                      |
|------------+--------------------------------------------|
| [a-z]      | all lower cases alphabetic characters      |
| [A-Za-z]   | all upper or lower case letters            |
| [a-z0-9]   | lower case alphabet or numbers 0 through 9 |
| [abcd1234] | letters a,b,c,d and numbers 1,2,3,4        |

Match both of those using a character set for the first letter:

emacs
Emacs

Match those that end with a number:

Emacs
emacs-27
emacs-26
GNU emacs

** Difference between postfix operators ?, +, *

"Postfix" means that it comes after a given set and alters its scope.

=?= match the previous term zero or one time.
=+= match the previous term one or more times.
=*= match the previous term zero or as many times as possible.

Match the =s= optionally:

day
days

Use =prote= followed by a postfix:

prot
prote
proteeee

** Grouped matches

A group is enclosed inside escaped parentheses =\(GROUP\)=.

Match both of these, including the optional suffix =ig=:

conf
config

** Greedy versus non-greedy

Postfix charaacter are greedy by default.  "Greedy" matches the
longest possible part.  Whereas "non-greedy" corresponds to the
shortest.

A non-greedy variant is used when the postfix is followed by =?=.

Using the =.*= construct, match items both greedily and not:

Hello world
Hello world world world world

** Multiple groups

Match the alphabetic and numeric parts in two separate groups.

emacs27
emacs26
emacs25
emacs24

** Literal hyphen and dot

Match the hyphen as part of the alphabetic group and the dot as part
of the numeric one.

emacs-27.1
emacs-26.3
emacs-25.2

** Exclude sets

To exclude a set you prepend a caret sign: =[^SET]=

Match every line except those that start with a capital letter.

GNU
Emacs
org-mode
regexp
emacs_lisp
Linux
guix

** Alternative groups with literal brackets

Use a character sets that matches =name= and =nom=.

name
nom

Then:

1. Match the =username= variants' =[name]= or =[nom]=.
2. Replace the match with =[PROT]=.


<username><![CDATA[name]]></username>
<nameuser><![CDATA[nam]]></nameuser>
<userName><![CDATA[nom]]></userName>
<nameuser><![CDATA[nome]]></nameuser>

** Either match

To target either set, use =\|=.

Prepend =vr/= to the first =group= and =match= on each line.

`(group-0 ((group (:inherit modus-theme-intense-blue))))
`(group-1 ((group (:inherit modus-theme-intense-magenta))))
`(group-2 ((group (:inherit modus-theme-intense-green))))
`(match-0 ((match (:inherit modus-theme-refine-yellow))))
`(match-1 ((match (:inherit modus-theme-refine-yellow))))

** Running elisp functions on groups

Run elisp by escaping the comma =\,= and then following it with a symbol
inside parentheses: =\,(FUNCTION)=.

Using the =.ired= pattern from earlier, run a replace command where you
must execute the =upcase= function on the second/middle match.  Keep the
rest in tact.

direddireddired
firedfiredfired
miredmiredmired
tiredtiredtired
wiredwiredwired
```
