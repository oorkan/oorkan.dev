---
title: "Controlling the Time Settings in Linux via timedatectl"
date: 2020-09-20T07:35:00+04:00
publishdate: 2020-09-20T07:35:00+04:00
---

If our Linux OS has been booted using `systemd`, we can use a program called `timedatectl` to control its time settings. `timedatectl` is a utility of the `systemd` service manager and won't be available in systems that aren't using it {{<a href="https://distrowatch.com/search.php?defaultinit=Not+systemd" target="_blank" rel="noopener noreferrer">}}🔗{{</a>}}. When typing `timedatectl status` in the terminal, it will show us the current time settings, like local time, time zone, network time synchronization, etc. Most of the systems, if not all, will pick this command as the default, and we can simply run `timedatectl` instead.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1600572014/blog/img/topics/linux/controlling_the_time_settings_in_linux_via_timedatectl/timedatectl_status_hpzlqg.png" alt="timedatectl status" loading="lazy">}} {{<img src="https://res.cloudinary.com/oorkan/image/upload/v1600572013/blog/img/topics/linux/controlling_the_time_settings_in_linux_via_timedatectl/timedatectl_mvsqq4.png" alt="timedatectl" loading="lazy">}}

To view this report in developer-friendly format, we can use the `show` command instead. However, in some older systems, this command may not be available.

{{< highlight bash >}}

🚀 ~ timedatectl show

{{< / highlight >}}

One of the most useful properties of this command is an ability to quickly set up a system timezone. Before setting up a timezone, we must first check available time zones and find the one we need. To do that we should use the `list-timezones` command.

{{< highlight bash >}}

🚀 ~ timedatectl list-timezones

{{< / highlight >}}

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1600572013/blog/img/topics/linux/controlling_the_time_settings_in_linux_via_timedatectl/timedatectl_list-timezones_e5pzxk.png" alt="timedatectl list-timezones" loading="lazy">}}

To search through this list for timezone, we can use the `grep` command, like this: 

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1600623305/blog/img/topics/linux/controlling_the_time_settings_in_linux_via_timedatectl/timedatectl_list-timezones_grep_t6v2yt.png" alt="timedatectl list-timezones grep" loading="lazy">}}

Now, to set up a timezone, we must use the `set-timezone` command.

{{< highlight bash >}}

🚀 ~ timedatectl set-timezone 'Europe/Paris'

{{< / highlight >}}

To see whether our changes took effect, we can run `timedatectl status` once again.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1600623305/blog/img/topics/linux/controlling_the_time_settings_in_linux_via_timedatectl/timedatectl_recheck_wowdzs.png" alt="timedatectl recheck" loading="lazy">}}

As we can see, the system timezone has changed, and we now have a different system time as well. The same way we can change only the system time, by using the `set-time` command and providing the date and time in `<YYYY-MM-DD HH:MM:SS>` format. I don't want to dive into this more, because setting up a system time manually doesn't seem to me the right way of doing things these days.

&nbsp;

**Network time synchronization or NTP**

`timedatectl` allows us to syncronize our local time with a network time by using a protocol called `NTP` which stands for `Network Time Protocol`. To turn on the network time synchronization, we should use the `set-ntp` command.

{{< highlight bash >}}

🚀 ~ timedatectl set-ntp 1

{{< / highlight >}}

or

{{< highlight bash >}}

🚀 ~ timedatectl set-ntp true

{{< / highlight >}}

And after running `timedatectl` again, we have our network time on.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1600572014/blog/img/topics/linux/controlling_the_time_settings_in_linux_via_timedatectl/timedatectl_set-ntp_v1rshf.png" alt="timedatectl set-ntp" loading="lazy">}}

Now, after we activated our network time synchronization, we can syncronize the time. To do that, we must refer to a service under `systemd` called `systemd-timesyncd`. First, let's check its status by running:

{{< highlight bash >}}

🚀 ~ systemctl status systemd-timesyncd

{{< / highlight >}}

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1600572013/blog/img/topics/linux/controlling_the_time_settings_in_linux_via_timedatectl/systemctl_status_systemd-timesyncd_robj1k.png" alt="systemctl status systemd-timesyncd" loading="lazy">}}

If it's not active, then we can start it by running:

{{< highlight bash >}}

🚀 ~ sudo systemctl start systemd-timesyncd

{{< / highlight >}}

And, finally, we restart our `systemd-timesyncd.service` to syncronize our local time with time on the NTP server.

{{< highlight bash >}}

🚀 ~ sudo systemctl restart systemd-timesyncd

{{< / highlight >}}

Whola, if we run `timedatectl` again, we'll see that the time is syncronized now. 👏 🎉

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1600572013/blog/img/topics/linux/controlling_the_time_settings_in_linux_via_timedatectl/timedatectl_NTP_syncronized_igwcnc.png" alt="timedatectl NTP syncronized" loading="lazy">}}

&nbsp;

**Bonus 🍭🎈**

We've talked about time so much. It worths listening to one of the greatest musical pieces of all time about it: 🎶

{{<a href="https://youtu.be/pgXozIma-Oc" target="_blank" rel="noopener noreferrer">}}**Pink Floyd - Time - YouTube**{{</a>}}