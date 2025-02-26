FROM debian:bullseye

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install mariadb-client mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf


COPY tools/run.sh .
RUN chmod +x ./run.sh
RUN chmod 777 /var/run/*
EXPOSE 3306

CMD ["./run.sh"]
