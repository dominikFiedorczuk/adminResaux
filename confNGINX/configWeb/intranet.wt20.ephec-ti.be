server { 
	listen 80;
	listen [::]:80;
	server_name intranet.wt20.ephec-ti.be www.intranet.wt20.ephec-ti.be;
	return 301 https://$server_name$request_uri;
}

server { 
   	listen 443 ssl http2;
	listen [::]:443 ssl http2;
	server_name intranet.wt20.ephec-ti.be www.intranet.wt20.ephec-ti.be;

	ssl_certificate /etc/nginx/ssl/intranet.wt20.ephec-ti.crt;
	ssl_certificate_key /etc/nginx/ssl/intranet.wt20.ephec-ti.key;

	root /usr/share/nginx/html/intranet; 
	index index.php index.html index.htm;

	location / { 
		allow 51.77.147.80; 
		deny all; 
		try_files $uri $uri/ =404; 
	}
	
	location ~ \.php$ {
        	include fastcgi_params;
        	fastcgi_pass unix:/run/php/php7.2-fpm.sock;
		fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
	}
} 
