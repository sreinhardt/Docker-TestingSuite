# HTTPD
#start with my cent build
FROM sreinhardt/centos-6-x86_64:latest

MAINTAINER Spenser Reinhardt

# Install needed deps
RUN yum install -y httpd openssl mod_ssl

# Add certs for ssl
ADD certs/ca.crt /etc/pki/tls/certs/ca.crt
ADD certs/ca.key /etc/pki/tls/private/ca.key
ADD certs/ca.csr /etc/pki/tls/private/ca.csr
RUN chmod 400 /etc/pki/tls/certs/ca.crt
RUN chmod 400 /etc/pki/tls/private/ca.{key,csr}

# Add httpd confs
ADD testing.conf /etc/httpd/conf.d/testing.conf
ADD ssl.conf /etc/httpd/conf.d/ssl.conf

# Add html pages
ADD www/ /var/www/

#Post-build docker info
EXPOSE 80
EXPOSE 443
WORKDIR /var/www/
CMD ["/usr/sbin/httpd"]
