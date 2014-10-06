#start with ubuntu
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

ADD http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm /tmp/rpmforge.rpm
RUN rpm -Uvh /tmp/rpmforge.rpm

ADD http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm /tmp/epel.rpm
RUN rpm -Uvh /tmp/epel.rpm

RUN yum search mongo
RUN yum install mongodb-server -y

#copy config
ADD mongodb.conf /etc/mongodb.conf

#Post-build docker info
EXPOSE 27017
VOLUME ["/var/log/mongodb/"]
WORKDIR /usr/bin/
ENTRYPOINT ["/usr/bin/mongod"]
CMD ["--quiet", "-f", "/etc/mongodb.conf", "run"]
