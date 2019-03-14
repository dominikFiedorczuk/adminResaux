# On utilise une image deja existante sur hub.docker de sameersbn
FROM sameersbn/bind

# Placer les configurations des sites
ADD configDNS/named.conf /etc/bind/
ADD configDNS/named.conf.local /etc/bind/
ADD configDNS/db.wt20.ephec-ti.be.direct /etc/bind/
ADD configDNS/db.wt20.ephec-ti.be.reverse /etc/bind/
