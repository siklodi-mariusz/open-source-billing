DOCKER_SYNC_CHECK := $(shell gem list -i docker-sync)
check_docker_sync:
	@if [ ${DOCKER_SYNC_CHECK} == true ]; then \
					echo "docker-sync already installed"; \
	else \
					gem install docker-sync; \
	fi

build: check_docker_sync
	docker-compose build ${args}

up: check_docker_sync
	docker-sync stop
	docker-sync start
	docker-compose up ${args}

bash:
	docker-compose run --rm app /bin/bash

rails-console:
	docker-compose run --rm app bunlde exec rails c

db-create:
	docker-compose run --rm app bundle exec rake db:create

db-schema-load:
	docker-compose run --rm app bundle exec rake db:schema:load

db-migrate:
	docker-compose run --rm app bundle exec rake db:migrate

db-seed:
	docker-compose run --rm app bundle exec rake db:seed

setup-db: db-create db-schema-load db-migrate db-seed