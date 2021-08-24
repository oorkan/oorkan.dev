---
title: "Format 'docker ps' Command Output Nicely"
date: 2020-05-27T08:51:38+04:00
publishdate: 2020-05-27T08:51:38+04:00
description: "Formatting the docker ps command output using Go. docker ps --format=vertical."
tags: ["docker"]
---

Run the following command in your terminal:

{{< highlight bash >}}

🚀 ~ export VERTICAL="\nID\t{{.ID}}\nImage\t{{.Image}}\nCommand\t{{.Command}}\nCreated\t{{.RunningFor}}\nStatus\t{{.Status}}\nPorts\t{{.Ports}}\nNames\t{{.Names}}\n"

{{< / highlight >}}

After this, you'll be able to format your `docker ps` command output vertically by doing:

{{< highlight bash >}}

🚀 ~ docker ps --format=$VERTICAL

{{< / highlight >}}

The shell script is available in my repo here:&nbsp;{{<a href="https://github.com/oorkan/docker_ps_vertical" target="_blank" rel="noopener noreferrer">}}github.com/oorkan/docker_ps_vertical{{</a>}}

Many thanks to **Arthur Ulfeldt** and this course from Linkedin:
{{<a href="https://www.linkedin.com/learning/learning-docker-2" target="_blank" rel="noopener noreferrer">}}Learning Docker by Arthur Ulfeldt{{</a>}}



