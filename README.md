# Setup project

## Redis setup

This project uses redis.

1. For ubuntu 20.04 machines, you may follow [this article](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-20-04-pt) **step 1**;

## Project Setup Basic

After clone the project, run the commands:

```bash
gem install bundler --no-doc
bundle install
```
The stimulus command below will ask you to overwrite some files. You may skip it with `n`
```
rake stimulus_reflex:install
rails db:drop db:create db:migrate db:seed
```

## Run the server

```
rails server
```

## After you can access the application with the credentials:

http://localhost:3000

```
username: test@test.com
password: aassdd
```

## API

### Sign in

The process of sign in it's simple to test, run

```
curl localhost:3000/api/login --ipv4 --data "username=test@test.com&password=aassdd"
```

The result should be the **User** instance
