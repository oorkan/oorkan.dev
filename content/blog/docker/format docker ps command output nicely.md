---
title: "Format 'docker ps' Command Output Nicely"
date: 2020-05-27T08:51:38+04:00
publishdate: 2020-05-27T08:51:38+04:00
---

Run the following command in your terminal:

```
export VERTICAL="\nID\t{{.ID}}\nImage\t{{.Image}}\nCommand\t{{.Command}}\nCreated\t{{.RunningFor}}\nStatus\t{{.Status}}\nPorts\t{{.Ports}}\nNames\t{{.Names}}\n"
```

After this, you'll be able to format your `docker ps` command output vertically by doing:

```
docker ps --format=$VERTICAL
```

The shell script is available in my repo here:&nbsp;{{<a href="https://github.com/oorkan/docker_ps_vertical" target="_blank">}}github.com/oorkan/docker_ps_vertical{{</a>}}

Many thanks to **Arthur Ulfeldt** and this course from Linkedin:
{{<a href="https://www.linkedin.com/learning/learning-docker-2" target="_blank">}}Learning Docker by Arthur Ulfeldt{{</a>}}



