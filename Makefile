install:
	bundle config path .bundle
	bundle
	touch .env.test
	touch .env.development

run:
	bundle exec rackup -p 3000

console:
	bundle exec pry -r ./application/api
