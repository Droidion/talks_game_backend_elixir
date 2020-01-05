# Talks Game

Backend for Talks Game simulation in Elixir.

Experimental project to try Elixir/BEAM.

## Database

Have PostgreSQL installed and available. Know its hostname, login and password. Make sure there is no existing database called `talks-game`.

Have local Redis instance installed and available.

Set database hostname, login and password in `config/config.exs`.

If you need to reaceate previously created database, run `$ mix ecto.drop`. If it's you first run, go to the next step.

Run `$ mix ecto.create` to set up new database.

Run `$ mix ecto.migrate` to run all migrations.

Run `$ mix run apps/talks_game/priv/repo/seeds.exs` to seed DB with data.

## Run in development environment

Have [Elixir](https://elixir-lang.org/install.html) installed.

Run `$ mix deps.get` to install dependencies.

Run `$ mix compile` to compile project.

Run `$ mix test` to run unit tests.

Run `$ mix phx.server` to start web server with GraphQL API.

## Run in production environment

Set up prod PostgreSQL credentials in `config/prod.exs`. For Mac and Windows hosts you can use `host.docker.internal` as hostname, for linux hosts you need to know host's IP address. See more [here](https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach).

Have `docker` and `docker-compose` installed.

Run `docker-compose up -d` to start the container.

## GraphQL API

Use `http://localhost:4000/api/graphiql` to test GraphQL api. Use `http://localhost:4000/api` to send queries.

Sign in schema:

```
{
  signin(login: "supplier1", password: "supplier1") {
    token
    teamNumber
    teamType
    isCommander
    createdAt
    updatedAt
  }
}
```

Sign out schema:

```
{
  signout(token: "9be1a478-2c28-427a-bcad-f8ad7f571f95") {
    message
  }
}
```
