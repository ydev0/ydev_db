FROM mariadb:11.5.1-ubi9-rc

WORKDIR /workdir/db/

# Set environment variables
ENV MYSQL_DATABASE=${MYSQL_DATABASE} \
    MYSQL_USER=${MYSQL_USER} \
    MYSQL_PASSWORD=${MYSQL_PASSWORD} \
    MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

# Copy the setup script
COPY ./complete-setup.sql ./

# Ensure proper permissions
RUN chown mysql:mysql complete-setup.sql && \
    chmod 644 complete-setup.sql

# Initialize the database
RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Define the entrypoint
ENTRYPOINT ["mysqld", "--user=root", "--datadir=/var/lib/mysql", "--init-file=/workdir/db/complete-setup.sql"]

# Expose the MySQL port
EXPOSE 3306

