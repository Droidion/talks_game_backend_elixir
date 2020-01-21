use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :talks_game_web, TalksGameWeb.Endpoint,
  http: [port: 4002],
  server: false

config :talks_game, TalksGame.Repo, database: "talks-game"
