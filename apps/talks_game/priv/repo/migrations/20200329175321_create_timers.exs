defmodule TalksGame.Repo.Migrations.CreateTimers do
  use Ecto.Migration

  def change do
    create table("timers") do
      add(:period, :integer)
      add(:hour, :integer)
      add(:minute, :integer)
      timestamps()
    end
  end
end
