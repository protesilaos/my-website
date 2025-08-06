---
title: "'Prot Asks' video series"
subtitle: "One-on-one public conversations about Emacs and life in general"
excerpt: "I talk to anybody who wants to have a public discussion with me. Topics cover Emacs and practically everything else."
permalink: /prot-asks/
---

The "Prot Asks" series of videos contain friendly and casual
discussions. The topics range from Emacs, to general technology
themes, to life at-large. Everybody is welcome to participate. The
only requirements are that (i) you are willing to show your face on
camera, and (ii) the video is posted on my YouTube channel.

The way this works is that anybody interested contacts me:
<https://protesilaos.com/contact>. They tell me a few things about who
they are and what they are interested in. Then we schedule a meeting.
I do not have any questions written down and simply go with the flow
of the conversation. These are fun chats, not formal interviews!

Meetings are scheduled on the basis of equal opportunity: "first come;
first served", if you will. This means that those interested join the
queue and will not get any preferrential treatment.

Here are all the videos:

{% assign codelog = site.codelog | where_exp: "item", "item.path contains 'prot-asks'" | where_exp: "item", "item.mediaid or item.layout == 'vlog'" | sort: 'date' %}
<ul>
  {% for i in codelog %}
  <li>
    <time class="index-blog-post-timestamp">{{ i.date | date: site.date_format }}</time><a class="index-blog-post-link" href="{{ i.url | relative_url }}"> {{- i.title -}} </a>
  </li>
  {% endfor %}
</ul>

I have a policy of not editing my videos, but I am happy to make an
exception if you ask me to. If you watch the other entries in the
series, you will notice that I start by hitting the record button and
end the same way. No tricks; no gimmicks! If you have any further
questions about how this is done, just let me know.
