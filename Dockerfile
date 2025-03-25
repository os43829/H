FROM ubuntu:latest


RUN apt update && apt install -y \
    tigervnc-standalone-server xfce4 xfce4-goodies wget unzip curl


RUN mkdir -p /root/.vnc && echo "123456" | vncpasswd -f > /root/.vnc/passwd && chmod 600 /root/.vnc/passwd


RUN wget -O /root/ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && \
    unzip /root/ngrok.zip -d /root/ && chmod +x /root/ngrok


RUN /root/ngrok config add-authtoken 2erQMGxNqGpirfbGmdoRFwrqI8t_5qot7EbZK4arrnfzsiq7m


RUN echo '#!/bin/bash\n\
vncserver :1 -geometry 1280x720 -depth 24\n\
nohup /root/ngrok tcp 5901 > /root/ngrok.log 2>&1 &' > /root/start.sh && chmod +x /root/start.sh


CMD ["/bin/bash", "-c", "/root/start.sh && tail -f /dev/null"]
