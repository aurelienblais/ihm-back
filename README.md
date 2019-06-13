[![Build Status](https://travis-ci.com/aurelienblais/ihm-back.svg?token=vaQxUtjRjKXazYSwVqcN&branch=master)](https://travis-ci.com/aurelienblais/ihm-back)

![Maintener](https://image.noelshack.com/fichiers/2019/24/4/1560433822-logo.png)
# README

* Ruby version : 2.5.3
* Require a working postgres instance (use docker-compose)

# Setup

* `docker-compose up -d`
* `rails db:setup`
* `rails db:migrate`
* `rails s`
* Navigate to `localhost:3000`

# Api

Api Doc is available here : https://aurelienblais.github.io/ihm-back/apidoc.html