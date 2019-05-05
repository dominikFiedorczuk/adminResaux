server {
	#Ecoute sur le port 80 en IPv4 et IPv6
        listen 80;
        listen [::]:80;

	#Nom de domaine
        server_name b2b.wt20.ephec-ti.be www.b2b.wt20.ephec-ti.be;

	#Redirige vers la page HTTPS si on veut acceder en HTTP
        return 301 https://b2b.wt20.ephec-ti.be$request_uri;
}

server { 
	#Serveur va écouter sur le port 443
	listen 443 ssl http2;
	listen [::]:443 ssl http2;
	server_name b2b.wt20.ephec-ti.be www.b2b.wt20.ephec-ti.be; #Nom de domaine
	
	#Certificats HTTPS 
	 ssl_certificate /etc/nginx/letsencrypt/live/b2b.wt20.ephec-ti.be/fullchain.pem;
        ssl_certificate_key /etc/nginx/letsencrypt/live/b2b.wt20.ephec-ti.be/privkey.pem;

	#Redirection vers le container nginx sur le port 4433
	location / {
		proxy_pass https://172.17.0.2:4433;

	}
}
