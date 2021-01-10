---
title: "JS Core"
date: 2021-01-10T13:21:32+04:00
draft: true
---

FAT principal states:

{{< highlight text >}}
  F**k Any Tool or other s**t which decreases the level of understanding the underlying processes.
{{< / highlight >}}

This means that whenever you have a chance to learn fundamental part of this and that technology, then do so. Understanding the core concepts is way more important than just chasing a tool.

Unlike any other high-level languages, where we have class-based inheritance, JavaScript depends on prototypal inheritance. 

There's common missconception that everything in JavaScript is an object. In reality, everything in JavaScript can act like an object. What does this mean?

Let's take a look at the following example:

{{< highlight js >}}
  const greeting = 'Hello World';
  console.log(a.toUpperCase());
{{< / highlight >}}

Don't you amazed, that `greeting` has just a simple string data type but you can actually call on it a function like you do for objects, for example: 

{{< highlight js >}}
  const alien_obj = {
    planet: 'Saturn',
    greeting: () => {
      return 'Aiooomaa...';
    }
  };
  console.log(alien_obj.greeting());
{{< / highlight >}}

So, why this really happens?

JavaScript, in it's core, consists of 9 basic objects:

- Object() object
- String() object
- Number() object
- Boolean() object
- Function() object
- Array() object
- Math object
- ...
- ...

ES6 added a `class` syntactic sugar but, in reality, there's no such thing as `class` in JavaScript. There are objects and we need functions to construct them. Let's see an example:

{{< highlight js >}}
  const SimpleShape = function(width, height) {
    this.width = width;
    this.height = height;
    this.area = () => {
      return this.width * this.height;
    }
  }

  const rectengle = new SimpleShape(10,20);
  console.log(`width=${rectengle.width}`);
  console.log(`height=${rectengle.height}`);
  console.log(`area=${rectengle.area()}`);
{{< / highlight >}}

In the example above, we define a Constructor named SimpleShape, and rectengle is a new instance of that constructor. Like this one, JavaScript has built-in constructors which we can use to instantiate from.

{{< highlight js >}}
  const greeting = new String('Hello, World');
  console.log(greeting);
{{< / highlight >}}

{{< highlight js >}}
  const odd = new Number(3);
  console.log(odd.toString());
{{< / highlight >}}

{{< highlight js >}}
  const arr = new Array('John', 'Doe', '40');
  console.log(arr);
{{< / highlight >}}

To be continued...