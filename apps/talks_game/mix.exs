defmodule TalksGame.MixProject do
  use Mix.Project

  def project do
    [
      app: :talks_game,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TalksGame.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:argon2_elixir, "~> 2.3"},
      {:uuid, "~> 1.1"},
      {:ecto_sql, "~> 3.4"},
      {:jason, "~> 1.2"},
      {:postgrex, "~> 0.15.3"},
      {:redix, "~> 0.10.5"},
      {:typed_struct, "~> 0.1.4"}
    ]
  end
end
