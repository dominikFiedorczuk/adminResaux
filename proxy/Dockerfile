FROM ubuntu

RUN apt-get update \
	&& apt-get -y install vim \  
 	&& apt-get -y install squid

#Tout le monde peut passer par le proxy
RUN sed -i -e 's/http_access deny all/http_access allow all/g' /etc/squid/squid.conf

#On ajoute des sites pour lequels on ne peut pas acceder par le proxy
RUN sed -i -e '992i\acl badSites dstdomain .facebook.com .youtube.com' /etc/squid/squid.conf

#On bloque les mauvais sites
RUN sed -i -e '1195i\http_access deny badSites' /etc/squid/squid.conf

#Expose le port proxy
EXPOSE 3128

#Lance le squid
CMD ["squid", "-N"]
