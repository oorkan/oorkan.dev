---
title: "Make Your Life Easier With Z Script"
date: 2020-09-21T20:33:49+04:00
draft: true
---

When working inside terminal, we often face situations when we deal with jumping through different directories or levels inside that directories. Keeping the track of it and remembering what directory we accessed some steps ago, can be a tough task. One option can be using the `history` command in Linux, for example:

```bash

🚀 ~ history | grep cd

```

But let's agree that this is not an ideal solution because if the list is very long and we don't remember the exact name of the directory we used before, then there we have problems.

That's a one problem. Another problem is that sometimes we need to dive very deeply in the child directories. Of course, tabing works in the shell but it's often very painful and time-consuming to write all that stuff.

The `z` is here to help you.


**How it works**

First we need to download it, from here: {{<a href="https://github.com/rupa/z" target="_blank" rel="noopener noreferrer">}}github.com/rupa/z{{</a>}}. See the file called `z.sh`, open it in Raw mode and Save to your computer.