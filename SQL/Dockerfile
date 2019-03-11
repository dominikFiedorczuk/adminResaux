FROM ubuntu 

RUN apt-get update \
	&& apt-get install -y mysql-server \
	&& apt-get install -y vim

ADD /config/WoodyToys.sql /tmp/
RUN service mysql start 


EXPOSE 3306/tcp
CMD ["/usr/bin/mysqld_safe"]
