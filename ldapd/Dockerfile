#LDAP
#start with centos
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

#install
RUN yum -y install openldap openldap-clients openldap-servers

#add base configs
ADD olcDatabase={2}bdb.ldif /etc/openldap/slapd.d/cn=config/olcDatabase={2}bdb.ldif
ADD ./olcDatabase={1}monitor.ldif /etc/openldap/slapd.d/cn=config/olcDatabase={1}monitor.ldif

#add ldap tree
ADD ./nagios.ldif /tmp/nagios.ldif
ADD ./users.ldif /tmp/users.ldif
RUN service slapd start && sleep 5 && \
ldapadd -f /tmp/nagios.ldif -D cn=Manager,dc=nagios,dc=local -w welcome && \
RUN ldapadd -f /tmp/users.ldif -D cn=Manager,dc=nagios,dc=local -w welcome

#Post-build docker info
EXPOSE 389
WORKDIR /root/
ENTRYPOINT ["/usr/sbin/slapd"]
CMD ["-4 -h \"ldap:///\" -h \"ldapi:///\" -u ldap -d o"]
