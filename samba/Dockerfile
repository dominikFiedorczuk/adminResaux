FROM ubuntu

#On installe les services necessaires
RUN apt-get update \ 
	&& apt-get -y install samba \
	&& apt-get -y install samba-common-bin \
	&& apt-get -y install vim

#On cree les groupes, les repertoires qui sont lies aux groupes et on donne les droits pour chaque repertoire
#On supprime le fichier de config
RUN groupadd directeur \
&&	groupadd secretaire \
&&	groupadd employe \
&&	groupadd comptables \
&&	groupadd commerces \
&&	useradd -m -g directeur directeur \
&&      useradd -m -g secretaire secretaire \
&&      useradd -m -g employe employe \
&&      useradd -m -g comptables comptable1 \
&&      useradd -m -g comptables comptable2 \
&&      useradd -m -g commerces commerce1 \
&&      useradd -m -g commerces commerce2 \
&&	mkdir /home/commun \
&&	mkdir /home/Direction \
&&	mkdir /home/Comptables \
&&	mkdir /home/Commerces \
&&	mkdir /home/Secretaires \
&&	chmod 777 /home/commun \
&&	chown -R root:directeur /home/Direction \
&&	chown -R 770 /home/Direction \
&&      chown -R root:secretaire /home/Secretaires \
&&      chown -R 770 /home/Secretaires \
&&      chown -R root:comptables /home/Comptables \
&&      chown -R 770 /home/Comptables \
&&      chown -R root:commerces /home/Commerces \
&&      chown -R 770 /home/Commerces \
&&	rm /etc/samba/smb.conf 

#On copie le fichier de config dans le container
COPY ./config/smb.conf /etc/samba/	 

#On expose les ports necessaires
EXPOSE 140 446

#On lance les services samba 
CMD service smbd start && service nmbd start  ; while true ; do sleep 100; done;

