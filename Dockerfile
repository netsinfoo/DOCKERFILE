FROM centos:7

MAINTAINER Ma_neo <netsinfoo@gmail.com>

EXPOSE 389

ENV CONF_ROOTPW sinfo
ENV CONF_ROOTPW1 sinfo
ENV CONF_BASEDN dc=ufrn,dc=br

COPY ldapDocer.tar.gz /

RUN yum -y install openldap-servers openldap-clients && cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG\
    && chown ldap. /var/lib/ldap/DB_CONFIG

COPY entrypoint /

RUN chmod 0755 /entrypoint \
    && mkdir /config\
    && mkdir /data\
    && mkdir /initdb.d \
    && chown ldap:ldap /config /data \
    && ln -s /data /var/lib/ldap

VOLUME	/data
VOLUME /config

     

CMD ["/entrypoint"]

# A versão 1.0 funacionalidades e schemas basicos.
#Falta popular, adicionar esquemas da federação, ativar o starttls, adicionar os modulos de grupos, e sincronização.
      



