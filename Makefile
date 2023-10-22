build:
	docker-compose build

bash:
	docker-compose run rails /bin/bash

up:
	docker-compose run --rm rails sh -c "bundle install && bundle exec rake db:create db:migrate"
	docker-compose up

down:
	docker-compose down

restart: down up

rspec:
	docker-compose run --rm rails bundle exec rspec --profile -- ${TARGETS}

console:
	docker-compose run --rm rails bundle exec rails c

install:
	docker-compose run --rm rails bundle install

dbmigrate:
	docker-compose run --rm rails bundle exec rake db:migrate

dbreset:
	docker-compose run --rm rails bundle exec rake db:migrate:reset

dbseed:
	docker-compose run --rm rails bundle exec rake db:seed

lint:
	docker-compose run --rm rails sh -c "bundle exec rubocop -a"
