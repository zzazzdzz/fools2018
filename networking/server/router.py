'''
    A very simple WSGI router.
    Based on: https://github.com/ericmoritz/wsgirouter
    
    Copyright 2010 Eric Moritz. All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are
    met:

       1. Redistributions of source code must retain the above copyright
          notice, this list of conditions and the following disclaimer.

       2. Redistributions in binary form must reproduce the above
          copyright notice, this list of conditions and the following
          disclaimer in the documentation and/or other materials provided
          with the distribution.

    THIS SOFTWARE IS PROVIDED BY Eric Moritz ``AS IS'' AND ANY
    EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> OR
    CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
    EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
    LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
    NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

    The views and conclusions contained in the software and documentation
    are those of the authors and should not be interpreted as representing
    official policies, either expressed or implied, of Eric Moritz.
'''

import re

class RouteNotFound(Exception):
    def __init__(self, router, tried):
        self.router = router
        self.tried = tried

    def __str__(self):
        return "<RouteNotFound tried: %r>" % self.tried

class RouteMatch(object):
    def __init__(self, app, match, rest, info):
        self.app = app
        self.match = match
        self.rest = rest
        self.info = info

class Router(object):
    def __init__(self):
        self.rules = []

    def route(self, pat, methods=["GET", "POST"]):
        def decor(application):
            regex = re.compile(pat)
            self.rules.append((
                    (regex, methods, application),
                    (pat,)
                    ))
            return application
        return decor

    def resolve(self, method, path):
        tried = []
        original_path = path
        for (regex, methods, app), info in self.rules:
            if method in methods:
                match = regex.match(path)
                if match:
                    rest = regex.sub("", path)
                    return RouteMatch(app, match, rest, info)
                else:
                    tried.append({
                        'method': method,
                        'path': path,
                        'pattern': info[0],
                        'methods': methods
                    })

        raise RouteNotFound(self, tried)
    
    def path_info(self, environ):
        return environ['PATH_INFO']

    def __call__(self, environ, start_response, path=None):
        method = environ['REQUEST_METHOD']
        if path is None:
            path = self.path_info(environ)
        result = self.resolve(method, path)
        if result.app is not None:
            kwargs = result.match.groupdict()
            if kwargs:
                args = ()
            else:
                kwargs = {}
                args = result.match.groups()
            environ['wsgiorg.routing_args'] = (args, kwargs)
            if isinstance(result.app, Router):
                return result.app(environ, start_response, path=result.rest)
            else:
                return result.app(environ, start_response)
