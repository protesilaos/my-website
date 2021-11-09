---
title: 'Task management using the shell and dmenu'
subtitle: 'Or else why I uninstalled Taskwarrior'
excerpt: 'I created my own solution to managing my task list. Everything now exists in a plain text file. And my new bespoke scripts write to it.'
---

I came up with my own solution to managing my task list.  Yes, there
probably are a zillion such approaches in the libre software world.  And
yes, mine is not the best of the bunch.  But I am happy with what I got,
so I might as well share my experience.

It all starts with the realisation that a task list is just a plain text
file.  You do not need a spreadsheet or some other type of structured
data.  Manipulating text is what the terminal is good at.  The point is
to be able to control everything with standard shell programs, such
as `cat`, `sed`, `grep`, `sort`.

Here is a sample of my task list:

	cat ~/.my_task_list

	Continue with the work @swätzchen =2019-01-23
	This should pop up first =2016-12-21
	Contact <person> @chat =2019-01-22
	Another test @dots =2017-01-20
	Date is not added @dots
	this task starts with a lower case letter

I can add items to the list by editing the file.  Such as:

* By using Vim or another text editor.
* Or by appending some text directly `echo 'string' >> ~/.my_task_list`.

As this is plain text, no markup is needed, no further requirements.
_Just write_.

## Managing the task list

Writing to a file is only the beginning.  Now we get to manipulate that
text.  Some examples are in order.

Print the contents of the file and capitalise the first letter on each
sentence:

	cat ~/.my_task_list | sed 's/\(^[a-z]\)/\U\1/'

	Continue with the work @swätzchen =2019-01-23
	This should pop up first =2016-12-21
	Contact <person> @chat =2019-01-22
	Another test @dots =2017-01-20
	Date is not added @dots
	This task starts with a lower case letter

Print only the tasks that have a due date assigned to them.  Also sort
numerically and put the date at the beginning of the line:

	grep -e '=[0-9-]*' ~/.my_task_list | sed 's/\(^.*\) =\([0-9-]*\)/\2: \1/g' | sort -g

	2016-12-21: This should pop up first
	2017-01-20: Another test @dots
	2019-01-22: Contact <person> @chat
	2019-01-23: Continue with the work @swätzchen

Sort and display tasks that match a specific string or pattern:
	
	grep -e '^This\|^this' ~/.my_task_list

	This should pop up first =2016-12-21
	this task starts with a lower case letter

You get the idea…  It is new to me, so I might figure out more use cases
and better ways of doing things.  Everything will be made clear in time
as I believe I am on the right track.

## Simple formatting

While everything is plain text, we can still use typographic symbols to
give a sense of structure and assign meaning to different parts of the
string.

This is particularly useful for printing the data in a different format
than its original.  Such as what I did in the example above where I got
the tasks with a date assigned to them.  The date appears first and then
the task description, even though the actual file has the date _after_
the task's description.

Without any kind of structure we find ourselves more limited in what we
can do.  Adding a few minor things here and there can help us greatly.
As such, I follow this pattern for marking my tasks: 

	<description> @<context> #<tag> =<date in YYYY-MM-DD>

I usually need only the `<description>`.  Every other piece of
"meta-data" is added in that given order, so that the context always
precedes the tag, which always precedes the date.

## Introducing a couple of scripts

To further improve my workflow, I just finished writing two scripts that
iterate on my task list file:

* The first is `stm`, the _Simplistic Task Manager_ which is a wrapper
  for the scenaria I showcased above.  So I can run `stm` to get a list
  of my pending tasks;  `stm due` to show those with a due date; and
  `stm list <string>` to search for something specific.
* The second is `stmmenu`, which is a `dmenu` tool that displays a list
  with all my tasks.  If I select an existing item, it is removed from
  the list.  If I type something new, it is appended to the list.

While `stm` is meant to be used in the terminal, `stmmenu` is invoked
with a hotkey.  _Need to quickly write down a task?_  Press the key
binding and start typing `<description> @context #tag =<date>`.  Done!

These new scripts are part of [my
dotfiles](https://gitlab.com/protesilaos/dotfiles).  Look inside the
"bin" directory.  Note though that I plan to review them, so things
might change in the future.

## "Do one thing and do it well"

Plain text.  Standard shell utilities.  A user-defined methodology for
writing things.  Minimal. Super effective.

I am so satisfied with the results that I have completely removed `task`
(aka "Taskwarrior") from my workflow.  That tool has served me well over
the last couple of years or so, but I always felt it offered more than
I ever needed.  Or it tried to perform too many specialised functions
outside the narrow confines of controlling a task list.  Something was
amiss.

Now I have found solace in the simplest of tools which, rather
unsurprisingly, involve the application of UNIX principles and use of
relevant commands.
