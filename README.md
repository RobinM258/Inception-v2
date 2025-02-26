Avant de lancer il faut mettre  un fichier  dans /home/robin/.env

A linterrieur ajouter ca :

MYSQL_DB=my_database
MYSQL_USER=my_user
MYSQL_PASSWORD=my_password
MYSQL_ROOT_PASSWORD=my_root_password

DOMAIN_NAME=romartin.42.fr
WP_TITLE="Inception"
WP_ADMIN=robin
WP_ADMIN_PASSWORD=robin
WP_ADMIN_MAIL=admin@example.com
WP_USER=user
WP_USER_MAIL=user@example.com
WP_USER_PASSWORD=userpass


fais make

puis connecte toi a https://romartin.42.fr

pour arreter le programme tu fais:
  -make down
  -cd /home/robin/data && rm -rf /wordpress/ && rm -rf mariadb/

