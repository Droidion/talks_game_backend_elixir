defmodule TalksGame.Schemas.User do
  @moduledoc """
  An Ecto mapped struct representing a user.
  """

  use Ecto.Schema

  schema "users" do
    field(:team_number, :integer)
    field(:team_type, :string)
    field(:login, :string)
    field(:password, :string)
    timestamps()
  end
end
