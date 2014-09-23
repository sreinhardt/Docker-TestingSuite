#start with centos
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

ENV PGDATA /var/lib/pgsql/data
ENV PGPORT 5432
ENV PGLOG /var/lib/pgsql/pgsql.log

#install
RUN yum install postgresql-server -y

#all future commands and container run as postgres user
USER postgres

RUN /etc/init.d/postgresql start && \
psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" && \
createdb -O docker docker

#Post-build docker info
EXPOSE 5432
VOLUME ["/var/log/pgsql/" "/var/lib/pgsql/"]
WORKDIR /var/lib/pgsql/
ENTRYPOINT ["/usr/bin/postmaster"]
CMD ["-p '$PGPORT' -D '$PGDATA' -i -N 200 2>&1 >> $PGLOG < /dev/null"]
