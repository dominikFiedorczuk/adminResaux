FROM ubuntu

RUN apt-get update \
		&& apt-get install -y bind9 \
		&& apt-get install -y dnsutils \
		&& apt-get install -y vim 

ADD https://github.com/fshatskiy/ProjetAdminSys-R-seaux/tree/master/DNS/Config/db.wt20.ephec-ti.be /etc/bind/
ADD https://github.com/fshatskiy/ProjetAdminSys-R-seaux/tree/master/DNS/Config/named.conf.local /etc/bind/
ADD https://github.com/fshatskiy/ProjetAdminSys-R-seaux/tree/master/DNS/Config/named.conf.default-zones /etc/bind/
ADD https://github.com/fshatskiy/ProjetAdminSys-R-seaux/tree/master/DNS/Config/named.conf.options /etc/bind/

WORKDIR /etc/bind

VOLUME /etc/bind

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
