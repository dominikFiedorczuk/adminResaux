server {
	listen 443 http2;
	listen [::]:443 http2;
	server_name wt20.ephec-ti.be www.wt20.ephec-ti.be;

	ssl_certificate /etc/nginx/letsencrypt/live/www.wt20.ephec-ti.be/fullchain.pem; ##Directory vers le certificat https
    ssl_certificate_key /etc/nginx/letsencrypt/live/www.wt20.ephec-ti.be/privkey.pem; ##Directory vers la cle https
	
	location / {

		proxy_pass http://172.17.0.2;
    }

}
