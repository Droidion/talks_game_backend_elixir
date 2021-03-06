# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :talks_game_web,
  generators: [context_app: false]

# Configures the endpoint
config :talks_game_web, TalksGameWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R18814Vkp2ExvWhz5qMXks3taQpJXsZTT/IXxsMwdPjRcjoRBx4ukAeIUDREWuk9",
  render_errors: [view: TalksGameWeb.ErrorView, accepts: ~w(json)],
  server: true,
  root: ".",
  version: Application.spec(:phoenix_app, :vsn),
  pubsub: [name: TalksGameWeb.PubSub, adapter: Phoenix.PubSub.PG2]

config :talks_game, ecto_repos: [TalksGame.Repo]

config :talks_game, redis_host: "localhost"

config :argon2_elixir,
  parallelism: 8,
  t_cost: 10,
  m_cost: 16

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
import_config "#{Mix.env()}.secret.exs"
