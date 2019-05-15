FROM ubuntu:latest
RUN apt-get update && apt-get install -y
RUN echo "postfix postfix/mailname string wt20.ephec-ti.be" | debconf-set-selections &&\ echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections &&\ apt-get install -y mailutils
RUN DEBIAN_FRONTEND=noninteractive apt install dovecot-core dovecot-imapd dovecot-pop3d dovecot-lmtpd -y
RUN mkdir /var/mail/vhosts
RUN mkdir /var/mail/vhosts/wt20.ephec-ti.be
RUN groupadd -g 5000 vmail
RUN useradd -r -g vmail -u 5000 vmail -d /var/mail/vhosts -c "virtual mail user"
RUN chown -R vmail:vmail /var/mail/vhosts/
COPY /MAIL/hosts /etc/hosts
COPY /MAIL/mailname /etc/mailname
COPY /MAIL/main.cf /etc/postfix/main.cf
COPY /MAIL/virtual_mailbox_domains /etc/postfix/virtual_mailbox_domains
COPY /MAIL/virtual_alias /etc/postfix/virtual_alias
COPY /MAIL/master.cf /etc/postfix/master.cf
COPY /MAIL/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
COPY /MAIL/10-master.conf /etc/dovecot/conf.d/10-master.conf
COPY /MAIL/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
COPY /MAIL/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf
COPY /MAIL/auth-passwdfile.conf.ext /etc/dovecot/conf.d/auth-passwdfile.conf.ext
COPY /MAIL/dovecot-users /etc/dovecot/dovecot-users
COPY /MAIL/wt20.ephec-ti.be.crt /wt20.ephec-ti.be.crt
COPY /MAIL/wt20.ephec-ti.be.key /wt20.ephec-ti.be.key
RUN postmap /etc/postfix/virtual_mailbox_domains
RUN postmap /etc/postfix/virtual_alias
EXPOSE 25 110 143 465 587 993 995
CMD service postfix start
