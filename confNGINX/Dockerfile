FROM ubuntu

# Installer tous les paquets nécessaires :
RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y nginx \
    && apt-get install -y php-fpm php-mysql \ 
    && apt-get install -y vim 

# Placer les configurations des sites
COPY ./configWeb/default /etc/nginx/sites-available/
COPY ./configWeb/wt20.ephec-ti.be /etc/nginx/sites-available/
COPY ./configWeb/b2b.wt20.ephec-ti.be /etc/nginx/sites-available/
COPY ./configWeb/intranet.wt20.ephec-ti.be /etc/nginx/sites-available/

# Copier les configurations dans sites-enabled
RUN ln -s /etc/nginx/sites-available/wt20.ephec-ti.be /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/b2b.wt20.ephec-ti.be /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/intranet.wt20.ephec-ti.be /etc/nginx/sites-enabled/

# Modifier la configuration par défaut de PHP7.0 en passant le paramètres cgi.fix_pathinfo à 0
RUN sed -i -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.2/fpm/php.ini

# Créer les répertoires pour les certificats HTTPS
RUN mkdir -p /etc/nginx/ssl

# Copier les certificats HTTPS du site B2B
COPY ./configWeb/b2b.wt20.ephec-ti.crt /etc/nginx/ssl/
COPY ./configWeb/b2b.wt20.ephec-ti.key /etc/nginx/ssl/

# Copier les certificats HTTPS du site statique
COPY ./configWeb/wt20.ephec-ti.crt /etc/nginx/ssl/
COPY ./configWeb/wt20.ephec-ti.key /etc/nginx/ssl/

#Copier les certificats HTTPS de l'intrantet
COPY ./configWeb/intranet.wt20.ephec-ti.crt /etc/nginx/ssl/
COPY ./configWeb/intranet.wt20.ephec-ti.key /etc/nginx/ssl/

# Exposer les ports
EXPOSE 80 443

# Lancer PHP et nginx en mode démon
CMD service php7.2-fpm start && nginx -g "daemon off;"
