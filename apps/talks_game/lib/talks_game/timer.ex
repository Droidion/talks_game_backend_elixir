defmodule TalksGame.Timer do
  @moduledoc """
  A struct representing a timer, meaning hours and minutes when a period is supposed to end.
  """

  use Ecto.Schema

  schema "timers" do
    field(:period, :integer)
    field(:hour, :integer)
    field(:minute, :integer)
    timestamps()
  end
end
