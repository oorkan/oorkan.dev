---
title: "How to Rename a Linux User"
date: 2021-02-04T21:20:00+04:00
publishdate: 2021-02-04T21:20:00+04:00
description: "Renaming a Linux user: the correct way."
tags: ["linux"]
---

What if after installing a Linux OS you found that you made a typo in the username. Reinstalling the whole OS just to fix a typo doesn't sound rational.

One solution can be removing the wrong user and creating a new one, with a correct name. But in that case, all programs that had configs in the user's home directory will be messed up, which is very bad. 

The correct way of renaming a Linux user and his home directory is to use the `usermod` command:

{{< highlight bash >}}
🚀 ~ usermod -l <new_username> <old_username>
{{< / highlight >}}

Then, we need to set a home directory for our new user:

{{< highlight bash >}}
🚀 ~ usermod -md /home/<new_username> <new_username>
{{< / highlight >}}

Here, the `-d` flag sets the home directory for our new user, and the `-m` flag moves all contents from the old user's home directory.

We also need to change the user's default group, which is the same as the username in most cases:

{{< highlight bash >}}
🚀 ~ groupmod -n <new_username> <old_username>
{{< / highlight >}}

And, finally, if your hostname is like `<username-desktop>` or similar, you might want to change it, too. You need to edit both `/etc/hostname` and `/etc/hosts` files to do that.

{{< highlight bash >}}
🚀 ~ echo <new_username>-desktop | tee /etc/hostname # or 'sudo tee'
{{< / highlight >}}

{{< highlight bash >}}
# backup first
🚀 ~ cp /etc/hosts /etc/hosts.bak
# then
🚀 ~ sed -i 's/<old_username>/<new_username>/gI' /etc/hosts
{{< / highlight >}}

&nbsp;

**Important!** All commands above need to run under `root` or with `sudo`.

**Important!** The changes in `/etc/hostname` and `/etc/hosts` will take effect only after rebooting the system.

**Important!** If you want to rename the currently logged-in user, then it won't work because that user is used by certain processes. The workaround here is to switch to Virtual Console (Ctrl+Alt+F1-F6), log in as `root`, kill all that processes with `kill <pid>`, do the necessary operations of renaming the user, and re-login again by switching to GUI login screen (Ctrl+Alt+F7).

&nbsp;

**{{<small>}}References{{</small>}}**

{{<small>}}{{<a href="https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-rename-linux-users-and-their-home-directory/" target="_blank" rel="noopener noreferrer">}}"How to rename Linux users and their home directory" by Shane Rainville (August 28, 2020){{</a>}}{{</small>}}&nbsp;

{{<small>}}{{<a href="https://www.cyberciti.biz/faq/ubuntu-change-hostname-command/" target="_blank" rel="noopener noreferrer">}}"Ubuntu Linux Change Hostname (computer name)" by Vivek Gite (August 19, 2020){{</a>}}{{</small>}}&nbsp;

{{<small>}}{{<a href="https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/" target="_blank" rel="noopener noreferrer">}}"How to use sed to find and replace text in files in Linux / Unix shell" by Vivek Gite (January 13, 2018){{</a>}}{{</small>}}&nbsp;

{{<small>}}{{<a href="https://linux.die.net/man/1/kill" target="_blank" rel="noopener noreferrer">}}"kill(1) — Linux man page"{{</a>}}{{</small>}}
