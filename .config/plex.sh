#!/bin/bash

docker run -d \
  --name=plex \
  --net=plexvlan \
  --ip=10.0.0.35 \
  -p 32400:32400 \
  -p 1900:1900/udp \
  -p 3005:3005 \
  -p 5353:5353/udp \
  -p 8324:8324 \
  -p 32410:32410/udp \
  -p 32412:32412/udp \
  -p 32413:32413/udp \
  -p 32414:32414/udp \
  -p 32469:32469 \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -v /home/louis/Containers/plex/library:/config \
  -v /home/louis/Containers/plex/tv:/tv \
  -v /home/louis/Containers/plex/movies:/movies \
  --restart unless-stopped \
  lscr.io/linuxserver/plex:latest