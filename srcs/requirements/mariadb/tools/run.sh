#!/bin/sh

if [ ! -d /var/lib/mysql/inception ] ; then
    # lance mysql
    exec mysqld_safe &
    sleep 3
    # creer la database '$SQL_DB' si elle n existe pas deja
    mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};"
    # pareil qu au dessus mais avec un user + son password
    mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    # on lui donne tous les privileges histoire qu'il puisse manipule la table (.* toutes les tables de la db) 
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    # on change le mot de pass du root
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
    # on update les changements fait au dessus
    mysql -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
    # eteind mysql
    echo "restarting mysql"
    mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
fi;

chmod 777 /var/lib/mysql/inception/*
# la way recommande pour lancer mysql
exec mysqld_safe
