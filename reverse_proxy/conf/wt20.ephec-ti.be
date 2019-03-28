server {
	listen 80;
	#listen [::]:80;
	server_name wt20.ephec-ti.be www.wt20.ephec-ti.be;
	location / {

		proxy_pass http://172.17.0.2:8080;
    }

}

server {
	listen 80;
	#listen [::]:80;

 	server_name b2b.wt20.ephec-ti.be www.b2b.wt20.ephec-ti.be;

	location / {

		proxy_pass http://172.17.0.2:8080;
		#proxy_pass http://www.b2b.wt20.ephec-ti.be:8080;
	}
}

server {

	listen 80;
	#listen [::]:80;

	server_name intranet.wt20.ephec-ti.be www.intranet.wt20.ephec-ti.be;

	location / { 
		#proxy_pass http://172.17.0.2:8080;
		proxy_pass http://172.17.0.2:8080; 
	}
}
