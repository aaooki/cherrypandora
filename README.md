Panadoura
---

https://panadoura.herokuapp.com/

A time organizer based on the Pomodoro technique.

<img src="https://github.com/aonemd/panadoura/blob/master/frontend/images/panadoura.png" width="200">

[![Build Status](https://travis-ci.org/aonemd/panadoura.svg?branch=master)](https://travis-ci.org/aonemd/panadoura)

## Installation

- You need to have Ruby v2.5+ and yarn
- Run `bundle` and then `yarn` to install the dependencies
- Create a config file named `.env` & `.env.test` and put your env variables in
  there. An example is provided in `.env.example`
- Run `export $(cat .env | xargs) && bin/migrate` to setup the database
  for the first time. A PostgreSQL server must be running.
- Run `export $(cat .env.test | xargs) && bin/migrate` to setup the test
  database
- Build the frontend using `yarn build`
- Run the main server `export $(cat .env | xargs) && bundle exec rackup -p 7070`
- Run to tests `export $(cat .env.test | xargs) && rake test`

## Contribution

If there's anything you would like to change, please send a pull request or open an issue.

## License
See [LICENSE](https://github.com/aonemd/panadoura/blob/master/LICENSE).
