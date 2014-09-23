#start with ubuntu
FROM sreinhardt/nagios-testing-suite:nagios-plugins

MAINTAINER Spenser Reinhardt

# install sshd
RUN yum install openssh-server -y
RUN if [[ ! -d /usr/local/nagios/.ssh/ ]]; then mkdir -p /usr/local/nagios/.ssh; fi
ADD id_dsa.pub /usr/local/nagios/.ssh/authorized_keys
RUN chown ${nagios_user}:${nagios_group} /usr/local/nagios/.ssh -R
RUN chmod 400 /usr/local/nagios/.ssh -R

#build initial keys
RUN /etc/init.d/sshd start

#Post-build docker info
EXPOSE ["22"]
WORKDIR /usr/local/nagios/libexec/
ENTRYPOINT ["/usr/sbin/sshd"]
CMD [""]
