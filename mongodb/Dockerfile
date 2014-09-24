#start with ubuntu
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

RUN yum search mongo
RUN yum install mongodb-server -y

#copy config
ADD mongodb.conf /etc/mongodb.conf

#Post-build docker info
EXPOSE 27017
VOLUME ["/var/log/mongodb/"]
WORKDIR /usr/bin/
ENTRYPOINT ["/usr/bin/mongodb"]
CMD ["--quiet -f /etc/mongodb.conf run 2>&1 >> /var/log/mongodb/mongodb.log"]
