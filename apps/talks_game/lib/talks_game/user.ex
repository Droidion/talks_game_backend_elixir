defmodule TalksGame.User do
  use Ecto.Schema

  # defstruct team_number: 0, team_type: "", login: "", password: ""

  schema "users" do
    field(:team_number, :integer)
    field(:team_type, :string)
    field(:login, :string)
    field(:password, :string)
    timestamps()
  end
end
