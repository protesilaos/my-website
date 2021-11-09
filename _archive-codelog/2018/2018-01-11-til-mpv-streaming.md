---
title: "Today I learned: mpv for online video streaming"
subtitle: "An easy way to control video playback"
excerpt: "It is very easy to launch mpv with any online video, by running it through the terminal. Use it to stream Youtube videos without logging in."
date: 2018-01-11
permalink: /codelog/til-mpv-streaming/
---
Today I learned how to use Youtube without ever logging in to the site. This is a combination of subscribing to channels via RSS and then using `mpv` (with `youtube-dl` dependency) to stream the content locally.

Here is how it works.

First subscribe to your favourite channel via RSS. You need to retrieve the channel's id or username, which you will implement in the corresponding url template:

```sh
# Templates
https://www.youtube.com/feeds/videos.xml?user=THE-USERNAME
https://www.youtube.com/feeds/videos.xml?channel_id=THE-ID

# Example with my channel's actual url (last part is the id)
https://www.youtube.com/channel/UC0uTPqBCFIpZxlz_Lv1tk_g

# Example with my channel's RSS feed
https://www.youtube.com/feeds/videos.xml?channel_id=UC0uTPqBCFIpZxlz_Lv1tk_g
```

Now you are good to go. When you receive an update in your RSS reader, copy the link, open a terminal and execute the following:

```sh
# Template
mpv link-to-video

# Example with my latest seminar
mpv https://www.youtube.com/watch?v=CDjJ6vY0plk
```

My RSS reader is `newsboat` which makes things even better, as I remain close to the command line.

Anyway, using `mpv` to stream videos is a solid method to degoogle part of your online activity without losing out on some valuable content. I strongly recommend checking out `man mpv` and the relevant [Arch wiki entry](https://wiki.archlinux.org/index.php/Mpv) for cool ways to optimise your experience.
