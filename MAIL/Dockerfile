FROM ubuntu:latest
RUN apt update -y && apt upgrade -y
RUN touch /var/log/tallylog
RUN chmod 600 /var/log/tallylog
RUN apt install nano -y && DEBIAN_FRONTEND=noninteractive apt install postfix -y
RUN mv /etc/postfix/main.cf /etc/postfix/main.cf.bak
RUN DEBIAN_FRONTEND=noninteractive apt install dovecot-core dovecot-imapd dovecot-pop3d dovecot-lmtpd -y
RUN mkdir /var/mail/vhosts
RUN mkdir /var/mail/vhosts/wt20.ephec-ti.be
RUN groupadd -g 5000 vmail
RUN useradd -r -g vmail -u 5000 vmail -d /var/mail/vhosts -c "virtual mail user"
RUN chown -R vmail:vmail /var/mail/vhosts/



COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/hosts /etc/hosts
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/mailname /etc/mailname
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/main.cf /etc/postfix/main.cf
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/virtual_mailbox_domains /etc/postfix/virtual_mailbox_domains
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/virtual_alias /etc/postfix/virtual_alias
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/master.cf /etc/postfix/master.cf
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/10-master.conf /etc/dovecot/conf.d/10-master.conf
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/auth-passwdfile.conf.ext /etc/dovecot/conf.d/auth-passwdfile.conf.ext
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/dovecot-users /etc/dovecot/dovecot-users
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/wt20.ephec-ti.be.crt /wt20.ephec-ti.be.crt
COPY https://github.com/fshatskiy/ProjetAdminSys-R-seaux/blob/master/MAIL/wt20.ephec-ti.be.key /wt20.ephec-ti.be.key
RUN postmap /etc/postfix/virtual_mailbox_domains
RUN postmap /etc/postfix/virtual_alias
EXPOSE 25 110 143 465 587 993 995
service postfix start
dovecot -F
