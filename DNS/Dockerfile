FROM ubuntu

# Installer tous les paquets nécessaires :
RUN apt-get update && apt-get install -y bind9 \
		dnsutils \
		vim

WORKDIR /etc/bind

VOLUME /etc/bind

# Placer les configurations des sites
ADD configDNS/named.conf /etc/bind/
ADD configDNS/named.conf.local /etc/bind/
ADD configDNS/db.wt20.ephec-ti.be.direct /etc/bind/
ADD configDNS/db.wt20.ephec-ti.be.reverse /etc/bind/


EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named"]
