---
title: "How to Create a Python Virtual Environment"
date: 2021-03-19T06:19:30+04:00
publishdate: 2021-03-19T13:10:00+04:00
description: "Creating a virtual environment for python: setup, activation, deactivation, nuances."
image: "https://res.cloudinary.com/oorkan/image/upload/v1631564231/blog/img/topics/python/how_to_create_a_python_virtual_environment/python-venv_mccbnc.png"
tags: ["python"]
---

When working with Python, often we need to use different packages and modules. Some of them are part of {{<a href="https://docs.python.org/3/library/index.html" target="_blank" rel="noopener noreferrer">}}Python's Standard Library{{</a>}} but many of them are not. On the other hand, we may need a specific version of a custom module for our app. Upgrading or downgrading to that version for a whole system is a risky idea because it can break other applications that are dependant on a specific version of a module.

Virtual Environments are here to help us. Starting from Python version 3.3, a module called `venv` was added to the language spec, allowing users to set up a Python virtual environment more natively and supported by the Python development team. 
{{<a href="https://www.python.org/dev/peps/pep-0405/" target="_blank" rel="noopener noreferrer">}}See PEP 405{{</a>}}.

Before version 3.3 this was only possible via installing 3rd-party packages, primarily Ian Bicking's {{<a href="https://virtualenv.pypa.io/en/latest/" target="_blank" rel="noopener noreferrer">}}virtualenv{{</a>}}. Although, these 3rd-party packages are still popular and in use, Python officially recommends the use of `venv` for creating virtual environments since version 3.5.

First of all, if you are a Debian or Debian-based OS user {{<a href="https://distrowatch.com/search.php?basedon=Debian" target="_blank" rel="noopener noreferrer">}}🔗{{</a>}}, you need to make sure that you have the python3-venv package installed on your system:

{{< highlight bash >}}
🚀 ~ sudo apt install python3-venv
{{< / highlight >}}

The creation of a typical virtual environment for Python looks like this:

{{< highlight bash >}}
🚀 ~ python3 -m venv /path/to/new/virtual/environment
{{< / highlight >}}

Often, a Python virtual environment is installed in the current working directory and named `venv` or `.venv`. Some IDEs, like {{<a href="https://www.jetbrains.com/pycharm/" target="_blank" rel="noopener noreferrer">}}PyCharm{{</a>}}, support an automatic setup of such virtual environments. Let's create our virtual environment and name it `venv`.

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

This means that you are running inside a virtual environment. If you do `python3 -c "import site; print(site.PREFIXES)"` here, you'll see that python3 site-packages directory prefix points to your virtual environment and not the system's default one. You can now start installing packages or specific versions of packages via `pip3` to your virtual environment. They will be isolated from the rest of the system.

To exit from a virtual environment, you need to run the following command inside that virtual environment:

{{< highlight bash >}}
(venv) 🚀 ~ deactivate
{{< / highlight >}}

&nbsp;

In some sense, a Python virtual environment created with `venv` is similar to a Linux jail, except that in Linux jail you have completely self-contained, independent binaries while in Python virtual environment your python binary is just a symlink to the system's default, typically located under /usr/bin/ directory. Also, in Linux jail, you run from within the jail and don't have access to the outside system while in Python virtual environment all system commands and directories are still available and the real magic happens during the activation step when the program modifies the user's $PATH variable and "overrides" the default paths/locations to python and pip binaries.


&nbsp;

**{{<small>}}References{{</small>}}**

{{<small>}}{{<a href="https://docs.python.org/3/library/index.html" target="_blank" rel="noopener noreferrer">}}The Python Standard Library (@3.9, lup: March 18, 2021){{</a>}}{{</small>}}&nbsp;

{{<small>}}{{<a href="https://docs.python.org/3/library/venv.html" target="_blank" rel="noopener noreferrer">}}venv — Creation of virtual environments (@3.9, lup: March 18, 2021){{</a>}}{{</small>}}&nbsp;

{{<small>}}{{<a href="https://www.python.org/dev/peps/pep-0405/" target="_blank" rel="noopener noreferrer">}}PEP 405 -- Python Virtual Environments by Carl Meyer (June 13, 2011){{</a>}}{{</small>}}&nbsp;

{{<small>}}{{<a href="https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/#creating-a-virtual-environment" target="_blank" rel="noopener noreferrer">}}Installing packages using pip and virtual environments | Creating a virtual environment (@3.9, lup: March 18, 2021){{</a>}}{{</small>}}&nbsp;

{{<small>}}{{<a href="https://docs.python.org/3/library/site.html" target="_blank" rel="noopener noreferrer">}}site — Site-specific configuration hook (@3.9, lup: March 18, 2021){{</a>}}{{</small>}}&nbsp;

{{<small>}}{{<a href="https://python-reference.readthedocs.io/en/latest/docs/operators/semicolon.html" target="_blank" rel="noopener noreferrer">}}; Statement Separator by Jakub Przywóski (2015){{</a>}}{{</small>}}