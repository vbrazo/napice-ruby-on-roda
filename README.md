# Napice Ruby API [![Maintainability](https://api.codeclimate.com/v1/badges/e53c8b4e2454290843b4/maintainability)](https://codeclimate.com/github/Napice/napice-ruby/maintainability)

This is the Napice Ruby API using the [Roda Web Framework](https://github.com/jeremyevans/roda).

## Setting the project up

### Clone the repository

Fork the project and clone it to your machine.

### Install the database

You can install the database by running `make build_database`.

### Install the dependencies

Run `make install` to install the gems.

### Configurate your .env files

Take a look at `.env.example` and configure your `.env`, `.env.test` and `.env.development` files.

## Development

### Launch the console

You can use the application programmatically via Ruby environment. To access the console, you should run `make console`.

### Run the specs

To run the API tests, you should run `bundle exec rspec spec`.

## Built With

* Roda
* Roda Auth
* PostgreSQL (with ruby Sequel ORM)
* Rspec
* Faker
* FactoryBot
* CSRF and SESSION
* TOKEN AUTH

## Contributing Guidelines

See [CONTRIBUTING.md](https://github.com/napice/napice-api/blob/master/CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
