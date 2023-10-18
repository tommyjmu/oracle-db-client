FROM ubuntu:latest

ENV DB_PORT 1521
ENV DB_USERNAME orcale
ENV DB_PASSWORT oracle 
ENV DB_HOST oracle
ENV DB_SERVICENAME oracle

# ugly fix for "update-alternatives" missing directories in slim image
RUN mkdir -p /usr/share/man/man1 &&\
    mkdir -p /usr/share/man/man7
RUN apt update && apt install -y unzip rpm alien gcc libaio1 \
    --no-install-recommends

ADD /assets /assets

# Instal Oracle Client
RUN mkdir /usr/lib/oracle/12.2/client64/network/admin -p

#RUN alien -i /assets/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm &&\
#    alien -i /assets/oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm &&\
#    alien -i /assets/oracle-instantclient12.2-jdbc-12.2.0.1.0-1.x86_64.rpm &&\
#    alien -i /assets/oracle-instantclient12.2-tools-12.2.0.1.0-1.x86_64.rpm &&\
#    alien -i /assets/oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm

ENV ORACLE_HOME=/usr/lib/oracle/12.2/client64
ENV TNS_ADMIN=/usr/lib/oracle/12.2/client64/network/admin
ENV LD_LIBRARY_PATH=/usr/lib/oracle/12.2/client64/lib
ENV PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/oracle/12.2/client64/bin

# output directory
RUN mkdir /data
VOLUME /data

ADD entrypoint.sh /usr/bin/entrypoint.sh
ADD scripts/dump-tables.sh /usr/bin/dump-tables.sh
ADD scripts/dump-db.sh /usr/bin/dump-db.sh

WORKDIR /

ENTRYPOINT ["entrypoint.sh"]

CMD ["bash"]
