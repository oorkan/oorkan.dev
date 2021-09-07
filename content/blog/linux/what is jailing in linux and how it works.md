---
title: "What Is Jailing in Linux and How It Works"
date: 2021-01-23T00:22:30+04:00
draft: true
---

One of the most interesting topics I encountered in Linux is the `jailing` and `chroot jail`. In simple words, `jailing` limits a user or process to a specified sandbox. In other words, we can describe `jailing` as an isolation or encapsulation. Jailed users and programs aren't allowed to access any directory outside the jail. In other words, the jail directory makes users and programs think that they run in the root folder in their own filesystem. 

....
....

**Creating chroot jail**

```bash
  mkdir jailhouse
```

```bash
  sudo chroot jailhouse
  # /bin/bash command not found 
```

```bash
  ldd /bin/bash
```

ldd prints the shared objects (shared libraries) required by each program or shared object specified on the command line.

(linux-vdso.so.1 - phisycally doesn't exist)

```bash
  cp --parents /bin/bash jailhouse
  cp -r --parents /lib/x86_64-linux-gnu/{libtinfo.so.5,libtinfo.so.5.9,libdl.so.2,libdl-2.28.so,libc.so.6,libc-2.28.so} jailhouse
  cp --parents /lib64/ld-linux-x86-64.so.2 jailhouse
```

```bash
  cp --parents /usr/bin/clear jailhouse
  cp --parents /bin/touch jailhouse
```

```bash
  cp -r --parents /lib/terminfo jailhouse
```

```bash
  ldd /bin/ls
```

```bash
  cp -r --parents /lib/x86_64-linux-gnu/{libselinux.so.1,libpcre.so.3,libpcre.so.3.13.3,libpthread.so.0,libpthread-2.28.so} jailhouse
  cp --parents /bin/ls jailhouse
```


**The l2chroot**
```bash
  wget https://gist.githubusercontent.com/andypowe11/60f4d8b38a164a2547174a6d62393bba/raw/b97e600684105105588430b24ee9ced9298deb7d/l2chroot
  chmod +x l2chroot
  # Change the BASE dir inside
```

```bash
  ./l2chroot /bin/mv /bin/cp
  cp --parents /bin/mv /bin/cp jailhouse
```


**man**

```bash
  ./l2chroot /usr/bin/man
  cp --parents /usr/bin/man jailhouse
  cp --parents /etc/manpath.config jailhouse
```

```bash
  cp -r --parents /usr/share/man jailhouse
```

```bash
  cp --parents /usr/bin/nroff jailhouse 
```

```bash
  ./l2chroot /bin/sh
  cp --parents /bin/sh jailhouse
```

```bash
  ./l2chroot /bin/cat
  cp --parents /bin/cat jailhouse
```

```bash
  cp --parents /dev/null jailhouse
```

```bash
  ./l2chroot /usr/bin/pager
  cp --parents /usr/bin/pager jailhouse
```

```bash
  cp -r --parents /usr/lib/man-db jailhouse
```

```bash
  ./l2chroot /usr/bin/tbl
  cp --parents /usr/bin/tbl jailhouse
```

```bash
  ./l2chroot /usr/bin/groff
  cp --parents /usr/bin/groff jailhouse
  cp -r --parents /etc/groff jailhouse
  cp -r --parents /usr/share/groff jailhouse
```

```bash
  ./l2chroot /usr/bin/troff
  cp --parents /usr/bin/troff jailhouse
```

```bash
  ./l2chroot /usr/bin/grotty
  cp --parents /usr/bin/grotty jailhouse
```

```bash
  ./l2chroot /usr/bin/locale
  cp --parents /usr/bin/locale jailhouse
```

```bash
  cp -r --parents /etc/profile jailhouse?
```

```bash
  cp --parents /etc/default/locale jailhouse/
```

```bash
  cp --parents /etc/locale.* jailhouse
```

```bash
  cp -r --parents /usr/lib/locale/ jailhouse
```