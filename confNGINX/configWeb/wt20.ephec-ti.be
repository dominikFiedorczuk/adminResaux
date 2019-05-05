server{
	#Serveur va ecouter sur le port 443 en IPv4 et IPv6
	listen 443 ssl http2;
	listen [::]:443 ssl http2;
    server_name wt20.ephec-ti.be www.wt20.ephec-ti.be; #Nom de domaine
    
   
    ssl_certificate /etc/nginx/letsencrypt/live/www.wt20.ephec-ti.be/fullchain.pem; #Directory vers le certificat https
    ssl_certificate_key /etc/nginx/letsencrypt/live/www.wt20.ephec-ti.be/privkey.pem; #Directory vers la cle https
   root /usr/share/nginx/html/www; #Chemin vers le site

    index index.html index.htm;
    location / {
        try_files $uri $uri/ =404;
    }
}

