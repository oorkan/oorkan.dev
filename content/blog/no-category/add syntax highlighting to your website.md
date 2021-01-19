---
title: "Add Syntax Highlighting to Your Website"
date: 2021-01-19T08:42:38+04:00
draft: true
---

If you have a programming blog, like me, or your website contains code examples and explanatory content, you will want to support syntax highlighting in your pages. There are many solutions and workarounds available, but the most flexible, to me, is using Chroma.

&nbsp;

**What's Chroma?** 

Chroma is an open-source library written in Go allowing you to have syntax highlighting for many different languages. Chroma is based on Pygments which is a generic syntax highlighter, written in Python.

{{<a href="https://github.com/alecthomas/chroma" target="_blank" rel="noopener noreferrer">}}github.com/alecthomas/chroma{{</a>}}

&nbsp;

**Chroma CLI**

While you can write Go scripts to use Chroma in your website, the easiest way is to use Chroma CLI. To install it, first, we need to install Go.

{{<a href="https://golang.org/dl/" target="_blank" rel="noopener noreferrer">}}golang.org/dl/{{</a>}}

If you are a Linux user, then you can use apt (Debian-based operating systems) or brew to install it:

{{< highlight bash >}}
🚀 ~ sudo apt install golang
{{< / highlight >}}

{{< highlight bash >}}
🚀 ~ brew install go
{{< / highlight >}}

Then, verify the installation by running `go version` in your terminal.

**Important!** Chroma depends on a Go package called `bits` which was introduced in {{<a href="https://golang.org/doc/go1.9#math-bits" target="_blank" rel="noopener noreferrer">}}go1.9{{</a>}}, so be sure you have go >= 1.9 .

&nbsp;

Now, when we have Go installed in our system, we can install Chroma CLI by running:

{{< highlight bash >}}
🚀 ~ go get -u github.com/alecthomas/chroma/cmd/chroma
{{< / highlight >}}

This will install the Chroma and make it available in the `bin` directory in our current folder. To make it available globally, we can copy it to the `/usr/bin` directory.

{{< highlight bash >}}
🚀 ~ sudo cp bin/chroma /usr/bin
{{< / highlight >}}

To verify our installation, we can run `chroma --version` in terminal.

&nbsp;

**Chroma CLI Usage**

Chroma is based on concepts of lexers, formatters and styles. Lexers, generally speaking, are resonsible for making lexical analisys of the input file and understand what language we are dealing with. Formatters do the necesarry operations to prepare the output file for styling. And styles set the color scheme of the output file.

In other words, lexers define the input file type, formatters define the output file format and styles style the output file. 

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

Where, the `--html-inline-styles` flag tells Chroma to generate inline styles for our html, and the `--html-only` flag tells Chroma to omit the standard html tags, like `<html>` and `<body>`.

Chroma is smart and can autodetect the lexer, so, in most cases, we don't need to specify it explicitily.

{{< highlight bash >}}
🚀 ~ chroma --html --style monokai --html-inline-styles --html-only greeting.js > output.html 
{{< / highlight >}}

Now, we only need to take the contents of the generated html file and place in our page.

{{< highlight html >}}
<pre style="color:#f8f8f2;background-color:#272822"><span style="color:#75715e">// greeting.js
</span><span style="color:#75715e"></span><span style="color:#66d9ef">let</span> <span style="color:#a6e22e">fullname</span> <span style="color:#f92672">=</span> <span style="color:#e6db74">&#39;John Doe&#39;</span>;
<span style="color:#66d9ef">const</span> <span style="color:#a6e22e">greeting</span> <span style="color:#f92672">=</span> <span style="color:#e6db74">`Hello, </span><span style="color:#e6db74">${</span><span style="color:#a6e22e">fullname</span><span style="color:#e6db74">}</span><span style="color:#e6db74">`</span>;
<span style="color:#a6e22e">console</span>.<span style="color:#a6e22e">log</span>(<span style="color:#a6e22e">greeting</span>);
</pre>
{{< / highlight >}}

&nbsp;

**The flexibility**

While being incredibly useful, Chroma is also very flexible. We can generate the CSS style separately and integrate it to our website styles.   

{{< highlight bash >}}
🚀 ~ chroma --html --style monokai --html-styles greeting.js > style.css
🚀 ~ chroma --html --style monokai --html-only greeting.js > output.html 
{{< / highlight >}}

This will insert the appropriate classnames to our generated html file and the same classnames will be available separately in the css file.

&nbsp;

To avoid any conflicts between the classnames generated by chroma and other classnames available in your website, you can use prefixes, like this: 

{{< highlight bash >}}
🚀 ~ chroma --html --style monokai --html-prefix c5h1_ greeting.js > output.html 
{{< / highlight >}}

**Important!** In the current version of Chroma (0.8.2), there's a bug which doesn't use both `--html-styles` and `--html-prefix` flags together correctly, so you'll need to copy everything manually from the generated html file's `<style>` tag in this case if you want to have a separate CSS file.