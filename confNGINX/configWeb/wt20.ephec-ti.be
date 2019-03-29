server {
	##Serveur va écouter sur le port 8080 en IPv4 et IPv6
	##Il redirige vers la page https
    listen 8080;
    listen [::]:8080;
    server_name wt20.ephec-ti.be www.wt20.ephec-ti.be;
   return 301 https://$server_name$request_uri;
    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;
}


server{
	#Serveur va écouter sur le port 443 en IPv4 et IPv6
	listen 4433 ssl http2;
    listen [::]:4433 ssl http2;
    server_name wt20.ephec-ti.be www.wt20.ephec-ti.be; ##Nom de domaine
    
    ssl_certificate /etc/nginx/ssl/wt20.ephec-ti.crt; ##Directory vers le certificat https
    ssl_certificate_key /etc/nginx/ssl/wt20.ephec-ti.key; ##Directory vers la cle https
    root /usr/share/nginx/html/www; ##Chemin vers le site

    index index.html index.htm;
    location / {
        try_files $uri $uri/ =404;
    }
}

