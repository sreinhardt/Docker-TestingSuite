#start with ubuntu
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

#copy and build
ADD http://assets.nagios.com/downloads/...

#Post-build docker info
EXPOSE [ports]
WORKDIR /usr/local/[project]/
#CMD ["binary-to-start"]
