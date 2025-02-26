FROM debian:bullseye

RUN apt-get update -y 

RUN apt-get install php7.4 php7.4-fpm php7.4-mysql wget -y

COPY ./tools /var/www/
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

RUN chmod +x /var/www/script.sh

CMD [ "/var/www/script.sh" ]
