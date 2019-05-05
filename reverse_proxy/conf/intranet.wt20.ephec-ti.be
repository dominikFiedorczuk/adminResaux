server {
	
	#Ecoute sur le port 80 en IPv4 et IPv6

	listen 80;
	listen [::]:80;

	#Nom de domaine
	server_name intranet.wt20.ephec-ti.be www.intranet.wt20.ephec-ti.be;

	#Redirige vers  le container nginx sur le port 80
	location / { 
		
		proxy_pass http://172.17.0.2:80; 
	}
}
