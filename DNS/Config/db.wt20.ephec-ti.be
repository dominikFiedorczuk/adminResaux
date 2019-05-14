;
;BIND File
;

$TTL 10H
$ORIGIN wt20.ephec-ti.be.
@       1D      IN      SOA     ns.wt20.ephec-ti.be. root.wt20.ephec-ti.be. (
                                1          ; serial number
                                3600       ; refresh [1h]
                                600        ; retry [10m]
                                1209600    ; expire[14d]
                                3600 )     ; min TTL [1h]

;NS RECORDS
@        	IN      NS              ns.wt20.ephec-ti.be.

;A & AAAA Records
ns      	IN      A       51.77.147.80
		      IN	    AAAA	  2001:41d0:404:200::cf1
@		      IN	    A	      51.77.147.80
          IN      AAAA    2001:41d0:404:200::cf1
web		    IN	    A	      51.77.147.80  ; VPS-V4-FIL
          IN      AAAA    2001:41d0:404:200::cf1 ; VPS-V6-FIL
www     	IN      CNAME   web
b2b       IN      CNAME   web
intranet	IN	    CNAME	  web

;MAIL
mail		  IN	    A	      51.77.203.11
@		      IN	    MX	    10	    mail
