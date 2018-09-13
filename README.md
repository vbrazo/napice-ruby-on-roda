# [Napice](http://napice.com) Ruby API [![Build Status](https://travis-ci.org/Napice/napice-ruby.svg?branch=master)](https://travis-ci.org/Napice/napice-ruby) [![Maintainability](https://api.codeclimate.com/v1/badges/e53c8b4e2454290843b4/maintainability)](https://codeclimate.com/github/Napice/napice-ruby/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/e53c8b4e2454290843b4/test_coverage)](https://codeclimate.com/github/Napice/napice-ruby/test_coverage)

This is the Napice Ruby API. To understand more about our roadmap, please access [its repository](https://github.com/Napice/roadmap).

## Setting the project up

### Clone the repository

Fork the project and clone it to your machine.

### Install the database

You can install the database by running `make build_database`.

### Install the dependencies

Run `make install` to install the gems. 

## Development 

### Launch the console

You can use the application programmatically via Ruby environment. To access the console, you should run `make console`.

### Run the specs

To run the API tests, you should run `bundle exec rspec spec`.

## Built With

* PostgreSQL (with ruby Sequel ORM)
* GraphQL API
* Rspec
* Faker
* FactoryBot
* CSRF and SESSION
* TOKEN AUTH
* Heroku

## Contributing Guidelines

See [CONTRIBUTING.md](https://github.com/napice/napice-api/blob/master/CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
