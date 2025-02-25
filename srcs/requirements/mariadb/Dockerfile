FROM debian:bullseye

# apk = apt de debian
RUN apt-get update -y

RUN apt-get upgrade -y

# on installe mariadb
RUN apt-get install mariadb-client mariadb-server -y

# COPY le fichier conf dans le container
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# COPY le script run qui setup mysql et l executer
COPY tools/run.sh .
RUN chmod +x ./run.sh
RUN chmod 777 /var/run/*
EXPOSE 3306

CMD ["./run.sh"]
