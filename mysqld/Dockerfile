#MYSQLD
#start with my cent build
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

ENV datadir /var/lib/mysql
ENV basedir /usr
ENV socketfile /var/lib/mysql/mysql.sock
ENV logfile /var/log/mysqld/mysqld.log
ENV user mysql
ENV pid /var/run/mysqld/mysqld.pid

#install mysqld
RUN yum install -y mysql-server
RUN mkdir $(dirname ${logfile})
RUN service mysqld start && /usr/bin/mysqladmin -u root password 'jumpstart' && service mysqld stop

#Post-build docker info
EXPOSE 3306
WORKDIR /var/lib/mysql
VOLUME /var/lib/mysql
VOLUME /var/log/mysqld
ENTRYPOINT ["/usr/bin/mysqld_safe"]
CMD ["--datadir=/var/lib/mysql", "--user=mysql", "--pid-file=/var/run/mysqld/mysqld.pid", "--basedir=/usr", "--socket=/var/lib/mysql/mysql.sock", "> /dev/null 2>&1 >> /var/log/mysqld/mysqld.log"]
