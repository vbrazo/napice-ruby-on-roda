# Roda Graphql Server

### Setup and Running locally

```bash
git clone repo
cd to folder
bundle install
# make sure postgres is installed
createdb roda_graphql
bundle exec rake db:migrate
bundle exec rake db:seed
# run the server
bundle exec rackup -p 3000
# Visit http://localhost:3000
```

[Visit browser](http://localhost:3000)

# Features
* Graphql API
* CSRF and SESSION
* TOKEN AUTH

### DB
* Postgresql (with ruby Sequel ORM)
