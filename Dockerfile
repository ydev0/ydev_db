FROM mariadb:11.5.1-ubi9-rc

WORKDIR /workdir/db/

ENV MYSQL_DATABASE=${MYSQL_DATABASE} \
    MYSQL_USER=${MYSQL_USER} \
    MYSQL_PASSWORD=${MYSQL_PASSWORD} \
    MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

COPY ./complete-setup.sql ./

COPY my.cnf /etc/mysql/conf.d/

RUN chown mysql:mysql complete-setup.sql && \
    chmod 644 complete-setup.sql

RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql 

ENTRYPOINT ["mysqld", "--user=root", "--datadir=/var/lib/mysql", "--init-file=/workdir/db/complete-setup.sql"]

EXPOSE 3306

