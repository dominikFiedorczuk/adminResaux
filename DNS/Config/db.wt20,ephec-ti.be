;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	ns1.wt20.ephec-ti.be. root.wt20.ephec-ti.be. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns1.wt20.ephec-ti.be.
@	IN	A	51.77.147.83
ns1	IN	A	51.77.147.83
www	IN	A	51.77.147.83
