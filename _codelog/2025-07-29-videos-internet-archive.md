---
title: "All my videos are mirrored on the Internet Archive (thanks to Amin Bandali)"
excerpt: "All my videos are now available on a hosting platform that respects user freedom."
---

A few days ago, Amin Bandali contacted me about the prospect of
mirroring my videos to the Internet Archive. The idea is to have the
option of a video hosting platform that respects user freedom. I
agreed and confirmed the free/libre copyleft terms I share all my
publications under (GNU GPLv3+ for code, Creative Common BY-SA 4.0 for
prose, GNU FDL for my technical manuals).

Amin has since done the work and documented it here:
<https://kelar.org/~bandali/2025/07/25/protesilaos-videos-archive.html>.
The publication also points to the Python script which performs the
requisite operations. The script relies on the source code of my
website to extract the relevant data. Amin describes the underlying
technical considerations, given the large number of videos that needed
to be downloaded from YouTube and uploaded to the Internet Archive.

On my part, I made a small change to the template of my website that
produces the HTML output of entries with an embedded video. Those have
links to the source on YouTube and, now, to the corresponding Internet
Archive page. For example, my latest "Prot Asks" video with Ihor, the
Emacs Org mode maintainer, is available here:
<https://archive.org/details/prot-codelog-2025-07-26-prot-asks-ihor-emacs-org-maintainer-history-travel-material-science/>.

These "raw links", as opposed to the embedded frame, are also helpful
for users who receive my publications via RSS/Atom feeds (and I do
share the entire blog post, by the way, rather than an excerpt because
that is the most convenient way to read RSS).

Thanks to Amin for this initiative!
