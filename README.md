# Rails API Template

[![Github Actions CI](https://github.com/rootstrap/rails_api_base/actions/workflows/ci.yml/badge.svg?event=push)](https://github.com/rootstrap/rails_api_base/actions)
[![Code Climate](https://codeclimate.com/github/rootstrap/rails_api_base/badges/gpa.svg)](https://codeclimate.com/github/rootstrap/rails_api_base)
[![Test Coverage](https://api.codeclimate.com/v1/badges/63de7f82c79f5fe82f46/test_coverage)](https://codeclimate.com/github/rootstrap/rails_api_base/test_coverage)

Rails Api Base is a boilerplate project for JSON RESTful APIs. It follows the community best practices in terms of standards, security and maintainability, integrating a variety of testing and code quality tools. It's based on Rails 6 and Ruby 2.7.

Finally, it contains a plug an play Administration console (thanks to [ActiveAdmin](https://github.com/activeadmin/activeadmin)).

## Features

This template comes with:
- Schema
  - Users table
  - Admin users table
- Endpoints
  - Sign up with user credentials
  - Sign in with user credentials
  - Sign out
  - Reset password
  - Get and update user profile
- Administration panel for users
- Rspec tests
- Code quality tools
- API documentation following https://apiblueprint.org/
- Docker support
- Exception Tracking
- RSpec API Doc Generator

## How to use

1. Clone this repo
1. Install PostgreSQL in case you don't have it
1. Run `bootstrap.sh` with the name of your your project like `./bootstrap.sh my_awesome_project`
1. `rspec` and make sure all tests pass
1. `rails s`
1. You can now try your REST services!

## How to use with docker

1. Have `docker` and `docker-compose` installed (You can check this by doing `docker -v` and `docker-compose -v`)
1. Modify the following lines in the `database.yml` file:
  ``` yaml
  default: &default
    adapter: postgresql
    encoding: unicode
    pool: 5
    username: postgres
    password: postgres
    host: db
    port: 5432
  ```
1. Generate a secret key for the app by running `docker-compose run --rm --entrypoint="" web rake secret`, copy it and add it in your environment variables.
1. Update the default database configuration in the `config/database.yml` file to point to the `docker-compose` database:
   1. Set `username: postgres`
   1. Set `password: postgres`
   1. Set `host: db`
1. Run `docker-compose run --rm --entrypoint="" web rails db:create db:migrate`.
   1. (Optional) Seed the database with an AdminUser for use with ActiveAdmin by running `docker-compose run --rm --entrypoint="" web rails db:seed`. The credentials for this user are: email: `admin@example.com` ; password: `password`.
1. (Optional) If you want to deny access to the database from outside of the `docker-compose` network, remove the `ports` key in the `docker-compose.yml` from the `db` service.
1. (Optional) Run the tests to make sure everything is working with: `docker-compose run --rm --entrypoint="" web rspec .`.
1. Run the application with `docker-compose up`.
1. You can now try your REST services!

## Requirements

======================================
Gilded Rose Requirements Specification
======================================

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

	- All items have a SellIn value which denotes the number of days we have to sell the item
	- All items have a Quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
still works correctly. However, do not alter the Item class or Items property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.