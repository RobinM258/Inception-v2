COMPOSE = docker compose -f srcs/docker-compose.yml
DATA_FOLD = /home/robin/data
WP_FOLD = ${DATA_FOLD}/wordpress
DB_FOLD = ${DATA_FOLD}/mariadb

all: up

up: build
	${COMPOSE} up -d

build:
	@if [ ! -d "${DATA_FOLD}" ]; then \
		mkdir -p ${DATA_FOLD}; \
	fi
	@if [ ! -d "${WP_FOLD}" ]; then \
		mkdir -p ${WP_FOLD}; \
	fi
	@if [ ! -d "${DB_FOLD}" ]; then \
		mkdir -p ${DB_FOLD}; \
	fi
	${COMPOSE} build

restart:
	${COMPOSE} restart

logs:
	${COMPOSE} logs

stop:
	${COMPOSE} stop

start:
	${COMPOSE} start

down:
	${COMPOSE} down

clean: down
	docker system prune -af
	rm -rf ${WP_FOLD}/*
	rm -rf ${DB_FOLD}/*

re: clean all