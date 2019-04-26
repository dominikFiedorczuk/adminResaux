server {
	##Serveur va écouter sur le port 8080 en IPv4 et IPv6
	##Il redirige vers la page https 
	listen 80;
	listen [::]:80;
	server_name intranet.wt20.ephec-ti.be www.intranet.wt20.ephec-ti.be;
	root /usr/share/nginx/html/intranet;
	index index.php index.html index.htm;
	
	location / { 
		allow 51.77.147.80; 
		deny all; 
		try_files $uri $uri/ =404; 
	}

	##Permet d affiche l index.php
	location ~ \.php$ {
        	include fastcgi_params;
        	fastcgi_pass unix:/run/php/php7.2-fpm.sock;
		fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
	}
}

#server { 
	##Serveur va écouter sur le port 4433 en IPv4 et IPv6
#   	listen 443 ssl http2;
#	listen [::]:443 ssl http2;
#	server_name intranet.wt20.ephec-ti.be www.intranet.wt20.ephec-ti.be; ##Nom de domaine


#	root /usr/share/nginx/html/intranet; ##Chemin vers le site
#	index index.php index.html index.htm;
	
	##Seul les gens sur ce VPS peuvent acceder au site
#	location / { 
#		allow 51.77.147.80; 
		deny all; 
		try_files $uri $uri/ =404; 
#	}
	##Permet d affiche l index.php
#	location ~ \.php$ {
 #       	include fastcgi_params;
  #      	fastcgi_pass unix:/run/php/php7.2-fpm.sock;
#		fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
#	}
#} 
