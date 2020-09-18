---
title: "Making Screenshots in Linux Using Terminal - Part 1"
date: 2020-09-17T04:48:08+04:00
publishdate: 2020-09-17T05:35:00+04:00
---


**Using the `xwd` command**

If our Linux OS is using the {{<a href="https://linux.die.net/man/7/x" target="_blank" rel="noopener noreferrer">}}X Window System{{</a>}}, we can use the `xwd` command there to make screenshots. This command is part of a package called `x11-apps`. Under Debian-based operating systems, like Ubuntu, we can run `sudo apt install x11-apps` to install it. 

```bash

🚀 ~ xwd -out screenshot.xwd

```

The command above will provide us a pointer to select the window we want to make a screenshot of. The problem here is that when we have another window in the foreground, that window will be captured as well as shown in the illustration.

![xwd screenshot illustration](https://res.cloudinary.com/oorkan/image/upload/v1600306477/blog/img/topics/linux/xwd_screenshot_illustration-480x_z4cnwo.png)

To avoid this, we can use the `sleep` command and have a delay before taking the screenshot to successfully minimize, close, or bring backward all other windows we don't want to capture.

```bash

🚀 ~ sleep 5; xwd -out screenshot.xwd

```

The `xwd` command uses its own format for screenshots. We can convert `.xwd` to standard image formats by using a visual editor, like {{<a href="https://www.gimp.org/" target="_blank" rel="noopener noreferrer">}}GIMP{{</a>}}, or command-line tools, like the `convert` from {{<a href="https://imagemagick.org/script/index.php" target="_blank" rel="noopener noreferrer">}}ImageMagick{{</a>}}.

```bash

🚀 ~ xwd -out screenshot.xwd
🚀 ~ convert screenshot.xwd screenshot.jpg

```

By default, `xwd` will not include the window frame. To make it shown, we must use the `frame` flag, like this: 

```bash

🚀 ~ xwd -frame -out screenshot.xwd

```

![xwd screenshot illustration 2](https://res.cloudinary.com/oorkan/image/upload/v1600306477/blog/img/topics/linux/xwd_screenshot_illustration-2-480x_tcg3zd.png)

And, finally, to make a screenshot of the entire screen with all windows, we should use the `root` flag. All frames of all windows will be included in this case. There's no need to specify the `frame` flag when using it with the `root` flag.

```bash

🚀 ~ xwd -root -out screenshot.xwd

```

It’s important to mention that the `xwd` command doesn't talk well or, sometimes, even allow window background transparency options. Keep this in mind when taking your screenshots with it. 🙂

&nbsp;

To be continued...

