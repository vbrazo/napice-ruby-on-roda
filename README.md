# [Napice](http://napice.com) Ruby API [![Build Status](https://travis-ci.org/Napice/napice-ruby.svg?branch=master)](https://travis-ci.org/Napice/napice-ruby) [![Maintainability](https://api.codeclimate.com/v1/badges/e53c8b4e2454290843b4/maintainability)](https://codeclimate.com/github/Napice/napice-ruby/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/e53c8b4e2454290843b4/test_coverage)](https://codeclimate.com/github/Napice/napice-ruby/test_coverage)

This is the Napice API.

## Development

### Install the database

You can install the database by running `make build_database`

### Install the dependencies and run specs

After checking out the repo, run `make install` to install dependencies. Then, run `bundle exec rspec spec` to run the tests.

### Launch the console

You can use the application programmatically by installing the gem and using on the Ruby environment (You can run `make console` for this)

## Project details

## Features

* Graphql API
* CSRF and SESSION
* TOKEN AUTH

## DB

* Postgresql (with ruby Sequel ORM)

## Contributing

See [CONTRIBUTING.md](https://github.com/napice/napice-api/blob/master/CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
