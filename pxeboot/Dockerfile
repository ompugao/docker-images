FROM ubuntu:16.04

RUN apt-get update && apt-get install -y make gcc git inetutils-inetd tftpd-hpa && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/frsyuki/pxe-pdhcp.git ;\
    cd pxe-pdhcp ;\
    make

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
COPY tftpd-hpa /etc/default/tftpd-hpa
VOLUME /netboot
EXPOSE 68 69
ENTRYPOINT ["/entrypoint.sh"]
ENV PXEHOST
CMD ["/pxe-pdhcp/pxe-pdhcp", "-l", "0.0.0.0", "-b", "255.255.255.255", "-t", "$PXEHOST", "-d", "pxelinux.0"]
#CMD ["tail", "-f", "/var/log/syslog"]


