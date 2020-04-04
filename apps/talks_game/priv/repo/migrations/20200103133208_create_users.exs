defmodule TalksGame.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table("users") do
      add(:team_number, :integer, null: true)
      add(:team_type, :string, null: false)
      add(:login, :string, null: false)
      add(:password, :string, null: false)
      timestamps()
    end
  end
end
