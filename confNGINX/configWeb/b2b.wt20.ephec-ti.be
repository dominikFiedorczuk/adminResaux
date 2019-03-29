server {
	##Serveur va écouter sur le port 8080 en IPv4 et IPv6
	##Il redirige vers la page https
	listen 8080;
	listen [::]:8080;
	server_name b2b.wt20.ephec-ti.be www.b2b.wt20.ephec-ti.be;
	return 301 https://$server_name$request_uri;
}

server { 
	##Serveur va écouter sur le port 4433 en IPv4 et IPv6
	listen 4433 ssl http2;
	listen [::]:4433 ssl http2;
	server_name b2b.wt20.ephec-ti.be www.b2b.wt20.ephec-ti.be; ##Nom de domaine

	ssl_certificate /etc/nginx/ssl/b2b.wt20.ephec-ti.crt; ##Directory vers le certificat https
	ssl_certificate_key /etc/nginx/ssl/b2b.wt20.ephec-ti.key; ##Directory vers la cle https

	root /usr/share/nginx/html/b2b; ##Chemin vers le site
	index index.php index.html index.htm;

	location / { 
		try_files $uri $uri/ =404; 
	}
	##Permet d affiche l index.php
	location ~ \.php$ {
        	include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
        	fastcgi_pass unix:/run/php/php7.2-fpm.sock;
    	} 

}


