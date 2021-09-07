---
title: "A Simple Python HTTP Server"
date: 2021-03-21T10:30:00+04:00
publishdate: 2021-03-21T10:30:00+04:00
description: "Creating a Simple HTTP Server with Python using the socketserver and http.server modules from the Standard Library."
image: "https://res.cloudinary.com/oorkan/image/upload/v1631028431/blog/img/topics/python/a_simple_python_http_server/a-simple-python-http-server_ybjium.jpg"
tags: ["python"]
---

Although, we aren't gonna need it in this article but it's always good to setup a virtual environment when working with Python. Check out my article on how to create a virtual environment for Python:
{{<a href="https://www.oorkan.dev/blog/python/how-to-create-a-python-virtual-environment/" target="_blank" rel="noopener noreferrer">}}/blog/python/how-to-create-a-python-virtual-environment/{{</a>}}.

To create a simple Python HTTP Server, we are going to use two modules called `http.server` and `socketserver`. They both are part of {{<a href="https://docs.python.org/3/library/index.html" target="_blank" rel="noopener noreferrer">}}Python's Standard Library{{</a>}}, we don't need to install them.

**Important!** This material is made for learning purposes. **DO NOT** use it in production. `http.server` is not recommended for production. It only implements basic security checks.

&nbsp;

Let's create a file called `server.py` and define our `Server` class there.

{{< highlight python "linenos=table" >}}
# server.py
from socketserver import TCPServer
from http.server import SimpleHTTPRequestHandler


class Server:
    def __init__(self,
                 server_address=('127.0.0.1', 0),
                 handler=SimpleHTTPRequestHandler):
        self.server_address = server_address
        self.handler = handler

    def serve(self):
        with TCPServer(self.server_address, self.handler) as httpd:
            serving_at = httpd.server_address

            print(f'serving at http://{serving_at[0]}:{serving_at[1]}')
            httpd.serve_forever()


server = Server()
server.serve()

{{< / highlight >}}

The preceding code-block will create a running server, listening, by default, on a port chosen by your OS and serving the current working directory. 

&nbsp;

**How it works**

On lines 8,9 the `Server` class initiates with two arguments - `server_address` and `handler`. 

{{< highlight python "linenos=table, linenostart=6, hl_lines=3 4" >}}
class Server:
    def __init__(self,
                 server_address=('127.0.0.1', 0),
                 handler=SimpleHTTPRequestHandler):
{{< / highlight >}}

The `server_address` is a tuple taking two values. The first value is the host, which is `127.0.0.1` for `localhost`. The second value is the port number, which by default is `0`, this allows the operating system to choose itself on which port to serve. The `handler`, by default, accepts `SimpleHTTPRequestHandler` class. `SimpleHTTPRequestHandler` is part of the `http.server` module and is responsible for handling the client requests. 

You can see how the handler is used by a `TCPServer` instance on line 14. `TCPServer` itself is part of the `socketserver` module and instantiates with 3 arguments: `server_address`, `RequestHandlerClass`, and `bind_and_activate`. We'll skip the `bind_and_activate` argument in this article. For the other two, you already understand what they do.

{{< highlight python "linenos=table, linenostart=13, hl_lines=2" >}}
    def serve(self):
        with TCPServer(self.server_address, self.handler) as httpd:
{{< / highlight >}}

On line 15, we call `server_address` from the newly created `TCPServer` instance to print the server information on line 17. Here, the port number is set by the OS, already. We set `serving_at` as the variable name here to escape confusion with the variable on line 10.

{{< highlight python "linenos=table, linenostart=15, hl_lines=1 3" >}}
            serving_at = httpd.server_address

            print(f'serving at http://{serving_at[0]}:{serving_at[1]}')
{{< / highlight >}}

On line 18, we call the `serve_forever()` method. It runs the server in a loop and never exits unless the program gets terminated.

{{< highlight python "linenos=table, linenostart=18, hl_lines=1" >}}
            httpd.serve_forever()
{{< / highlight >}}

Finally, on lines 21, 22 we instantiate the `Server` class and call its `serve` method.

{{< highlight python "linenos=table, linenostart=21, hl_lines=1-2" >}}
server = Server()
server.serve()
{{< / highlight >}}

&nbsp;

**Creating a custom handler**

You can create a custom handler to be used by the `TCPServer` instead of `SimpleHTTPRequestHandler`. For simplicity, let’s define our handler in the same server.py file.

