---
title: "How to Reboot or Shutdown From Terminal in Linux"
date: 2020-04-30T04:27:00+04:00
publishdate: 2020-04-30T04:27:00+04:00
---

In all examples, we need to be `root` or use the command with `sudo`.

&nbsp;

**Reboot**

{{< highlight bash >}}🚀 ~ reboot{{< / highlight >}}

or

{{< highlight bash >}}🚀 ~ poweroff --reboot{{< / highlight >}} 

**Note:** In some systems, the `reboot` flag may not be available to use with `poweroff` command. 

The `reboot` command can also be used with `-f` flag which stands for `force` option.

{{< highlight bash >}}🚀 ~ reboot -f{{< / highlight >}}

**Important!** When using the `-f` flag in `reboot` command, the machine will reboot immediately without properly closing the system. **Be careful with it**.

&nbsp;

**Delayed Reboot**

{{< highlight bash >}}🚀 ~ shutdown -r <time_in_minutes>{{< / highlight >}}

For example, `shutdown -r 1` will reboot our system after 1 minute. The `-r` flag stands for `reboot` option.

This command can also be used with `-f` flag which stands for `skip fsck` option.

{{< highlight bash >}}🚀 ~ shutdown -r -f <time_in_minutes>{{< / highlight >}}

or

{{< highlight bash >}}🚀 ~ shutdown -rf <time_in_minutes>{{< / highlight >}}

**Important!** When using the `-f` flag in `shutdown -r` command, the system will reboot without doing any filesystem check. **Be careful with it**. It's safer to use the `-F` flag ( uppercase ) which stands for `force fsck` option, and forces the system to do filesystem check before closing it. Like this:

{{< highlight bash >}}🚀 ~ shutdown -r -F <time_in_minutes>{{< / highlight >}}

or

{{< highlight bash >}}🚀 ~ shutdown -rF <time_in_minutes>{{< / highlight >}}

If we want to reboot with 0 delay, then we can do:

{{< highlight bash >}}🚀 ~ shutdown -rF 0{{< / highlight >}}

or

{{< highlight bash >}}🚀 ~ shutdown -rF now{{< / highlight >}}

&nbsp;

**Shutdown**

{{< highlight bash >}}🚀 ~ poweroff{{< / highlight >}}

This command can also be used with `-f` flag which stands for `force` option.

{{< highlight bash >}}🚀 ~ poweroff -f{{< / highlight >}}

**Important!** When using the `-f` flag in `poweroff` command, the machine will shutdown immediately without properly closing the system. **Be careful with it**.

{{< highlight bash >}}🚀 ~ shutdown # We already know this command and some of its arguments, right? 🙂{{< / highlight >}}

If no argument specified, then the system will shut down after 1 minute. We can do `shutdown now` or `shutdown 0` if we don't want any delays.

&nbsp;

**Delayed Shutdown**

To achieve this, we can again use the `shutdown` command as we did for reboot, this time without `-r` argument:

{{< highlight bash >}}🚀 ~ shutdown <time_in_minutes>{{< / highlight >}}

or

{{< highlight bash >}}🚀 ~ shutdown -P <time_in_minutes>{{< / highlight >}}

In the last example the `-P` flag stands for `poweroff` option which is the default when using the `shutdown` command.

**Important!** Now, in some systems ( like {{<a href="https://mxlinux.org/" target="_blank" rel="noopener noreferrer">}}mxlinux{{</a>}}, for example ) we'll also need to specify `-h` flag for it to work, like this: 

{{< highlight bash >}}🚀 ~ shutdown -hP <time_in_minutes>{{< / highlight >}}

The `-h` flag is equivalent to `--poweroff` option.

&nbsp;
***

**How to cancel the delayed shutdown**

When using the `shutdown` command to delay either shutdown or reboot, we can cancel the operation by typing

{{< highlight bash >}}🚀 ~ shutdown -c{{< / highlight >}}

The `-c` flag here stands for `cancel` option. In some systems, instead of scheduling a delayed shutdown in the backyard, the system freezes the terminal interaction. In that situation, we can simply hit `Ctrl+C` and the process will be cancelled.

&nbsp;

**Bonus 🍭🎈**

I used the phrase `Be careful with it` too many times in this article. If you feel stressed, then "relax" by listening some good music: 🎶

{{<a href="https://youtu.be/48PJGVf4xqk" target="_blank" rel="noopener noreferrer">}}**Pink Floyd - One Of These Days - YouTube**{{</a>}}













