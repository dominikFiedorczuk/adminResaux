;
;BIND File
;

$TTL 10H
$ORIGIN wt20.ephec-ti.be.
@       1D      IN      SOA     ns.wt20.ephec-ti.be. root.wt20.ephec-ti.be. (
                                2          ; serial number
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
                  IN    MX      10      mail
		  IN    TXT     "v=spf1 include:mail.wt20.ephec-ti.be ip4:51.77.203.11 -all"
_imaps._tcp 	  IN    SRV     1 1 993 mail
_submission._tcp  IN    SRV     1 1 587 mail
mail._domainkey   IN    TXT     ( "v=DKIM1; h=sha256; k=rsa; t=y; "
          "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtv7olvd1pyqhu3Qtwiy9IDVrTkPdNDAXVtKeVGCfaoed29tQcwPIDULk/Kp3UpEO4Vxuwwn8IuLhIPc/gu6uRxiVNwqeFx78Fknu15AMdV5IkC05BYSvEXLZ3e6fvmkIvbADk/T0ZM6MPxM0Z4H9zD7KHIYfGJyLYJyjYmEM+iQ7jddd6VBgkiuiLNOxOSfzjx2Dge6MWpjdwD"
          "DGDN12A9OMWkygCJSAiPsvbs4iAxeOC17Jrctyj12ZoWCo6QCgF2p6vVQ+ERAGxng2zsRiZejjducgGmKZW7Grw9osLytGPmY/s6Y9S6DoUh0kapZyZ6hHngXzc5FsSwudvSZFuwIDAQAB" )  ; ----- DKIM key mail for wt20.ephec-ti.be

;Certificats 
_acme-challenge.mail	30	IN	TXT	"-9m6nHVFd0L_fbkRi_Co7IYu_1WSYchPV7BR8jPaKeY"

;VOiP

sip		IN	A	51.77.147.80
_sip._udp	SRV	0	0	5060	sip
_sip._tcp       SRV     0       0       5060    sip
