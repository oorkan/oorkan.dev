---
title: "Creating a Simple Http Server With Python"
date: 2021-03-19T00:09:10+04:00
draft: true
---

Although, in this article we aren't gonna need it but it's always good to setup a virtual environment in python. Check out my article on how to create virtual environments in python.

We are going to use two modules called `http.server` and `socketserver`. They are both part of Python3's standard library so we don't need to install them.

Lets create our Server class:

{{< highlight python >}}
# server.py
import socketserver
from http.server import SimpleHTTPRequestHandler


class Server:
    def __init__(self,
                 host='127.0.0.1', port=0,
                 handler=SimpleHTTPRequestHandler):
        self.host = host
        self.port = port
        self.handler = handler

    def serve(self):
        server_address = (self.host, self.port)

        with socketserver.TCPServer(server_address, self.handler) as httpd:
            serving_at = httpd.server_address

            print(f'serving at http://{serving_at[0]}:{serving_at[1]}')
            httpd.serve_forever()


server = Server()
server.serve()

{{< / highlight >}}

The code above will create a running server, listening, by default, on a port chosen by your OS and serving the current directory.

Now, what if you want to serve a different directory. Let's say, you have a directory called `public` containing a few html files and images.

{{< highlight python >}}
# server.py
import socketserver
from http.server import SimpleHTTPRequestHandler


class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs, directory='./public/')


class Server:
    def __init__(self,
                 host='127.0.0.1', port=0,
                 handler=Handler):
        self.host = host
        self.port = port
        self.handler = handler

    def serve(self):
        server_address = (self.host, self.port)

        with socketserver.TCPServer(server_address, self.handler) as httpd:
            serving_at = httpd.server_address

            print(f'serving at http://{serving_at[0]}:{serving_at[1]}')
            httpd.serve_forever()


server = Server()
server.serve()

{{< / highlight >}}

And, finally, you can do some basic routing when you define a custom Handler, for example:

{{< highlight python >}}
# server.py
import socketserver
from http.server import SimpleHTTPRequestHandler


class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs, directory='./public/')

    def do_GET(self):
        if self.path == '/':
            self.path = self.path + 'index.html'

        if self.path == '/lyrics':
            self.path = '/' + 'lyrics.html'

        return SimpleHTTPRequestHandler.do_GET(self)


...

{{< / highlight >}}

The demo of the code is available here:

**github link**


