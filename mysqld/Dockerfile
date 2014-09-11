#start with ubuntu
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

#install mysqld
yum install -y mysql mysql-devel

#Post-build docker info
EXPOSE 3306
WORKDIR /bin/mysql
VOLUME /var/lib/mysql
CMD ["./mysqld", "--datadir=/var/lib/mysql", "--user=mysql"]
