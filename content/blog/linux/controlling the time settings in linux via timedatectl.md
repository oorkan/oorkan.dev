---
title: "Controlling the Time Settings in Linux via timedatectl"
date: 2020-09-18T11:09:15+04:00
draft: true
---

If our Linux OS has been booted using `systemd`, we can use a program called `timedatectl` to control its time settings. `timedatectl` is a utility of the `systemd` service manager and won't be available in systems that aren't using it {{<a href="https://distrowatch.com/search.php?defaultinit=Not+systemd" target="_blank" rel="noopener noreferrer">}}🔗{{</a>}}. When typing `timedatectl status` in the terminal, it will show us the current time settings, like local time, time zone, network time synchronization, etc. Most of the systems, if not all, will pick this command as the default, and we can simply run `timedatectl` instead.

![timedatectl status](http://127.0.0.1/img/timedatectl_status.png) ![timedatectl](http://127.0.0.1/img/timedatectl.png)

To view this report in developer-friendly format, we can use the `show` command instead. However, in some older systems, this command may not be available.

```bash

🚀 ~ timedatectl show

```

One of the most useful properties of this command is an ability to quickly set up a system timezone. Before setting up a timezone, we must first check available time zones and find the one we need. To do that we should use the `list-timezones` command.

```bash

🚀 ~ timedatectl list-timezones

```

![timedatectl list-timezones](http://127.0.0.1/img/timedatectl_list-timezones.png)

To search through this list for timezone, we can use the `grep` command, like this: 

![timedatectl list-timezones grep](http://127.0.0.1/img/timedatectl_list-timezones_grep.png)

Now, to set up a timezone, we must use the `set-timezone` command.

```bash

🚀 ~ timedatectl set-timezone 'America/New_York'

```

To see whether our changes took effect, we can run `timedatectl status` once again.

![timedatectl recheck](http://127.0.0.1/img/timedatectl_recheck.png)

As we can see, the system timezone has changed, and we now have a different system time as well. The same way we can change only the system time, by using the `set-time` command and providing the date and time in `<YYYY-MM-DD HH:MM:SS>` format. I don't want to dive into this more, because setting up a system time manually doesn't seem to me the right way of doing things these days.

&nbsp;

**Network time synchronization or NTP**

`timedatectl` allows us to syncronize our local time with a network time by using a protocol called `NTP` which stands for `Network Time Protocol`. To turn on the network time synchronization, we should use the `set-ntp` command.

```bash

🚀 ~ timedatectl set-ntp 1

```

or

```bash

🚀 ~ timedatectl set-ntp true

```

And after running `timedatectl` again, we have our network time on.

![timedatectl set-ntp](http://127.0.0.1/img/timedatectl_set-ntp.png)

Now, after we activated our network time synchronization, we can syncronize the time. To do that, we must refer to a service under `systemd` called `systemd-timesyncd`. First, let's check its status by running:

```bash

🚀 ~ systemctl status systemd-timesyncd

```

![systemctl status systemd-timesyncd](http://127.0.0.1/img/systemctl_status_systemd-timesyncd.png)

If it's not active, then we can start it by running:

```bash

🚀 ~ sudo systemctl start systemd-timesyncd

```

And, finally, we restart our `systemd-timesyncd.service` to syncronize our local time with time on the NTP server.

```bash

🚀 ~ sudo systemctl restart systemd-timesyncd

```

Whola, if we run `timedatectl` again, we'll see that the time is syncronized now. 👏 🎉

![timedatectl NTP syncronized](http://127.0.0.1/img/timedatectl_NTP_syncronized.png)

&nbsp;

**Bonus 🍭🎈**

We've talked about time so much. It worths listening to one of the greatest musical pieces of all time about it: 🎶

{{<a href="https://youtu.be/pgXozIma-Oc" target="_blank" rel="noopener noreferrer">}}**Pink Floyd - Time - YouTube**{{</a>}}