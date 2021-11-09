---
title: "The Emacs community bought me a new PC"
excerpt: "Video announcement on my current status with the computer: the Emacs community donated money for a new desktop computer."
layout: vlog
mediaid: "y14Hw6twxgc"
---

My laptop broke a few weeks ago and I had no other personal computer.
The Emacs community helped me with donations and I am back in action.

In this video I provide an overview of what happened and what I am
currently up to.

Below is the text of my presentation, though note that I did not follow
it too closely:

```org
#+TITLE: The Emacs community bought me a computer
#+AUTHOR: Protesilaos Stavrou (https://protesilaos.com)
#+DATE: 2021-08-29

Hello everyone!  My name is Protesilaos, also known as "Prot".

As you can tell from the title of this video, this is a status update on
my current condition: *the Emacs community bought me a new computer.* I
both humbled and elated by the fact.

What follows is a summary of events and an overview of my next steps.

* The laptop's battery malfunctioned

On August 5 my laptop's battery stopped receiving power.  It was
behaving erratically for a couple of days prior, as it would abruptly
not send power to the computer, shutting down, and then make the special
sound it does that it was recharging again.  All this while being
plugged to the wall and with capacity to spare.

On the 5th it stopped recharging and the laptop has not worked since.
At the time I posted a short announcement on my website: there is a
dedicated section about "News", which is separate from my other
writings.  Here it is:

#+begin_quote
Laptop battery out; will be back ASAP

2021-08-05

My laptop’s battery is no longer recharging. I double-checked: it has
probably malfunctioned. I need what remains of it to make some final
backups. I’ll have no regular access to a computer afterwards. Need to
check for replacements and if they are worth it. Will reply to your
emails as soon as I can.

https://protesilaos.com/news/2021-08-05-laptop-battery/
#+end_quote

My only access to a computer was at the one available in my local
community.  This is a mountainous region.  Not many options.

Anyhow, I was expecting to remain out of action for several weeks due to
budget constraints.  Though after eleven days since I posted the
announcement, I noticed many emails from Paypal informing me that I had
received donations.  Checked my account and there were EUR 430!  That
was more than I had ever received before.

I could not check all the emails at the time, because I am subscribed to
several mailing lists and without Emacs+Notmuch it was too difficult to
find what I needed.  So I did not have a clear picture of what triggered
those donations.  Nothing like that had never happened before.

On August 16 I posted another announcement informing people that I got
donations and would be able to buy new equipment (by the way, writing a
blog post on Gitlab is much worse than doing it inside of Emacs).  I
explained that it would probably be better to invest in a mini tower
than pay for exorbitant shipping charges for a battery.

* New desktop computer

Shortly after I posted the second announcement, I contacted a friend who
knows more about computer hardware than I do.  I basically know nothing.
He helped me piece together a mini tower.  Some parts are new.  Others
are second-hand.  I am very happy with the outcome, as this is more
powerful than the laptop I had before (Emacs launches faster, I can load
a heavy website with javascript, etc.).

I also got this camera and a small microphone that I have here on my
side.  Hopefully the video and audio quality are better than before, but
don't expect anything fancy.

Anyhow, while I was waiting for the computer to be assembled, the
donations kept flowing in, but I did not know about them at the time.
When I eventually set up the new machine (on the night of August 26 and
the morning after) and finally got back to my email, I started reading
through the notifications from Paypal and the other emails I received.

The sum had tripled at about EUR 1400!  Many donations included a
message.  Almost all were related to Emacs.  Some people were thanking
me for my contributions in general.  Others referred to my Modus themes.
And others still mentioned the videos I do.

I don't know whether I should post the names of the people who
contributed, as this is private information and I have no permission to
divulge it.  Safe to say, there are many names on that list that I
already know.  We have exchanged emails before or collaborated on some
Emacs-related project.  Also, some of those names are very well known in
the Emacs community.

*I wish to thank everyone for their support.* I was not expecting it and
it has definitely made a noticeable improvement in my daily life.

I am still working through my backlog.  You will get a reply in the
coming days.

* Note on recent code updates and latest philosophy post

I have been busy setting things up.  I already had hand-written notes of
all sorts that I have already digitised and published.  Bash scripts,
Elisp snippets, and an 8k word publication on philosophical themes.

Some highlights:

+ I am back to using BSPWM (a tiling window manager).  Those of you who
  may only know me from my Emacs stuff, I used to have my bespoke
  computing environment, which included BSPWM+Tmux+Vim+CLI.  I still
  mostly using nothing but Emacs, though it is better to control the
  other windows with the keyboard.

+ I now publish the derived =*.el= file of my dotemacs.  This is for
  people who do not need to read through a massive document that
  contains more than 70k words.

+ Those are available in my dotfiles' repo.  My dotemacs is also posted
  in HTML on my website: https://protesilaos.com/emacs/dotemacs (includes
  link to the dotfiles).

+ I am back to maintaining my Git projects.  There has been an update to
  my Tempus themes, which are not Emacs-related.  Templates for the
  Alacritty terminal emulator are now available, as well as a dedicated
  =tempus-themes-alacritty= repo.

  - The shell scripts for maintaining the numerous Tempus themes have
    also been updated.

+ And now some philosophy.  I started writing this before my laptop
  failed, but I think the topic relates to the help I received from the
  Emacs community.  I will let you check the actual text on your own.
  It is written in a dialogue style, based on real experiences.  The
  title is /Why you are not important/ and relates to egocentrism,
  escapism, and related concepts.  Instead of my text, let me read you
  this, which many of you already know about.

#+begin_quote
Notmuch is not much of an email program.  It doesn't receive messages
(no POP or IMAP support).  It doesn't send messages (no mail composer,
no network code at all).  And for what it does do (email search) that
work is provided by an external library, Xapian.  So if Notmuch provides
no user interface and Xapian does all the heavy lifting, then what's
left here?  Not much.

https://notmuchmail.org/
#+end_quote
```
