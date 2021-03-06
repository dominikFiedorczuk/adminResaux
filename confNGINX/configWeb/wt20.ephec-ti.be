upstream wt20{
	server 51.77.147.83:443;
}

server {
    listen      [::]:80;
    listen 80;
    server_name www.wt20.ephec-ti.be wt20.ephec-ti.be;
   return 301 https://$server_name$request_uri;
    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;
}


server{
    listen [::]:443 ssl http2;
    listen 443 ssl http2;
    server_name www.wt20.ephec-ti.be wt20.ephec-ti.be;
    
    ssl_certificate /etc/nginx/ssl/wt20.ephec-ti.crt;
    ssl_certificate_key /etc/nginx/ssl/wt20.ephec-ti.key;
    root /usr/share/nginx/html/www;

    index index.html index.htm;
    location / {
        try_files $uri $uri/ =404;
    }

}
server	{
	listen 443 ssl http2;
	ssl_certificate /etc/nginx/ssl/wt20.ephec-ti.crt;
	ssl_certificate_key /etc/nginx/ssl/wt20.ephec-ti.key;
	location / {
		include proxy_params;
		proxy_pass https://wt20;
	}
} 

