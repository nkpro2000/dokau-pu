FROM dorowu/ubuntu-desktop-lxde-vnc

# Tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends nam ns2 default-jre default-jdk

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends wine wine32
COPY emu8086.exe.aes /tmp/
RUN openssl enc -aes-256-cbc -d -in /tmp/emu8086.exe.aes -out /tmp/emu8086.exe -pass pass:password && \
    rm -f /tmp/emu8086.exe.aes
COPY emu.exe.aes /tmp/
RUN openssl enc -aes-256-cbc -d -in /tmp/emu.exe.aes -out /tmp/emu.exe -pass pass:password && \
    rm -f /tmp/emu.exe.aes

ADD https://github.com/argouml-tigris-org/argouml/releases/download/VERSION_0_34/ArgoUML-0.34.tar.gz /tmp
RUN tar -xzf /tmp/ArgoUML*.tar.gz -C /usr/local && \
    ln -s /usr/local/argouml-*/argouml.sh /usr/local/bin/argouml && \
    rm -r /tmp/ArgoUML*.tar.gz

# Online
ADD https://zoom.us/client/latest/zoom_amd64.deb /tmp/
RUN apt install -y --no-install-recommends /tmp/zoom*.deb && \
    rm -f /tmp/zoom*.deb
ADD https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.30857_amd64.deb /tmp/
RUN apt install -y --no-install-recommends /tmp/teams*.deb && \
    rm -f /tmp/teams*.deb

# STARTUP
ENV RESOLUTION 1366x768
ENV USER user
ENV PASSWORD password

ENTRYPOINT ["/startup.sh"]
