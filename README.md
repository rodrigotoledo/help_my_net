# Setup project

Basic instructions to setup the project. After clone the project, run the commands:

```
gem install bundler --no-doc
bundle install
rails db:drop db:create db:migrate db:seed
./bin/dev
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

### Help me

Hello guys, this is my application using rails 7, hotwire, stimulus reflex. Basically have tasks and each one has an address.
Also possible employees to the management of the task. Let me show you how it works.

But isn't working on Heroku. Let me try to deploy. Error is

assets/channels/consumer is missing. Can someone help me?
