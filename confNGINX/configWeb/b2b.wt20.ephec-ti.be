server { 
	#Serveur va ecouter sur le port 4433 en IPv4 et IPv6
	listen 4433 ssl http2;
	listen [::]:4433 ssl http2;
	server_name b2b.wt20.ephec-ti.be www.b2b.wt20.ephec-ti.be; #Nom de domaine

	#Les certificats HTTPS
	ssl_certificate /etc/nginx/letsencrypt/live/b2b.wt20.ephec-ti.be/fullchain.pem;
        ssl_certificate_key /etc/nginx/letsencrypt/live/b2b.wt20.ephec-ti.be/privkey.pem;


	root /usr/share/nginx/html/b2b; #Chemin vers le site
	index index.php index.html index.htm;

	location / { 
		try_files $uri $uri/ =404; 
	}
	#Permet d affiche l index.php
	location ~ \.php$ {
        	include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
        	fastcgi_pass unix:/run/php/php7.2-fpm.sock;
    	} 

}


