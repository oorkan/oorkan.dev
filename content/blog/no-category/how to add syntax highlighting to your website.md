---
title: "How to Add Syntax Highlighting to Your Website"
date: 2021-01-19T18:00:00+04:00
publishdate: 2021-01-19T18:00:00+04:00
description: "Support syntax highlighting in your website using Chroma"
image: "/img/how-to-add-syntax-highlighting-to-your-website.png"
tags: ["html", "css"]
---

If you have a programming blog, like me, or your website contains code examples and explanatory content, you may want to support syntax highlighting on your pages. There are many solutions and workarounds available, but the most flexible, to me, is using Chroma.

&nbsp;

**What's Chroma** 

Chroma is an open-source library written in Go allowing to have syntax highlighting for many different languages. Chroma is based on Pygments which is a generic syntax highlighter, written in Python.

{{<a href="https://github.com/alecthomas/chroma" target="_blank" rel="noopener noreferrer">}}github.com/alecthomas/chroma{{</a>}}&nbsp;🔗 &nbsp;&nbsp; {{<a href="https://pygments.org/" target="_blank" rel="noopener noreferrer">}}pygments.org{{</a>}}&nbsp;🔗

&nbsp;

**Chroma CLI**

While you can write Go scripts to use Chroma in your website, an easier way is to use Chroma CLI. To install it, first, you need to install Go.

{{<a href="https://golang.org/dl/" target="_blank" rel="noopener noreferrer">}}golang.org/dl/{{</a>}}&nbsp;🔗

If you are a Linux user, you can use `apt` (&nbsp;{{<a href="https://distrowatch.com/search.php?basedon=Debian" target="_blank" rel="noopener noreferrer">}}Debian-based operating systems{{</a>}}&nbsp;) or `brew` to install it:

{{< highlight bash >}}
🚀 ~ sudo apt install golang
{{< / highlight >}}

{{< highlight bash >}}
🚀 ~ brew install go
{{< / highlight >}}

Then, verify the installation by running `go version` in the terminal.

**Important!** Chroma depends on a Go package called `bits` which was introduced in {{<a href="https://golang.org/doc/go1.9#math-bits" target="_blank" rel="noopener noreferrer">}}go1.9{{</a>}}, so be sure you have `go >= 1.9` .

&nbsp;

To install the Chroma CLI, run:

{{< highlight bash >}}
🚀 ~ go get -u -v github.com/alecthomas/chroma/cmd/chroma
{{< / highlight >}}

Then, to make it available globally:

{{< highlight bash >}}
🚀 ~ sudo cp ./bin/chroma /usr/bin
{{< / highlight >}}

or

{{< highlight bash >}}
🚀 ~ sudo cp ~/go/bin/chroma /usr/bin # When $GOPATH is not specified
{{< / highlight >}}

Run `chroma --version` to verify your installation.

&nbsp;

**How to use**

Chroma is based on concepts of lexers, formatters, and styles. Lexers, generally speaking, are responsible for making lexical analysis of the input and understanding what language it uses. Formatters do the necessary operations to structure the output in a given format. And styles set the appearance of the output.

More simply, lexers determine the input type, formatters define the output type, and styles style the output.

To see the list of available lexers, formatters and styles, we run:

{{< highlight bash >}}
🚀 ~ chroma --list
{{< / highlight >}}

&nbsp;

Let's say we want to highlight the syntax of the JavaScript code below using the `monokai` color scheme.

{{< highlight text >}}
  // greeting.js
  let fullname = 'John Doe';
  const greeting = `Hello, ${fullname}`;
  console.log(greeting);
{{< / highlight >}}

{{< highlight bash >}}
🚀 ~ chroma --lexer js --formatter html --style monokai --html-inline-styles --html-only greeting.js > output.html 
{{< / highlight >}}

Here, the flag `--html-inline-styles` tells Chroma to use inline styles instead of classnames, and the flag `--html-only` omits the default html tags: `<html>` and `<body>`.

Chroma is smart and can autodetect the lexer. In most cases, you don't need to specify it explicitly.

{{< highlight bash >}}
🚀 ~ chroma --html --style monokai --html-inline-styles --html-only greeting.js > output.html 
{{< / highlight >}}

Now, you just have to copy the contents of `output.html` to your code. 🙂

{{< highlight html >}}
<pre style="color:#f8f8f2;background-color:#272822"><span style="color:#75715e">// greeting.js
</span><span style="color:#75715e"></span><span style="color:#66d9ef">let</span> <span style="color:#a6e22e">fullname</span> <span style="color:#f92672">=</span> <span style="color:#e6db74">&#39;John Doe&#39;</span>;
<span style="color:#66d9ef">const</span> <span style="color:#a6e22e">greeting</span> <span style="color:#f92672">=</span> <span style="color:#e6db74">`Hello, </span><span style="color:#e6db74">${</span><span style="color:#a6e22e">fullname</span><span style="color:#e6db74">}</span><span style="color:#e6db74">`</span>;
<span style="color:#a6e22e">console</span>.<span style="color:#a6e22e">log</span>(<span style="color:#a6e22e">greeting</span>);
</pre>
{{< / highlight >}}

&nbsp;

**The flexibility**

While being incredibly useful, Chroma is also very flexible. You can generate a standalone CSS file and combine it with your website styles.

{{< highlight bash >}}
🚀 ~ chroma --html --style monokai --html-styles greeting.js > output.css
🚀 ~ chroma --html --style monokai --html-only greeting.js > output.html 
{{< / highlight >}}

The above-generated `output.html` and `output.css` will use corresponding classnames.

&nbsp;

To avoid any conflicts between the classnames generated by Chroma and classnames used in your website, you can use prefixes, for example: 

{{< highlight bash >}}
🚀 ~ chroma --html --style monokai --html-prefix c5h1_ greeting.js > output.html 
{{< / highlight >}}

**Important!** In the current version of Chroma (0.8.2), there's a bug when using both `--html-styles` and `--html-prefix` flags together. If you want to have a standalone CSS with prefixed classnames, you need to manually copy the styles from `output.html`.

&nbsp;

By the way, Chroma has an online playground where you can visually test different color schemes.

{{<a href="https://swapoff.org/chroma/playground/" target="_blank" rel="noopener noreferrer">}}swapoff.org/chroma/playground/{{</a>}}

&nbsp;

Have fun. Cheers! 🍻