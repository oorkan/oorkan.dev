---
title: "Setup GitHub CLI"
date: 2021-01-04T17:30:00+04:00
publishdate: 2021-01-04T17:30:00+04:00
---

**Installation**

The easiest way to install the GitHub CLI (henceforth `gh`) under Linux or Mac is to use {{<a href="https://gist.github.com/oorkan/6e4f44652c1458032d20d517d52ab608" target="_blank" rel="noopener noreferrer">}}Homebrew{{</a>}}:

{{< highlight bash >}}

🚀 ~ brew install gh

{{< / highlight >}}

Under Linux, `gh` is also available via `snapd` on the `edge` channel (dev builds).

{{< highlight bash >}}

🚀 ~ sudo snap install --edge gh

{{< / highlight >}}

And under Windows, we can just use the {{<a href="https://github.com/cli/cli/releases/download/v1.4.0/gh_1.4.0_windows_amd64.msi" target="_blank" rel="noopener noreferrer">}}MSI Installer{{</a>}}.

Other installation instructions and methods are available at {{<a href="https://cli.github.com/manual/installation" target="_blank" rel="noopener noreferrer">}}cli.github.com/manual/installation{{</a>}}.

&nbsp;

**Authentication**

Before using the `gh`, first, we need to authenticate in GitHub. To do that we run the following command in the terminal:

{{< highlight bash >}}

🚀 ~ gh auth login

{{< / highlight >}}

We see that `gh` wants us to choose between the Github.com account and the Github Enterprise Server account. The first one is a regular account we use to work in GitHub. Besides this, GitHub offers enterprise services, and the Github Enterprise Server account refers to that. {{<a href="https://github.com/enterprise" target="_blank" rel="noopener noreferrer">}}See the page{{</a>}}.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609535399/blog/img/topics/git/github_cli_setup/gh_auth_login-q1_dfqlep.png" alt="gh auth login - q1" loading="lazy">}}

For now, let's choose a regular Github.com account. The next step requires us to choose an authentication method, either via a web browser or via an authentication token.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609533486/blog/img/topics/git/github_cli_setup/gh_auth_login-q2_xoypye.png" alt="gh auth login - q2" loading="lazy">}}

&nbsp;

**1. Login with a web browser**

The first method will provide us one-time code which we should paste on the GitHub authentication page located at {{<a href="https://github.com/login/device" target="_blank" rel="noopener noreferrer">}}github.com/login/device{{</a>}}. This will authorize our device and it will be able to access our gists, teams, and repositories. 

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609546405/blog/img/topics/git/github_cli_setup/gh_auth_device-1_q8jyet.png" alt="gh auth device - 1" loading="lazy">}}

If everything runs smoothly, we'll see the `Authentication complete` message in the terminal.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609546561/blog/img/topics/git/github_cli_setup/gh_auth_device-2_ea6swc.png" alt="gh auth device - 2" loading="lazy">}}

**2. Login with an authentication token**

The second login method can be achieved by generating a personal authentication token in GitHub. To do that, we should go to {{<a href="https://github.com/settings/tokens" target="_blank" rel="noopener noreferrer">}}github.com/settings/tokens{{</a>}}.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609547977/blog/img/topics/git/github_cli_setup/gh_auth_token-1_bo1zak.png" alt="gh auth token - 1" loading="lazy">}}

Once we click on the "Generate new token" button, a new window will open where we should describe the token and choose the permission scopes. GitHub CLI requires us to have at minimum `repo` and `read:org` permission scopes.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609633287/blog/img/topics/git/github_cli_setup/gh_auth_token-3_awuzxb.png" alt="gh auth token - 3" loading="lazy">}}

We can now copy our newly generated token and paste it in the terminal.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609633886/blog/img/topics/git/github_cli_setup/gh_auth_token-4_xjoqli.png" alt="gh auth token - 4" loading="lazy">}}

&nbsp;

**The last step: choosing a git protocol**

Now, when we are authorized either via a web browser or an auth token, we can move to the last step, where we choose a Git protocol being used to interact with the GitHub host. We have two options there: HTTPS and SSH. I prefer to use SSH. If everything runs smoothly, we'll be able to verify that we are logged in by running:

{{< highlight bash >}}

🚀 ~ gh auth status

{{< / highlight >}}

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609635633/blog/img/topics/git/github_cli_setup/gh_auth_status_ftq5kc.png" alt="gh auth status" loading="lazy">}}

&nbsp;

Whola! The setup is finished now. Phew... 🥴