defmodule TalksGameWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :session do
    field(:token, :string)
    field(:team_number, :integer)
    field(:team_type, :string)
    field(:is_commander, :boolean)
    field(:created_at, :string)
    field(:updated_at, :string)
  end
end
