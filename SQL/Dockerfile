FROM ubuntu 

##On installe le serveur mysql et le vim
RUN apt-get update \
	&& apt-get install -y mysql-server \
	&& apt-get install -y vim
##On ajoute la bdd dans le dossise tmp du containeur pour l utilise
ADD /config/WoodyToys.sql /tmp/

##On demarre le service mysql
RUN service mysql start 

##On expose les ports 3306 et tcp
EXPOSE 3306/tcp
CMD ["/usr/bin/mysqld_safe"]
