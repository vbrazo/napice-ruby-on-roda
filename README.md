# Napice Ruby API 

![CI](https://github.com/Napice/napice-ruby/workflows/CI/badge.svg) 
[![Ruby Version](https://img.shields.io/badge/ruby-3.2+-red.svg)](https://www.ruby-lang.org)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A lightweight, high-performance Ruby API built with the Roda web framework. This project demonstrates modern Ruby best practices with a focus on simplicity, security, and maintainability.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Development](#development)
- [Testing](#testing)
- [Deployment](#deployment)
- [Built With](#built-with)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Lightweight & Fast:** Built on Roda, one of the fastest Ruby web frameworks
- **RESTful API:** Clean and consistent API design
- **Database Management:** PostgreSQL with Sequel ORM for reliable data handling
- **Authentication:** HTTP Basic Auth for secure endpoints
- **Security:** Built-in CSRF and session protection with Rack Protection
- **Testing:** Comprehensive test suite with RSpec
- **Code Quality:** Enforced with RuboCop and SimpleCov for coverage tracking
- **CI/CD Ready:** Automated testing with GitHub Actions
- **Production Ready:** Configured for Heroku deployment

## Prerequisites

Before you begin, ensure you have the following installed:

- **Ruby:** 3.2 or higher
- **Bundler:** 2.6.9 or higher
- **PostgreSQL:** 13 or higher
- **Make:** For convenient command execution

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/Napice/napice-ruby.git
cd napice-ruby-on-roda
```

Or fork the project first and clone your fork:

```bash
git clone https://github.com/YOUR_USERNAME/napice-ruby.git
cd napice-ruby-on-roda
```

### 2. Install dependencies

```bash
make install
```

Or manually:

```bash
bundle install
```

### 3. Set up the database

```bash
make build_database
```

This will create the database and run all migrations.

## Configuration

### Environment Variables

Create your environment configuration files based on the example:

```bash
cp .env.example .env
cp .env.example .env.test
cp .env.example .env.development
```

Configure the following variables in each file:

```bash
# Database Configuration
DATABASE_ENV=postgres://username:password@localhost:5432/database_name

# Authentication
HTTP_USER=your_username
HTTP_PASSWORD=your_secure_password

# Session Security (use a strong random string)
RACK_COOKIE_KEY=your_cookie_key
RACK_COOKIE_SECRET=your_cookie_secret_min_32_characters

# Environment
ENVIRONMENT=development  # or test, production
```

**Security Note:** Never commit `.env` files to version control. Use strong, randomly generated values for production secrets.

## Development

### Available Make Commands

```bash
make install          # Install dependencies
make build_database   # Create database and run migrations
make console          # Launch interactive Ruby console
make server           # Start the development server
```

### Launch the console

Access an interactive Ruby environment with full application context:

```bash
make console
```

This is useful for testing queries, debugging, and exploring the API programmatically.

### Start the development server

```bash
make server
```

Or manually:

```bash
bundle exec puma
```

The API will be available at `http://localhost:9292` (or the port configured in your environment).

## Testing

### Run the test suite

```bash
bundle exec rspec spec
```

### Run with coverage report

SimpleCov is configured to generate coverage reports automatically when running tests. View the report at `coverage/index.html`.

### Run the linter

Check code quality with RuboCop:

```bash
bundle exec rubocop
```

Auto-fix issues where possible:

```bash
bundle exec rubocop -a
```

### Run all checks

```bash
make test     # If configured in Makefile
```

## Deployment

### Heroku

This application is ready for Heroku deployment:

```bash
heroku create your-app-name
heroku addons:create heroku-postgresql:mini
heroku config:set RACK_COOKIE_KEY=your_key
heroku config:set RACK_COOKIE_SECRET=your_secret
heroku config:set HTTP_USER=your_user
heroku config:set HTTP_PASSWORD=your_password
git push heroku main
heroku run rake db:migrate
```

## Built With

### Core Technologies
- **[Roda](http://roda.jeremyevans.net/)** - Fast, flexible routing tree Ruby web framework
- **[Sequel](http://sequel.jeremyevans.net/)** - Database toolkit for Ruby
- **[PostgreSQL](https://www.postgresql.org/)** - Advanced open source relational database
- **[Puma](https://puma.io/)** - Ruby web server built for concurrency

### Security
- **[Rack Protection](https://github.com/sinatra/sinatra/tree/main/rack-protection)** - Protection against common web attacks
- **[Roda HTTP Auth](https://github.com/jeremyevans/roda-http-auth)** - HTTP authentication plugin

### Development & Testing
- **[RSpec](https://rspec.info/)** - Behavior-driven development framework
- **[FactoryBot](https://github.com/thoughtbot/factory_bot)** - Fixtures replacement
- **[Faker](https://github.com/faker-ruby/faker)** - Generate fake data
- **[RuboCop](https://rubocop.org/)** - Ruby static code analyzer and formatter
- **[SimpleCov](https://github.com/simplecov-ruby/simplecov)** - Code coverage analysis

### DevOps
- **[GitHub Actions](https://github.com/features/actions)** - CI/CD automation
- **[Dotenv](https://github.com/bkeepers/dotenv)** - Environment variable management

## Project Structure

```
napice-ruby-on-roda/
├── application/
│   ├── api/
│   │   ├── models/          # Database models
│   │   ├── operations/      # Business logic layer
│   │   ├── routes/          # API route definitions
│   │   └── api_support.rb   # Shared API utilities
│   ├── api.rb               # Main API application
│   ├── config/              # Configuration files
│   │   ├── database.rb
│   │   └── sequel.rb
│   ├── db/
│   │   └── migrations/      # Database migrations
│   └── tasks/               # Rake tasks
├── spec/                    # Test files
│   ├── api/
│   ├── models/
│   ├── operations/
│   └── workflow/
├── config.ru                # Rack configuration
├── Gemfile                  # Dependencies
└── Makefile                 # Convenient commands
```

## Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details on:

- Code of Conduct
- Development process
- Submitting pull requests
- Coding standards

### Quick Start for Contributors

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests and linter (`bundle exec rspec && bundle exec rubocop`)
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to your branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## License

This project is available as open source under the terms of the [MIT License](LICENSE).
