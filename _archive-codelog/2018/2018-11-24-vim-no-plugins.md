---
title: 'Now using Vim without plugins'
subtitle: 'Trying to do things the UNIX way'
excerpt: 'I no longer use any plugins in my .vimrc. External functions, such as file browsing or git diffs, are handled by other tools. The UNIX way.'
---
I no longer use plugins in my `.vimrc`.  I have been running this
experiment for a while now.  I had already reduced the list of plugins
to less than five and was actively trying to work without them prior to
disabling them altogether.

I like my new setup and consider it superior to what I had before, 
because I adapted my workflow to make better use of other CLI programs.  
In general, I think all one needs for a decent Vim experience is a 
sensible configuration file.  Everything else should be taken care of by 
external tools.

## Letting go of the IDE mentality

My first code editor was Atom on a Mac.  It shaped my expectations about 
what coding is about and what tools should be incorporated in the 
development environment.  I knew nothing about GNU/Linux, the UNIX 
philosophy, the CLI, etc. so I got this notion that the editor must 
include virtually everything that is needed for the task at hand.

I gradually learned about Vim and started using it, slowly leaving Atom
behind.  This happened for good after I switched to the libre software
side full-time some 2+ years ago.  I still did not know much though, so
I retained this IDE mentality: Vim should be able to replicate all sorts
of functions that the console could otherwise provide unbeknownst to me.

As such, I would have a plugin for browsing the files in my current
working directory and its subdirectories, another for showing me the git
changes, and so on.  There is no denying that these make Vim a better
tool overall, _if you only rely on Vim_, without support from the rest
of the operating system.  If, however, you start leveraging what the OS
provides, Vim's plugins become largely redundant.

Not only that, but some of Vim's built-in features turn out to be
useless, perhaps some edge cases notwithstanding.  For example, I find
no need to ever use splits (or however the tiles are called), when
`tmux` can handle that splendidly.  Similarly, I have never encountered
a situation where `:terminal` would genuinely improve my workflow.  If I
need to run some command I can just as easily fire up a new instance of
my terminal or use `tmux` again to achieve the same result.

## "Do one thing and do it well"

This means operating in accordance with the UNIX way.  Vim becomes
another specialised instrument that helps you get things done.  It has a
small footprint, is quick and nimble, plus you get to learn the rest of
your toolkit better.

In my experience, plugins have the unintended yet major downside of
offering disincentives to learning other CLI programs.  A plugin is akin
to a black box.  It does things in ways that the user does not fully
comprehend, unless they have prior knowledge of similar tools—which they
most likely acquired by not using the plugin equivalent.

Take some of the Git-related offers for example: they are cool and
convenient, but then you learn that plain `git` can show diffs, status,
and a whole host of information.  Just spend some time on `man git`.
The plugin is just a wrapper that obfuscates the underlying utility.

You may be thinking: why bother with the command line when the plugin
works just as well, if not better in terms of convenience?  For me, the
superiority of doing things the UNIX way is about being able to solve
problems through _shell scripting_.  Once you learn the commands for
running common file operations, manipulating streams, and the like, you
begin to see new possibilities that are not immediately apparent in a
Vim-centric setup.

Granted, I am no shell guru myself—I am not even a programmer.  Yet I 
can already see how such a workflow benefits my computing.

## The right tool for the job

For me part of using GNU/Linux on a daily basis is learning new things,
which basically comes down to improving your knowledge of the CLI tools
on offer.  It is why I also enjoy customising [my working
environment](https://gitlab.com/protesilaos/dotfiles).  No, I do not do
it for the sake of 'ricing', as per Reddit parlance, but to develop a
deeper understanding of what is going on and how things work together.

I am aware that there are people whose needs are profoundly different
than mine and who must maintain a long list of plugins to make Vim meet
their requirements.  That is just fine.  I did it, it works.  The beauty
of free software is that you can make those decisions yourself: pick and
choose what caters to your needs, follow the beaten path or do things
out of the ordinary.  Your call.

## Portability and adaptability

On another note, the upside to removing all plugins from my Vim setup is
that my dotfiles are ever more portable.  This is consistent with my
reasoning for switching from [Polybar to Lemonbar for my system
panel](https://protesilaos.com/codelog/2018-11-23-bspwm-lemonbar/).  

It also puts me in a better position with regard to being able to
operate in an unknown environment, say, a remote machine where my
dotfiles cannot be deployed or a custom `.vimrc` is not an option.

Adaptability is a huge asset.  I still have to do some work on that 
front: simplify my key bindings and the like.  The idea is to reach a 
state where I can be vimrc-agnostic, or at least know how to do 
everything without my configurations in place.
