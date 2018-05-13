ARG BASE=alpine
FROM $BASE

ARG arch=none
ENV ARCH=$arch

COPY qemu/qemu-$ARCH-static* /usr/bin/

RUN apk add --no-cache apache2-webdav apache2-utils \
  # Create a subdir for webdav lockdb file.
  && mkdir -p /var/lib/dav \
  && chown apache:apache /var/lib/dav \
  && chmod 755 /var/lib/dav \
  # Create a subdir to hold the daemon's pid:
  && mkdir -p /run/apache2

ADD dav.conf /etc/apache2/conf.d/
ADD entrypoint.sh /
RUN chmod 750 /entrypoint.sh

VOLUME /media
EXPOSE 80 443

CMD ["/entrypoint.sh"]
