    
server {
	#Ecoute sur le port 80 en IPv4 et IPv6
        listen 80;
        listen [::]:80;

	#Nom de domaine
        server_name intranet.wt20.ephec-ti.be www.intranet.wt20.ephec-ti.be;

	#Redirige vers la page HTTPS si on veut acceder en HTTP
        return 301 https://intranet.wt20.ephec-ti.be$request_uri;
}

server { 
	#Serveur va écouter sur le port 443
	listen 4434 ssl http2;
	listen [::]:4434 ssl http2;
	server_name intranet.wt20.ephec-ti.be www.intranet.wt20.ephec-ti.be; #Nom de domaine
	
	root /usr/share/nginx/html/intranet;
	index index.php index.html index.htm;

	#Certificats HTTPS 
	 ssl_certificate /etc/nginx/letsencrypt/live/intranet.wt20.ephec-ti.be/fullchain.pem;
        ssl_certificate_key /etc/nginx/letsencrypt/live/intranet.wt20.ephec-ti.be/privkey.pem;

	location / {
		allow 51.77.147.80; 
		deny all; 
		try_files $uri $uri/ =404; 		

	}

	location ~ \.php$ {
        	include fastcgi_params;
        	fastcgi_pass unix:/run/php/php7.2-fpm.sock;
		fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
	}
}
