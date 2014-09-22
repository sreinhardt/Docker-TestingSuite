# SNMPD
#start with my cent build
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

# install snmpd/net-snmp
RUN yum install net-snmp -y

# Add configs
ADD snmpd.conf /etc/snmp/snmpd.conf

#Post-build docker info
EXPOSE 161
WORKDIR /usr/sbin/
ENTRYPOINT ["/usr/sbin/snmpd"]
CMD ["-f"]
