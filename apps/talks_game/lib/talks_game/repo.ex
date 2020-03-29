defmodule TalksGame.Repo do
  @moduledoc false

  use Ecto.Repo,
    otp_app: :talks_game,
    adapter: Ecto.Adapters.Postgres
end
