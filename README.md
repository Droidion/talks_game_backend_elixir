# Talks Game

Backend for Talks Game simulation in Elixir.

Experimental project to try Elixir/BEAM.

## Database

Have PostgreSQL installed and available. Know its hostname, login and password. Make sure there is no existing database called `talks-game`.

Set database hostname, login and password in `config/config.exs`.

If you need to reaceate previously created database, run `$ mix ecto.drop`. If it's you first run, go to the next step.

Run `$ mix ecto.create` to set up new database.

Run `$ mix ecto.migrate` to run all migrations.

Run `$ mix run apps/talks_game/priv/repo/seeds.exs` to seed DB with data.

## Application

Have [Elixir](https://elixir-lang.org/install.html) installed.

Run `$ mix deps.get` to install dependencies.

Run `$ mix compile` to compile project.

Run `$ mix test` to run unit tests.

Run `$ mix phx.server` to start web server with GraphQL API.

## GraphQL API

Use `http://localhost:4000/api/graphiql` to test GraphQL api.

For testing, use the following schema

```
{
  auth(login: "supplier1", password: "supplier1") {
    token
  }
}
```
