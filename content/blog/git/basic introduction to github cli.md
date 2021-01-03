---
title: "Basic Introduction to GitHub CLI"
date: 2021-01-01T22:56:50+04:00
draft: true
---

**Authentication**

Before using the Github CLI, first, we need to authenticate with GitHub host. To do that we run the following command in the terminal:

{{< highlight bash >}}

🚀 ~ gh auth login

{{< / highlight >}}

We see that gh wants us to choose between the github.com account and Github Enterprise Server account. The first one is a regular account we use to work in GitHub. Besides this, GitHub also offers enterprise services, and Github Enterprise Server account refers to that. See the page.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609535399/blog/img/topics/git/github_cli_setup/gh_auth_login-q1_dfqlep.png" alt="gh auth login - q1" loading="lazy">}}

So, for now, we choose a regular github.com account. The next step requires from us to choose the authentication method, either via web browser or via authentication token.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609533486/blog/img/topics/git/github_cli_setup/gh_auth_login-q2_xoypye.png" alt="gh auth login - q2" loading="lazy">}}

&nbsp;

**1. Login with a web browser**

The first method will provide us one-time code which we should paste in the GitHub authentication page located at {{<a href="https://github.com/login/device" target="_blank" rel="noopener noreferrer">}}github.com/login/device{{</a>}}. This will authorize our device and it will be able to access our gists, teams and repositories. 

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609546405/blog/img/topics/git/github_cli_setup/gh_auth_device-1_q8jyet.png" alt="gh auth device - 1" loading="lazy">}}

If everything run smoothly, we'll see that our authentication is complete in the terminal and we need to press "Enter" to continue.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609546561/blog/img/topics/git/github_cli_setup/gh_auth_device-2_ea6swc.png" alt="gh auth device - 2" loading="lazy">}}

**2. Login with an authentication token**

The second method of login can be achieved by generating personal authentication token in GitHub. To do that, we should go to {{<a href="https://github.com/settings/tokens" target="_blank" rel="noopener noreferrer">}}github.com/settings/tokens{{</a>}}.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609547977/blog/img/topics/git/github_cli_setup/gh_auth_token-1_bo1zak.png" alt="gh auth token - 1" loading="lazy">}}

Once we click the "Generate new token" button, new window will open where we should describe the token and choose the permission scopes.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609632632/blog/img/topics/git/github_cli_setup/gh_auth_token-2_fss1q2.png" alt="gh auth token - 2" loading="lazy">}}

GitHub CLI requires from us to have at minimum `repo` and `read:org` permission scopes.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609633287/blog/img/topics/git/github_cli_setup/gh_auth_token-3_awuzxb.png" alt="gh auth token - 3" loading="lazy">}}

We can now copy our newly generated token and paste it in the terminal.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609633886/blog/img/topics/git/github_cli_setup/gh_auth_token-4_xjoqli.png" alt="gh auth token - 4" loading="lazy">}}

&nbsp;

**The last step: choosing the git protocol**

Now, when we are authorized either via web browser or auth token, we can move to the last step, where we choose the Git protocol being used to interact with the GitHub host. We have two options there: HTTPS and SSH. I prefer to use SSH. If everything run smoothly, we'll be able to verify that we are logged in by running the following command in the terminal:

{{< highlight bash >}}

🚀 ~ gh auth status

{{< / highlight >}}

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1609635633/blog/img/topics/git/github_cli_setup/gh_auth_status_ftq5kc.png" alt="gh auth status" loading="lazy">}}

&nbsp;

Whola! Phew...