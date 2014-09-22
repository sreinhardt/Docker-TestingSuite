#nagios-plugins
#start with my cent build
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

ENV nagios_user nagios
ENV nagios_group nagios
ENV nagios_cmd_group nagcmd
ENV plugins_version 2.0.3

# deps
RUN yum install -y wget httpd php gcc glibc glibc-common gd gd-devel make net-snmp automake autoconf \
openssl-devel mysql-devel fping perl-Net-SNMP openssh-devel net-snmp-utils bind-utils samba-client gettext automake libtool

# users and groups
RUN groupadd ${nagios_cmd_group}
RUN usermod -a -G ${nagios_cmd_group} -U nagios

#add and untar plugins
WORKDIR /tmp/
ADD https://github.com/nagios-plugins/nagios-plugins/archive/release-${plugins_version}.tar.gz /tmp/nagios-plugins-${plugins_version}.tar.gz
RUN tar xzvf nagios-plugins-${plugins_version}.tar.gz

# change per version
WORKDIR nagios-plugins-release-2.0.3/

# build and install plugins
RUN ./tools/setup
RUN ./configure --with-nagios-user=${nagios_user} --with-nagios-group=${nagios_group} --prefix=/usr/local/ncpa --libexecdir=/usr/local/ncpa/plugins
RUN make
RUN make install

# cleanup
RUN rm -rf /tmp/nagios-plugins-release-${plugins_version}/

ENTRYPOINT ["/bin/bash"]
CMD [""]
