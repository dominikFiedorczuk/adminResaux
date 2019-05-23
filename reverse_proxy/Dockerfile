FROM ubuntu

#On installe les services necessaires
RUN apt-get update \
	&& apt-get install -y vim \
    && apt-get install -y apt-utils \
 && apt-get install -y php-fpm php-mysql \
    && apt-get install -y nginx 

#On place les config des sites
COPY ./conf/default /etc/nginx/sites-available/
COPY ./conf/wt20.ephec-ti.be /etc/nginx/sites-available/
COPY ./conf/b2b.wt20.ephec-ti.be /etc/nginx/sites-available/
COPY ./conf/intranet.wt20.ephec-ti.be /etc/nginx/sites-available/


#On copie les config dans sites-enabled
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/wt20.ephec-ti.be /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/b2b.wt20.ephec-ti.be /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/intranet.wt20.ephec-ti.be /etc/nginx/sites-enabled/


# Modifier la configuration par défaut de PHP7.0 en passant le paramètres cgi.fix_pathinfo à 0
RUN sed -i -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.2/fpm/php.ini

#On cree le repertoire pour les certificats
RUN mkdir -p /etc/nginx/letsencrypt/

#On copie les certificats dans le dossier
COPY ./letsencrypt /etc/nginx/letsencrypt

#On verifie que les configs sont bons
RUN nginx -t
#On expose les ports 
EXPOSE 80 443

CMD  service php7.2-fpm start &&  nginx -g "daemon off;"
