FROM debian:latest

RUN apt update && apt install -y 
     sudo ffmpeg nano firefox-esr tigervnc-standalone-server xfce4 xfce4-goodies wget unzip curl

CMD ["/bin/bash", "-c", "/root/start.sh && tail -f /dev/null"]
