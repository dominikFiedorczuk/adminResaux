server { 
	listen 80;
	server_name www.intranet.wt20.ephec-ti.be intranet.wt20.ephec-ti.be;
	return 301 https://$server_name$request_uri;
}

server { 
	listen [::]:443 ssl http2;
   	listen 443 ssl http2;
	server_name www.intranet.wt20.ephec-ti.be intranet.wt20.ephec-ti.be;

	ssl_certificate /etc/nginx/ssl/intranet.wt20.ephec-ti.crt;
	ssl_certificate_key /etc/nginx/ssl/intranet.wt20.ephec-ti.key;

	root /usr/share/nginx/html/intranet; 
	index index.html index.htm;

	location / { 
		allow 51.77.147.83; 
		deny all; 
		try_files $uri $uri/ =404; 
	}
} 
