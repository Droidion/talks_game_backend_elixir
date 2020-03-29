defmodule TalksGame.Application do
  @moduledoc false

  use Application

  @spec start(any, any) :: {:ok, pid} | {:error, any}
  def start(_type, _args) do
    children = [
      {TalksGame.Repo, []},
      {Redix, host: Application.fetch_env!(:talks_game, :redis_host), name: :redix}
    ]

    opts = [strategy: :one_for_one, name: TalksGame.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
