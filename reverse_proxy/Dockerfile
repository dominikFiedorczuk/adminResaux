FROM ubuntu

#On installe les services necessaires
RUN apt-get update \
	&& apt-get install -y vim \
    && apt-get install -y apt-utils \
    && apt-get install -y nginx 

#On place les config des sites
COPY ./conf/default /etc/nginx/sites-available/
COPY ./conf/wt20.ephec-ti.be /etc/nginx/sites-available/
COPY ./conf/b2b.wt20.ephec-ti.be /etc/nginx/sites-available/

#On copie les config dans sites-enabled
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/wt20.ephec-ti.be /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/b2b.wt20.ephec-ti.be /etc/nginx/sites-enabled/
#On cree le repertoire pour les certificats
RUN mkdir -p /etc/nginx/letsencrypt/

#On copie les certificats dans le dossier
COPY ./letsencrypt /etc/nginx/letsencrypt

#On verifie que les configs sont bons
RUN nginx -t
#On expose les ports 
EXPOSE 80 443

CMD nginx -g "daemon off;"
