---
title: "gitignore exceptions: The Tricky Parts"
date: 2021-01-09T18:00:00+04:00
publishdate: 2021-01-09T18:00:00+04:00
---
{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1610202608/blog/img/topics/git/gitignore_exceptions_the_tricky_parts/banner-640x_rfc2qq.jpg" alt="gitignore exceptions - banner" width="0" height="0" style="width:0px!important;width:0px!important;opacity:0!important;visibility:hidden!important;" loading="lazy">}}Sometimes, when pushing our changes to remote, we want to ignore everything in the directory except some files. In `.gitignore` we must use the exclamation mark **!** to do that.

&nbsp;

Let's say we have the following structure in our local:

{{< highlight text >}}
my-app/
  └── .gitignore
  └── dir1/
  └── file1
  └── file2
  └── file3
{{< / highlight >}}

And, we want to, for example, ignore everything in `my-app` except `file3`. We simply add to our `.gitignore`:

{{< highlight text >}}
  *
  !file3
{{< / highlight >}}

Easy, right? Pfff... 🤭

&nbsp;

Let's take another example. This time we have the following structure: 

{{< highlight text >}}
my-app/
  └── .gitignore
  └── dir1/
        └── file1
        └── file2
  └── file3
{{< / highlight >}}

And, we want to ignore everything in `dir1` except `file1`.

\- Ah, cmon..., that's too easy, here, catch it:

{{< highlight text >}}
  dir1
  !dir1/file1
{{< / highlight >}}

🥁 Padam! And... I don't want to disappoint you but this will not work. Don't believe me? Check it yourself:

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1610123517/blog/img/topics/git/gitignore_exceptions_the_tricky_parts/gitignore-exceptions-ex2_ama8wr.png" alt="gitignore exceptions - ex 2" loading="lazy">}}

As you can see, only `file3` from the root folder will be added to commit, above. 

Fortunately, the solution is pretty simple here:

{{< highlight text >}}
  dir1/*
  !dir1/file1
{{< / highlight >}}

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1610123254/blog/img/topics/git/gitignore_exceptions_the_tricky_parts/gitignore-exceptions-ex3_tzxhnj.png" alt="gitignore exceptions - ex 3" loading="lazy">}}

With an asterisk added, we say: `Ignore everything in the folder`. While, without an asterisk, we say: `Ignore the folder`.

When we are **not** dealing with `gitignore` exceptions, there's no difference between using `dir/*` or just `dir`. This happens, because, if everything is ignored in the directory, then git will find no meaning in adding it to commit. 

But things are changing when we have exceptions in gitignore. And the reason why it's not working when we simply use `dir` is that:

{{< highlight text >}}
It is not possible to re-include a file if a parent directory of that file is excluded. 
Git doesn’t list excluded directories for performance reasons, so any patterns on contained files
have no effect, no matter where they are defined.
{{< / highlight >}}

{{<a href="https://git-scm.com/docs/gitignore" target="_blank" rel="noopener noreferrer">}}git-scm.com/docs/gitignore{{</a>}}

&nbsp;

\- {{<a href="https://youtu.be/djV11Xbc914" target="_blank" rel="noopener noreferrer">}}A-ha...{{</a>}} I get it now. 😜

Are you sure? If you are, then let's take a look at the final example. This time we have the following structure:

{{< highlight text >}}
my-app/
  └── .gitignore
  └── dir1/
        └── file1
        └── dir2
              └── file2
              └── file3
  └── file4
{{< / highlight >}}

And now, we want to ignore everything in `dir1` but keep the `file3` inside `dir2`. So, in the end, we only want to have `file4` and `dir1/dir2/file3` in the commit.

\- Easy, here you go, boomer!

{{< highlight text >}}
  dir1/*
  !dir1/dir2/file3
{{< / highlight >}}

Wait, mmm... this will not work because `dir1/*` will ignore the `dir2`, and since it's ignored we can't re-include `file3`. Give me a minute... 🤔 Maybe...

{{< highlight text >}}
  dir1/dir2/*
  !dir1/dir2/file3
  ( ... 🤔 )
  dir1/* ... ( No, this will ignore the dir2 again... 😟 ) 
{{< / highlight >}}

Ok, I give up. What can we do? You, {{<a href="https://youtu.be/0qanF-91aJo" target="_blank" rel="noopener noreferrer">}}paranoid{{</a>}}! 🤬 

\_\_\_\_\_\_\_\_\_\_

Don't panic! It has a solution, even if it's ugly. We need to add `.gitignore`s inside `dir1` and `dir2`.

{{< highlight text >}}
my-app/
  └── .gitignore
  └── dir1/
        └── .gitignore
        └── file1
        └── dir2
              └── .gitignore
              └── file2
              └── file3
  └── file4
{{< / highlight >}}

In `.gitignore` inside `dir2` we need to have:

{{< highlight text >}}
  *
  !file3 
{{< / highlight >}}

And, in `.gitignore` inside `dir1`:

{{< highlight text >}}
  *
  !dir2 
{{< / highlight >}}

Don't forget to empty any directives you had for `dir1` and `dir2` in `.gitignore` in the root directory.

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1610137976/blog/img/topics/git/gitignore_exceptions_the_tricky_parts/gitignore-exceptions-ex4-il_iwkrjw.png" alt="gitignore exceptions - ex 4 - illustrate" loading="lazy">}}

And, `--dry-run` again, to check 🙂

{{<img src="https://res.cloudinary.com/oorkan/image/upload/v1610131180/blog/img/topics/git/gitignore_exceptions_the_tricky_parts/gitignore-exceptions-ex4_jxote7.png" alt="gitignore exceptions - ex 4" loading="lazy">}}

Although this solution works fine, I don't think using multiple `.gitignore`s in different tree levels is a good sign. I suggest doing as maximum as you can to avoid this kind of situation. Cheers! 🍾 
