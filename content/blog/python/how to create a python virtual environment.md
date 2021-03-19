---
title: "How to Create a Python Virtual Environment"
date: 2021-03-19T06:19:30+04:00
draft: true
---

When working with Python, often we need to use different packages and modules. Some of them are part of the Python's Standard Library but many of them are not. On the other hand, we may need a specific version of a custom module for our app. Upgrading or downgrading to that version for a whole system is a risky idea because it can break other applications that are dependant on a specific version of a module.

Virtual Environments are here to help us. Starting from Python version 3.3, a module called `venv` was added to the language spec, allowing users to setup a python virtual environment natively and supported by the python development team.
See PEP 405.

Before the version 3.3 this was only possible via installing 3rd-party packages, primarily Ian Bicking's virtualenv.

First of all, you need to make sure that you have python3-venv package installed on your system. Under Debian and Debian-based OS, you have to run:

{{< highlight bash >}}
🚀 ~ sudo apt install python3-venv
{{< / highlight >}}

The creation of a typical virtual environment for Python looks like this:

{{< highlight bash >}}
🚀 ~ python3 -m venv /path/to/new/virtual/environment
{{< / highlight >}}

Often, a python virtual environment is installed in the current working directory and named `venv` or `.venv`. Some IDEs, like PyCharm, support automatic setup of such virtual environments. Let's create our virtual environment and name it `venv`.

{{< highlight bash >}}
🚀 ~ python3 -m venv venv
{{< / highlight >}}

&nbsp;

After the virtual environment has been created, you need to activate it. To do that you have to run the following command:

{{< highlight bash >}}
🚀 ~ source venv/bin/activate
{{< / highlight >}}

or

{{< highlight bash >}}
🚀 ~ . venv/bin/activate
{{< / highlight >}}

&nbsp;

Notice the change in your terminal, it now contains a mark `(venv)` at the beginning. 

{{< highlight bash >}}
(venv) 🚀 ~ 
{{< / highlight >}}

This means that you are running inside a virtual environment. If you do `python3 -c "import site; print(site.PREFIXES)"` here, you'll see that python3 site packages directory prefix points to your virtual environment and not system's default one. You can now start installing packages or specific versions of packages via `pip3` to your virtual environment. They will be isolated from the rest of the system.

To exit from a virtual environment, you need to run the following command inside that virtual environment:

{{< highlight bash >}}
(venv) 🚀 ~ deactivate
{{< / highlight >}}

&nbsp;

In some sense, a python virtual environment is similar to a Linux jail, except that in Linux jail you have completely self-contained, independant binaries while in python virtual environment your python3 binary is just a symlink to a system's default, typically located under /usr/bin/python3. Also, in Linux jail you run from within a jail and don't have access to the outside system while in python virtual environment all system commands and directories are still available and the real magic happens during the activation step when the program modifies the user's $PATH variable, and overrides the default paths/locations to python and pip binaries.