{{< highlight python "linenos=table" >}}
# server.py
from socketserver import TCPServer
from http.server import SimpleHTTPRequestHandler


class Handler(SimpleHTTPRequestHandler):
    pass


class Server:
    def __init__(self,
                 server_address=('127.0.0.1', 0),
                 handler=SimpleHTTPRequestHandler):
        self.server_address = server_address
        self.handler = handler

    def serve(self):
        with TCPServer(self.server_address, self.handler) as httpd:
            serving_at = httpd.server_address

            print(f'serving at http://{serving_at[0]}:{serving_at[1]}')
            httpd.serve_forever()


server = Server(handler=Handler)
server.serve()

{{< / highlight >}}

The `Handler` class inherits from `SimpleHTTPRequestHandler`. We keep it empty for now. You’ll see soon how we can customize it. Since we’ve defined a custom handler, the `Server` class instantiates with the handler attribute equal to our custom `Handler` class on line 25.

{{< highlight python "linenos=table, linenostart=25, hl_lines=1" >}}
server = Server(handler=Handler)
server.serve()

{{< / highlight >}}

&nbsp;

**Serving a custom directory**

Now, what if we want to serve on a different directory. Let's say we have a directory called `public` containing a few HTML files and images. To serve that directory we must modify the `Handler` class defined in the previous passage.

{{< highlight python "linenos=table, linenostart=6" >}}
class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory='public', **kwargs)
{{< / highlight >}}

Here, we initiate our `Handler` class by calling the `__init__` of the parent class and modifying the `directory` argument of it. All other non-keyword and keyword arguments remain the same with `*args` and `**kwargs` called. It worths mentioning that in Python3.9 the `directory` argument accepts a path-like object.

&nbsp;

**Basic routing**

`SimpleHTTPRequestHandler` class allows us to manage the requests coming from a client via `do_GET()`, `do_POST()` and `do_HEAD()` methods. Since our `Handler` class inherits from `SimpleHTTPRequestHandler`, we can define custom routes by overriding these methods. In this article, we do so only to `do_GET()` method and define custom routes for `GET` requests.

{{< highlight python "linenos=table, linenostart=6" >}}
class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory='public', **kwargs)

    def do_GET(self):
        if self.path == '/':
            self.path = '/index.html'

        if self.path == '/lyrics':
            self.path = '/lyrics.html'

        return super().do_GET()
{{< / highlight >}}

On lines 11-15, we say that if the root path (`/`) is requested then the server should look for the `index.html` file. And if the requested path is `/lyrics`, then the server should look for the `lyrics.html` file.

Notice the `return` statement at the end:

{{< highlight python "linenos=table, linenostart=17, hl_lines=1" >}}
        return super().do_GET()
{{< / highlight >}}

Since we override the `do_GET()` method, we must call the default one from the parent class at the end so the handler knows how to process the `GET` requests.

We can do more with `do_GET()` and even create automatic routing to look for the corresponding `HTML` files for each path, etc. But that's a topic for another article or for you to experiment and find it out yourself. 🙂

&nbsp;

The code in this article is available in my repo here: {{<a href="https://github.com/oorkan/a-simple-python-http-server" target="_blank" rel="noopener noreferrer">}}github.com/oorkan/a-simple-python-http-server{{</a>}}. 

I hope you enjoyed it. Cheers! 🍻

&nbsp;

**{{<small>}}References{{</small>}}**

{{<small>}}{{<a href="https://docs.python.org/3/library/index.html" target="_blank" rel="noopener noreferrer">}}The Python Standard Library (@3.9, lup: March 20, 2021){{</a>}}{{</small>}}&nbsp;

{{<small>}}{{<a href="https://docs.python.org/3/library/socketserver.html" target="_blank" rel="noopener noreferrer">}}socketserver — A framework for network servers (@3.9, lup: March 20, 2021){{</a>}}{{</small>}}&nbsp;

{{<small>}}{{<a href="https://docs.python.org/3/library/http.server.html" target="_blank" rel="noopener noreferrer">}}http.server — HTTP servers (@3.9, lup: March 20, 2021){{</a>}}{{</small>}}&nbsp;

{{<small>}}{{<a href="https://www.programiz.com/python-programming/args-and-kwargs" target="_blank" rel="noopener noreferrer">}}Python *args and **kwargs by Programiz{{</a>}}{{</small>}}