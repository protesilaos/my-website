---
title: "Gandi SOGO services on GNU/Linux and iOS"
subtitle: "Quick note on how to set up Gandi calendar and contacts"
excerpt: "Quick note on how to set up the new Gandi services (SOGO calendar and contacts) across GNU/Linux and iOS devices."
date: 2018-05-02
permalink: /codelog/gandi-sogo-cal-ios/
---
I use [Gandi](https://www.gandi.net) for my domain name. Recently, with the major overhaul of their website, they switched their email software to SOGO. On top of what they have always offered, they added calendar and contacts support.

Syncing up Gandi mail is well documented in their wiki, but the newer features do not yet come with usage instructions for local setup (or at least I have not found them). After a few trials and errors, I have figured out how to go about syncing everything across my devices. I post this short note here for future self-reference, or if someone else has the same use case.

The communications protocol for SOGO calendars is calDAV, while cardDAV is for contacts. The corresponding URLs for retrieving the content are as follows:

```
https://sogo3.gandi.net/SOGo/dav/YOUR-GANDI-EMAIL/Calendar/personal/

https://sogo3.gandi.net/SOGo/dav/YOUR-GANDI-EMAIL/Contacts/personal/
```

I have set up calendar and contacts syncing on two separate GNU/Linux machines, running Debian 9 (Debian Stretch) and Arch Linux respectively. Can confirm that syncing works on both Thunderbird and Evolution mail clients, though the former [needs an add-on for address books](https://docs.iredmail.org/thunderbird.sogo.html). You follow the application's interface for setting up a new calendar/address book, add the appropriate of the above URLs, and then use your email as username together with its password.

On the latest iOS version, the process is fairly straightforward, but the URL for the Calendar is slightly different (see below). To start, go to Settings > Accounts & Passwords > Add Account > Other. Select cardDAV for contacts, provide the aforementioned URL, your email as username and its password. Done!

For iOS calendars, follow the same procedure, select calDAV, but use the following URL, otherwise the connection fails:

```
https://sogo3.gandi.net/SOGo/dav/YOUR-GANDI-EMAIL/
```

That should be it. Thank you Gandi for these added features!
