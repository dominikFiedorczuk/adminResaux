;
; BIND data file for local loopback interface
;
$TTL    604800
$ORIGIN wt20.ephec-ti.be.
@       IN      SOA     ns.wt20.ephec-ti.be. root.wt20.ephec-ti.be. (
                              2         ; Serial
                             8H         ; Refresh
                            30M         ; Retry
                        2419200         ; Expire
                             8H )       ; Negative Cache TTL
;
; NS record
@               IN      NS      ns.wt20.ephec-ti.be.

; A record
ns              IN      A       51.77.147.80

; servWeb
serverWeb       IN      A       51.77.147.83
www             IN      CNAME   serverWeb
b2b             IN      CNAME   serverWeb
intranet        IN      CNAME   serverWeb
