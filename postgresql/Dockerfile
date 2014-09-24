#start with centos
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

ENV PGDATA /var/lib/pgsql/data
ENV PGPORT 5432
ENV PGLOG /var/lib/pgsql/pgsql.log

#install
RUN yum install postgresql-server -y

#initdb so we can start service
RUN /etc/init.d/postgresql initdb

#add commands
ADD psql-commands /tmp/psql-commands

RUN service postgresql start && sleep 10 && \
sudo - postgres -c "psql -f /tmp/psql-commands" && \
createdb -O docker docker

#Post-build docker info
USER postgres
EXPOSE 5432
VOLUME ["/var/log/pgsql/" "/var/lib/pgsql/"]
WORKDIR /var/lib/pgsql/
ENTRYPOINT ["/usr/bin/postmaster"]
CMD ["-p '$PGPORT' -D '$PGDATA' -i -N 200 2>&1 >> $PGLOG < /dev/null"]
