server {
	#Serveur va ecouter sur le port 80 en IPv4 et IPv6
	#Il redirige vers la page http 
	listen 80;
	listen [::]:80;
	server_name intranet.wt20.ephec-ti.be www.intranet.wt20.ephec-ti.be;
	root /usr/share/nginx/html/intranet;
	index index.php index.html index.htm;
	
	#Intranet seuelement accessible en interne
	location / { 
		allow 51.77.147.80; 
		deny all; 
		try_files $uri $uri/ =404; 
	}

	##Permet d afficher l index.php
	location ~ \.php$ {
        	include fastcgi_params;
        	fastcgi_pass unix:/run/php/php7.2-fpm.sock;
		fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
	}
} 
