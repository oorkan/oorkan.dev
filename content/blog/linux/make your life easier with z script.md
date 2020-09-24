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

We have our z command available. Let's see what it is capable of. First of all, we need to jump around some directories so that `z` fills up some entries in its database. 

{{<img src="http://localhost/img/cd_multiple-640x.png" alt="cd multiple" loading="lazy">}}

Now, if we type `z` and hit `Enter`, we see that `z` stored some values of directories we've changed to.

{{<img src="http://localhost/img/z-db-640x.png" alt="z db" loading="lazy">}}

And now comes the awesome part. Let's change directory to `/home/nux/Pictures/family/2020-05/Armenia`. With `z`, we can just do `z Armenia` or type `z Ar` and hit the `Tab` key. `z` will figure out everything for us, and change to appropriate directory without a need to provide the full path to it.

{{<img src="http://localhost/img/z-armenia-568x.png" alt="z armenia" loading="lazy">}} {{<img src="http://localhost/img/z-ar-tab-568x.png" alt="z ar tab" loading="lazy">}}

Same way, we can change to other directories and this is just the small part of `z` capabilities. More information, available options, etc can be found right in the script, provided as commented documentation. You can view it by opening the script with some Text Editor or, for example, with `nano` in terminal. I'll also paste it here:

{{<a href="https://raw.githubusercontent.com/rupa/z/master/z.sh" target="_blank" rel="noopener noreferrer">}}View the entire file{{</a>}}

```bash

# Copyright (c) 2009 rupa deadwyler. Licensed under the WTFPL license, Version 2

# maintains a jump-list of the directories you actually use
#
# INSTALL:
#     * put something like this in your .bashrc/.zshrc:
#         . /path/to/z.sh
#     * cd around for a while to build up the db
#     * PROFIT!!
#     * optionally:
#         set $_Z_CMD in .bashrc/.zshrc to change the command (default z).
#         set $_Z_DATA in .bashrc/.zshrc to change the datafile (default ~/.z).
#         set $_Z_MAX_SCORE lower to age entries out faster (default 9000).
#         set $_Z_NO_RESOLVE_SYMLINKS to prevent symlink resolution.
#         set $_Z_NO_PROMPT_COMMAND if you're handling PROMPT_COMMAND yourself.
#         set $_Z_EXCLUDE_DIRS to an array of directories to exclude.
#         set $_Z_OWNER to your username if you want use z while sudo with $HOME kept
#
# USE:
#     * z foo     # cd to most frecent dir matching foo
#     * z foo bar # cd to most frecent dir matching foo and bar
#     * z -r foo  # cd to highest ranked dir matching foo
#     * z -t foo  # cd to most recently accessed dir matching foo
#     * z -l foo  # list matches instead of cd
#     * z -e foo  # echo the best match, don't cd
#     * z -c foo  # restrict matches to subdirs of $PWD
#     * z -x      # remove the current directory from the datafile
#     * z -h      # show a brief help message

```

&nbsp;

**Where `z` stores its database**

By default, `z` will store its database in the user's home directory under the file named `.z`. However, we can change the default database directory by modifying a variable called `$_Z_DATA` (see the docs). Anytime we want to clear our database so `z` starts tracking from zero, we can simply run:

```bash

🚀 ~ > ~/.z

```

&nbsp;

**Epilogue**

`z` is a really powerful tool which can save us a lot of time. It's available in both bash and {{<a href="https://www.zsh.org/" target="_blank" rel="noopener noreferrer">}}Z shells (zsh){{</a>}}. You can also install it under {{<a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/powershell" target="_blank" rel="noopener noreferrer">}}Power Shell{{</a>}} in Windows.

{{<a href="https://github.com/badmotorfinger/z" target="_blank" rel="noopener noreferrer">}}github.com/badmotorfinger/z{{</a>}}

```ps

PS> Install-Module -Name z

```

Enjoy z life!!! Peace&Love 😊 👏 🎉