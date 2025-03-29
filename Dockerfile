FROM debian:latest

RUN apt update && apt install -y \
     sudo ffmpeg nano firefox-esr tigervnc-standalone-server --assume-yes xfce4 desktop-base dbus-x11 xscreensaver wget unzip curl

CMD ["/bin/bash", "-c", "/root/start.sh && tail -f /dev/null"]
