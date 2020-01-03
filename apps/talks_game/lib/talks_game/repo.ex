defmodule TalksGame.Repo do
  use Ecto.Repo,
    otp_app: :talks_game,
    adapter: Ecto.Adapters.Postgres
end
