---
title: "Up and Running With Html5 Canvas"
date: 2021-01-11T14:57:55+04:00
draft: true
---

With HTML5 Canvas (henceforth `Canvas`) we can create 2D animations, beautiful shapes, interactive elements and, even, games. You can think of Canvas, as the name suggests, as a 2D paper to draw pixels on.

&nbsp;

**What we'll need in this totorial**

- An online HTML5 editor with JavaScript support

In this tutorial, I'm going to use `W3Schools Online Code Editor` (also known as `Try It Editor`) but you are free to use any editor you want, like Codepen, JSFiddle, etc.

**Let's start**

First thing we need to do is to define 3 things in our HTML file:
- The Canvas element
- The JavaScript file or an embed script which is going to manage our Canvas
- Some styling to make it visible

{{< gist oorkan 9e34fd9c4bfc3e82c17641359e7928aa init.htm >}}

{{<canvas width="480" height="320" id="mycanvas1">}}
  <script async>(function(){const canvas=document.getElementById("mycanvas1");canvas.style.border="4px dashed crimson";const ctx=canvas.getContext("2d");}())</script>
{{</canvas>}}

This will define just an empty Canvas 480px wide and 320px tall. To start drawing on the Canvas, we need to access its context. In this course, we'll work only with `2D` contexts.

{{< gist oorkan 9e34fd9c4bfc3e82c17641359e7928aa get_context.htm >}}

&nbsp;

**§ 1 - Fill the canvas with custom background color**

{{< gist oorkan 9e34fd9c4bfc3e82c17641359e7928aa fill_canvas.htm >}}

{{<canvas width="480" height="320" id="mycanvas2">}}
  <script async>(function(){const canvas=document.getElementById("mycanvas2");const ctx=canvas.getContext("2d");ctx.fillStyle='#191919';ctx.fillRect(0,0,canvas.width,canvas.height);}())</script>
{{</canvas>}}

&nbsp;

**§ 2 - Draw a line**

{{< gist oorkan 9e34fd9c4bfc3e82c17641359e7928aa draw_line.htm >}}

{{<canvas width="480" height="320" id="mycanvas3">}}
  <script async>(function(){const canvas=document.getElementById("mycanvas3");const ctx=canvas.getContext("2d");ctx.fillStyle='#191919';ctx.fillRect(0,0,canvas.width,canvas.height);ctx.strokeStyle='#0A84FF';ctx.moveTo(0,0);ctx.lineWidth='4';ctx.lineTo(192,192);ctx.stroke();}());</script>
{{</canvas>}}
<!-- {{<img src="https://res.cloudinary.com/oorkan/image/upload/v1610373068/blog/img/topics/html5/up_and_running_with_canvas/draw_line_jv1y9y.png" alt="Draw Line" loading="lazy">}} -->

&nbsp;

**§ 3 - Paths**

Path is the **cornerstone concept** in Canvas. To be able to work with Canvas paths professionally, you must memorize these 4 basic statements:

{{< highlight text >}}
1. In HTML5 Canvas, a path is a group of points that are connected by straight lines or curves.
{{< / highlight >}}

{{< highlight text >}}
2. A path has zero or more subpaths.
{{< / highlight >}}

{{< highlight text >}}
3. `ctx.beginPath()` method creates a path.
{{< / highlight >}}

{{< highlight text >}}
4. `ctx.moveTo()` method creates a subpath.
{{< / highlight >}}

{{< gist oorkan 9e34fd9c4bfc3e82c17641359e7928aa paths1.htm >}}

{{<canvas width="480" height="320" id="mycanvas4">}}
  <script async>(function(){const canvas=document.getElementById("mycanvas4"),ctx=canvas.getContext("2d");ctx.fillStyle="#191919",ctx.fillRect(0,0,canvas.width,canvas.height),ctx.lineWidth="4",ctx.beginPath(),ctx.strokeStyle="#0A84FF",ctx.moveTo(50,192),ctx.lineTo(250,192),ctx.stroke(),ctx.beginPath(),ctx.strokeStyle="#23D16F",ctx.moveTo(300,192),ctx.lineTo(300,50),ctx.stroke();}())</script>
{{</canvas>}}

Let's comment out the code on line 15 and see what happens.

{{< gist oorkan 9e34fd9c4bfc3e82c17641359e7928aa paths2.htm >}}

{{<canvas width="480" height="320" id="mycanvas5">}}
  <script async>(function(){const canvas=document.getElementById("mycanvas5"),ctx=canvas.getContext("2d");ctx.fillStyle="#191919",ctx.fillRect(0,0,canvas.width,canvas.height),ctx.lineWidth="4",ctx.beginPath(),ctx.strokeStyle="#0A84FF",ctx.moveTo(50,192),ctx.lineTo(250,192),ctx.stroke(),ctx.strokeStyle="#23D16F",ctx.moveTo(300,192),ctx.lineTo(300,50),ctx.stroke();}())</script>
{{</canvas>}}

As you can see, the horizontal line fills with the color we set on line 16 instead of filling blue. This happens because by commenting the line 15, we still inside the first path and even if we already draw the 1st line it will be re-drawn by the stroke() method on line 19, this time using the new color we specify for the stroke.