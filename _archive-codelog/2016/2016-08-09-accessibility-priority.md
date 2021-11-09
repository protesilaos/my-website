---
title: "Accessibility as a priority"
date: 2016-08-09
excerpt: "I am committing to make my website and all other themes accessible to all users. Accessibility is a facet of usability."
permalink: /codelog/accessibility-priority/
---
When we design websites we try to make them as usable as possible. This involves, among others, good typography, clear navigation menus, well structured code and content, and a mobile-first approach. To these we may add performance and aesthetics, to the extent they perform the function of enhancing the overall user experience. The end product has to be readable by humans and machines alike. It may thus be argued that *usability* is the single most important factor of a 'good' website.

## Accessibility is a facet of usability

I do not purport to be an expert on the matter. This is a learning process. I just understand the importance of making the site usable for all. Just as we write clean code for machines to read, or design responsive layouts that fit into the multitude of connected devices, so we must not discriminate against people on the basis of the technology they use to browse the Internet.

Here is my own experience, which is, at most, a mere proxy of the real issue. The other day my laptop's trackpad malfunctioned, forcing me to rely exclusively on the keyboard. The way to navigate the web is to press `tab` to move from one link to the next, and `shift+tab` to do so backwards. Almost every page tends to present a menu filled with links prior to the main content. Having to press a key several times can become tedious. Hence the need for a "skip to content" button.

If you are reading this on your desktop computer, go ahead and press `tab` (and then `enter` or `return` to follow the link). The first thing that will be focused on is a prominent module that enables the user to skip straight to the content area, circumventing the other navigation links.

This element alone helps make everything simpler. It is a plain HTML `a` tag, embellished with some CSS. Though it may appear "hidden" until it enters a `:focus` state, it is in fact absolutely positioned outside the viewport. That is considered a better practice than anything that has to do with `display: none`. Besides, it is the method used by the developers of the default WordPress Twenty Sixteen theme, so I consider it workable.[^WPTwentySixteen]

The gist of the styles:

```scss
.skip-link {
  position: absolute;
  left: -9999em;
  top: -9999em;

  &:focus {
    left: 1rem;
    top: 1rem;
    width: auto;
    z-index: 100000;
  }
}
```

## Semantic markup and use of SVGs

At this point in time, HTML5 is the only way to write proper markup. The spec provides for all sorts of tags that help machines—and assistive technologies—understand the role of each piece of code. For instance, the module with the menu links should be wrapped in `nav` tags or a block element with `role="navigation"`. The content area should be an `article`. Each page should only have one `h1`, while all headings should be written in accordance with their ordinal importance (from 1 to 6, where the former is the highest), **not** their respective styles.

Yet even valid HTML5 can contain inaccessible parts. A prime example is icon fonts, typically used to decorate links to social media, draw attention to ancillary functions or reference some actionable task. These do indeed offer a convenient way (for the developer) to add some extra visual flair to the overall design. Their major downside though is that they cannot be interpreted by screen readers.

Whereas SVGs can be rendered accessible, provided the developer is willing to change their ways (as they ought to). GitHub switched from an icon font to SVG a few months ago. As they note in their blog post (emphasis mine):[^GitHubArticleSVG]

> For dyslexics, certain typefaces can be more readable. To those changing their fonts, our font-based icons were rendered as empty squares. This messed up GitHub’s page layouts and didn’t provide any meaning. **SVGs will display regardless of font overrides**. For screen readers, SVG provides us the ability to add pronouncable alt attributes, or leave them off entirely.

Sounds promising and progressive.

To this end, I have already started to implement SVGs throughout all of my projects. My icon font was anyway limited to a handful of social media icons, so the transition has been smooth. The cool thing about SVG is that it is actual code, making its manipulation more effective. Each item can also be given a title and a description to further enhance its readability. Based on the available information, SVG generally is a superior choice over icon fonts.[^SVGAccessibilityReading]

## A commitment to universal access

I am still learning and want to be a better developer. This entails becoming more capable at delivering usable web applications. And accessibility is inextricably attached to usability. A universally accessible website offers a consistent user experience, making it good in *functional* as well as *normative* terms.

Understandably, accessibility is not limited to a handful of neat tricks, even though these can go a long way to addressing some of the most common problems. A multitude of factors needs to be accounted for. In practice, the transition from an exclusive to an *inclusive* app design will be gradual.

Time frame and technicalities aside, the intention is to incorporate accessibility into the broader code structure. The cummulative result of individually minor refinements will be better browsing for an ever larger group of users. The ultimate objective is to broaden the membership of that group to encompass 100% of the people accessing the Internet. There is absolutely no reason to maintain barriers to entry. A better web is one that is open to all.

[^GitHubArticleSVG]: [Delivering Octicons with SVG]( https://github.com/blog/2112-delivering-octicons-with-svg). Posted on February 23, 2016.

[^WPTwentySixteen]: The GitHub repo of [Twenty Sixteen](https://github.com/WordPress/twentysixteen). I recall from my time in the WordPress milieu that the developers committed to making this a fully accessible theme.

[^SVGAccessibilityReading]: I have found some resources to be particularly helpful, such as Chris Coyier's [Inline SVG vs Icon Fonts](https://css-tricks.com/icon-fonts-vs-svg/) and Sara Soueidan's [introductory guide](https://sarasoueidan.com/blog/icon-fonts-to-svg/) on making the switch.
