defmodule TalksGame.Session do
  use TypedStruct

  @typedoc "User session"
  @derive Jason.Encoder
  typedstruct enforce: true do
    field :token, String.t()
    field :team_number, integer()
    field :team_type, String.t()
    field :is_commander, boolean(), default: false
    field :created_at, DateTime.t()
    field :updated_at, DateTime.t()
  end
end
