server {

	listen 80;
	#listen [::]:80;

	server_name intranet.wt20.ephec-ti.be www.intranet.wt20.ephec-ti.be;

	location / { 
		
		proxy_pass http://172.17.0.2; 
	}
}
