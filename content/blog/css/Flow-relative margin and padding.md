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

Here's an example - subscription message where the subscribe button has `14px` of margin from right.

{{<codepen_widget penId="gONQPPM">}}

But what happens when we switch to Arabic language?

{{<codepen_widget penId="zYVXVYX">}}

The margin from the right for button still exist but that's not what we want - we want to have a space between the textual description and button.

&nbsp;

We can have the desired behavior by using flow-relative margin instead.

{{<codepen_widget penId="yLdrdYR">}}

Here, we replace `margin-right` with its flow-relative corresponding in this case `margin-inline-end`. But what does `inline`, `end` and more importantly, `flow-relative` mean? To understand the concept of flow-relative properties, let's take an example of CSS flexbox:

In CSS flexbox, we have two axises: the main axis and the axis perpendicular to it, i.e.: cross axis. When the `flex-direction` is `row`, the main axis is horizontal, and the cross axis is vertical.

![..](http://localhost:1313/img/flexbox.png)

<!-- {{<codepen_widget penId="yLdrdYR">}} -->
Let's say we have a container inside our flexbox and we want to bring it to the very right across the main axis:

![..](http://localhost:1313/img/flexbox1.png)
Fig. A

As you can see, we haven't wrote `justify-content: right;` but `justify-content: flex-end;` because there's no right or left. And that's logical. If we now change the `flex-direction` to `row-reverse`, the `flex-end` will push the container to the very left and not right because the flex-end is on the left now:

![..](http://localhost:1313/img/flexbox2.png)
Fig. B


When we speak about the flow in this case, in Fig A it's horizontal from left to right, and in Fig B it's horizontal from right to left. If we now draw an analogy with our example with margin, the `inline` flow is horizontal from left to right in ltr languages and horizontal from right to left in rtl languages. So, in ltr languages, the start is on the left, and in rtl languages the start is on the right. (???) But that's not all the truth.

Now what happens with the flexbox when the direction is column. In that case the main and cross axises will change places, so the main axis will become vertical and the cross axis horizontal.

![..](http://localhost:1313/img/flexbox-col.png)

The `flex-end` will now become the very bottom of the flexbox:

![..](http://localhost:1313/img/flexbox1-col.png)

and when the `flex-direction` is `column-reverse`, the `flex-end` will become the very top:

![..](http://localhost:1313/img/flexbox2-col.png)

To have an analogy with `margin-inline-end`, now we have to switch to japanese, where we write vertically and not horizontally.



&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;

Ref:
https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_logical_properties_and_values/Basic_concepts_of_logical_properties_and_values
https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_flexible_box_layout/Aligning_items_in_a_flex_container
