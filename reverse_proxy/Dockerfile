FROM ubuntu

RUN apt-get update \
	&& apt-get install -y vim \
    && apt-get install -y apt-utils \
    && apt-get install -y nginx 

COPY ./conf/wt20.ephec-ti.be /etc/nginx/sites-available/


RUN ln -s /etc/nginx/sites-available/wt20.ephec-ti.be /etc/nginx/sites-enabled/

EXPOSE 80 443

CMD nginx -g "daemon off;"
