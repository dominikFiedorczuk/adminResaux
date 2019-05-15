FROM ubuntu:latest

RUN apt-get update && apt-get install -y bind9 \
		&& apt-get install -y dnsutils \
		&& apt-get install -y vim

ADD /configTestDNS/db.wt20.ephec-ti.be /etc/bind/
ADD /configTestDNS/named.conf.options /etc/bind/
ADD /configTestDNS/named.conf.local /etc/bind/
ADD /configTestDNS/named.conf.default-zones /etc/bind/

WORKDIR /etc/bind

VOLUME /etc/bind

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
