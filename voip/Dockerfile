FROM ubuntu

#On installer asterisk
RUN apt-get update \ 
	&& apt-get -y install asterisk

#On copie les fichiers de config vers le container
COPY ./config/    /etc/asterisk/

#On expose les ports
EXPOSE 5060 
CMD ["/usr/sbin/asterisk", "-f"]
