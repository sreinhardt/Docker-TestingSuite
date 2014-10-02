#start with ubuntu
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

RUN yum install ntp -y
ADD ntp.conf /etc/ntp.conf

#Post-build docker info
EXPOSE 123
ENTRYPOINT ["/usr/sbin/ntpd"]
CMD ["-gn", "-u ntp:ntp", "-p /var/run/ntpd.pid"]
