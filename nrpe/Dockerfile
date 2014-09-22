#start with ubuntu
FROM sreinhardt/nagios-testing-suite:nagios-plugins

MAINTAINER Spenser Reinhardt

ENV nrpe_ver 2-14

#Download and untar
WORKDIR /tmp/
ADD https://github.com/NagiosEnterprises/nrpe/archive/nrpe-2-14.tar.gz
RUN tar xzf nrpe-${nrpe_ver}.tar.gz

WORKDIR nrpe-nrpe-2-14/
RUN ./configure --enable-ssl --enable-command-args
RUN make all
RUN make install
RUN make install-daemon
ADD nrpe.cfg /usr/local/nagios/etc/nrpe.cfg
RUN chown -R ${nagios_user}:${nagios_user} /usr/local/nagios/etc/

#Cleanup
WORKDIR /tmp/
RUN rm -rf nrpe*

#Post-build docker info
EXPOSE ["5666"]
WORKDIR /usr/local/nagios/
ENTRYPOINT ["/usr/local/nagios/bin/nrpe"]
CMD ["-c /usr/local/nagios/etc/nrpe.cfg -4 -d"]
