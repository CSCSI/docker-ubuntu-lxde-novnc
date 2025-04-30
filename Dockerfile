FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/root

RUN dpkg-divert --local --rename --add /sbin/initctl && ln -sf /bin/true /sbin/initctl

RUN apt-get update \
    && apt-get install -y --force-yes --no-install-recommends supervisor \
        openssh-server pwgen sudo vim-tiny git \
        net-tools \
        lxde x11vnc xvfb \
        gtk2-engines-murrine fonts-ubuntu fonts-ubuntu-console fonts-ubuntu-title \
        libreoffice firefox \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir /etc/startup.aux/
RUN echo "#Dummy" > /etc/startup.aux/00.sh
RUN chmod +x /etc/startup.aux/00.sh
RUN mkdir -p /etc/supervisor/conf.d
RUN rm /etc/supervisor/supervisord.conf

RUN git clone https://github.com/novnc/noVNC.git /novnc
RUN chmod +x /novnc/utils/novnc_proxy
ADD startup.sh /
ADD supervisord.conf /etc/supervisor/
EXPOSE 6080
EXPOSE 5900
EXPOSE 22
WORKDIR /
ENTRYPOINT ["/startup.sh"]
