---
title: "Emojifying Your Linux Terminal"
date: 2019-08-17T03:34:43+04:00
publishdate: 2019-08-17T03:34:43+04:00
description: "Want to make your work environment a little bit nicer? Learn how to insert emojis in your Linux terminal and get enjoyment every time you work in it."
---

All of us wish to express their individualism. Customizing the tools we use is one of the ways to do it. This article will show how we can make our Linux terminal more interesting and user-friendly by tweaking it a little with some nice emoji.

In this experiment, I personally use Debian 10 (Buster) with Chromium web browser, and a terminal called Xfce Terminal, all are running on a virtual machine. The process should be very similar in other Linux distros as well.
We’ll also need some site which contains cool emojis. I very like {{<a href="https://emojipedia.org/" target="_blank" rel="noopener noreferrer">}}Emojipedia{{</a>}}.

Now, when opening Emojipedia for the first time, we might see weird characters instead of nice emojis. Same is true about the terminal. If we try to copy and paste those characters to our terminal, we’ll see similar results.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1608507689/blog/img/topics/linux/emojifying_your_linux_terminal/emojipedia_blank_chars_hiph91.png" alt="emojipedia blank chars" loading="lazy">}}

You can think about emoji 🔥 as a font. If a system (OS) or a browser doesn’t have the appropriate font file installed in it, then it just will not be able to parse custom characters appropriately. Some modern operating systems, like Ubuntu, have already integrated this stuff by default, so you can skip some parts of this article if you see actual emojis instead of unidentified characters on your side.

So, it’s clear, that we need to install some fonts to translate the unattractive characters into beautiful emojis. These two fonts are very common, let’s use them: {{<a href="https://www.google.com/get/noto/" target="_blank" rel="noopener noreferrer">}}Google Noto Color Emoji{{</a>}} and {{<a href="https://github.com/joypixels/emojione-assets/releases" target="_blank" rel="noopener noreferrer">}}EmojiOne Android{{</a>}}.

If the links above do not work for some reason, then you can download the fonts from my personal drive here: {{<a href="https://yadi.sk/d/wPiV4h9LRIThFQ" target="_blank" rel="noopener noreferrer">}}yadi.sk/d/wPiV4h9LRIThFQ{{</a>}}

After downloading the fonts, we need to install them. In Debian and Debian-based operating systems (like Ubuntu) we can do this by placing these fonts to “~/.local/share/fonts/” directory, and then running the following command in our terminal: “fc-cache -v -f”, where “v” option provides verbose output and “f” option scans the font directories.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1608508160/blog/img/topics/linux/emojifying_your_linux_terminal/fc-cache_upd1fq.png" alt="fc-cache" loading="lazy">}}

If everything was done correctly, then we should see the following message at the end: “fc-cache: succeeded”. Now we can restart our terminal and web browser, and this time we must see the actual emojis.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1608508335/blog/img/topics/linux/emojifying_your_linux_terminal/emojipedia_with_emojis_shown_g9vjjv.png" alt="emojipedia with emojis shown" loading="lazy">}}

After we have our fonts in place, we can start customizing our terminal by using a custom emoji to display it in the bash prompt. For that task, we’ll need to deal with a system variable called “PS1” and change its value. We can do a lot of amazing things with PS1 variable, but this time we’ll just modify the bash prompt message.

Let’s open our bash configuration file located under home directory by using “nano ~/.bashrc” command in the terminal or editing it with our favorite text editor, like Pluma. At the end of that file, we’ll add a new line with PS1 value containing the emoji we want to use, like this: PS1="🦊 ~ "

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1608508449/blog/img/topics/linux/emojifying_your_linux_terminal/ps1_modification_h1apjx.png" alt="ps1 modification" loading="lazy">}}

After saving the changes, we must apply them by running the following command in our terminal: “source ~/.bashrc”.

&nbsp;

Hooray! 🥳 That’s all. We now have a nice bash prompt in the terminal, which will give us more joy every time we use it. 💚

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1608509102/blog/img/topics/linux/emojifying_your_linux_terminal/emojified_terminal_ja9jvw.png" alt="emojified terminal" loading="lazy">}}

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1608509103/blog/img/topics/linux/emojifying_your_linux_terminal/screenfetch_oihcxc.png" alt="screenfetch" loading="lazy">}}

**Important!** In some older Linux distros you’ll need more recent versions of some packages ( like, cairo and fontconfig ) to allow it to work. There are others as well. Upgrading them all manually can result in incompatibility issues or dependency hell, so think carefully before doing so.

&nbsp;

Cheers! 🍻



