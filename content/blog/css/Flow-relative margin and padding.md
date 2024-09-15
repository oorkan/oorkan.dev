---
title: "Flow-relative margin and padding"
date: 2024-08-27T13:00:43Z
draft: true
tags: ["css"]
---

We live in globalising world and having software adapted to different languages, regions and locales is crucial. This is known under abbreviations **i18n** and **l10n**, i.e., internationalization and localization respectively.

We are used to do margins and paddings like this:

{{< highlight css >}}
margin: <margin-y> <margin-x>;
{{< / highlight >}}

which is the more compact version of:

{{< highlight css >}}
margin: <margin-top> <margin-right> <margin-bottom> <margin-left>;
{{< / highlight >}}

We can also set each direction separately:

{{< highlight css >}}
margin-top: <value>;
margin-right: <value>;
margin-bottom: <value>;
margin-left: <value>;
{{< / highlight >}}

Here's an example - subscription message where the subscribe button has `14px` of margin from left.

{{<codepen_widget penId="gONQPPM">}}

But what happens when we switch to Arabic language?

{{<codepen_widget penId="zYVXVYX">}}

The margin from the left for button still exist but that's not what we want - we want to have a space between the textual description and button.

{{<codepen_widget penId="yLdrdYR">}}
