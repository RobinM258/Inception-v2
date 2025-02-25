#!/bin/sh

sleep 5

mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Wordpress configuration..."
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
 	echo "Wp core download"
	wp core download --allow-root;
 	echo "Wp config create"
 	wp config create	--allow-root \
 				--dbname=$MYSQL_DB \
 				--dbuser=$MYSQL_USER \
 				--dbpass=$MYSQL_PASSWORD \
 				--dbhost=mariadb:3306 --path='/var/www/html'
    echo "Wp core install"
	wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --skip-email --allow-root
	echo "Wp user create"
 	wp user create --allow-root ${WP_USER} ${WP_USER_MAIL} --user_pass=${WP_USER_PASSWORD};
fi

echo "Wordpress end"
/usr/sbin/php-fpm7.4 -F
