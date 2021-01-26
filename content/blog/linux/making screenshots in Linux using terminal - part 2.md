---
title: "Making Screenshots in Linux Using Terminal - Part 2"
date: 2021-01-06T22:00:00+04:00
publishdate: 2021-01-06T22:00:00+04:00
description: "Make screenshots directly from your terminal in Linux using the import command."
---

In the [previous part](/blog/linux/making-screenshots-in-linux-using-terminal-part-1/), we saw how to make screenshots in the terminal by using the `xwd` command. In this part, we'll meet the `import` command.

[Part 1 here. 🔗](/blog/linux/making-screenshots-in-linux-using-terminal-part-1/)

&nbsp;

**Using the `import` command**

The `import` command is part of `imagemagick` package. To install it, under Debian and Debian-based operating systems {{<a href="https://distrowatch.com/search.php?basedon=Debian" target="_blank" rel="noopener noreferrer">}}🔗{{</a>}} you can run:

{{< highlight bash >}}

🚀 ~ sudo apt install imagemagick

{{< / highlight >}}


As for `xwd`, `import` also relies on the {{<a href="https://linux.die.net/man/7/x" target="_blank" rel="noopener noreferrer">}}X Window System{{</a>}}.

{{< highlight bash >}}

🚀 ~ import window.png

{{< / highlight >}}

The command above will provide us a pointer to select the window we want to take a screenshot of. Unlike `xwd`, where the foreground windows were being captured as well, the `import` command will capture only the window we select, and even if there is another window in the foreground, it will be omitted. This is a big plus over `xwd`, if you think about it. 🙃

To include the window frame in the screenshot we use the `frame` flag again, like this:

{{< highlight bash >}}

🚀 ~ import -frame window.png

{{< / highlight >}}

![import - include window frame](https://res.cloudinary.com/oorkan/image/upload/v1600306477/blog/img/topics/linux/xwd_screenshot_illustration-2-480x_tcg3zd.png)

To make a screenshot of the entire screen we can use the `window` flag. **Note:** when using the `window` flag, we should provide a window id as well. In the example below, window id equals to `root` since we want to capture the whole screen.

{{< highlight bash >}}

🚀 ~ import -window root entire_screen.png

{{< / highlight >}}

The same result can be achieved by using the `screen` flag, this time with pointer need to be clicked somewhere on the screen (but **NOT** on the general OS menus at the top or bottom, etc):

{{< highlight bash >}}

🚀 ~ import -screen entire_screen.png

{{< / highlight >}}

Another big plus over `xwd` is that `import` supports window background transparency when capturing an entire screen.

&nbsp;

**Supported formats**

Since `import` is part of ImageMagick, it supports numerous formats for the output file. Here are some of them:

- image/png
- image/jpg
- image/jpeg
- image/webp (requires webp to be installed in your system, {{<a href="https://packages.debian.org/search?searchon=names&keywords=webp" target="_blank" rel="noopener noreferrer">}}see deb 🔗{{</a>}} , {{<a href="https://developers.google.com/speed/webp/download" target="_blank" rel="noopener noreferrer">}}see google devs 🔗{{</a>}}.)
- image/xwd
- image/bmp
- image/gif

The full list of image formats ImageMagick supports can be found here:

- {{<a href="https://imagemagick.org/script/formats.php" target="_blank" rel="noopener noreferrer">}}imagemagick.org/script/formats.php{{</a>}} 
- {{<a href="https://gist.github.com/oorkan/a8bab579c590647b64dd2bb049d55d54" target="_blank" rel="noopener noreferrer">}}gist.github.com/oorkan/a8bab579c590647b64dd2bb049d55d54{{</a>}}

&nbsp;

**🍰 The cherry on the cake: selecting a custom area to grab**

It's very common for a GUI client to have a way to select a custom area to grab when taking a screenshot. But for a CLI command, this is a really cool feature.

{{< highlight bash >}}

🚀 ~ import custom_area_screenshot.png

{{< / highlight >}}

The window pointer here is able to select a custom area of the screen as well. 😉 

&nbsp;

To be continued...

[Go to Part 1. 🔗](/blog/linux/making-screenshots-in-linux-using-terminal-part-1/)