defmodule TalksGameWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :session do
    field(:token, :string)
  end
end
