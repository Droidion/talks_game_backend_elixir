defmodule TalksGame.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table("users") do
      add :team_number, :integer
      add :team_type, :string
      add :login, :string
      add :password, :string
      timestamps()
    end

  end
end
