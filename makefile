default: help

API_URL = http://127.0.0.1:8004

run: ## Run the application
	@if [ -f "./vendor/autoload_runtime.php" ]; then \
		make start; \
	else \
		make init; \
	fi
		$(info The application is running on: $(API_URL)/.) \

init: ## Install the application
	make build start install_dependencies copy_env_file cp_pre_commit_file install_db

build: ## Build images stack
	docker-compose build

start: ## Start stack
	docker-compose up -d --remove-orphans
	make cache_clear

stop: ## Stop stack
	docker-compose stop

restart: ## Restart stack
	docker-compose stop
	docker-compose up -d

down: ## Drop the containers stack
	docker-compose down

logs: ## Show containers logs
	docker-compose logs

app_exec_cmd: app_start  ## Execute commands in PHP container
	docker exec php_movies_v2_container bash -c "${OPT}"

db_exec_cmd: db_start  ## Execute commands in DB container
	docker exec mysql_movies_v2_container bash -c "${OPT}"

nginx_exec_cmd: nginx_start ## Execute commands in Nginx container
	docker-compose run --rm nginx_service sh -c "${OPT}"

install_dependencies:  ## Install dependencies
	make app_exec_cmd OPT="composer install --no-interaction"
	make app_exec_cmd OPT="npm install -y"
	make app_exec_cmd OPT="npm run build"

install_db:  ## Create database and schema
	if [ ! -f "./.env.local" ]; then \
		echo 'DATABASE_URL="mysql://root:root@mysql_movies_v2_container:3306/movies_db"' > .env.local; \
	fi
	make app_exec_cmd OPT="php bin/console doctrine:database:drop --if-exists --force"
	make app_exec_cmd OPT="php bin/console doctrine:database:create"
	make db_exec_cmd OPT="mysql -u root -p'root' movies_db -e 'SET FOREIGN_KEY_CHECKS = 0; source /data/movies_db.sql; SET FOREIGN_KEY_CHECKS = 1;'"
	make app_exec_cmd OPT="php bin/console doctrine:migrations:migrate --no-interaction"

sh_app: app_start ## Connect to PHP container
	docker exec -it php_movies_v2_container bash

sh_db: db_start ## Connect to Mysql container
	docker exec -it mysql_movies_v2_container bash

app_start:
	[ `docker ps -q -f name=php_movies_v2_container` ] || docker-compose up -d php_service

nginx_start:
	[ `docker ps -q -f name=nginx_movies_v2_container` ] || docker-compose up -d nginx_service

db_start:
	[ `docker ps -q -f name=mysql_movies_v2_container` ] || docker-compose up -d mysql_service_movies

cache_clear: ## Clear cache
	make app_exec_cmd OPT="rm -rf var/cache"

copy_env_file:
	@if [ ! -f "./.env.dev.local" ]; then\
		cp docker/build/config/.env.local.php ./.env.local.php;\
	fi

cp_pre_commit_file: ## Copy pre-commit file to Git hooks folder
	rm -f .git/hooks/pre-commit
	cp docker/git/pre-commit .git/hooks
	chmod 755 .git/hooks/pre-commit

check_code_style: ## Execute grumphp pre commit command to check code style
	make app_exec_cmd OPT="./vendor/bin/grumphp git:pre-commit"

help: ## Commands guide .
	@awk -F ':|##' '/^[^\t].+?:.*?##/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF}' $(MAKEFILE_LIST)
