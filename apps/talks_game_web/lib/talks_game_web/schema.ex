defmodule TalksGameWeb.Schema do
  use Absinthe.Schema
  import_types(TalksGameWeb.Schema.ContentTypes)

  alias TalksGameWeb.Resolvers

  query do
    @desc "Try to authenticate"
    field :signin, :session do
      arg(:login, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.Content.signin/3)
    end
  end
end
