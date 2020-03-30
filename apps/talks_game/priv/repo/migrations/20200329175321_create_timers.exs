defmodule TalksGame.Repo.Migrations.CreateTimers do
  use Ecto.Migration

  def change do
    create table("timers") do
      add(:period, :integer, null: false)
      add(:hour, :integer, null: false)
      add(:minute, :integer, null: false)
      timestamps()
    end
  end
end
