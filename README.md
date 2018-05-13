# docker-apache-webdav

-	[`latest` (*Dockerfile*)](https://github.com/angelnu/docker-apache-webdav/blob/master/Dockerfile)

[![](https://badge.imagelayers.io/angelnu/apache-webdav:latest.svg)](https://imagelayers.io/?images=angelnu/apache-webdav:latest 'Get your own badge on imagelayers.io')

Webdav server running in Alpine Linux container

# How to use this image

```console
$ docker run -ti --rm -e USERNAME=webdav -e PASSWORD=webdav -p 8080:80 --name webdav -v $(pwd):/media angelnu/apache-webdav:latest
```
This will start a webdav server listening on the default port of 80.
Then access it via `http://localhost:8080` or `http://host:8080` in a browser.

This server will serve files located in your /media folder

Image's supported volumes:
- `/media` - served directory
