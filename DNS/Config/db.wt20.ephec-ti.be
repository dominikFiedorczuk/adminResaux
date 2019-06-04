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
                                300 )      ; min TTL [1h]

;NS RECORDS
@        	IN      NS              ns.wt20.ephec-ti.be.

;A & AAAA Records
ns      	IN      A       51.77.147.80
		IN	AAAA	2001:41d0:404:200::cf1
@		IN	A	51.77.147.80
                IN      AAAA    2001:41d0:404:200::cf1
web		IN	A	51.77.147.80  ; VPS-V4-FIL
                IN      AAAA    2001:41d0:404:200::cf1 ; VPS-V6-FIL
www     	IN      CNAME   web
b2b             IN      CNAME   web
intranet	IN	CNAME	web

;MAIL
mail		  IN	A	51.77.203.11
		  IN	AAAA	2001:41d0:404:200::12f7
		  IN	MX	10	mail
		  IN    TXT     "v=spf1 include:mail.wt20.ephec-ti.be ip4:51.77.203.11 -all"
smtp		  IN	CNAME	mail
pop3		  IN	CNAME	mail
imap		  IN	CNAME	mail
_imaps._tcp 	  IN    SRV     1 1 993 mail.wt20.ephec-ti.be.
_submission._tcp  IN    SRV     1 1 587 mail.wt20.ephec-ti.be.

;Certificats 
_acme-challenge.mail	30	IN	TXT	"-9m6nHVFd0L_fbkRi_Co7IYu_1WSYchPV7BR8jPaKeY"

;VOiP

sip		IN	A	51.77.147.80
_sip._udp	SRV	0	0	5060	sip
_sip._tcp       SRV     0       0       5060    sip
