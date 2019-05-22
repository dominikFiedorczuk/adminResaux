FROM ubuntu

#On installer asterisk
RUN apt-get update \ 
	&& apt-get -y install asterisk \
	&& apt-get -y install vim

#On copie les fichiers de config vers le container
COPY ./config/    /etc/asterisk/

#On expose les ports
EXPOSE 5060/udp
EXPOSE 5060/tcp
EXPOSE  4569/udp
EXPOSE 4569/tcp
EXPOSE 16384-16394/udp

CMD ["/usr/sbin/asterisk", "-f"]
