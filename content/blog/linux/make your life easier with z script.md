---
title: "Make Your Life Easier With Z Script"
date: 2020-09-21T20:33:49+04:00
draft: true
---

When working inside terminal, we often jump through different directories or levels inside that directories. Keeping the track of it and remembering what directory we accessed some steps ago, can be a tough task. One option can be using the `history` command in Linux, for example:

```bash

🚀 ~ history | grep cd

```

But let's agree that this is not an ideal solution because if the list is very long and we don't remember the exact name of the directory we used before, then there we have problems.

That's a one problem. Another problem is that sometimes we need to dive very deeply in the child directories. Of course, tabing works in the shell but it's often very painful and time-consuming to write all that stuff.

The `z` is here to help you.

&nbsp;

**How it works**

First we need to download it from a GitHub repository here: {{<a href="https://github.com/rupa/z" target="_blank" rel="noopener noreferrer">}}github.com/rupa/z{{</a>}}. We only need the file called `z.sh`.

```bash

🚀 ~ wget https://raw.githubusercontent.com/rupa/z/master/z.sh -P ~

```

I recommend to save it in user's home directory to easily access from our `.bashrc` file later. To make it work, we must open our `.bashrc` and at the end of it call&apply our z shell-script file. We can do that by running the commands below. 

**Important! Make sure you type two `>` symbols instead of one,  otherwise your `.bashrc` will be emptied and only contain that one line. Make sure you backup your .bashrc before making any modifications.** 

```bash

🚀 ~ echo ". \$HOME/z.sh" >> ~/.bashrc
🚀 ~ . ~/.bashrc

```

Now we have our z command available. Let's see what it is capable of. First of all, we need to jump around some directories so that `z` fills up some entries in its database. 

