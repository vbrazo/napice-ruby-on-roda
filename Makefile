build_database:
	createdb roda_graphql
	bundle exec rake db:migrate
	bundle exec rake db:seed

console:
	bundle exec pry -r ./application/api

install:
	bundle config path .bundle
	bundle
	touch .env
	touch .env.test
	touch .env.development

run:
	bundle exec rackup -p 3000
