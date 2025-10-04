# [Napice](http://napice.com) Ruby API 

![CI](https://github.com/Napice/napice-ruby/workflows/CI/badge.svg) 

This is the Napice Ruby API built with Roda framework.

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

### Run the linter

To check code quality with RuboCop, run `bundle exec rubocop`.

## Built With

<<<<<<< HEAD
* **Framework:** Roda (Ruby web framework)
* **Database:** PostgreSQL with Sequel ORM
* **Testing:** RSpec, Faker, FactoryBot
* **Code Quality:** RuboCop, SimpleCov
* **Security:** Rack Protection, CSRF and SESSION protection, HTTP Auth
* **CI/CD:** GitHub Actions
* **Deployment:** Heroku-ready
=======
* Roda
* Roda Auth
* PostgreSQL (with ruby Sequel ORM)
* Rspec
* Faker
* FactoryBot
* CSRF and SESSION
* TOKEN AUTH
>>>>>>> master

## Contributing Guidelines

See [CONTRIBUTING.md](https://github.com/napice/napice-api/blob/master/CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
