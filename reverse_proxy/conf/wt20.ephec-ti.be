server {
	#Ecoute sur le port 80 en IPv4 et IPv6
        listen 80;
        listen [::]:80;

	#Nom de domaine
        server_name wt20.ephec-ti.be www.wt20.ephec-ti.be;

	#Renvoie vers le site HTTPS si on veut acceder au site en HTTP
        return 301 https://www.wt20.ephec-ti.be$request_uri;
}

server {
	#Ecoute sur le port HTTPS
	listen 443 ssl http2;
	listen [::]:443 ssl http2;
	server_name wt20.ephec-ti.be www.wt20.ephec-ti.be; #Nom de domain
	
	#Certificats HTTPS
         ssl_certificate /etc/nginx/letsencrypt/live/www.wt20.ephec-ti.be/fullchain.pem;
        ssl_certificate_key /etc/nginx/letsencrypt/live/www.wt20.ephec-ti.be/privkey.pem;
	
	#Redirige vers le container nginx sur le port 443
	location / {

		proxy_pass https://172.17.0.2:443;
    }

}
