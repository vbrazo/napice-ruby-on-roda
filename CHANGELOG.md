# Changelog

## HEAD Unreleased
### Latest update: 2025-10-04

### Major Improvements
- Migrated from TravisCI/CircleCI to GitHub Actions for CI/CD
- Updated all gem dependencies to more recent stable versions:
  - Ruby 3.x compatible versions
  - Roda: 3.48 → 3.96
  - Sequel: 5.48 → 5.97
  - Puma: 5.4 → 6.6
  - Rack: 2.2.3 → 2.2.18 (security update)
  - Rack Protection: 2.1 → 3.2
  - RSpec: 3.10 → 3.13
  - RuboCop: 1.21 → 1.81
  - Faker: 2.19 → 3.5
  - And other dependencies updated to latest stable versions
- Enhanced code quality with improved error handling throughout the application
- Added comprehensive test coverage for routes and operations
- Improved model validations and associations
- All tests passing with 86.79% code coverage

### Features
- Added global error handler with environment-specific error responses
- Implemented proper HTTP status codes for all API responses (400, 404, 422, 500)
- Added 404 handler for undefined routes
- Enhanced Operations Base class with better DSL implementation
- Added input validation to all operations

### Enhancements
- Fixed model associations (Napicer, User, Skill relationships)
- Added timestamps plugin to all models
- Added email format validation for User and Demo models
- Added URL validation for Demo company_website field
- Added unique constraints (username, email, skill names)
- Added foreign key and uniqueness validations to join tables
- Improved error messages and validation feedback
- Added bidirectional associations for many-to-many relationships

### Tests
- Added comprehensive route tests with error case coverage
- Added Base operations class test suite
- Enhanced existing operation tests with error handling scenarios
- Added validation and edge case tests for all operations

### Bug Fixes
- Fixed incorrect foreign keys in Napicer model associations
- Fixed Base operations class logic for step execution
- Corrected validates_presence syntax across all models
- Fixed method_missing implementation in Base::Builder

### Chores
- Updated README with new CI badge and improved documentation
- Removed deprecated TravisCI badge
- Updated "Built With" section with better organization
- Added RuboCop linting instructions to README

------------------------------------------------------------------------------
## v0.2.0 (2018-11-25)

### Bugs
- [PR #26](https://github.com/napice/napice-api/pull/26) Update rack gem [@vbrazo](https://github.com/vbrazo)

### Chores
- [PR #25](https://github.com/napice/napice-api/pull/25) Add rules to .rubocop.yml [@vbrazo](https://github.com/vbrazo)

------------------------------------------------------------------------------
## v0.2.0 (2018-10-12)

### Chores
- [PR #19](https://github.com/napice/napice-api/pull/19) Add .env.example [@vbrazo](https://github.com/vbrazo)
- [PR #18](https://github.com/napice/napice-api/pull/18) Update roda-http-auth [@badosu](https://github.com/badosu)

### Feature Request
- [PR #24](https://github.com/napice/napice-api/pull/24) Add DSL for Operations tasks [@vbrazo](https://github.com/vbrazo)
- [PR #23](https://github.com/napice/napice-api/pull/23) Add /napicer - index and show endpoints [@vbrazo](https://github.com/vbrazo)
- [PR #22](https://github.com/napice/napice-api/pull/22) Add /companies/demo endpoint, its operations and specs [@vbrazo](https://github.com/vbrazo)
- [PR #21](https://github.com/napice/napice-api/pull/21) Add Experience, Education and Demo tables [@vbrazo](https://github.com/vbrazo)
- [PR #20](https://github.com/napice/napice-api/pull/20) Add rake:version task [@vbrazo](https://github.com/vbrazo)
- [PR #17](https://github.com/napice/napice-api/pull/17) Add basic authentication to Roda [@vbrazo](https://github.com/vbrazo)

------------------------------------------------------------------------------
## v0.1.0 (2018-09-30)

### Bug/Fixes
- [PR #4](https://github.com/napice/napice-api/pull/4) Upgrade rack protection gem [@vbrazo](https://github.com/vbrazo)

### Documentation
- [PR #2](https://github.com/napice/napice-api/pull/2) Add contributing.md [@vbrazo](https://github.com/vbrazo)
- [PR #1](https://github.com/napice/napice-api/pull/1) Add changelog.md [@vbrazo](https://github.com/vbrazo)

### Feature Request
- [PR #16](https://github.com/napice/napice-api/pull/16) Add MVP schema [@vbrazo](https://github.com/vbrazo)
- [PR #15](https://github.com/napice/napice-api/pull/15) Set up initial rake tasks [@vbrazo](https://github.com/vbrazo)
- [PR #14](https://github.com/napice/napice-api/pull/14) Add RackAuthMiddleware and jwt [@vbrazo](https://github.com/vbrazo)
- [PR #13](https://github.com/napice/napice-api/pull/13) Add CreateUser endpoint workflow spec [@vbrazo](https://github.com/vbrazo)
- [PR #12](https://github.com/napice/napice-api/pull/12) Add Rack Middleware and SimpleOauth [@vbrazo](https://github.com/vbrazo)
- [PR #11](https://github.com/napice/napice-api/pull/11) Add CreateUser GraphQL endpoint [@vbrazo](https://github.com/vbrazo)
- [PR #10](https://github.com/napice/napice-api/pull/10) Remove tilt and colorize. Add puma gem [@vbrazo](https://github.com/vbrazo)
- [PR #9](https://github.com/napice/napice-api/pull/9) Add Makefile [@vbrazo](https://github.com/vbrazo)
- [PR #8](https://github.com/napice/napice-api/pull/8) Add rubocop [@vbrazo](https://github.com/vbrazo)
- [PR #7](https://github.com/napice/napice-api/pull/7) Add travis CI [@vbrazo](https://github.com/vbrazo)
- [PR #6](https://github.com/napice/napice-api/pull/6) Add test suite and Code Climate [@vbrazo](https://github.com/vbrazo)
- [PR #5](https://github.com/napice/napice-api/pull/5) Separate frontend and backend [@vbrazo](https://github.com/vbrazo)
- [PR #3](https://github.com/napice/napice-api/pull/3) Set up project [@vbrazo](https://github.com/vbrazo)
