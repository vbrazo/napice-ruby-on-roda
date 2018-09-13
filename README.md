# [Napice](http://napice.com) Ruby API [![Maintainability](https://api.codeclimate.com/v1/badges/e53c8b4e2454290843b4/maintainability)](https://codeclimate.com/github/Napice/napice-ruby/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/e53c8b4e2454290843b4/test_coverage)](https://codeclimate.com/github/Napice/napice-ruby/test_coverage)

### Setup and Run locally the Roda Graphql Server

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

## Features

* Graphql API
* CSRF and SESSION
* TOKEN AUTH

## DB

* Postgresql (with ruby Sequel ORM)

## Contributing

See [CONTRIBUTING.md](https://github.com/napice/napice-api/blob/master/CONTRIBUTING.md).

