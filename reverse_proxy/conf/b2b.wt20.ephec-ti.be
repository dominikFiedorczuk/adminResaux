
server { 
	##Serveur va écouter sur le port 4433 en IPv4 et IPv6
	listen 443 ssl http2;
	listen [::]:4433 ssl http2;
	server_name b2b.wt20.ephec-ti.be www.b2b.wt20.ephec-ti.be; ##Nom de domaine

	ssl_certificate /etc/nginx/letsencrypt/live/b2b.wt20.ephec-ti.be/fullchain.pem; ##Directory vers le certificat https
	ssl_certificate_key /etc/nginx/letsencrypt/live/b2b.wt20.ephec-ti.be/privkey.pem; ##Directory vers la cle https

	location / {
		proxy_pass http://172.17.0.2;

	}
}
